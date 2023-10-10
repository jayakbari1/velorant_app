import 'package:mobx/mobx.dart';
import 'package:velorant/api_service/api_repository.dart';
import 'package:velorant/api_service/api_service.dart';
import 'package:velorant/api_service/dio.dart';
import 'package:velorant/enumeration/network_state.dart';
import 'package:velorant/model/agents/agents_model.dart';

part 'get_agent_data.g.dart';

class GetAgentDataStore = _GetAgentDataStore with _$GetAgentDataStore;

abstract class _GetAgentDataStore with Store {
  final client = RestClient(SingletonDio.instance.dio);

  _GetAgentDataStore() {
    getAgentData();
  }

  @observable
  String errorMsg = '';

  ObservableList<AgentModel> agentList = ObservableList.of([]);

  @observable
  NetworkState networkState = NetworkState.initial;

  Future<void> getAgentData() async {
    networkState = NetworkState.loading;
    final response = await Repository.instance.getAgentData();
    if (response.response != null) {
      agentList.addAll(response.response!.data);
      networkState = NetworkState.success;
    } else {
      errorMsg = response.errorInfo!;
      networkState = NetworkState.failure;
    }
  }
}
