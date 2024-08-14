import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/function/authentication.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (!snapshot.hasData) {
            Future.microtask(() => context.go('/login'));
            return const Scaffold();
          } else {
            return Scaffold(
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Hello'),
                  ElevatedButton(
                      onPressed: () async {
                        await UserRepository.instance.signOut();
                        context.go('/login');
                      },
                      child: const Text('logOut'))
                ],
              )),
            );
          }
        });
  }
}
