import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _duplicateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Put In your Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: 'Put In your Password'),
            ),
            TextField(
              controller: _duplicateController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: 'Confirm your Password'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _registerUser(context, _emailController.text,
                          _passwordController.text, _duplicateController.text);
                    },
                    child: const Text('Register')),
                const SizedBox(width: 20.0),
                ElevatedButton(
                    onPressed: () => context.go('/'),
                    child: const Text('Cancel')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _registerUser(BuildContext context, String email, String password,
    String checkPassword) async {
  if (email.isEmpty) {
    const snackBar = SnackBar(
      content: Text("Email can't be Empty"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  } else if (password.isEmpty) {
    const snackBar = SnackBar(
      content: Text("Password can't be Empty"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  } else if (checkPassword.isEmpty) {
    const snackBar = SnackBar(
      content: Text("Please Confirm your Password"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  } else if (password != checkPassword) {
    const snackBar = SnackBar(
      content: Text("Passwords do not match"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  }

  try {
    final userCredential = FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(userCredential);
  } on FirebaseAuthException catch (e) {
    print('e.code');
  } catch (e) {
    print(e);
  }
}
