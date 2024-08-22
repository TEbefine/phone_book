import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/update_%20profile_cubit/update_photo_cubit.dart';
import 'package:phone_book/cubit/update_cubit/update_name_cubit.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocListener(listeners: [
      BlocListener<UpdateNameCubit, UpdateNameState>(
        listener: (context, state) {
          _showSnackBar(context, state);
        },
      ),
      BlocListener<UpdatePhotoCubit, UpdatePhotoState>(
          listener: (constext, state) {
        _showSnackBar(context, state);
      })
    ], child: const Scaffold()));
  }
}

void _showSnackBar(BuildContext context, dynamic state) {
  String message;
  Color backgroundColor;

  if (state is UpdateNameSuccess || state is UpdatePhotoSuccess) {
    message = state.success;
    backgroundColor = Colors.green;
  } else if (state is UpdateNameFailure || state is UpdatePhotoFailure) {
    message = state.error;
    backgroundColor = Colors.redAccent;
  } else {
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        elevation: 0),
  );
}
