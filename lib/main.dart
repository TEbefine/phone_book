import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/auth_guard_page.dart';
import 'package:phone_book/bloc/auth_bloc/auth_bloc.dart';
import 'package:phone_book/cubit/login_out_cubit/login_out_cubit.dart';
import 'package:phone_book/cubit/new_login_cubit.dart/new_login_cubit.dart';
import 'package:phone_book/cubit/personal_info_btu_cubit/button_cubit.dart';
import 'package:phone_book/cubit/register_cubit/register_user_cubit.dart';
import 'package:phone_book/cubit/update_%20profile_cubit/update_photo_cubit.dart';
import 'package:phone_book/cubit/update_cubit/update_name_cubit.dart';
import 'package:phone_book/cubit/username_controller.dart';
import 'package:phone_book/function/authentication.dart';
import 'package:phone_book/router/router.dart';
// import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserRepository.instance.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AuthBloc()),
      BlocProvider(create: (context) => UpdateNameCubit(router)),
      BlocProvider(create: (context) => RegisterUserCubit()),
      BlocProvider(create: (context) => LoginOutCubit()),
      BlocProvider(create: (context) => UpdatePhotoCubit()),
      BlocProvider(create: (context) => ButtonCubit()),
      BlocProvider(create: (context) => UsernameControllerCubit()),
      BlocProvider(create: (context) => NewLoginCubit()),
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://da28rauy2a860.cloudfront.net/completehome/wp-content/uploads/2021/03/03114534/Millbrook-Homes-58series-1.jpg',
                width: 200.0, // Set desired width
                height: 200.0,
              ),
              const SizedBox(
                width: 40.0,
              ),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Blank_page_intentionally_end_of_book.jpg/800px-Blank_page_intentionally_end_of_book.jpg',
                width: 200.0, // Set desired width
                height: 200.0,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () => context.go('/profile'),
              child: const Text('profile'))
        ],
      ),
    ));
  }
}

//https://da28rauy2a860.cloudfront.net/completehome/wp-content/uploads/2021/03/03114534/Millbrook-Homes-58series-1.jpg

