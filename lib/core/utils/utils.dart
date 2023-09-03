// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:salesappcc/core/theme/colors.dart';
//
// import '../styles/styles.dart';
//
// class Utils {
//   static String capitalizeString(String s) {
//     return s.substring(0, 1).toUpperCase() + s.substring(1);
//   }
//
//   static void showSuccessToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: cGreenColor,
//       textColor: cWhiteColor,
//       fontSize: 16.0,
//     );
//   }
//
//   static void showErrorToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: cRedColor,
//       textColor: cWhiteColor,
//       fontSize: 16.0,
//     );
//   }
//
//   static void showInfoToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: cGreyColor.withOpacity(0.6),
//       textColor: cWhiteColor,
//       fontSize: 16.0,
//     );
//   }
//
//   static showCustomDialog({
//     required BuildContext context,
//     required String title,
//     required String message,
//     required String yesLabel,
//     required String cancelLabel,
//     required VoidCallback onYesPressed,
//   }) async {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: Text(
//           title,
//           style: TextStyles.headingMediumTextStyle,
//         ),
//         content: Text(
//           message,
//           style: TextStyles.weekDay16TextStyle,
//         ),
//         backgroundColor: cWhiteColor,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, false);
//             },
//             child: Text(cancelLabel),
//           ),
//           TextButton(
//             onPressed: () => onYesPressed(),
//             child: Text(yesLabel),
//           ),
//         ],
//       ),
//     );
//   }
// }
