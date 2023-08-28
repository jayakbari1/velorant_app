import 'package:json_annotation/json_annotation.dart';
import 'package:velorant/model/agents/agents_model.dart';
part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  ResponseModel({
    required this.status,
    required this.data,
  });

  final int status;
  final List<AgentModel> data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ResponseModelFromJson(json);
  }
}
