import 'package:json_annotation/json_annotation.dart';

part 'maps_model.g.dart';

@JsonSerializable()
class MapModel {
  MapModel({
    required this.displayName,
    required this.narrativeDescription,
    required this.splash,
    required this.displayIcon,
    required this.tacticalDescription,
    required this.callouts,
  });

  final String displayName;
  @JsonKey(includeIfNull: true)
  final String? narrativeDescription;
  @JsonKey(includeIfNull: true)
  final String? tacticalDescription;
  final String? displayIcon;
  final String splash;
  @JsonKey(includeIfNull: true)
  final List<CallOuts>? callouts;

  factory MapModel.fromJson(Map<String, dynamic> json) {
    return _$MapModelFromJson(json);
  }
}

@JsonSerializable()
class CallOuts {
  CallOuts({
    required this.regionName,
    required this.location,
    required this.superRegionName,
  });

  final String? regionName;
  final String? superRegionName;

  final Location location;

  factory CallOuts.fromJson(Map<String, dynamic> json) {
    return _$CallOutsFromJson(json);
  }
}

@JsonSerializable()
class Location {
  Location({
    required this.xCoordinates,
    required this.yCoordinates,
  });

  @JsonKey(includeIfNull: true)
  final double? xCoordinates;
  @JsonKey(includeIfNull: true)
  final double? yCoordinates;

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }
}
