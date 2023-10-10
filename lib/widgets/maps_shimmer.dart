import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MapShimmer extends StatelessWidget {
  const MapShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey.shade300,
            child: const Card(
              child: SizedBox(
                width: double.infinity,
                height: 200,
              ),
            ),
          );
        },
      ),
    );
  }
}
