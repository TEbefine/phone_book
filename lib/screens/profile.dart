import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/cubit/update_name_cubit.dart';
import 'package:phone_book/screens/widgets/profile_widgets/profile_layout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: BlocListener<UpdateNameCubit, UpdateNameState>(
        listener: (context, state) {
          if (state is UpdateNameSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('User name updated successfully!'),
              ),
            );
          }
        },
        child: const ProfileLayout(),
      ),
    );
  }
}
