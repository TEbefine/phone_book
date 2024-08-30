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
                          style: _walletBoxStyle(),
                          child: _walletRow(
                              imgURL: 'images/zelcore_wallet.png',
                              text: 'Zelcore Wallet'),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: _walletBoxStyle(),
                          child: _walletRow(
                              imgURL: 'images/ssp_wallet.png',
                              text: 'SSP Wallet'),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: _walletBoxStyle(),
                          child: _walletRow(
                              imgURL: 'images/metamask.png', text: 'MetaMask'),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextButton(
                            onPressed: () {},
                            style: _walletBoxStyle(),
                            child: _walletRow(
                                imgURL: 'images/walletconnect.png',
                                text: 'WalletConnect')),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: _walletBoxStyle(),
                          child: _walletRow(
                              imgURL: 'images/coinbase_wallet.png',
                              text: 'Coinbase Wallet'),
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
                                style: _policyTextStyle(link: false),
                                children: [
                                  _buildLinkTextSpan(
                                    text: 'Terms of Service',
                                    url: 'https://uniswap.org/terms-of-service',
                                  ),
                                  TextSpan(
                                    text: ' and consent to its ',
                                    style: _policyTextStyle(link: false),
                                  ),
                                  _buildLinkTextSpan(
                                    text: 'Privacy Policy',
                                    url: 'https://uniswap.org/privacy-policy',
                                  ),
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

  ButtonStyle _walletBoxStyle() {
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

  Row _walletRow({
    required String imgURL,
    required String text,
  }) {
    return Row(
      children: [
        Image.asset(
          imgURL,
          width: 40.0,
          height: 40.0,
        ),
        const SizedBox(width: 15.0),
        Text(
          text,
          style: _dialogTextStyle(),
        ),
      ],
    );
  }

  TextStyle _dialogTextStyle() {
    return const TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w300,
      fontSize: 15.8,
      height: 1.3125,
      color: Color.fromRGBO(48, 59, 82, 1),
    );
  }

  TextStyle _policyTextStyle({required bool link}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 12,
      height: 1.6667,
      color: const Color.fromRGBO(112, 122, 138, 0.7),
      decoration: link ? TextDecoration.underline : TextDecoration.none,
      decorationColor: link ? const Color.fromRGBO(112, 122, 138, 0.7) : null,
    );
  }

  TextSpan _buildLinkTextSpan({
    required String text,
    required String url,
  }) {
    return TextSpan(
      text: text,
      style: _policyTextStyle(link: true),
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            throw 'Could not launch $uri';
          }
        },
    );
  }
}
