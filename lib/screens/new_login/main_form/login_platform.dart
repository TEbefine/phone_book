import 'package:flutter/material.dart';

class LoginPlatform extends StatelessWidget {
  const LoginPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.indigo[500], // Text color
            backgroundColor: Colors.white, // Background color
            side: const BorderSide(
              color: Colors.grey, // Border color
              width: 0.5, // Border width
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0), // Rounded corners
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 16.0), // Padding inside button
          ),
          child: Row(
            children: [
              Image.network(
                'https://e7.pngegg.com/pngimages/882/225/png-clipart-google-logo-google-logo-google-search-icon-google-text-logo-thumbnail.png', // Replace with your image URL
                width: 25.0,
                height: 25.0,
              ),
              const SizedBox(width: 10.0),
              Text('Google',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 16.0,
                        color: Colors.indigo[500],
                      )),
            ],
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.indigo[500], // Text color
            backgroundColor: Colors.white, // Background color
            side: const BorderSide(
              color: Colors.grey, // Border color
              width: 0.5, // Border width
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0), // Rounded corners
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 16.0), // Padding inside button
          ),
          child: Row(
            children: [
              Image.network(
                'https://seeklogo.com/images/G/github-logo-5F384D0265-seeklogo.com.png', // Replace with your image URL
                width: 25.0,
                height: 25.0,
              ),
              const SizedBox(width: 10.0),
              Text('Github',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 16.0,
                        color: Colors.indigo[500],
                      )),
            ],
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.indigo[500], // Text color
            backgroundColor: Colors.white, // Background color
            side: const BorderSide(
              color: Colors.grey, // Border color
              width: 0.5, // Border width
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0), // Rounded corners
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 16.0), // Padding inside button
          ),
          child: Row(
            children: [
              Image.network(
                'https://w7.pngwing.com/pngs/535/202/png-transparent-gitlab-logo-version-control-company-react-others-miscellaneous-angle-company-thumbnail.png', // Replace with your image URL
                width: 25.0,
                height: 25.0,
              ),
              const SizedBox(width: 10.0),
              Text('Gitlab',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 16.0,
                        color: Colors.indigo[500],
                      )),
            ],
          ),
        ),
      ],
    );
  }
}
