class JwtModel {
  String at;
  String id;
  String email;

  JwtModel({required this.at, required this.id, required this.email});

  factory JwtModel.fromJson(Map<String, dynamic> json) {
    return JwtModel(at: json["at"], id: json["id"], email: json["email"]);
  }

  Map<String, dynamic> toJson() => {"at": at, "id": id, "email": email};

}
