import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/UI/app_colors.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

void showWarningDialog(String title, String body, BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Platform.isAndroid
          ? AlertDialog(
              title: Text(title),
              content: Text(
                body,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Ок',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyText2.fontFamily,
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          : CupertinoAlertDialog(
              title: Text(title),
              content: Text(
                body,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Ок',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyText2.fontFamily,
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
    },
  );
}

// void showWarningDialog(String title, String body,BuildContext context) {
//     showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return Platform.isAndroid
//             ? AlertDialog(
//                 title: Text(title),
//                 content: Text(
//                   body,
//                   style: Theme.of(context).textTheme.body1,
//                 ),
//                 actions: <Widget>[
//                   FlatButton(
//                     child: Text(
//                       'Ок',
//                       style: TextStyle(
//                         fontFamily:
//                             Theme.of(context).textTheme.body2.fontFamily,
//                         fontSize: 16,
//                         color: Theme.of(context).primaryColor,
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               )
//             : CupertinoAlertDialog(
//                 title: Text(title),
//                 content: Text(
//                   body,
//                   style: Theme.of(context).textTheme.body1,
//                 ),
//                 actions: <Widget>[
//                   FlatButton(
//                     child: Text(
//                       'Ок',
//                       style: TextStyle(
//                         fontFamily:
//                             Theme.of(context).textTheme.body2.fontFamily,
//                         fontSize: 16,
//                         color: Theme.of(context).primaryColor,
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//       },
//     );
//   }

void showProfileTapSuggestionDialog(int suggestion_id, BuildContext context) {
  showDialog<void>(
      barrierColor: AppColors.transparent_grey,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          child: Container(
              color: AppColors.white,
              width: ResponsiveSize.width(241),
              height: ResponsiveSize.height(241),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        "Скачать сгенерированный документ для подписи",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: ResponsiveSize.width(14),
                          color: AppColors.black_black,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    //height: ResponsiveSize.height(41),
                    color: AppColors.diveded_grey,
                    indent: ResponsiveSize.width(45),
                    endIndent: ResponsiveSize.width(45),
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        "Открыть страницу предложения",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: ResponsiveSize.width(14),
                            color: AppColors.black_black),
                      ),
                    ),
                  ),
                ],
              )),
        );
      });
}
