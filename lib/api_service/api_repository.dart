// ignore_for_file: public_member_api_docs, only_throw_errors, lines_longer_than_80_chars, inference_failure_on_function_invocation

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:velorant/generics/response_or_error.dart';
import 'package:velorant/model/agents/response_model.dart';
import 'package:velorant/model/maps/maps_response_model.dart';
import 'package:velorant/model/weapos/weapon_response_model.dart';
import 'package:velorant/utils/app_string.dart';

import 'api_service.dart';
import 'dio.dart';
import 'status_codes.dart';

class Repository {
  Repository._internal();

  static final Repository instance = Repository._internal();

  final client = RestClient(SingletonDio.instance.dio);

  Future<ResponseOrError<ResponseModel>> getAgentData() async {
    return loadData(client.getAgents());
  }

  Future<ResponseOrError<WeaponResponseModel>> getWeaponData() async {
    return loadData(client.getWeapon());
  }

  Future<ResponseOrError<MapResponseModel>> getMapsData() async {
    return loadData(client.getMaps());
  }
}

/// Function to check for the internet connection
Future<bool> checkInternetConnectivity() async {
  try {
    final internetResponse = await InternetAddress.lookup('www.google.com');
    if (internetResponse.isNotEmpty &&
        internetResponse[0].rawAddress.isNotEmpty) {
      return true;
    }
  } catch (e) {
    return false;
  }
  return false;
}

final client = RestClient(SingletonDio.instance.dio);

Future<ResponseOrError<T>> loadData<T>(Future<T> function) async {
  if (await checkInternetConnectivity()) {
    try {
      final response = await function;
      return ResponseOrError.success(response: response);
    } catch (e, s) {
      return catchError(e, s);
    }
  } else {
    return ResponseOrError.failure(errorInfo: AppStrings.noInternet);
  }
}

ResponseOrError<T> catchError<T>(Object e, StackTrace s) {
  if (e is DioException) {
    if (e.error is SocketException) {
      return ResponseOrError.failure(errorInfo: AppStrings.noInternet);
    }
    return ResponseOrError.failure(
      errorInfo: errorOnResponseHandler(e.response?.statusCode),
    );
  } else {
    debugPrintStack(stackTrace: s);
    debugPrint('error is $e');
    return ResponseOrError.failure(errorInfo: AppStrings.someThingWrong);
  }
}

String errorOnResponseHandler(int? statusCode) {
  if (statusCode == StatusCode.unauthorized) {
    return AppStrings.noInternet;
  } else if (statusCode == StatusCode.unauthorized) {
    return AppStrings.noInternet;
  } else if (statusCode == StatusCode.notFound) {
    return AppStrings.noInternet;
  } else {
    return AppStrings.someThingWrong;
  }
}
