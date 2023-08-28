import 'package:json_annotation/json_annotation.dart';

part 'agents_model.g.dart';

@JsonSerializable()
class AgentModel {
  AgentModel({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.displayIconSmall,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.fullPortraitV2,
    required this.killfeedPortrait,
    required this.background,
    required this.backgroundGradientColors,
    required this.role,
    required this.abilities,
  });

  final String uuid;
  final String displayName;
  final String description;
  @JsonKey(defaultValue: '')
  final String displayIcon;
  @JsonKey(defaultValue: '')
  final String displayIconSmall;
  @JsonKey(defaultValue: '')
  final String bustPortrait;
  @JsonKey(defaultValue: '')
  final String fullPortrait;
  @JsonKey(defaultValue: '')
  final String fullPortraitV2;
  @JsonKey(defaultValue: '')
  final String killfeedPortrait;
  @JsonKey(defaultValue: '')
  final String background;
  final List<String> backgroundGradientColors;
  @JsonKey(includeIfNull: false)
  final AgentRoleModel? role;
  final List<AgentAbilitiesModel> abilities;

  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return _$AgentModelFromJson(json);
  }
}

@JsonSerializable()
class AgentRoleModel {
  AgentRoleModel({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  final String uuid;
  final String displayName;
  final String description;
  @JsonKey(defaultValue: '')
  final String displayIcon;

  factory AgentRoleModel.fromJson(Map<String, dynamic> json) {
    return _$AgentRoleModelFromJson(json);
  }
}

@JsonSerializable()
class AgentAbilitiesModel {
  AgentAbilitiesModel({
    this.displayName = '',
    required this.description,
    required this.displayIcon,
  });

  final String? displayName;
  final String description;
  @JsonKey(defaultValue: '')
  final String displayIcon;

  factory AgentAbilitiesModel.fromJson(Map<String, dynamic> json) {
    return _$AgentAbilitiesModelFromJson(json);
  }
}
