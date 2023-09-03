// import 'package:http/http.dart' as http;
//
// class InternetChecker {
//   static Future<bool> isActive() async {
//     try {
//       final url = Uri.https('google.com');
//       var response = await http.get(url).timeout(const Duration(seconds: 5),
//           onTimeout: () {
//         return throw Exception();
//       });
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       return false;
//     }
//   }
// }
