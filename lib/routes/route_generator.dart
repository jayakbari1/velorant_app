// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:velorant/model/agents/agents_model.dart';
import 'package:velorant/routes/app_routes.dart';
import 'package:velorant/store/agent/get_agent_data.dart';
import 'package:velorant/utils/extension/provider_extension.dart';
import 'package:velorant/views/agents/agent_info.dart';
import 'package:velorant/views/agents/agents_grid_list.dart';
import 'package:velorant/views/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      case '/agentsGridList':
        return MaterialPageRoute(
          builder: (_) =>
              const AgentsGridList().withProvider(GetAgentDataStore()),
        );

      case AppRoutes.agentInfo:
        return MaterialPageRoute(
          builder: (_) => AgentInfo(
            agentModel: args as AgentModel,
          ),
        );

      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Error',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: const Center(
            child: Text('No Routes Found'),
          ),
        );
      },
    );
  }
}
