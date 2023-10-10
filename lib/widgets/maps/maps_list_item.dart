import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velorant/routes/app_routes.dart';
import 'package:velorant/routes/route_navigation.dart';
import 'package:velorant/store/maps/maps_store.dart';

class MapsListItems extends StatelessWidget {
  const MapsListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<MapStore>();
    return ListView.builder(
      itemCount: store.mapList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => RouteNavigation.instance.navigateToScreen(
            AppRoutes.mapInfo,
            arguments: store.mapList[index],
          ),
          child: Card(
            child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image(
                    image: NetworkImage(store.mapList[index].splash),
                    fit: BoxFit.fitWidth,
                    opacity: const AlwaysStoppedAnimation(0.5),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 175,
                  child: Text(
                    store.mapList[index].displayName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
