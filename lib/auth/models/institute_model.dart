import 'package:json_annotation/json_annotation.dart';

part 'institute_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InstituteModel {
  final String id;
  final List<String> domainIds;
  final String instituteName;

  InstituteModel({required this.id, required this.domainIds, required this.instituteName});

  factory InstituteModel.fromJson(Map<String, dynamic> json) => _$InstituteModelFromJson(json);

  Map<String, dynamic> toJson() => _$InstituteModelToJson(this);
}
