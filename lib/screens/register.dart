import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_book/cubit/register_cubit/register_user_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _duplicateController = TextEditingController();
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            return Scaffold(
              body: BlocListener<RegisterUserCubit, RegisterUserState>(
                listener: (context, state) {
                  if (state is RegisterUserFailure) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            labelText: 'Put In your Email'),
                        keyboardType: TextInputType.emailAddress,
                        onSubmitted: _isLoading ? null : (value) => register(),
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            hintText: 'Put In your Password'),
                        onSubmitted: _isLoading ? null : (value) => register(),
                      ),
                      TextField(
                        controller: _duplicateController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            hintText: 'Confirm your Password'),
                        onSubmitted: _isLoading ? null : (value) => register(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                register();
                              },
                              // onPressed: _isLoading ? null : register,
                              child: const Text('Register')),
                          const SizedBox(width: 20.0),
                          ElevatedButton(
                              onPressed: () => context.go('/profile'),
                              child: const Text('Cancel')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }

  Future<void> register() async {
    context.read<RegisterUserCubit>().registerUser(_emailController.text,
        _passwordController.text, _duplicateController.text);

    _emailController.clear();
    _passwordController.clear();
    _duplicateController.clear();
  }
}
