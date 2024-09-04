import 'package:flutter/material.dart';
import 'package:phone_book/screens/new_nav_homepage/head_nav_homepage.dart';
import 'package:phone_book/screens/new_nav_homepage/nav_button.dart';
import 'package:phone_book/work/first_test_data_table.dart';
import 'package:phone_book/work/sec_test_data_table.dart';
import 'package:phone_book/work/third_test_data_table.dart';
import 'package:phone_book/work/try_sec_test_data_table.dart';
import 'package:phone_book/work/try_third_data_table.dart';

class NavigationRailExample extends StatefulWidget {
  const NavigationRailExample({super.key});

  @override
  State<NavigationRailExample> createState() => _NavigationRailExampleState();
}

class _NavigationRailExampleState extends State<NavigationRailExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.grey.withOpacity(0.3), // Border color
                    width: 1.0, // Border width
                  ),
                  // Optional: Rounded corners
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    const HeadNavHomepage(),
                    Container(
                      height: 1.0, // Height of the underline
                      color: Colors.grey.withOpacity(0.3),
                      // Color of the underline
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    const NavButton(),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centers vertically
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FirstTestDataTable(),
                    SecTestDataTable(),
                    TrySecTestDataTable(),
                    TryThirdDataTable(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
