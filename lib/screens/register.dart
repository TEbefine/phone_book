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
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: 'Put In your Password'),
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              controller: _duplicateController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: 'Confirm your Password'),
              onSubmitted: (_) => _submitForm(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _submitForm, child: const Text('Register')),
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

  void _submitForm() {
    _registerUser(
      context,
      _emailController.text,
      _passwordController.text,
      _duplicateController.text,
    );

    _emailController.clear();
    _passwordController.clear();
    _duplicateController.clear();
  }

  Future<void> _registerUser(BuildContext context, String email,
      String password, String checkPassword) async {
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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!mounted) return;

      const snackBar = SnackBar(
        content: Text("Registation Successful"),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      context.go('/profile');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        const snackBar = SnackBar(
          content: Text("Password's too weak"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      } else if (e.code == 'email-already-in-use') {
        const snackBar = SnackBar(
          content: Text("email already in use"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      } else {
        // ... handle other FirebaseAuth exceptions
        const snackBar = SnackBar(
          content: Text("Some thing Error happen"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
    } on Exception catch (e) {
      print(e);
    }

    _emailController.dispose();
    _passwordController.dispose();
    _duplicateController.dispose();
  }
}
