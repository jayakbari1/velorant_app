import 'package:flutter/material.dart';
import 'package:velorant/model/agents/agents_model.dart';
import 'package:velorant/utils/app_colors.dart';
import 'package:velorant/utils/app_string.dart';
import 'package:velorant/utils/extension/media_query_extension.dart';
import 'package:velorant/widgets/agents/show_ability.dart';

class AgentInfo extends StatelessWidget {
  const AgentInfo({required this.agentModel, super.key});

  final AgentModel agentModel;

  @override
  Widget build(BuildContext context) {
    final height = GetMediaQuery(context).height;
    final width = GetMediaQuery(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: height / 2.5,
              color: AppColors.backgroundColor,
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    child: SizedBox(
                      width: width,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          agentModel.displayIcon.toString() != null
                              ? agentModel.displayIcon
                              : AppStrings.imageNotFound,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      gradient: LinearGradient(
                        colors: [
                         Color(int.parse(agentModel.backgroundGradientColors[0],radix: 16)),
                         Color(int.parse(agentModel.backgroundGradientColors[1],radix: 16)),
                         Color(int.parse(agentModel.backgroundGradientColors[2],radix: 16)),
                         Color(int.parse(agentModel.backgroundGradientColors[3],radix: 16)),

                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    child: Image(
                      // fit: BoxFit.cover,
                      height: height / 2.12,
                      image: NetworkImage(
                        agentModel.fullPortrait ?? AppStrings.imageNotFound,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 50,
                    child: Column(
                      children: [
                        Text(
                          agentModel.displayName,
                          style: const TextStyle(
                            fontSize: 40,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightWhiteColor,
                            shape: const ContinuousRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            agentModel.role?.displayName ??
                                AppStrings.noRoleFound,
                            style: const TextStyle(color: AppColors.whiteColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '// BIOGRAPHY',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      agentModel.description,
                      style: const TextStyle(
                        color: AppColors.lightWhiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '// SPECIAL ABILITIES',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: agentModel.abilities.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ShowAbilityCard(
                                    imageURL: agentModel
                                            .abilities[index].displayIcon,
                                    skillName: agentModel
                                        .abilities[index].displayName!,
                                    skillInfo:
                                        agentModel.abilities[index].description,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
