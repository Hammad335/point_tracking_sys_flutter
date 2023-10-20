import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/models/models.dart';

const CameraPosition kGooglePlex = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);

final pointUsers = [
  UserModel.ofPoint(
    uId: '2323232',
    name: 'Hamad',
    rollNo: '19SW71',
    department: 'Software',
  ),
  UserModel.ofPoint(
    uId: '2113232',
    name: 'Waiz',
    rollNo: '19SW752',
    department: 'Software',
  ),
];

final points = [
  Point(
    pointNumber: 43,
    driverName: 'Hamad',
    area: 'Qasimabad',
    isFav: true,
  ),
  Point(
    pointNumber: 53,
    driverName: 'Not Hamad',
    area: 'Not Qasimabad',
    isFav: true,
  ),
  Point(
    pointNumber: 63,
    driverName: 'Not Hamad',
    area: 'Not Qasimabad',
    isFav: false,
  ),
];
final savePoints = [
  Point(
    pointNumber: 43,
    driverName: 'Hamad',
    area: 'Qasimabad',
    isFav: true,
  ),
  Point(
    pointNumber: 53,
    driverName: 'Not Hamad',
    area: 'Not Qasimabad',
    isFav: true,
  ),
];
