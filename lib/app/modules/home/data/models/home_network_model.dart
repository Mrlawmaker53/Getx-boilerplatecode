import 'package:flutter_getx_template/app/modules/home/domain/entities/home_network_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../common/util/exports.dart';

part 'home_network_model.g.dart';

@JsonSerializable()
class HomeNetworkModel extends DataMapper<HomeNetworkEntity> {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  HomeNetworkModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory HomeNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$HomeNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeNetworkModelToJson(this);

  @override
  HomeNetworkEntity mapToEntity() {
    return HomeNetworkEntity(
      id: id,
      avatar: avatar,
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
  }
}
