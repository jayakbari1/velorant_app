import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:velorant/model/weapos/weapon_model.dart';
import 'package:velorant/widgets/weapon/gun_skin_items.dart';
import 'package:velorant/widgets/weapon/weapon_data.dart';

class WeaponInfo extends StatelessWidget {
  const WeaponInfo({required this.weaponModel, super.key});

  final WeaponModel weaponModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weaponModel.displayName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.maybeOf(context)!.size.width / 1.2,
              child: Image(
                image: NetworkImage(weaponModel.displayIcon),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                WeaponData(
                  weaponText: 'Type',
                  weaponData: weaponModel.shopData?.category ?? 'No Data Found',
                ),
                const Divider(
                  color: Colors.white,
                  height: 20,
                  thickness: 2,
                ),
                WeaponData(
                  weaponText: 'Cost',
                  weaponData: weaponModel.shopData?.cost.toString() ?? 'No Data Found',
                ),
                const Divider(
                  color: Colors.white,
                  height: 20,
                  thickness: 2,
                ),
                WeaponData(
                  weaponText: 'Fire Rate',
                  weaponData:
                      '${weaponModel.weaponStats?.fireRate.toString()} Roundes/Sec',
                ),
                const Divider(
                  color: Colors.white,
                  height: 20,
                  thickness: 2,
                ),
                WeaponData(
                  weaponText: 'Magazine Size',
                  weaponData: weaponModel.weaponStats?.magazineSize.toString() ?? 'No Data Found',
                ),
                const Divider(
                  color: Colors.white,
                  height: 20,
                  thickness: 2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(child: GunSkinItems(weaponModel: weaponModel,)),
        ],
      ),
    );
  }
}
