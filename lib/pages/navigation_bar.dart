import 'package:erranza/pages/pages.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentPageIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Erranza", 
        style: TextStyle(
          color: Color(0xffFFCC00),
          fontSize: 32, 
          fontWeight: FontWeight.w400
          ),
        ),

        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff4B983C),
              Color(0xff368A90),
            ])
          ),
        ),
        toolbarHeight: 88,
      ),

      body: Center(
        child: pages[_currentPageIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentPageIndex,
        indicatorColor: Color(0xff378B8A),
        onDestinationSelected: (int newIndex) {
          setState(() {
            _currentPageIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          NavigationDestination(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}