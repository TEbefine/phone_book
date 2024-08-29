import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewSignupForm extends StatefulWidget {
  const NewSignupForm({super.key});

  @override
  State<NewSignupForm> createState() => _NewSignupFormState();
}

class _NewSignupFormState extends State<NewSignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  bool _isEmailError = false;
  bool _isPasswordError = false;
  bool _isConfirmError = false;

  bool _isPasswordObscure = true;
  bool _isConfirmObscure = true;

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
      FocusScope.of(context).requestFocus(_emailFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
          TextFormField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                errorStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 14.0,
                      color: Colors.redAccent,
                    ),
                enabledBorder: _buildOutlineInputBorder(
                    color: Colors.grey.withOpacity(0.5)),
                focusedBorder: _buildOutlineInputBorder(
                    color: Colors.indigo.withOpacity(0.6), width: 2.0),
                errorBorder: _buildOutlineInputBorder(
                    color: Colors.redAccent, width: 2.0),
                focusedErrorBorder: _buildOutlineInputBorder(
                    color: Colors.redAccent, width: 2.0),
                suffixIcon: _emailController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          _emailController.clear();
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.close,
                          color: _isEmailError ? Colors.redAccent : Colors.grey,
                        ))
                    : null),
            validator: (String? value) {
              String pattern =
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

              if (value == null || value.isEmpty) {
                setState(() {
                  _isEmailError = true;
                });
                return 'Email required';
              } else if (!RegExp(pattern, caseSensitive: false)
                  .hasMatch(value)) {
                return 'Invalid email';
              }
              setState(() {
                _isEmailError = false;
              });
              return null;
            },
          ),
          const SizedBox(
            height: 15.0,
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
          TextFormField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
            },
            obscureText: _isPasswordObscure,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
                hintText: 'Password',
                errorMaxLines: 2,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                errorStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 14.0,
                      color: Colors.redAccent,
                    ),
                enabledBorder: _buildOutlineInputBorder(
                    color: Colors.grey.withOpacity(0.5)),
                focusedBorder: _buildOutlineInputBorder(
                    color: Colors.indigo.withOpacity(0.6), width: 2.0),
                errorBorder: _buildOutlineInputBorder(
                    color: Colors.redAccent, width: 2.0),
                focusedErrorBorder: _buildOutlineInputBorder(
                    color: Colors.redAccent, width: 2.0),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_passwordController.text.isNotEmpty)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordObscure = !_isPasswordObscure;
                          });
                        },
                        icon: Icon(
                          _isPasswordObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color:
                              _isPasswordError ? Colors.redAccent : Colors.grey,
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
                          color:
                              _isPasswordError ? Colors.redAccent : Colors.grey,
                        ),
                      ),
                  ],
                )),

            validator: (String? value) {
              String pattern =
                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[a-zA-Z\d@$!%*?&]{6,}$';

              if (value == null || value.isEmpty) {
                setState(() {
                  _isPasswordError = true;
                });
                return 'Password required';
              } else if (!RegExp(pattern).hasMatch(value)) {
                setState(() {
                  _isPasswordError = true;
                });
                return 'Password too weak: minimum 6 characters, 1 uppercase letter, 1 lowercase letter, 1 special character and 1 digit.';
              }
              setState(() {
                _isPasswordError = false;
              });
              return null;
            },
            // obscureText: true,
          ),
          const SizedBox(
            height: 15.0,
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
          TextFormField(
            controller: _confirmPasswordController,
            focusNode: _confirmPasswordFocusNode,
            onFieldSubmitted: (value) {
              // FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
            },
            obscureText: _isConfirmObscure,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
                hintText: 'Confirm Password',
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                errorStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 14.0,
                      color: Colors.redAccent,
                    ),
                enabledBorder: _buildOutlineInputBorder(
                    color: Colors.grey.withOpacity(0.5)),
                focusedBorder: _buildOutlineInputBorder(
                    color: Colors.indigo.withOpacity(0.6), width: 2.0),
                errorBorder: _buildOutlineInputBorder(
                    color: Colors.redAccent, width: 2.0),
                focusedErrorBorder: _buildOutlineInputBorder(
                    color: Colors.redAccent, width: 2.0),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_confirmPasswordController.text.isNotEmpty)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isConfirmObscure = !_isConfirmObscure;
                          });
                        },
                        icon: Icon(
                          _isConfirmObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color:
                              _isConfirmError ? Colors.redAccent : Colors.grey,
                        ),
                      ),
                    if (_confirmPasswordController.text.isNotEmpty)
                      IconButton(
                        onPressed: () {
                          _confirmPasswordController.clear();
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.close,
                          color:
                              _isConfirmError ? Colors.redAccent : Colors.grey,
                        ),
                      ),
                  ],
                )),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                setState(() {
                  _isConfirmError = true;
                });
                return 'Confirm Password required';
              } else if (_passwordController.text !=
                  _confirmPasswordController.text) {
                setState(() {
                  _isConfirmError = true;
                });
                return 'Confirm password not match';
              }
              setState(() {
                _isConfirmError = false;
              });
              return null;
            },
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
                    color: _isChecked
                        ? Colors.indigo.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.5),
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
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.indigo.withOpacity(0.9),
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          Colors.indigo.withOpacity(0.9),
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
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('Ok');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[600],
                foregroundColor: Colors.white,
                elevation: 0,
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
      ),
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
