import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/screens/error.dart';
import 'package:phone_book/screens/login.dart';
import 'package:phone_book/screens/profile.dart';
import 'package:phone_book/screens/register.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      if (!isLoggedIn) {
        return const LoginScreen();
      }
      return const ProfileScreen();
    },
  ),
  GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      }),
  GoRoute(
      path: '/register',
      redirect: (context, state) {
        final isLoggedIn = FirebaseAuth.instance.currentUser != null;
        if (isLoggedIn) {
          return '/error?message=Please log out first&button=profile';
        }
        return null;
      },
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      }),
  GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        final isLoggedIn = FirebaseAuth.instance.currentUser != null;
        if (!isLoggedIn) {
          return const LoginScreen();
        }
        return const ProfileScreen();
      }),
  GoRoute(
      path: '/error',
      builder: (BuildContext context, GoRouterState state) {
        final message = state.uri.queryParameters['message'] ?? 'Unknown error';
        final button = state.uri.queryParameters['button'] ?? 'login';
        return ErrorScreen(message: message, button: button);
      }),
]);
