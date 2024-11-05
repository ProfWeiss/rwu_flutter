import 'package:flutter/cupertino.dart';
import 'InfoScreen.dart';
import 'SettingsScreen.dart';

void main() {
  runApp(CupertinoApp(
    home: CupertinoAppWithBottomNav(),
  ));
}

class CupertinoAppWithBottomNav extends StatefulWidget {
  @override
  _CupertinoAppWithBottomNavState createState() =>
      _CupertinoAppWithBottomNavState();
}

class _CupertinoAppWithBottomNavState extends State<CupertinoAppWithBottomNav> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    InfoScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Recents',
          )
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => InfoScreen(),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => SettingsScreen(),
            );
          default:
            return CupertinoTabView(
              builder: (context) => InfoScreen(),
            );
        }
      },
    );
  }
}
