// Repositry Pattern

import 'package:flutter/material.dart';
import 'package:velorant/model/agents/response_model.dart';

import 'api_service.dart';
import 'dio.dart';

class ApiRepository {
  ApiRepository._internal();

  static final ApiRepository instance = ApiRepository._internal();

  final client = RestClient(SingletonDio.instance.dio);

  // Get All The Agents Information
  // Future<ResponseModel> getAgentsInfo() async {
  //   try {
  //     final response = await client.getAgents();
  //     debugPrint('Api is called');
  //     return ;
  //   } catch (e, s) {
  //     debugPrint(e.toString());
  //     debugPrintStack(stackTrace: s);
  //   }
  // }
}
