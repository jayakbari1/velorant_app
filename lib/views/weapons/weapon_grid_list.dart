import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:velorant/enumeration/network_state.dart';
import 'package:velorant/store/weapons/weapon_store.dart';
import 'package:velorant/widgets/agent_shimmer.dart';
import 'package:velorant/widgets/weapon/weapon_grid_item.dart';

class WeaponGridList extends StatelessWidget {
  const WeaponGridList({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<WeaponStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guns'),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        switch (store.networkState) {
            case NetworkState.initial:
              return const SizedBox.shrink();
            case NetworkState.loading:
              return const ShimmerGridWidget();
            case NetworkState.success:
              return const WeaponGridItems();
            case NetworkState.failure:
              return const CircularProgressIndicator();
          }
      }),
    );
  }
}
