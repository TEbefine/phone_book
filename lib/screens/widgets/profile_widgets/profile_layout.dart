import 'package:flutter/material.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(
                'https://png.pngtree.com/thumb_back/fh260/background/20220904/pngtree-side-profile-of-japanese-monkey-cute-snow-pool-photo-image_22752788.jpg'),
          ),
        ]);
  }
}
