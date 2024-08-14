import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:phone_book/function/auth_checker.dart';
import 'package:phone_book/function/authentication.dart';
import 'package:phone_book/screens/login.dart';
import 'package:phone_book/screens/profile.dart';
import 'package:phone_book/screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthChecker();
      }),
  GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      }),
  GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      }),
  GoRoute(
      path: '/profile',
      redirect: (context, state) {
        if (UserRepository.instance.isLoggedIn()) {
          return null;
        }
        return '/login';
      },
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen();
      }),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Details Screen')),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () => context.go('/login'),
//               child: const Text('Go to the Login screen'),
//             ),
//             ElevatedButton(
//               onPressed: () => context.go('/register'),
//               child: const Text('Go to the register screen'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
