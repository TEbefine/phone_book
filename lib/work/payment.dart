import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    width: 400.0,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Connect a Wallet',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                              width: 0.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 25.0),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhLIGqSkKnIbrJdFQ7z6MZ63_gs_LuCz875A&s', // Replace with your image URL
                                width: 40.0,
                                height: 40.0,
                              ),
                              const SizedBox(width: 15.0),
                              const Text(
                                'Zelcore Wallet',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                              width: 0.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 25.0),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                'https://pbs.twimg.com/profile_images/1712146862671527936/r279yPxM_400x400.jpg', // Replace with your image URL
                                width: 40.0,
                                height: 40.0,
                              ),
                              const SizedBox(width: 15.0),
                              const Text(
                                'SSP Wallet',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                              width: 0.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 25.0),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/MetaMask_Fox.svg/1024px-MetaMask_Fox.svg.png',
                                width: 40.0,
                                height: 40.0,
                              ),
                              const SizedBox(width: 15.0),
                              const Text(
                                'MetaMask',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                              width: 0.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 25.0),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://pbs.twimg.com/profile_images/1737473466847125504/SN4QL9k3_400x400.jpg', // Replace with your image URL
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 15.0),
                              const Text(
                                'WalletConnect',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                              width: 0.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 25.0),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://play-lh.googleusercontent.com/wrgUujbq5kbn4Wd4tzyhQnxOXkjiGqq39N4zBvCHmxpIiKcZw_Pb065KTWWlnoejsg', // Replace with your image URL
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 15.0),
                              const Text(
                                'Coinbase Wallet',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text:
                                    'By connecting a wallet,you agree to InFlux Technology Limited ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(
                                          0.5), // Adjust text color as needed
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          Colors.black.withOpacity(0.5),
                                      // Explicitly set underline color
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final Uri url = Uri.parse(
                                            'https://uniswap.org/terms-of-service');
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                  ),
                                  TextSpan(
                                    text: ' and consent to its ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(
                                            0.5), // Adjust text color as needed
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            Colors.black.withOpacity(0.5),
                                        // Explicitly set underline color
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          final Uri url = Uri.parse(
                                              'https://uniswap.org/privacy-policy');
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        }),
                                  const TextSpan(text: '.')
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 150.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }
}
