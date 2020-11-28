import 'package:flutter/cupertino.dart';
import 'package:rosseti/UI/app_colors.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

enum PersonalInfoType {
  email,
  position,
  department,
  education,
  yearOfBirth,
  startDate,
}

class ProfilePersonalInfoItem extends StatelessWidget {
  final String title;
  final String value;

  ProfilePersonalInfoItem(String title, String value)
      : this.title = title,
        this.value = value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3),
      child: Container(
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                title,
                style: TextStyle(
                    color: AppColors.light_black,
                    fontWeight: FontWeight.w400,
                    fontSize: ResponsiveSize.width(14)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                value,
                style: TextStyle(
                    color: AppColors.light_black,
                    fontWeight: FontWeight.w300,
                    fontSize: ResponsiveSize.width(14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
