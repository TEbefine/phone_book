import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/cubit/test_plus_button.dart';
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
      body: const ProfileLayout(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
