import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/new_login_cubit.dart/new_login_cubit.dart';
import 'package:phone_book/screens/new_login/Signin_form.dart';
import 'package:phone_book/screens/new_login/Signup_form.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({super.key});

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<NewLoginCubit, NewLoginState>(builder: (context, state) {
        if (state is SignIn) {
          return const SignInForm();
        } else {
          return const SignUpForm();
        }
      }),
    );
  }
}
