import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/auth_guard_page.dart';
import 'package:phone_book/bloc/auth_bloc/auth_bloc.dart';
import 'package:phone_book/function/authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (!snapshot.hasData) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_isLoading) const CircularProgressIndicator(),
                    if (_errorMessage != null)
                      Text(_errorMessage!,
                          style: const TextStyle(color: Colors.red)),
                    TextField(
                      controller: _emailController,
                      decoration:
                          const InputDecoration(hintText: 'Put In your ID'),
                      keyboardType: TextInputType.emailAddress,
                      onSubmitted: _isLoading ? null : (value) => signIn(),
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      onSubmitted: _isLoading ? null : (value) => signIn(),
                      decoration: const InputDecoration(
                          hintText: 'Put In your Password'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(AuthLoginRequested(
                                  email: _emailController.text,
                                  password: _passwordController.text));
                            },
                            child: const Text('Login')),
                        const SizedBox(width: 20.0),
                        ElevatedButton(
                            onPressed: () => context.go('/register'),
                            child: const Text('Register')),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Future.microtask(() => context.go('/profile'));
            return const Scaffold();
          }
        });
  }

  Future<void> signIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await UserRepository.instance
          .signInUser(_emailController.text, _passwordController.text);

      // if (!mounted) return;

      // context.go('/profile');
    } catch (e) {
      setState(() {
        _errorMessage = _parseError(e.toString());
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }

      _emailController.clear();
      _passwordController.clear();
    }
  }

  String _parseError(String error) {
    final match = RegExp(r'\[(.*?)\]\s*(.*)').firstMatch(error);
    if (match != null && match.groupCount == 2) {
      return match.group(2) ?? 'Unknown error';
    }
    return error;
  }
}
