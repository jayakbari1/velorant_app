import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:velorant/enumeration/network_state.dart';
import 'package:velorant/store/maps/maps_store.dart';
import 'package:velorant/widgets/maps/maps_list_item.dart';
import 'package:velorant/widgets/maps_shimmer.dart';

class MapsListView extends StatelessWidget {
  const MapsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<MapStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
      ),
      body: Observer(builder: (context) {
        switch (store.networkState) {
          case NetworkState.initial:
            return const SizedBox.shrink();
          case NetworkState.loading:
            return const MapShimmer();
          case NetworkState.success:
            return const MapsListItems();
          case NetworkState.failure:
            return const CircularProgressIndicator();
        }
      }),
    );
  }
}
