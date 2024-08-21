import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/cubit/login_out_cubit/login_out_cubit.dart';
import 'package:phone_book/cubit/register_cubit/register_user_cubit.dart';
import 'package:phone_book/cubit/update_%20profile_cubit/update_photo_cubit.dart';
import 'package:phone_book/cubit/update_cubit/update_name_cubit.dart';
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
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
