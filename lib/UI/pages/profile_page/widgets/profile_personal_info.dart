import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/repos/entities/profile_temp_repository.dart';

import 'profile_personal_info_item.dart';

class ProfilePersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileTemp = RepositoryProvider.of<ProfileTempRepository>(context);
    return Column(
      children: [
        ProfilePersonalInfoItem('E-mail:', profileTemp.email),
        ProfilePersonalInfoItem('Должность:', profileTemp.post),
        ProfilePersonalInfoItem('Образованиe:', profileTemp.education),
        ProfilePersonalInfoItem(
            'Дата рождения:',
            profileTemp.birthday == null
                ? ""
                : DateFormat.yMd().format(profileTemp.birthday)),
        ProfilePersonalInfoItem('Подразделение:', profileTemp.unit),
        ProfilePersonalInfoItem(
            'Дата начала работы:',
            profileTemp.startWorking == null
                ? ""
                : DateFormat.yMd().format(profileTemp.startWorking)),
      ],
    );
  }
}
