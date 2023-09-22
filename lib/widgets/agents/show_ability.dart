import 'package:flutter/material.dart';
import 'package:velorant/utils/app_colors.dart';

class ShowAbilityCard extends StatelessWidget {
  final String? imageURL;
  final String skillName;
  final String skillInfo;

  const ShowAbilityCard({
    super.key,
    required this.imageURL,
    required this.skillName,
    required this.skillInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: AppColors.skillCardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Expanded(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: AppColors.skillImageCardColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image(
                    image: NetworkImage(
                      imageURL!,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skillName,
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    skillInfo,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.lightWhiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
