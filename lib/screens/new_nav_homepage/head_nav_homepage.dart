import 'package:flutter/material.dart';

class HeadNavHomepage extends StatelessWidget {
  const HeadNavHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://ml.globenewswire.com/Resource/Download/27311aae-6eed-48ac-900c-7d107394d35a",
            width: 85,
          ),
          const SizedBox(
            width: 113,
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
    );
  }
}
