import 'package:json_annotation/json_annotation.dart';
part 'weapon_model.g.dart';

@JsonSerializable()
class WeaponModel {
  WeaponModel({
    required this.uuid,
    required this.displayName,
    required this.displayIcon,
    required this.weaponStats,
    required this.shopData,
    required this.skins,
  });

  final String uuid;
  final String displayName;
  final String displayIcon;
  @JsonKey(includeIfNull: true)
  final WeaponStats? weaponStats;
  @JsonKey(includeIfNull: true)
  final ShopData? shopData;
  @JsonKey(includeIfNull: true)
  final List<WeaponSkins>? skins;

  factory WeaponModel.fromJson(Map<String, dynamic> json) {
    return _$WeaponModelFromJson(json);
  }
}

@JsonSerializable()
class WeaponStats {
  WeaponStats({
    required this.fireRate,
    required this.magazineSize,
    required this.firstBulletAccuracy,
  });

  final double fireRate;
  final double magazineSize;
  final double firstBulletAccuracy;

  factory WeaponStats.fromJson(Map<String, dynamic> json) {
    return _$WeaponStatsFromJson(json);
  }
}

@JsonSerializable()
class ShopData {
  ShopData({
    required this.cost,
    required this.category,
  });
  final int cost;
  final String category;

  factory ShopData.fromJson(Map<String, dynamic> json) {
    return _$ShopDataFromJson(json);
  }
}

@JsonSerializable()
class WeaponSkins {
  WeaponSkins({
    required this.displayName,
    required this.displayIcon,
  });

  final String? displayName;
  final String? displayIcon;

  factory WeaponSkins.fromJson(Map<String, dynamic> json) {
    return _$WeaponSkinsFromJson(json);
  }
}
