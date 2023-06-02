import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../screens/add_article_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/tag_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const TagScreen(),
    const AddArticleScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    const items = <Widget>[
      Icon(Icons.home_rounded),
      Icon(Icons.tag_rounded),
      Icon(Icons.add_rounded),
      Icon(Icons.favorite_rounded),
      Icon(Icons.person_rounded),
    ];
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.transparent,
        extendBody: true,
        body: pages[pageIndex],
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          height: 55,
          items: items,
          onTap: (index) => setState(() {
            pageIndex = index;
          }),
        ),
      ),
    );
  }
}
