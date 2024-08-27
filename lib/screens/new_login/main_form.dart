import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/new_login_cubit.dart/new_login_cubit.dart';
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
                        const MyDropdown(),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/78997786?s=280&v=4'),
                    ),
                    const SizedBox(height: 30),
                    Text(state is SignIn ? 'Sign In' : 'Sign Up',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontSize: 50.0,
                                  color: Colors.indigo[500],
                                )),
                    const SizedBox(
                      height: 30.0,
                    ),
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
