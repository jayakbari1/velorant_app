// Repositry Pattern

import 'package:flutter/material.dart';

import 'api_service.dart';
import 'dio.dart';

class ApiRepository {
  ApiRepository._internal();

  static final ApiRepository instance = ApiRepository._internal();

  final client = RestClient(SingletonDio.instance.dio);

  // Get All The Agents Information
  Future<void> getAgentsInfo() async {
    try {
      final response = await client.getAgents();
      debugPrint('Api is called');

      for (int i = 0; i < response.data.length; i++) {
        debugPrint(response.data[i].displayName);
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }
}
