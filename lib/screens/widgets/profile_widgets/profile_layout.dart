import 'package:flutter/material.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(
                'https://png.pngtree.com/thumb_back/fh260/background/20220904/pngtree-side-profile-of-japanese-monkey-cute-snow-pool-photo-image_22752788.jpg'),
          ),
          Text(
            'User Name',
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ปุ่ม Delete
              ElevatedButton(
                onPressed: () {},
                child: const Text('Delete'),
              ),
              SizedBox(width: 20.0),
              // ปุ่ม Logout
              ElevatedButton(
                onPressed: () {},
                child: const Text('Logout'),
              ),
            ],
          )
        ]);
  }
}
