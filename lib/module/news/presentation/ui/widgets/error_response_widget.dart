import 'package:flutter/material.dart';

class ErrorResponseWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onTap;

  const ErrorResponseWidget({
    super.key,
    required this.message,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.refresh),
            ),
            const Text('Try to reload'),
          ],
        ),
      ),
    );
  }
}
