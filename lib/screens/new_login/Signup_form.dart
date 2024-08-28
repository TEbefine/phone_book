import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isObscure = true;
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
    _confirmPasswordController.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              focusNode: _focusNode,
              onChanged: (value) {},
              onSubmitted: (value) {},
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
                    color: Colors.grey.withOpacity(0.5)),
                focusedBorder: _buildOutlineInputBorder(
                    color: Colors.indigo.withOpacity(0.6), width: 2.0),
                errorBorder: _buildOutlineInputBorder(
                    color: Colors.red.withOpacity(0.7), width: 2.0),
                suffixIcon: _emailController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          _emailController.clear();
                          setState(() {});
                        },
                        icon: const Icon(Icons.close))
                    : null,
              ),
            ),
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
              onChanged: (value) {},
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
                    color: Colors.grey.withOpacity(0.5)),
                focusedBorder: _buildOutlineInputBorder(
                    color: Colors.indigo.withOpacity(0.6), width: 2.0),
                errorBorder: _buildOutlineInputBorder(
                    color: Colors.red.withOpacity(0.7), width: 2.0),
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
                        icon: Icon(_isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    if (_passwordController.text.isNotEmpty)
                      IconButton(
                        onPressed: () {
                          _passwordController.clear();
                          setState(() {});
                        },
                        icon: const Icon(Icons.close),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Confirm Password',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14.0,
                    color: Colors.black.withOpacity(0.7),
                  ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            TextField(
              controller: _confirmPasswordController,
              onChanged: (value) {},
              onSubmitted: (value) {},
              obscureText: _isObscure,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Confirm Password',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                enabledBorder: _buildOutlineInputBorder(
                    color: Colors.grey.withOpacity(0.5)),
                focusedBorder: _buildOutlineInputBorder(
                    color: Colors.indigo.withOpacity(0.6), width: 2.0),
                errorBorder: _buildOutlineInputBorder(
                    color: Colors.red.withOpacity(0.7), width: 2.0),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_confirmPasswordController.text.isNotEmpty)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    if (_confirmPasswordController.text.isNotEmpty)
                      IconButton(
                        onPressed: () {
                          _confirmPasswordController.clear();
                          setState(() {});
                        },
                        icon: const Icon(Icons.close),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  _isChecked = !_isChecked;
                });
              },
              fillColor:
                  WidgetStateProperty.all(Colors.white), // Background color
              checkColor: Colors.indigo.withOpacity(0.9),
              side: WidgetStateBorderSide.resolveWith(
                (states) => BorderSide(
                  color: Colors.indigo.withOpacity(0.9),
                  width: 2.0,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'By creating an account, you agree to InFlux',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.0,
                        color: Colors.black.withOpacity(0.7),
                      ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Technology Limited ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.0,
                          color: Colors.black.withOpacity(0.7),
                        ),
                    children: [
                      TextSpan(
                        text: 'Terms of Service',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.indigo.withOpacity(
                                  0.9), // Adjust text color as needed
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.indigo.withOpacity(
                                  0.9), // Explicitly set underline color
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            final Uri url = Uri.parse(
                                'https://runonflux.io/termsandconditions');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                      ),
                      TextSpan(
                        text: ' and consent to',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 16.0,
                              color: Colors.black.withOpacity(0.7),
                            ),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'its ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.0,
                          color: Colors.black.withOpacity(0.7),
                        ),
                    children: [
                      TextSpan(
                          text: 'Privacy Policy',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: Colors.indigo.withOpacity(0.9),
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.indigo.withOpacity(0.9),
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              final Uri url = Uri.parse(
                                  'https://runonflux.io/privacyPolicy');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                      const TextSpan(text: '.')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: double.infinity, // Makes the button full width
          child: ElevatedButton(
            onPressed: () {},
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
              'Sign Up',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ],
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
