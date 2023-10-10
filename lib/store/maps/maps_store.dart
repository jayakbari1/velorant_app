import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:velorant/api_service/api_service.dart';
import 'package:velorant/api_service/dio.dart';
import 'package:velorant/enumeration/network_state.dart';
import 'package:velorant/model/maps/maps_model.dart';

part 'maps_store.g.dart';

class MapStore = _MapStore with _$MapStore;

abstract class _MapStore with Store {
  _MapStore() {
    getMapsData();
  }

  final client = RestClient(SingletonDio.instance.dio);

  @observable
  NetworkState networkState = NetworkState.initial;

  ObservableList<MapModel> mapList = ObservableList.of([]);

  Future<void> getMapsData() async {
    try {
      networkState = NetworkState.loading;
      final response = await client.getMaps();
      mapList.addAll(response.data);
      for (int i = 0; i < mapList.length; i++) {
        debugPrint('Map List is ${mapList[i].callouts?[i].location}');
      }
      networkState = NetworkState.success;
    } catch (e, s) {
      debugPrint('Exception is $e');
      debugPrintStack(stackTrace: s);
      networkState = NetworkState.failure;
    }
  }
}
