import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/function/authentication.dart';
import 'package:phone_book/screens/widgets/profile_widgets/profile_layout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        centerTitle: true,
      ),
      body: const ProfileLayout(),
    );
  }
}


// Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Hello'),
//             ElevatedButton(
//                 onPressed: _isLoading ? null : signOut,
//                 child: const Text('logOut'))
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> signOut() async {
//     setState(() {
//       _isLoading = true;
//     });

//     await UserRepository.instance.signOut();

//     if (!mounted) return;

//     context.go('/login');
//   }