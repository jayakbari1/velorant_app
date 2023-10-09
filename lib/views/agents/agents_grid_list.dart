import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:velorant/enumeration/network_state.dart';
import 'package:velorant/store/agent/get_agent_data.dart';
import 'package:velorant/utils/app_colors.dart';
import 'package:velorant/utils/app_string.dart';
import 'package:velorant/widgets/agent_shimmer.dart';
import 'package:velorant/widgets/agents/display_grid_items.dart';

class AgentsGridList extends StatelessWidget {
  const AgentsGridList({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<GetAgentDataStore>();
    return Scaffold(
      backgroundColor: AppColors.gridItemsBGColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(AppStrings.agents),
        automaticallyImplyLeading: false,
      ),
      body: Observer(
        builder: (_) {
          switch (store.networkState) {
            case NetworkState.initial:
              return const SizedBox.shrink();
            case NetworkState.loading:
              return const ShimmerGridWidget();
            case NetworkState.success:
              return const DisplayGridItems();
            case NetworkState.failure:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
