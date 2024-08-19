import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_book/function/authentication.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _duplicateController = TextEditingController();
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
          } else {
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
                          const InputDecoration(labelText: 'Put In your Email'),
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
                            onPressed: _isLoading ? null : register,
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
            );
          }
        });
  }

  Future<void> register() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    bool passwordMatch = true;

    if (_passwordController.text != _duplicateController.text) {
      setState(() {
        _errorMessage = 'Passwords do not match';
        _isLoading = false;
      });
      passwordMatch = false;
    }

    if (passwordMatch) {
      try {
        await UserRepository.instance
            .registerUser(_emailController.text, _passwordController.text);

        if (!mounted) return;

        context.go('/profile');
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
      }
    }
    _emailController.clear();
    _passwordController.clear();
    _duplicateController.clear();
  }

  String _parseError(String error) {
    final match = RegExp(r'\[(.*?)\]\s*(.*)').firstMatch(error);
    if (match != null && match.groupCount == 2) {
      return match.group(2) ?? 'Unknown error';
    }
    return error;
  }
}
