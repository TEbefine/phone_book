import 'package:flutter/material.dart';

class MainAccountScreen extends StatefulWidget {
  const MainAccountScreen({super.key});

  @override
  State<MainAccountScreen> createState() => _MainAccountScreenState();
}

class _MainAccountScreenState extends State<MainAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Text(
            'General Settings',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 24.0,
                ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Update personal info and account settings.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
          ),
        ],
      ),
    );
  }
}
