import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/function/auth_checker.dart';
import 'package:phone_book/function/authentication.dart';
import 'package:phone_book/screens/error.dart';
import 'package:phone_book/screens/login.dart';
import 'package:phone_book/screens/profile.dart';
import 'package:phone_book/screens/register.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
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
