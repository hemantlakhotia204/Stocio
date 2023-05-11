// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstituteModel _$InstituteModelFromJson(Map<String, dynamic> json) =>
    InstituteModel(
      id: json['id'] as String,
      domainIds:
          (json['domainIds'] as List<dynamic>).map((e) => e as String).toList(),
      instituteName: json['instituteName'] as String,
    );

Map<String, dynamic> _$InstituteModelToJson(InstituteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'domainIds': instance.domainIds,
      'instituteName': instance.instituteName,
    };
