import 'package:flutter/material.dart';
import 'package:velorant/model/weapos/weapon_model.dart';
import 'package:velorant/utils/app_string.dart';

class GunSkinItems extends StatelessWidget {
  const GunSkinItems({required this.weaponModel, super.key});

  final WeaponModel weaponModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 20),
      shrinkWrap: true,
      //physics: NeverScrollableScrollPhysics(),
      itemCount: weaponModel.skins!.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              height: 150,
              width: 200,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    weaponModel.skins![index].displayName!,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 100,
                    child: Image(
                      image: NetworkImage(
                        weaponModel.skins![index].displayIcon ??
                            AppStrings.imageNotFound,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        );
      },
    );
  }
}
