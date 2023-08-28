import 'package:flutter/material.dart';
import 'package:velorant/routes/app_routes.dart';
import 'package:velorant/routes/route_navigation.dart';
import 'package:velorant/utils/app_colors.dart';

class DisplayGridItems extends StatelessWidget {
  const DisplayGridItems({
    required this.name,
    required this.image,
    super.key,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 20,
        mainAxisExtent: 290,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      itemBuilder: (_, index) {
        /*

        NEED TO IMPLEMENT HERO ANIMATION

         */

        return GestureDetector(
          onTap: () {
            RouteNavigation.instance.navigateToScreen(AppRoutes.agentInfo);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.homeListBorderColor,
              ),
              color: AppColors.backgroundColor,
            ),
            child: Column(
              children: [
                // Font style need to change
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                Image(
                  image: AssetImage(
                    image,
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
