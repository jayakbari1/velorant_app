import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:velorant/routes/app_routes.dart';
import 'package:velorant/routes/route_navigation.dart';
import 'package:velorant/store/weapons/weapon_store.dart';

class WeaponGridList extends StatelessWidget {
  const WeaponGridList({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<WeaponStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guns'),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: read.weapons.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => RouteNavigation.instance.navigateToScreen(
                  AppRoutes.weaponInfo,
                  arguments: read.weapons[index]),
              child: SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      read.weapons[index].displayName,
                      style: const TextStyle(color: Colors.white),
                    ),
                    SizedBox.square(
                      dimension: 150,
                      child: Image(
                        image: NetworkImage(
                          read.weapons[index].displayIcon,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
