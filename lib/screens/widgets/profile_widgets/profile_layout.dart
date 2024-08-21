import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:phone_book/cubit/login_out_cubit/login_out_cubit.dart';
import 'package:phone_book/cubit/register_cubit/register_user_cubit.dart';
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
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(UserRepository
                    .instance.user?.photoURL ??
                'https://png.pngtree.com/thumb_back/fh260/background/20220904/pngtree-side-profile-of-japanese-monkey-cute-snow-pool-photo-image_22752788.jpg'),
            onBackgroundImageError: (exception, stackTrace) {
              print('Error loading image: $exception');

              // showDialog(
              //   context: context,
              //   builder: (context) => AlertDialog(
              //     title: Text('เกิดข้อผิดพลาด'),
              //     content: Text('ไม่สามารถโหลดรูปภาพได้ กรุณาลองใหม่อีกครั้ง'),
              //   ),
              // );
            },
          ),
          const SizedBox(height: 10.0),
          Text(
            UserRepository.instance.user?.displayName ?? 'User Name',
          ),
          ElevatedButton(
              onPressed: () async {
                // ให้ผู้ใช้เลือกและครอปรูปภาพ (หรือใช้งาน code selectAndCropFile)
                final result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  final fileBytes = result.files.first.bytes;
                  final userId = FirebaseAuth.instance.currentUser?.uid ?? '';

                  await changeUserProfilePicture(fileBytes!, userId);
                }
              },
              child: const Text('Upload Image')),
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
                            onPressed: () => context
                                .read<RegisterUserCubit>()
                                .deleteUser(_passwordController.text),
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
                onPressed: () => context.read<LoginOutCubit>().signOut(),
                child: const Text('Logout'),
              ),
            ],
          )
        ]);
  }

  Future<String?> uploadProfilePicture(
      Uint8List fileBytes, String userId) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(userId);

      final metadata = SettableMetadata(contentType: 'image/jpeg');
      await storageRef.putData(fileBytes, metadata);
      final downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl; // ส่งคืน URL ของรูปภาพที่อัปโหลด
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

  Future<void> updateProfilePicture(String downloadUrl) async {
    try {
      final _user = await FirebaseAuth.instance.currentUser;
      if (_user != null) {
        await _user.updatePhotoURL(downloadUrl);
        await _user
            .reload(); // รีโหลดข้อมูลของผู้ใช้เพื่อให้แน่ใจว่าการเปลี่ยนแปลงถูกอัปเดต
        print('update profile picture successful');
      }
    } catch (e) {
      print('Error update the profile picture: $e');
    }
  }

  Future<void> changeUserProfilePicture(
      Uint8List fileBytes, String userId) async {
    // อัปโหลดรูปภาพไปยัง Firebase Storage
    try {
      String? downloadUrl = await uploadProfilePicture(fileBytes, userId);

      if (downloadUrl != null) {
        // อัปเดต URL รูปภาพใน Firebase Authentication
        await updateProfilePicture(downloadUrl);
        print('Able to upload');
      } else {
        print('Unable to upload');
      }
    } catch (e) {
      print('Error changing the profile picture: $e');
    }
  }

  // Future<void> selectFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result != null) {
  //     final fileBytes = result.files.first.bytes;
  //     final fileName = result.files.first.name;

  //     await uploadFile(fileBytes, fileName);
  //   }
  // }

  // Future<void> uploadFile(Uint8List? fileBytes, String fileName) async {
  //   if (fileBytes != null) {
  //     try {
  //       final storageRef =
  //           FirebaseStorage.instance.ref().child('uploads/$fileName');
  //       await storageRef.putData(fileBytes);
  //       print('Upload Successful');
  //     } catch (e) {
  //       print('Error occurred: $e');
  //     }
  //   }
  // }
}
