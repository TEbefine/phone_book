import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/new_login_cubit.dart/new_login_cubit.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/78997786?s=280&v=4'),
              ),
              const SizedBox(height: 30),
              Text('Sign In',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 50.0,
                        color: Colors.brown[800],
                      )),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 8.0), // Add spacing on both sides
                  Container(
                    height: 2.0,
                    width: 250.0, // Adjust width as needed
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  const SizedBox(width: 8.0), // Add spacing on both sides
                  const Text('OR', style: TextStyle(height: 2.0)),
                  const SizedBox(width: 8.0), // Add spacing on both sides
                  Container(
                    height: 2.0,
                    width: 250.0, // Adjust width as needed
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  const SizedBox(width: 8.0), // Add spacing on both sides
                ],
              ),
              Text('E-mail address',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 20.0,
                        color: Colors.brown[800],
                      )),
              const SizedBox(height: 40.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 12.0,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
