import 'package:flutter/material.dart';

class NavigationRailExample extends StatefulWidget {
  const NavigationRailExample({super.key});

  @override
  State<NavigationRailExample> createState() => _NavigationRailExampleState();
}

class _NavigationRailExampleState extends State<NavigationRailExample> {
  final List<Widget> _screens = [
    Container(
      color: Colors.yellow.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Home',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Container(
      color: Colors.purple.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Feed',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Container(
      color: Colors.red.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Favorites',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Container(
      color: Colors.pink.shade300,
      alignment: Alignment.center,
      child: const Text(
        'Settings',
        style: TextStyle(fontSize: 40),
      ),
    )
  ];

  int _selectedIndex = 0;
  int _hoveredIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.indigoAccent,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.feed), label: 'Feed'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favorites'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ])
          : null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
                leading: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        Image.network(
                          "https://ml.globenewswire.com/Resource/Download/27311aae-6eed-48ac-900c-7d107394d35a",
                          width: 85,
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // Handle menu button press
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      height: 2.0, // Height of the underline
                      color: Colors.black,
                      // Color of the underline
                    ),
                  ],
                ),
                backgroundColor: Colors.white,
                useIndicator: false,
                indicatorColor:
                    Colors.transparent, // Makes the indicator invisible
                indicatorShape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(0), // Ensures no visible shape
                ),
                selectedIconTheme: IconThemeData(
                  color: Colors.indigo[500],
                ),
                unselectedIconTheme: const IconThemeData(
                  color: Colors.grey,
                  size: 24,
                ),
                minWidth: 300,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                destinations: [
                  NavigationRailDestination(
                    icon: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _hoveredIndex = 0;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _hoveredIndex = -1;
                        });
                      },
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? Colors.transparent
                              : (_hoveredIndex == 0
                                  ? Colors.grey.withOpacity(0.15)
                                  : Colors.transparent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.home),
                            const SizedBox(width: 10.0),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: _selectedIndex == 0
                                    ? Colors.indigo[500]
                                    : Colors.grey,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                height: 1.6667,
                              ),
                            ),
                            const SizedBox(width: 125.0),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _hoveredIndex = 0;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _hoveredIndex = -1;
                        });
                      },
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? Colors.transparent
                              : (_hoveredIndex == 0
                                  ? Colors.grey.withOpacity(0.15)
                                  : Colors.transparent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.home),
                            const SizedBox(width: 10.0),
                            Text(
                              'Projects',
                              style: TextStyle(
                                color: _selectedIndex == 0
                                    ? Colors.indigo[500]
                                    : Colors.grey,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                height: 1.6667,
                              ),
                            ),
                            const SizedBox(width: 125.0),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    label: Text('Projects'),
                  ),
                  NavigationRailDestination(
                    icon: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _hoveredIndex = 0;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _hoveredIndex = -1;
                        });
                      },
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? Colors.transparent
                              : (_hoveredIndex == 0
                                  ? Colors.grey.withOpacity(0.15)
                                  : Colors.transparent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.home),
                            const SizedBox(width: 10.0),
                            Text(
                              'Favorites',
                              style: TextStyle(
                                color: _selectedIndex == 0
                                    ? Colors.indigo[500]
                                    : Colors.grey,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                height: 1.6667,
                              ),
                            ),
                            const SizedBox(width: 125.0),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    label: Text('Favorites'),
                  ),
                  NavigationRailDestination(
                    icon: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _hoveredIndex = 0;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _hoveredIndex = -1;
                        });
                      },
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? Colors.transparent
                              : (_hoveredIndex == 0
                                  ? Colors.grey.withOpacity(0.15)
                                  : Colors.transparent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.home),
                            const SizedBox(width: 10.0),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: _selectedIndex == 0
                                    ? Colors.indigo[500]
                                    : Colors.grey,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                height: 1.6667,
                              ),
                            ),
                            const SizedBox(width: 125.0),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    label: Text('Documentation'),
                  ),
                  NavigationRailDestination(
                      icon: Icon(Icons.feed), label: Text('Feed')),
                  NavigationRailDestination(
                      icon: Icon(Icons.favorite), label: Text('Favorites')),
                  NavigationRailDestination(
                      icon: Icon(Icons.settings), label: Text('Settings')),
                ],
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 300),
                    IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () {
                        // Handle logout button press
                      },
                    ),
                  ],
                ),
                selectedIndex: _selectedIndex),
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
    );
  }
}
