import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/app_colors.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/repos/entities/profile_repository.dart';
import 'package:rosseti/repos/entities/profile_temp_repository.dart';

class ProfileActivityInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileTemp=RepositoryProvider.of<ProfileTempRepository>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                   (profileTemp.messagesCount??0).toString() ,
                    style: TextStyle(
                        color: AppColors.bold_green,
                        fontWeight: FontWeight.w500,
                        fontSize: ResponsiveSize.width(24)),
                  ),
                  Text(
                    "сообщения в обсуждениях",
                    style: TextStyle(
                        color: AppColors.light_black,
                        fontWeight: FontWeight.w300,
                        fontSize: ResponsiveSize.width(10)),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                     (profileTemp.approvedSuggestions??0).toString(),
                    style: TextStyle(
                        color: AppColors.bold_green,
                        fontWeight: FontWeight.w500,
                        fontSize: ResponsiveSize.width(24)),
                  ),
                  Text(
                    "предложений одобрено",
                    style: TextStyle(
                        color: AppColors.light_black,
                        fontWeight: FontWeight.w300,
                        fontSize: ResponsiveSize.width(10)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
