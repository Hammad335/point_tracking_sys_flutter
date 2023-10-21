import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:point_tracking_sys_flutter/constants/data.dart';

class HomePageController extends GetxController {
  late final DatabaseReference _databaseReference;
  late LatLng pointCoordinates;

  HomePageController() {
    _init();
  }

  _init() {
    pointCoordinates = kGooglePlex.target;
    _databaseReference = FirebaseDatabase.instance.ref();
    _setListenerToCoordinates();
  }

  _setListenerToCoordinates() {
    print('setting listener.....');
    _databaseReference.child('points').child('54').onValue.listen(
      (event) {
        var data = event.snapshot.value;
        if (data != null) {
          data = data as Map;
          pointCoordinates = LatLng(
            double.parse(data['lat']!),
            double.parse(data['lng']!),
          );
          print(pointCoordinates);
        }
      },
      onError: (stackTrace) {
        print(stackTrace.toString());
      },
    );
  }
}
