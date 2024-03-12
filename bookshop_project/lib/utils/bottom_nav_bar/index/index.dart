import 'package:bookshop_project/screen/dashboard.dart';
import 'package:bookshop_project/utils/bottom_nav_bar/cart.dart';
import 'package:bookshop_project/utils/bottom_nav_bar/index/index_provider.dart';
import 'package:bookshop_project/utils/bottom_nav_bar/profile.dart';
import 'package:bookshop_project/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final screens = const [
Dashboard(),
Cart(),
Profile()
    // SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<IndexProvider>(
      //The consumer provides change notifications to its listeners. It lets flutter know id does not
      //have to rebuild bar widget .
      builder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(
              child: screens[provider.index]
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: GlobalColors.buttonColorwhite,
            currentIndex: provider.index,
            selectedItemColor: GlobalColors.buttonColorOrange,
            onTap: provider.changeIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                      'assets/blush_icons/profile.png',
                       color: Colors.grey,
                      height: 38,
                      width: 30,
                  ),
                  label: 'Profile'
                    ),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    color: Colors.grey,
                    size: 30,
                  ),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/blush_icons/courses.png',
                    color: Colors.grey,
                    height: 38,
                    width: 30,
                  ),
                  label: 'Courses'
              ),
            ],
          ),
        );
      },
    );
  }

}
