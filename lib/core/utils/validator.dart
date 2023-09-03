// import 'package:easy_localization/easy_localization.dart';
//
// class Validator {
//   static String? validateName(String? name) {
//     if (name == null || name.isEmpty) {
//       return "fullNameRequired".tr();
//     }
//     return null;
//   }
//
//   static String? validateDOB(String? dob) {
//     if (dob!.isEmpty) {
//       return "dobRequired".tr();
//     }
//     return null;
//   }
//
//   static String? validateCnic(String? dob) {
//     if (dob == null || dob.isEmpty) {
//       return "cnicRequired".tr();
//     } else if (dob.length < 13) {
//       return "cnicNotValid".tr();
//     }
//     return null;
//   }
//
//   static String? validatePhone(String? phone) {
//     if (phone == null || phone.isEmpty) {
//       return "phoneNumberRequired".tr();
//     }
//     if (phone.length <= 10) {
//       return "phonenumberNotValid".tr();
//     }
//     return null;
//   }
//
//   static String? validateAddress(String? address) {
//     if (address == null || address.isEmpty) {
//       return "addressRequired".tr();
//     }
//     return null;
//   }
//
//   static String? validateEmail(String? email) {
//     if (email == null || email.isEmpty) {
//       return "emailRequired".tr();
//     }
//     final bool isEmailValid = RegExp(
//             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//         .hasMatch(email);
//     if (!isEmailValid) {
//       return "emailnotValid".tr();
//     }
//     return null;
//   }
//
//   static String? validatePassword(String? password) {
//     if (password == null || password.isEmpty) {
//       return "passwordRequired".tr();
//     }
//     if (password.length < 6) {
//       return "passwordLengthError".tr();
//     }
//     return null;
//   }
//
//   static String? validateConfirmPassword(
//       String? password, String? confirmPassword) {
//     if (confirmPassword == null || confirmPassword.isEmpty) {
//       return "confirmPasswordRequired".tr();
//     }
//     if (password != confirmPassword) {
//       return "notMatchPassword".tr();
//     }
//     return null;
//   }
//
//   static String? validateStoreId(String? id) {
//     if (id == null || id.isEmpty) {
//       return 'storeIdRequired'.tr();
//     }
//     return null;
//   }
//
//   static String? validateStoreAddress(String? address) {
//     if (address == null || address.isEmpty) {
//       return 'StoreLocationRequired'.tr();
//     }
//     return null;
//   }
//
//   static String? validateCity(String? city) {
//     if (city == null || city.isEmpty) {
//       return 'StoreCityRequired'.tr();
//     }
//     return null;
//   }
//
//   static String? validateStoreState(String? storeState) {
//     if (storeState == null || storeState.isEmpty) {
//       return 'State/zip code required';
//     }
//     return null;
//   }
//
//   static String? validateStoreLat(String? lat) {
//     if (lat == null || lat.isEmpty) {
//       return 'StoreLatitudeRequired'.tr();
//     }
//     return null;
//   }
//
//   static String? validateStoreLong(String? long) {
//     if (long == null || long.isEmpty) {
//       return 'StoreLongitudeRequired'.tr();
//     }
//     return null;
//   }
//
//   static String? validateStoreRadius(String? radius) {
//     if (radius == null || radius.isEmpty) {
//       return 'storeRadiusRequired'.tr();
//     }
//     return null;
//   }
// }
