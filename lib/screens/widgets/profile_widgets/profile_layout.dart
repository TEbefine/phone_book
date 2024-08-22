import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/login_out_cubit/login_out_cubit.dart';
import 'package:phone_book/cubit/register_cubit/register_user_cubit.dart';
import 'package:phone_book/cubit/update_%20profile_cubit/update_photo_cubit.dart';
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
          Stack(
            children: [
              // CircleAvatar
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(UserRepository
                        .instance.user?.photoURL ??
                    'https://png.pngtree.com/thumb_back/fh260/background/20220904/pngtree-side-profile-of-japanese-monkey-cute-snow-pool-photo-image_22752788.jpg'),
              ),

              // Positioned button
              Positioned(
                right: -8,
                bottom: -10,
                child: GestureDetector(
                  child: Container(
                    width: 40.0, // Adjust size as needed
                    height: 40.0, // Adjust size as needed
                    decoration: const BoxDecoration(
                      color: Colors.white, // Background color of the button
                      shape: BoxShape.circle, // Make it circular
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // Shadow color
                          blurRadius: 4.0, // Shadow blur radius
                          offset: Offset(2.0, 2.0), // Shadow offset
                        ),
                      ],
                    ),
                    child: Center(
                        child: BlocBuilder<UpdatePhotoCubit, UpdatePhotoState>(
                            // bloc: BlocProvider.of<UpdatePhotoCubit>(context),
                            builder: (context, state) {
                      if (state is UpdatePhotoLoading) {
                        return const Center(
                            child: SizedBox(
                          width: 20.0, // Set the desired width
                          height: 20.0, // Set the desired height
                          child: CircularProgressIndicator(
                            strokeWidth:
                                2.0, // Adjust the stroke width if needed
                          ),
                        ));
                      } else {
                        return IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          onPressed: () => context
                              .read<UpdatePhotoCubit>()
                              .pickAndCropImage(context),
                        );
                      }
                    })),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20.0),
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
          ),
        ]);
  }
}
