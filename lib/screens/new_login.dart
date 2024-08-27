import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/new_login_cubit.dart/new_login_cubit.dart';
import 'package:phone_book/screens/new_login/Signin_form.dart';
import 'package:phone_book/screens/new_login/Signup_form.dart';
import 'package:phone_book/screens/new_login/my_dropdown.dart';

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
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Tooltip(
                        message: 'Close',
                        child: RawMaterialButton(
                          onPressed: () {},
                          fillColor: Colors.white,
                          shape: const CircleBorder(),
                          constraints: const BoxConstraints.tightFor(
                            width: 40.0,
                            height: 40.0,
                          ),
                          elevation: 0.0,
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      MyDropdown(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// BlocBuilder<NewLoginCubit, NewLoginState>(builder: (context, state) {
//         if (state is SignIn) {
//           return const SignInForm();
//         } else {
//           return const SignUpForm();
//         }
//       }),
