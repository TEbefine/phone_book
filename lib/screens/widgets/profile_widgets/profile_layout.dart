import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_book/cubit/login_out_cubit/login_out_cubit.dart';
import 'package:phone_book/cubit/register_cubit/register_user_cubit.dart';
import 'package:phone_book/function/authentication.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({super.key});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  File? _pickedImage;
  Uint8List? webImage = Uint8List(8);

  final TextEditingController _passwordController = TextEditingController();

  Future<void> _pickImge() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWasm) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('some thing went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // CircleAvatar(
          //   radius: 50.0,
          //   backgroundImage: NetworkImage(UserRepository
          //           .instance.user?.photoURL ??
          //       'https://png.pngtree.com/thumb_back/fh260/background/20220904/pngtree-side-profile-of-japanese-monkey-cute-snow-pool-photo-image_22752788.jpg'),
          // ),
          // const SizedBox(height: 10.0),
          // Text(
          //   UserRepository.instance.user?.displayName ?? 'User Name',
          // ),
          Image(
            image: _pickedImage != null
                ? FileImage(_pickedImage!)
                : MemoryImage(webImage!),
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) => Image.network(
              'https://example.com/default_image.png', // Replace with your default image URL
              fit: BoxFit.fill,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print('click');
                selectFile();
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

  // Future<void> deleteUser(BuildContext context) async {
  //   try {
  //     await UserRepository.instance.deleteUser(_passwordController.text);
  //   } catch (e) {
  //     print('Error reauthenticating or deleting user: ${e.toString()}');
  //   } finally {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('User deleted successfully.')),
  //     );

  //     context.go('/login');
  //   }
  // }

  Future<void> selectFile() async {
    print('click');
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final fileBytes = result.files.first.bytes;
      final fileName = result.files.first.name;

      // อัปโหลดไฟล์ไปยัง Firebase Storage
      await uploadFile(fileBytes, fileName);
    }
  }

  Future<void> uploadFile(Uint8List? fileBytes, String fileName) async {
    if (fileBytes != null) {
      try {
        final storageRef =
            FirebaseStorage.instance.ref().child('uploads/$fileName');
        await storageRef.putData(fileBytes);
        print('อัปโหลดสำเร็จ');
      } catch (e) {
        print('เกิดข้อผิดพลาด: $e');
      }
    }
  }
}
