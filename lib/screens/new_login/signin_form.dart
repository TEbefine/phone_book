import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/bloc/auth_bloc/auth_bloc.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_emailFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final emailError = state is AuthError ? state.emailError : null;
        final passwordError = state is AuthError ? state.passwordError : null;

        return Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 14.0,
                        color: Colors.black.withOpacity(0.7),
                      ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  onSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    enabledBorder: _buildOutlineInputBorder(
                        color: emailError == null
                            ? Colors.grey.withOpacity(0.5)
                            : Colors.redAccent,
                        width: 2.0),
                    focusedBorder: _buildOutlineInputBorder(
                        color: emailError == null
                            ? Colors.indigo.withOpacity(0.6)
                            : Colors.redAccent,
                        width: 2.0),
                    suffixIcon: _emailController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _emailController.clear();
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.close,
                              color: emailError != null
                                  ? Colors.red
                                  : Colors.black,
                            ))
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                if (emailError != null)
                  Row(
                    children: [
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        emailError,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 12.0,
                              color: Colors.redAccent,
                            ),
                      ),
                    ],
                  )
                else
                  const SizedBox.shrink(),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 14.0,
                        color: Colors.black.withOpacity(0.7),
                      ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  onSubmitted: (value) {},
                  obscureText: _isObscure,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      enabledBorder: _buildOutlineInputBorder(
                          color: passwordError == null
                              ? Colors.grey.withOpacity(0.5)
                              : Colors.redAccent,
                          width: 2.0),
                      focusedBorder: _buildOutlineInputBorder(
                          color: passwordError == null
                              ? Colors.indigo.withOpacity(0.6)
                              : Colors.redAccent,
                          width: 2.0),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_passwordController.text.isNotEmpty)
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: passwordError != null
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                          if (_passwordController.text.isNotEmpty)
                            IconButton(
                              onPressed: () {
                                _passwordController.clear();
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.close,
                                color: passwordError != null
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                if (passwordError != null)
                  Row(
                    children: [
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        passwordError,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 12.0,
                              color: Colors.redAccent,
                            ),
                      ),
                    ],
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity, // Makes the button full width
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthSignInRequested(
                      email: _emailController.text,
                      password: _passwordController.text));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.indigo[600], // Set the background color here
                  foregroundColor: Colors.white, // Set the text color here
                  elevation: 0, // Adjust shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                ),
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(
      {Color? color, double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0), // Increase for more chamfer
      borderSide: BorderSide(
        color: color ?? Colors.transparent,
        width: width,
      ),
    );
  }
}
