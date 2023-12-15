import 'package:flutter/material.dart';
import 'package:news/pages/home_page.dart';
import 'package:news/pages/headline_page.dart';
import 'package:news/pages/country_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {

  final List<Widget> pageList= const [
    HomePage(),
    HeadlinesPage(),
    CountryList()
  ];
  int currentIndex=0;

  void changeIndex(int index){
    setState(() {
      currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pageList[currentIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical:8, horizontal: 12),
        child: GNav(
          gap: 8,
          activeColor: const Color.fromRGBO(239, 83, 80, 1),
          tabActiveBorder: Border.all(color: Colors.red.shade400, width: 1), 
          padding: const EdgeInsets.all(10),
      
          selectedIndex: currentIndex,
          onTabChange: changeIndex,
          tabs: const [
            GButton(
              icon: Icons.home_rounded, text: 'Home',
            ),
            GButton(
              icon: Icons.view_headline_rounded, text: 'Headlines',
            ),
            GButton(
              icon: Icons.travel_explore_rounded, text: 'Country',
            ),
          ]
        ),
      ),
    );
  }
}