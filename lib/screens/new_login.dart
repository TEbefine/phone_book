import 'package:flutter/material.dart';
import 'package:phone_book/screens/new_login/main_form.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({super.key});

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(child: MainSignForm()));
  }
}

// BlocBuilder<NewLoginCubit, NewLoginState>(builder: (context, state) {
//         if (state is SignIn) {
//           return const SignInForm();
//         } else {
//           return const SignUpForm();
//         }
//       }),
