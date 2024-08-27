import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/new_login_cubit.dart/new_login_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextField(decoration: InputDecoration(labelText: 'Email')),
        const TextField(decoration: InputDecoration(labelText: 'Password')),
        const TextField(
            decoration: InputDecoration(labelText: 'ConfirmPassword')),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Login'),
        ),
        TextButton(
          onPressed: () => context.read<NewLoginCubit>().showSignIn(),
          child: const Text('Don\'t have an account? Sign In'),
        ),
      ],
    );
  }
}
