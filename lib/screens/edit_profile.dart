import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/update_cubit/update_name_cubit.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change User Name')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Enter new name'),
              onSubmitted: (value) {
                context
                    .read<UpdateNameCubit>()
                    .updateName(_nameController.text);
              },
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<UpdateNameCubit>()
                    .updateName(_nameController.text);
              },
              child: const Text('Change Name'),
            ),
          ],
        ),
      ),
    );
  }
}
