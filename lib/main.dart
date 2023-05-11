import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/article.dart';
import 'package:flutter_application_2/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/gen/fonts.gen.dart';
import 'package:flutter_application_2/profile.dart';
import 'package:flutter_application_2/splash.dart';

import 'home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = const Color(0xff0D253C);
    final secondaryTextColor = const Color(0xff2D4379);
    final primaryColor = const Color(0xff376AED);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          textTheme: TextTheme(
              headline5: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor),
              headline6: TextStyle(
                fontFamily: FontFamily.avenir,
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              headline4: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
              subtitle1: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: secondaryTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w200),
              bodyText2: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 12,
                  color: secondaryTextColor),
              subtitle2: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: primaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              caption: const TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w700,
                fontSize: 10,
                color: Color(0xff7B8BB2),
              )),
          // is not restarted.
          colorScheme: ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            surface: Colors.white,
            onSurface: primaryTextColor,
            background: const Color(0xffFBFCFF),
            onBackground: primaryTextColor,
          ),
          snackBarTheme: SnackBarThemeData(backgroundColor: primaryColor),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: primaryTextColor,
              titleSpacing: 32)),
      home: const MainScreen(),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(
      //       child: HomeScreen(),
      //     ),
      //     Positioned(bottom: 0, left: 0, right: 0, child: _BottomNavigation())
      //   ],
      // ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          bottom: 65,
          child: IndexedStack(
            index: selectedScreenIndex,
            children: [
              HomeScreen(),
              ArticleScreen(),
              SearchScreen(),
              ProfileScreen()
            ],
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: _BottomNavigation(
            onTap: (index) {
              setState(() {
                selectedScreenIndex = index;
              });
            },
            selectedIndex: selectedScreenIndex,
          ),
        ),
      ],
    ));
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  const _BottomNavigation(
      {super.key, required this.onTap, required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xff9B8487).withOpacity(0.3),
                )
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                      iconFileName: 'home.png',
                      activeIconFileName: 'homeActive.png',
                      isActive: selectedIndex == homeIndex,
                      onTap: () {
                        onTap(homeIndex);
                      },
                      title: 'Home'),
                  BottomNavigationItem(
                      iconFileName: 'articles.png',
                      isActive: selectedIndex == articleIndex,
                      onTap: () {
                        onTap(articleIndex);
                      },
                      activeIconFileName: 'articlesActive.png',
                      title: 'Articles'),
                  Expanded(
                    child: SizedBox(),
                  ),
                  BottomNavigationItem(
                      iconFileName: 'search.png',
                      isActive: selectedIndex == searchIndex,
                      onTap: () {
                        onTap(searchIndex);
                      },
                      activeIconFileName: 'searchActive.png',
                      title: 'Search'),
                  BottomNavigationItem(
                      iconFileName: 'menu.png',
                      isActive: selectedIndex == menuIndex,
                      onTap: () {
                        onTap(menuIndex);
                      },
                      activeIconFileName: 'menuActive.png',
                      title: 'Menu'),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color(0xff376AED),
                  borderRadius: BorderRadius.circular(32.5),
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Screen',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final bool isActive;
  final Function() onTap;

  const BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/icons/${isActive ? activeIconFileName : iconFileName}',
              width: 24,
              height: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: themeData.textTheme.caption!.copyWith(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.caption!.color),
            )
          ],
        ),
      ),
    );
  }
}
