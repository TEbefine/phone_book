import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  final String message;
  final String button;
  const ErrorScreen({super.key, required this.message, required this.button});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(message),
            ElevatedButton(
                onPressed: () => context.go('/$button'),
                child: Text('Go to $button')),
          ],
        ),
      ),
    );
  }
}
