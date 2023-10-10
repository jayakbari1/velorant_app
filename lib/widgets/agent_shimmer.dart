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
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.grey.shade300,
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 200,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
