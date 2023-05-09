import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterModel {
  final String name, email, password, institute;
  final String? instituteId;

  RegisterModel({required this.name,required  this.email,required  this.password,required  this.institute, this.instituteId});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}