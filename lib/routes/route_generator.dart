// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:velorant/routes/app_routes.dart';
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
          builder: (_) => const AgentsGridList(),
        );

      case AppRoutes.agentInfo:
        return MaterialPageRoute(
          builder: (_) => const AgentInfo(),
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
