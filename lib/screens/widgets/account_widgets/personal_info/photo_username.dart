import 'package:flutter/material.dart';
import 'package:phone_book/function/authentication.dart';
import 'package:phone_book/screens/widgets/account_widgets/personal_info/photo_username/drag_and_drop.dart';

class PhotoUsername extends StatelessWidget {
  const PhotoUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: SizedBox(
            width: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Photo',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 14.0,
                      ),
                ),
                Text(
                  'This photo will be displayed on your profile',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 12.0,
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        CircleAvatar(
          radius: 50.0,
          backgroundImage: NetworkImage(UserRepository
                  .instance.user?.photoURL ??
              'https://png.pngtree.com/thumb_back/fh260/background/20220904/pngtree-side-profile-of-japanese-monkey-cute-snow-pool-photo-image_22752788.jpg'),
        ),
        const SizedBox(
          width: 20,
        ),
        const DragAndDrop(),
      ],
    );
  }
}
