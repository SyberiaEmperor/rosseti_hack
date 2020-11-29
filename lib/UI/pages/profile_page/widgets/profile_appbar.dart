import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/app_colors.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/fill_in_the_profile_page/fill_in_th_profile_page.dart';
import 'package:rosseti/bloc/profile_bloc/profile_bloc.dart';
import 'package:rosseti/repos/entities/profile_temp_repository.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileTemp=RepositoryProvider.of<ProfileTempRepository>(context);
    return SafeArea(
        child: Column(children: [
      Container(
        color: AppColors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    child: Text(
                      "${profileTemp.surname} ${profileTemp.name[0]}${profileTemp.name.trim()==""?"":"."} ${profileTemp.secondName[0]}${profileTemp.surname.trim()==""?"":"."}",
                      style: TextStyle(
                          color: AppColors.bold_black,
                          fontWeight: FontWeight.w500,
                          fontSize: ResponsiveSize.width(24)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<ProfileBloc>(context),
                            child: FillInTheProfilePage()),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      child: Text(
                        "Редактировать",
                        style: TextStyle(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: ResponsiveSize.width(14)),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    ]));
  }
}
