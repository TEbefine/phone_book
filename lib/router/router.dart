import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/auth_guard_page.dart';
import 'package:phone_book/main.dart';
import 'package:phone_book/screens/account.dart';
import 'package:phone_book/screens/new_login.dart';
import 'package:phone_book/work/popup_payment.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
      routes: [
        GoRoute(
          path: 'login',
          redirect: (BuildContext context, GoRouterState state) {
            final isLoggedIn = FirebaseAuth.instance.currentUser != null;
            if (isLoggedIn) {
              return '/';
            }
            return null;
          },
          builder: (BuildContext context, GoRouterState state) =>
              const OPAuthGuardPage(child: NewLogin()),
        ),
        GoRoute(
          path: 'account',
          redirect: (BuildContext context, GoRouterState state) {
            final isLoggedIn = FirebaseAuth.instance.currentUser != null;
            if (!isLoggedIn) {
              return '/login';
            }
            return null;
          },
          builder: (BuildContext context, GoRouterState state) =>
              const AuthGuardPage(child: AccountScreen()),
        ),
      ],
    ),
    GoRoute(
      path: '/payment',
      builder: (BuildContext context, GoRouterState state) =>
          const PopupPayment(),
    ),
  ],
);
