import 'package:flutter/cupertino.dart';
import 'package:rosseti/UI/app_colors.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      "Иванов И.И.",
                      style: TextStyle(
                          color: AppColors.bold_black,
                          fontWeight: FontWeight.w500,
                          fontSize: ResponsiveSize.width(24)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
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
