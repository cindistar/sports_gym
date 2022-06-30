import 'package:abas_flutter/models/sport.dart';
import 'package:abas_flutter/pages/calendar_page.dart';
import 'package:abas_flutter/pages/profile_page.dart';
import 'package:abas_flutter/pages/ranking_page.dart';
import 'package:abas_flutter/pages/sports_page.dart';
import 'package:abas_flutter/resources/images.dart';
import 'package:abas_flutter/resources/strings.dart';
import 'package:flutter/material.dart';

class SportsGym extends StatefulWidget {
  final VoidCallback onThemeModePressed;

  const SportsGym({Key? key, required this.onThemeModePressed}) : super(key: key);

  @override
  State<SportsGym> createState() => SportsGymState();
}

class SportsGymState extends State<SportsGym> {
  final pageController = PageController();
  int currentPage = 0;
  final sports = [
    Sport(name: Strings.football, icon: Icons.sports_football, cover: Images.football),
    Sport(name: Strings.basketball, icon: Icons.sports_basketball, cover: Images.basketball),
    Sport(name: Strings.hockey, icon: Icons.sports_hockey, cover: Images.hockey),
    Sport(name: Strings.golf, icon: Icons.sports_golf, cover: Images.golf),
  ];
  // final tabs = [
  //   const Tab(
  //     icon: Icon(Icons.sports_football),
  //   ),
  //   const Tab(
  //     icon: Icon(Icons.sports_basketball),
  //   ),
  //   const Tab(
  //     icon: Icon(Icons.sports_hockey),
  //   ),
  // ];

  void onItemPressed(int index) {
    pageController.jumpToPage(index);
    // pageController.animateToPage(
    //   index,
    //   duration: const Duration(milliseconds: 400),
    //   curve: Curves.ease,
    // );
    setState(() {
      currentPage = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: sports.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appName),
          actions: [
            IconButton(
              onPressed: widget.onThemeModePressed,
              icon: Icon(
                theme.brightness == Brightness.light ? Icons.dark_mode : Icons.light_mode,
              ),
            ),
          ],
          bottom: currentPage == 0
              ? TabBar(
                  tabs: sports
                      .map((sport) => Tab(
                            icon: Icon(sport.icon),
                          ))
                      .toList(),
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                )
              : null,
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SportsPage(
              sports: sports,
            ),
            const RankingPage(),
            const CalendarPage(),
            const ProfilePage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 2.0,
          onPressed: () {},
          child: const Icon(Icons.share),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentPage,
            onTap: onItemPressed,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: Strings.sports,
                //backgroundColor:Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: Strings.ranking,
                // backgroundColor:Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: Strings.calendar,
                //backgroundColor:Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: Strings.profile,
                //backgroundColor:Colors.pink,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }
}
