// VALORANT GUIDE

import 'package:flutter/material.dart';
import 'package:velorant/home_page_data_provider/home_page_data_provider.dart';

import 'package:velorant/routes/app_routes.dart';
import 'package:velorant/routes/route_navigation.dart';

import 'package:velorant/utils/app_colors.dart';
import 'package:velorant/utils/app_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.homePageTitle),
      ),
      body: GestureDetector(
        onTap: () {
          // redirect to each screen

          RouteNavigation.instance.navigateToScreen(AppRoutes.agentInfo);
        },
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Card(
                color: AppColors.backgroundColor,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: AppColors.homeListBorderColor,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          HomePageDataProvider.homeDataList[index].name,
                          style: textTheme.titleLarge,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 138,
                        width: 152,
                        child: Image(
                          image: AssetImage(
                            HomePageDataProvider.homeDataList[index].imagePath,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
