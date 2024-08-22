import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/personal_info_btu_cubit/button_cubit.dart';
import 'package:phone_book/cubit/update_cubit/update_name_cubit.dart';
import 'package:phone_book/cubit/username_controller.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({super.key});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, bool>(
      builder: (context, isButtonEnabled) {
        return Align(
          alignment: Alignment.centerRight, // Align the button to the right
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: ElevatedButton(
              onPressed: isButtonEnabled
                  ? () {
                      final username =
                          context.read<UsernameControllerCubit>().state;
                      context.read<UpdateNameCubit>().updateName(username);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button background color
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 2.0), // Padding inside the button
                elevation: 0, // Remove shadow for a minimalistic look
              ),
              child: Text(
                'Save',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
