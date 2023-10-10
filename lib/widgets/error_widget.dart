import 'package:flutter/material.dart';

class ErrorWidgetWithButton extends StatelessWidget {
  const ErrorWidgetWithButton({
    required this.errorMsg,
    required this.function,
    super.key,
  });

  final String errorMsg;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMsg,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            onPressed: function,
            child: const Text('Retry'),
          )
        ],
      ),
    );
  }
}
