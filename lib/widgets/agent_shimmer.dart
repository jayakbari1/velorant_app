import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGridWidget extends StatelessWidget {
  const ShimmerGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 368,
      ),
      itemBuilder: (_, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Shimmer.fromColors(
              highlightColor: Colors.grey.shade100,
              baseColor: Colors.grey.shade300,
              direction: ShimmerDirection.ttb,
              child: const Card(
                child: SizedBox(
                  height: 250,
                  width: 150,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
