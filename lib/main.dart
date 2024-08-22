import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/login_out_cubit/login_out_cubit.dart';
import 'package:phone_book/cubit/personal_info_btu_cubit/button_cubit.dart';
import 'package:phone_book/cubit/register_cubit/register_user_cubit.dart';
import 'package:phone_book/cubit/update_%20profile_cubit/update_photo_cubit.dart';
import 'package:phone_book/cubit/update_cubit/update_name_cubit.dart';
import 'package:phone_book/cubit/username_controller.dart';
import 'package:phone_book/function/authentication.dart';
import 'package:phone_book/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserRepository.instance.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => UpdateNameCubit(router)),
      BlocProvider(create: (context) => RegisterUserCubit()),
      BlocProvider(create: (context) => LoginOutCubit()),
      BlocProvider(create: (context) => UpdatePhotoCubit()),
      BlocProvider(create: (context) => ButtonCubit()),
      BlocProvider(create: (context) => UsernameControllerCubit()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 36.0,
                fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontFamily: 'Roboto', fontSize: 14.0),
          )),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
