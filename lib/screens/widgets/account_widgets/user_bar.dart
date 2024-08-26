import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../function/authentication.dart';

class UserBar extends StatelessWidget {
  const UserBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage(UserRepository
                    .instance.user?.photoURL ??
                'https://png.pngtree.com/thumb_back/fh260/background/20220904/pngtree-side-profile-of-japanese-monkey-cute-snow-pool-photo-image_22752788.jpg'),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                UserRepository.instance.user?.displayName ?? 'Username',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 14.0,
                    ),
              ),
              Text(
                UserRepository.instance.user?.email ?? 'Email',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 12.0,
                      color: Colors.grey[600],
                    ),
              )
            ],
          ),
          const SizedBox(
            width: 30.0,
          ),
          Tooltip(
            message: 'Logout',
            child: RawMaterialButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthLogoutRequested());
              },
              fillColor: Colors.white,
              shape: const CircleBorder(),
              constraints: const BoxConstraints.tightFor(
                width: 40.0,
                height: 40.0,
              ),
              elevation: 0.0,
              child: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
