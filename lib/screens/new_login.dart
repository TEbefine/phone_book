import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_book/bloc/auth_bloc/auth_bloc.dart';
import 'package:phone_book/screens/new_login/main_form.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({super.key});

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginError) {
              Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                webBgColor: "rgba(255, 99, 71, 0.8)",
                webShowClose: true,
                textColor: Colors.white, // Red text color
                fontSize: 16.0,
                timeInSecForIosWeb: 6,
              );
            }
          },
          child: const SingleChildScrollView(child: MainSignForm()),
        ));
  }
}

// BlocBuilder<NewLoginCubit, NewLoginState>(builder: (context, state) {
//         if (state is SignIn) {
//           return const SignInForm();
//         } else {
//           return const SignUpForm();
//         }
//       }),
