import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PopupPayment extends StatelessWidget {
  const PopupPayment({super.key});

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
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    width: 384.0,
                    height: 670.59,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Connect a wallet',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Color.fromRGBO(48, 59, 82, 0.9),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Color.fromRGBO(164, 165, 174, 1),
                              ),
                              iconSize: 20.0,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: walletBoxStyle(),
                          child: walletRow(
                              'images/zelcore_wallet.png', 'Zelcore Wallet'),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: walletBoxStyle(),
                          child:
                              walletRow('images/ssp_wallet.png', 'SSP Wallet'),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: walletBoxStyle(),
                          child: walletRow('images/metamask.png', 'MetaMask'),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextButton(
                            onPressed: () {},
                            style: walletBoxStyle(),
                            child: walletRow(
                                'images/walletconnect.png', 'WalletConnect')),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: walletBoxStyle(),
                          child: walletRow(
                              'images/coinbase_wallet.png', 'Coinbase Wallet'),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text:
                                    'By connecting a wallet,you agree to InFlux Technology Limited ',
                                style: policyTextStyle(link: false),
                                children: [
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: policyTextStyle(link: true),
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
                                    style: policyTextStyle(link: false),
                                  ),
                                  TextSpan(
                                      text: 'Privacy Policy',
                                      style: policyTextStyle(link: true),
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

  ButtonStyle walletBoxStyle() {
    return TextButton.styleFrom(
      backgroundColor: Colors.white,
      minimumSize: const Size(352, 64),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: const BorderSide(
          color: Color.fromRGBO(184, 195, 225, 0.25),
          width: 1.0,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 19.0, horizontal: 20.0),
    );
  }

  Row walletRow(String url, String text) {
    return Row(
      children: [
        Image.asset(
          url,
          width: 40.0,
          height: 40.0,
        ),
        const SizedBox(width: 15.0),
        Text(
          text,
          style: dialogTextStyle(),
        ),
      ],
    );
  }

  TextStyle dialogTextStyle() {
    return const TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w300,
      fontSize: 15.8,
      height: 1.3125,
      color: Color.fromRGBO(48, 59, 82, 1),
    );
  }

  TextStyle policyTextStyle({bool link = false}) {
    TextStyle baseStyle = const TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 12,
      height: 1.6667,
      color: Color.fromRGBO(112, 122, 138, 0.8),
    );

    return baseStyle.copyWith(
      decoration: link ? TextDecoration.underline : TextDecoration.none,
      decorationColor: link ? const Color.fromRGBO(112, 122, 138, 0.8) : null,
    );
  }
}
