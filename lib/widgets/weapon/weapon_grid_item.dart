import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:velorant/routes/app_routes.dart';
import 'package:velorant/routes/route_navigation.dart';
import 'package:velorant/store/weapons/weapon_store.dart';

class WeaponGridItems extends StatelessWidget {
  const WeaponGridItems({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<WeaponStore>();
    return Observer(builder: (context) {
      return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: store.weapons.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => RouteNavigation.instance.navigateToScreen(
                AppRoutes.weaponInfo,
                arguments: store.weapons[index]),
            child: SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    store.weapons[index].displayName,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Hero(
                    tag: store.weapons[index].displayIcon,
                    child: SizedBox.square(
                      dimension: 150,
                      child: Image(
                        image: NetworkImage(
                          store.weapons[index].displayIcon,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    });
    ;
  }
}
