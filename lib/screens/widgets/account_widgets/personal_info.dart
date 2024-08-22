import 'package:flutter/material.dart';
import 'package:phone_book/screens/widgets/account_widgets/personal_info/personal_username.dart';
import 'package:phone_book/screens/widgets/account_widgets/personal_info/submit_button.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.white,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Text(
                'Personal Info',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 18.0,
                    ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Update your photo and personal details here.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 12.0,
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(
                  height: 10.0), // Space between container and underline
              Container(
                height: 2.0, // Height of the underline
                color: Colors.black.withOpacity(0.05),
                // Color of the underline
              ),
              const SizedBox(height: 10.0),
              const PersonalUsername(),
              const SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
