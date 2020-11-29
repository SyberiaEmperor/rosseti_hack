// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rosseti/models/point.dart';
// import 'package:rosseti/repos/entities/repos.dart';
// import '../UI/widgets/map.dart';

// Future<void> checkGeoDialog(BuildContext context, Point address) async {
//  var height = MediaQuery.of(context).size.height;
//   double _adaptiveHeight(double size) => height * (size / 740);
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         backgroundColor: Theme.of(context).cardColor,
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text(
//                 'Текущий адрес:\n',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
//                   color: Theme.of(context).textTheme.bodyText1.color,
//                   fontSize: _adaptiveHeight(14),
//                 ),
//               ),
//               Text(
//                 address != null?address.caption : 'Не удалось обнаружить геопозицию. Пожалуйста, проверьте, разрешен ли доступ к геопозиции.',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
//                   color: Theme.of(context).textTheme.bodyText1.color,
//                   fontSize: _adaptiveHeight(14),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           RaisedButton(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             color: Theme.of(context).buttonColor,
//             child: Text(
//               'Окей',
//               style: TextStyle(
//                 fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
//                 color: Colors.black,
//                 fontSize: _adaptiveHeight(14),
//               ),
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           RaisedButton(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             color: Theme.of(context).buttonColor,
//             child: Text(
//               'Указать на карте',
//               style: TextStyle(
//                 fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
//                 color: Colors.black,
//                 fontSize: _adaptiveHeight(14),
//               ),
//             ),
//             onPressed: () async {
//                 address = await Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => GMap(
//                                   del: address,
//                                 ))) ??
//                     address;
//                 StatementRepos.address = address;
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
