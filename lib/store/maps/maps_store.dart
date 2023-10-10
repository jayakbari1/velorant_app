import 'package:mobx/mobx.dart';
import 'package:velorant/api_service/api_repository.dart';
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

  @observable
  String errorMsg = '';

  ObservableList<MapModel> mapList = ObservableList.of([]);

  Future<void> getMapsData() async {
    networkState = NetworkState.loading;
    final response = await Repository.instance.getMapsData();
    if (response.response != null) {
      mapList.addAll(response.response!.data);
      networkState = NetworkState.success;
    } else {
      errorMsg = response.errorInfo!;
      networkState = NetworkState.failure;
    }
  }
}
