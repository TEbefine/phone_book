import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/router/router.dart';

class AuthGuardPage extends StatelessWidget {
  const AuthGuardPage(
      {super.key, required this.child, this.forceGoToInitialRoute = false});

  final Widget child;
  final bool forceGoToInitialRoute;

  @override
  Widget build(BuildContext context) {
    void redirect() {
      if (forceGoToInitialRoute) {
        context.go('/');
      } else {
        context.go('account');
      }
    }

    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          (previous.isNotAuthenticated != current.isNotAuthenticated),
      listener: (context, state) {
        if (state.isNotAuthenticated) {
          redirect();
        }
      },
      builder: (context, state) {
        if (state.isAuthenticated) {
          return child;
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            redirect();
          });
          return const SizedBox();
        }
      },
      buildWhen: (previous, current) =>
          (previous.isAuthenticated != current.isAuthenticated),
    );
  }
}
