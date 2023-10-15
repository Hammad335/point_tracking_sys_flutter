class Point {
  final int pointNumber;
  final String driverName;
  final String area;
  final bool isFav;

  const Point({
    required this.pointNumber,
    required this.driverName,
    required this.area,
    required this.isFav,
  });

  Map<String, dynamic> toMap() {
    return {
      'pointNumber': pointNumber,
      'driverName': driverName,
      'area': area,
      'isFav': isFav,
    };
  }

  factory Point.fromMap(Map<String, dynamic> map) {
    return Point(
      pointNumber: map['pointNumber'] as int,
      driverName: map['driverName'] as String,
      area: map['area'] as String,
      isFav: map['isFav'] as bool,
    );
  }
}
