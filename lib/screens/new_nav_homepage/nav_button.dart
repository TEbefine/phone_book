import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  const NavButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.grey.withOpacity(0.08), // Background color
                padding: EdgeInsets.symmetric(
                    vertical: 18.0,
                    horizontal: 10.0), // Padding inside the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  // Border
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.indigo[500],
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.indigo[500],
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      height: 1.6667,
                    ),
                  ),
                  const SizedBox(width: 130.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15.0,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
