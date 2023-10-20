class UserModel {
  String? uId;
  String? name;
  String? email;
  bool? isEmailVerified;
  String? rollNo;
  String? department;

  UserModel({
    this.uId,
    required this.name,
    required this.email,
    this.isEmailVerified = false,
  });

  UserModel.ofPoint({
    required this.uId,
    required this.name,
    required this.rollNo,
    required this.department,
  });

  set emailVerified(bool isEmailVerified) =>
      this.isEmailVerified = isEmailVerified;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }

  Map<String, dynamic> toJsonWithoutId() {
    return {
      'name': name,
      'email': email,
      'isEmailVerified': isEmailVerified,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      uId: json['uId'] as String,
      isEmailVerified: json['isEmailVerified'] as bool,
    );
  }
}
