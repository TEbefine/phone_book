import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_book/cubit/profile_photo_cubit.dart';
import 'package:phone_book/function/authentication.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({super.key});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePhotoCubit, ProfilePhotoState>(
        builder: (context, state) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                // เลือกไฟล์ภาพจาก device และอัปโหลด
                final filePath = await _pickImage();
                if (filePath != null) {
                  context
                      .read<ProfilePhotoCubit>()
                      .updateProfilePhoto(filePath);
                }
              },
              child: CircleAvatar(
                radius: 50,
                // backgroundImage: state is ProfilePhotoSuccess
                //     ? FileImage(File(state.photoPath))
                //     : const AssetImage('assets/default_profile.png')
                //         as ImageProvider,
              ),
            ),
            if (state is ProfilePhotoLoading) const CircularProgressIndicator(),
            if (state is ProfilePhotoFailure) Text('Error: ${state.error}'),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(UserRepository
                      .instance.user?.photoURL ??
                  'https://png.pngtree.com/thumb_back/fh260/background/20220904/pngtree-side-profile-of-japanese-monkey-cute-snow-pool-photo-image_22752788.jpg'),
            ),
            const SizedBox(height: 10.0),
            Text(
              UserRepository.instance.user?.displayName ?? 'User Name',
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
                          title: const Text('Confirm Delete Account'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Enter your password',
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => deleteUser(context),
                              child: const Text('Delete'),
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
    });
  }

  Future<void> signOut(BuildContext context) async {
    await UserRepository.instance.signOut();

    context.go('/login');
  }

  Future<void> deleteUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.currentUser?.reauthenticateWithCredential(
        EmailAuthProvider.credential(
          email: FirebaseAuth.instance.currentUser!.email!,
          password: _passwordController.text,
        ),
      );
      await UserRepository.instance.deleteUser();
    } catch (e) {
      print('Error reauthenticating or deleting user: ${e.toString()}');
    } finally {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User deleted successfully.')),
      );

      context.go('/login');
    }
  }

  Future<String?> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile?.path;
  }
}
