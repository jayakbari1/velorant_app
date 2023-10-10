import 'package:json_annotation/json_annotation.dart';

import 'maps_model.dart';

part 'maps_response_model.g.dart';

@JsonSerializable()
class MapResponseModel {
  MapResponseModel({
    required this.status,
    required this.data,
  });

  final int status;
  final List<MapModel> data;

  factory MapResponseModel.fromJson(Map<String, dynamic> json) {
    return _$MapResponseModelFromJson(json);
  }
}
