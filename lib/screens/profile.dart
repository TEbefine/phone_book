import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/function/authentication.dart';
import 'package:phone_book/screens/widgets/profile_widgets/profile_layout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    User? user = UserRepository.instance.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  context.go('/profile/edit-profile');
                },
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Edit Name'),
              ),
            ],
          ),
        ],
      ),
      body: ProfileLayout(user: user),
    );
  }
}
