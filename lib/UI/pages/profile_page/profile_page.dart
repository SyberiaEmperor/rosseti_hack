

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/UI/app_colors.dart';

import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/profile_page/widgets/profile_activity_info.dart';
import 'package:rosseti/UI/pages/profile_page/widgets/profile_personal_info.dart';
import 'package:rosseti/UI/pages/profile_page/widgets/profile_appbar.dart';
import 'package:rosseti/UI/pages/profile_page/widgets/profile_suggestions_info.dart';

import 'package:rosseti/bloc/profile_bloc/profile_bloc.dart';





class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProfileBloc, ProfileState>(builder: (_, state) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: CustomScrollView(slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: [
                ProfileAppBar(),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: ProfilePersonalInfo()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: ProfileActivityInfo(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: ProfileSuggestionsInfo(),
                ),
              ],
            ),
          ]))
        ]),
        //preferredSize: Size(double.infinity, ResponsiveSize.height(65)),
      );
    });
  }
}



