// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_network_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeNetworkModel _$HomeNetworkModelFromJson(Map<String, dynamic> json) =>
    HomeNetworkModel(
      id: json['id'] as int,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$HomeNetworkModelToJson(HomeNetworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
    };
