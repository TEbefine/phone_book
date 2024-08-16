import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/function/authentication.dart';

class ProfileLayout extends StatelessWidget {
  final User? user;
  const ProfileLayout({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(
                'https://png.pngtree.com/thumb_back/fh260/background/20220904/pngtree-side-profile-of-japanese-monkey-cute-snow-pool-photo-image_22752788.jpg'),
          ),
          const SizedBox(height: 10.0),
          Text(
            user?.displayName ?? 'User Name',
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Edit Profile'),
                        content: const Text('This is a small pop-up window.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Delete'),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () => signOut(context),
                child: const Text('Logout'),
              ),
            ],
          )
        ]);
  }

  Future<void> signOut(BuildContext context) async {
    await UserRepository.instance.signOut();

    context.go('/login');
  }
}
