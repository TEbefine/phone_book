import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/function/authentication.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello'),
            ElevatedButton(
                onPressed: () async {
                  await UserRepository.instance.signOut();
                  context.go('login');
                },
                child: const Text('logOut'))
          ],
        ),
      ),
    );
  }
}
