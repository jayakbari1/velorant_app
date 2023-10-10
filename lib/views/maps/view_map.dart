import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velorant/model/maps/maps_model.dart';
import 'package:velorant/store/maps/maps_store.dart';
import 'package:velorant/utils/extension/media_query_extension.dart';

class ViewMap extends StatelessWidget {
  const ViewMap({required this.mapModel, super.key});

  final MapModel mapModel;

  @override
  Widget build(BuildContext context) {
    final store = context.read<MapStore>();
    final size = context.mediaQuery.size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Image.network(
              mapModel.displayIcon!,
              fit: BoxFit.contain,
            ),
            Positioned(
              // left: 3980.9062 * 0.007 + 0.813895,
              //top: 5938.758 * 0.007 + 0.573242,
              child: Text(
                'Hi',
                style: TextStyle(color: Colors.white),
              ),
            )
            // ListView.builder(
            //   itemCount: store.mapList.length,
            //   itemBuilder: (context, index) {
            //     return Positioned(
            //       top:
            //           store.mapList[index].callouts?[index].location.yCoordinates,
            //       left:
            //           store.mapList[index].callouts?[index].location.xCoordinates,
            //       child: Text('Hi'),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
