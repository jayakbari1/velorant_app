import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:velorant/api_service/api_repository.dart';
import 'package:velorant/api_service/api_service.dart';
import 'package:velorant/api_service/dio.dart';
import 'package:velorant/enumeration/network_state.dart';
import 'package:velorant/model/weapos/weapon_model.dart';

part 'weapon_store.g.dart';

class WeaponStore = _WeaponStore with _$WeaponStore;

abstract class _WeaponStore with Store {
  _WeaponStore() {
    getWeaponData();
  }

  final client = RestClient(SingletonDio.instance.dio);

  ObservableList<WeaponModel> weapons = ObservableList.of([]);

  @observable
  NetworkState networkState = NetworkState.initial;

  @observable
  String errorMsg = '';

  Future<void> getWeaponData() async {
    networkState = NetworkState.loading;
    final response = await Repository.instance.getWeaponData();
    if (response.response != null) {
      weapons.addAll(response.response!.data);
      networkState = NetworkState.success;

      for (int i = 0; i < weapons.length; i++) {
        debugPrint('Gun Skins is ${weapons[i].skins![i].displayName}');
      }
    } else {
      errorMsg = response.errorInfo!;
      networkState = NetworkState.failure;
    }
  }
}
