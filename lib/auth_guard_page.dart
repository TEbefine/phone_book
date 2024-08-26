import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/bloc/auth_bloc/auth_bloc.dart';

class AuthGuardPage extends StatelessWidget {
  const AuthGuardPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    void redirect() {
      context.go('/');
    }

    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          (previous.isAuthenticated != current.isAuthenticated) &&
          current.isInitial == false,
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          print('listener');
          redirect();
        }
      },
      builder: (context, state) {
        if (state.isInitial) {
          return const SizedBox.shrink();
        }
        if (state is AuthAuthenticated) {
          return child;
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            print('builder');
            redirect();
          });
          return const SizedBox();
        }
      },
      buildWhen: (previous, current) =>
          (previous.isAuthenticated != current.isAuthenticated) &&
          current.isInitial == false,
    );
  }
}

class OPAuthGuardPage extends StatelessWidget {
  const OPAuthGuardPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    void redirect() {
      context.go('/');
    }

    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          (previous.isAuthenticated != current.isAuthenticated) &&
          current.isInitial == false,
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          print('listener');
          redirect();
        }
      },
      builder: (context, state) {
        if (state.isInitial) {
          return const SizedBox.shrink();
        }
        if (state is AuthUnauthenticated) {
          return child;
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            print('builder');
            redirect();
          });
          return const SizedBox();
        }
      },
      buildWhen: (previous, current) =>
          (previous.isAuthenticated != current.isAuthenticated) &&
          current.isInitial == false,
    );
  }
}
