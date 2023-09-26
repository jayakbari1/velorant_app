import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:velorant/model/agents/response_model.dart';
import 'package:velorant/model/weapos/weapon_response_model.dart';
import 'package:velorant/utils/app_string.dart';
import 'package:velorant/views/agents/agent_info.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)

/// Responsible for Handling all the Network call
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('agents')
  Future<ResponseModel> getAgents();

  @GET('weapons')
  Future<WeaponResponseModel> getWeapon();
}
