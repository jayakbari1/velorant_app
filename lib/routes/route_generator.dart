// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:velorant/model/agents/agents_model.dart';
import 'package:velorant/model/maps/maps_model.dart';
import 'package:velorant/model/weapos/weapon_model.dart';
import 'package:velorant/routes/app_routes.dart';
import 'package:velorant/store/agent/get_agent_data.dart';
import 'package:velorant/store/maps/maps_store.dart';
import 'package:velorant/store/weapons/weapon_store.dart';
import 'package:velorant/utils/extension/provider_extension.dart';
import 'package:velorant/views/agents/agent_info.dart';
import 'package:velorant/views/agents/agents_grid_list.dart';
import 'package:velorant/views/home_page.dart';
import 'package:velorant/views/maps/maps_info.dart';
import 'package:velorant/views/maps/maps_list_view.dart';
import 'package:velorant/views/maps/view_map.dart';
import 'package:velorant/views/weapons/weapon_grid_list.dart';
import 'package:velorant/views/weapons/weapon_info.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      case AppRoutes.agentsGridList:
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

      case AppRoutes.weaponGridList:
        return MaterialPageRoute(
          builder: (_) => const WeaponGridList().withProvider(WeaponStore()),
        );

      case AppRoutes.weaponInfo:
        return MaterialPageRoute(
          builder: (_) => WeaponInfo(
            weaponModel: args as WeaponModel,
          ),
        );

      case AppRoutes.maps:
        return MaterialPageRoute(
          builder: (_) => const MapsListView().withProvider(MapStore()),
        );

      case AppRoutes.mapInfo:
        return MaterialPageRoute(
          builder: (_) => MapInfo(
            mapModel: args as MapModel,
          ).withProvider(MapStore()),
        );

      case AppRoutes.viewMap:
        return MaterialPageRoute(
          builder: (_) => ViewMap(
            mapModel: args as MapModel,
          ).withProvider(MapStore()),
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
