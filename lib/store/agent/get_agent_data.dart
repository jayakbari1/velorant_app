import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:velorant/api_service/api_service.dart';
import 'package:velorant/api_service/dio.dart';
import 'package:velorant/model/agents/agents_model.dart';

part 'get_agent_data.g.dart';

class GetAgentDataStore = _GetAgentDataStore with _$GetAgentDataStore;

abstract class _GetAgentDataStore with Store {
  final client = RestClient(SingletonDio.instance.dio);

  _GetAgentDataStore() {
    getAgentData();
  }


  ObservableList<AgentModel> agentList = ObservableList.of([]);

  Future<void> getAgentData() async {
    try {
      final response = await client.getAgents();
      agentList.addAll(response.data);
      debugPrint('Agent list is $agentList');
    } catch (e, s) {
      debugPrint('Error is $e');
      debugPrintStack(stackTrace: s);
    }
  }
}
