import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velorant/store/agent/get_agent_data.dart';
import 'package:velorant/utils/app_colors.dart';
import 'package:velorant/utils/app_string.dart';
import 'package:velorant/widgets/agents/display_grid_items.dart';

class AgentsGridList extends StatelessWidget {
  const AgentsGridList({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.gridItemsBGColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(AppStrings.agents),
        automaticallyImplyLeading: false,
      ),
      body: const DisplayGridItems(),
    );
  }
}
