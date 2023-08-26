import 'package:flutter/material.dart';
import 'package:velorant/utils/app_colors.dart';
import 'package:velorant/utils/extension/media_query_extension.dart';
import 'package:velorant/widgets/agents/show_ability.dart';

class AgentInfo extends StatelessWidget {
  const AgentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = GetMediaQuery(context).mediaQuery;
    final height = GetMediaQuery(context).height;
    final width = GetMediaQuery(context).width;
    return Scaffold(
      body: Column(
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
                    child: const Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/displayicon.png',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height / 2.5,
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffc7f458ff),
                        Color(0xffd56324ff),
                        Color(0xff3a2656ff),
                        Color(0xff3a7233ff)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  child: Image(
                    // fit: BoxFit.cover,
                    height: height / 2.12,
                    image: const NetworkImage(
                      'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 50,
                  child: Column(
                    children: [
                      const Text(
                        'GEKKO',
                        style: TextStyle(
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
                        child: const Text(
                          'Initiator',
                          style: TextStyle(color: AppColors.whiteColor),
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
                  const Text(
                    'Gekko the Angeleno leads a tight-knit crew of calamitous creatures. His buddies bound forward, scattering enemies out of the way, with Gekko chasing them down to regroup and go again.',
                    style: TextStyle(
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
                      children: const [
                        ShowAbilityCard(
                          imageURL:
                              'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability1/displayicon.png',
                          skillName: 'Wingman',
                          skillInfo:
                              'EQUIP Wingman. FIRE to send Wingman forward seeking enemies',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ShowAbilityCard(
                          imageURL:
                              'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability2/displayicon.png',
                          skillName: 'Dizzy',
                          skillInfo:
                              'EQUIP Dizzy. FIRE to send Dizzy soaring forward through the air.',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ShowAbilityCard(
                          imageURL:
                              'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/grenade/displayicon.png',
                          skillName: 'Mosh Pit',
                          skillInfo:
                              'EQUIP Mosh. FIRE to throw Mosh like a grenade.',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ShowAbilityCard(
                          imageURL:
                              'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ultimate/displayicon.png',
                          skillName: 'Thrash',
                          skillInfo:
                              'EQUIP Thrash. FIRE to link with Thrash’s mind and steer her through enemy.',
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
    );
  }
}
