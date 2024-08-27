import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/new_login_cubit.dart/new_login_cubit.dart';
import 'package:phone_book/screens/new_login/Signin_form.dart';
import 'package:phone_book/screens/new_login/Signup_form.dart';
import 'package:phone_book/screens/new_login/main_form/login_platform.dart';
import 'package:phone_book/screens/new_login/my_dropdown.dart';

class MainSignForm extends StatelessWidget {
  const MainSignForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewLoginCubit, NewLoginState>(
      builder: (context, state) {
        return Center(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
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
                              width: 30.0,
                              height: 30.0,
                            ),
                            elevation: 0.0,
                            child: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50.0, // Adjust height as needed
                          child: MyDropdown(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/78997786?s=280&v=4'),
                    ),
                    const SizedBox(height: 15.0),
                    Text(state is SignIn ? 'Sign In' : 'Sign Up',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontSize: 45.0,
                                  color: Colors.indigo[500],
                                )),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const LoginPlatform(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 8.0),
                        Container(
                          height: 2.0,
                          width: 250.0,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          'OR',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          height: 2.0,
                          width: 250.0,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        const SizedBox(width: 8.0),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text('E-mail address',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontSize: 18.0,
                                  color: Colors.indigo[500],
                                )),
                    const SizedBox(height: 40.0),
                    if (state is SignIn)
                      const SigninForm()
                    else
                      const SignupForm(),
                    const SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state is SignIn
                              ? 'Don\'t have an account?'
                              : 'Already have an account?',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                        ),
                        TextButton(
                            onPressed: () {
                              if (state is SignIn) {
                                context.read<NewLoginCubit>().showSignUp();
                              } else {
                                context.read<NewLoginCubit>().showSignIn();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ).copyWith(
                              // Define the hover effect using WidgetStateProperty
                              overlayColor:
                                  WidgetStateProperty.resolveWith<Color?>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.hovered)) {
                                    return Colors.blue.withOpacity(
                                        0.05); // Small blue highlight on hover
                                  }
                                  return null; // No change when not hovered
                                },
                              ),
                              side: WidgetStateProperty.all(BorderSide.none),
                            ),
                            child: Text(
                              state is SignIn ? 'Sign Up' : 'Sign In',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize: 16.0,
                                    color: Colors.indigo[500],
                                  ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    if (state is SignIn)
                      TextButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ).copyWith(
                          // Define the hover effect using WidgetStateProperty
                          overlayColor: WidgetStateProperty.resolveWith<Color?>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.hovered)) {
                                return Colors.blue.withOpacity(
                                    0.05); // Small blue highlight on hover
                              }
                              return null; // No change when not hovered
                            },
                          ),
                          side: WidgetStateProperty.all(BorderSide.none),
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                fontSize: 16.0,
                                color: Colors.indigo[500],
                              ),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    const SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
