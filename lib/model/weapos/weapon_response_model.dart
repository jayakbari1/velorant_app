import 'package:json_annotation/json_annotation.dart';
import 'package:velorant/model/weapos/weapon_model.dart';
part 'weapon_response_model.g.dart';

@JsonSerializable()
class WeaponResponseModel {
  WeaponResponseModel({
    required this.status,
    required this.data,
  });

  final int status;
  final List<WeaponModel> data;

  factory WeaponResponseModel.fromJson(Map<String, dynamic> json) {
    return _$WeaponResponseModelFromJson(json);
  }
}
