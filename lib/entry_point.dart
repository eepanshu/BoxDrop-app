import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';
import 'screens/home/home_screen.dart';
import 'screens/orderDetails/order_details_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/search/search_screen.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({
    Key? key,
  }) : super(key: key);

  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  // By default first one is selected
  int _selectedIndex = 0;

  // List of nav items
  final List<Map<String, dynamic>> _navitems = [
    {"icon": "assets/icons/home.svg", "title": "Home"},
    {"icon": "assets/icons/search.svg", "title": "Search"},
    {"icon": "assets/icons/order.svg", "title": "Orders"},
    {"icon": "assets/icons/profile.svg", "title": "Profile"},
  ];

  // Screens
  final List<Widget> _screens = [
    HomeScreen(),
    const SearchScreen(),
    const OrderDetailsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/Illustrations/all_bg.svg', // Path to your SVG background image
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent, // Make the scaffold background transparent
          body: _screens[_selectedIndex],
          bottomNavigationBar: CupertinoTabBar(
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            currentIndex: _selectedIndex,
            activeColor: primaryColor,
            inactiveColor: bodyTextColor,
            items: List.generate(
              _navitems.length,
                  (index) => BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _navitems[index]["icon"],
                  height: 30,
                  width: 30,
                  colorFilter: ColorFilter.mode(
                    index == _selectedIndex ? primaryColor : bodyTextColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: _navitems[index]["title"],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
