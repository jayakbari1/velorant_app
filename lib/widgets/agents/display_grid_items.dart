import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velorant/routes/app_routes.dart';
import 'package:velorant/routes/route_navigation.dart';
import 'package:velorant/store/agent/get_agent_data.dart';
import 'package:velorant/utils/app_colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:velorant/utils/app_string.dart';

class DisplayGridItems extends StatelessWidget {
  const DisplayGridItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final read = context.read<GetAgentDataStore>();
    return Observer(builder: (_) {
      return GridView.builder(
        itemCount: read.agentList.length,
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
              RouteNavigation.instance.navigateToScreen(AppRoutes.agentInfo,
                  arguments: read.agentList[index]);
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
                    read.agentList[index].displayName,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CachedNetworkImage(
                    imageUrl: read.agentList[index].fullPortraitV2,
                    errorWidget: (_, __, ___) {
                      return Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              AppStrings.imageNotFound,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
