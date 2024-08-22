import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/personal_info_btu_cubit/button_cubit.dart';
import 'package:phone_book/main.dart';

import '../../../../cubit/username_controller.dart';

class PersonalUsername extends StatefulWidget {
  const PersonalUsername({super.key});

  @override
  State<PersonalUsername> createState() => _PersonalUsernameState();
}

class _PersonalUsernameState extends State<PersonalUsername> {
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController.addListener(() {
      context
          .read<UsernameControllerCubit>()
          .updateUsername(usernameController.text);
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
            child: Text(
              'Username',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 14.0,
                  ),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: TextField(
              controller: usernameController,
              onChanged: (value) {
                context.read<ButtonCubit>().checkButtonState(value);
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter your new username',
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue.withOpacity(0.7),
                    width: 2.0,
                  )),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.red.withOpacity(0.7),
                    width: 2.0,
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}
