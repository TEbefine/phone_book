import 'package:flutter/material.dart';

class NavigationRailExample extends StatefulWidget {
  const NavigationRailExample({super.key});

  @override
  State<NavigationRailExample> createState() => _NavigationRailExampleState();
}

class _NavigationRailExampleState extends State<NavigationRailExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: false, // Set to false if you want to collapse the rail
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: Colors.amber,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Badge(child: Icon(Icons.notifications_sharp)),
                label: Text('Notifications'),
              ),
              NavigationRailDestination(
                icon: Badge(
                  label: Text('2'),
                  child: Icon(Icons.messenger_sharp),
                ),
                label: Text('Messages'),
              ),
            ],
          ),
          Expanded(
            child: <Widget>[
              /// Home page
              Card(
                shadowColor: Colors.transparent,
                margin: const EdgeInsets.all(8.0),
                child: SizedBox.expand(
                  child: Center(
                    child: Text(
                      'Home page',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
              ),

              /// Notifications page
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.notifications_sharp),
                        title: Text('Notification 1'),
                        subtitle: Text('This is a notification'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.notifications_sharp),
                        title: Text('Notification 2'),
                        subtitle: Text('This is a notification'),
                      ),
                    ),
                  ],
                ),
              ),

              /// Messages page
              ListView.builder(
                reverse: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          'Hello',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(color: theme.colorScheme.onPrimary),
                        ),
                      ),
                    );
                  }
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Hi!',
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: theme.colorScheme.onPrimary),
                      ),
                    ),
                  );
                },
              ),
            ][currentPageIndex],
          ),
        ],
      ),
    );
  }
}
