import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
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

  Future<void> getWeaponData() async {
    try {
      networkState = NetworkState.loading;
      final response = await client.getWeapon();
      weapons.addAll(response.data);
      // for (int i = 0; i < weapons.length; i++) {
      //   print("Gun Name is ${weapons[i].displayName}");
      // }
      networkState = NetworkState.success;

      for (int i = 0; i < weapons.length; i++) {
        print('Gun Skins is ${weapons[i].skins![i].displayName}');
      }
    } catch (e, s) {
      networkState = NetworkState.failure;
      print('exception is $e');
      debugPrintStack(stackTrace: s);
    }
  }
}
