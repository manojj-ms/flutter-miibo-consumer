import 'dart:convert';

import 'package:flutter_app/auth/Register.dart';
import 'package:flutter_app/auth/Login.dart';
import 'package:flutter_app/auth/ForgotPassword.dart';
import 'package:flutter_app/tabPages/Announcement.dart';
import 'package:flutter_app/tabPages/Audio.dart';
import 'package:flutter_app/tabPages/Events.dart';
import 'package:flutter_app/tabPages/Gallery.dart';
import 'package:flutter_app/tabPages/Home.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_app/styles/AppTheme.dart';
import 'package:flutter_app/utils/SizeConfig.dart';
import 'package:flutter_app/utils/CustomBottomNavigation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class TabHolder extends StatefulWidget {
  @override
  _TabHolderPageState createState() => _TabHolderPageState();
}

class _TabHolderPageState extends State<TabHolder> {
  int _currentIndex = 0;
  ThemeData themeData;
  PageController _pageController;

  NavigationBarTheme navigationBarTheme;

  get prefs => null;

  get http => null;

  get env => null;



 Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    navigationBarTheme = AppTheme.getNavigationThemeFromMode(1);
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) async {
            switch (index) {
              case 0:
                getHomeData();
                break;
              case 3:
                var datum = await http.get(env.eventURL());
                Iterable l = json.decode(datum.body);
                List<Events> evelist =
                    List<Events>.from(l.map((model) => Events().fromJson(model)));
                break;
              case 4:
                break;
            }
          },
          children: <Widget>[
            Home(),
            Announcement(),
            Gallery(),
            Events(),
            Audio()
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        animationDuration: Duration(milliseconds: 350),
        selectedItemOverlayColor: navigationBarTheme.selectedOverlayColor,
        backgroundColor: navigationBarTheme.backgroundColor,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          if (index == 4 && prefs.getInt('uid') == null) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          } else {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          }
        },
        items: <CustomBottomNavigationBarItem>[
          CustomBottomNavigationBarItem(
              title: "Home",
              icon: Icon(MdiIcons.storeOutline, size: MySize.size22),
              activeIcon: Icon(MdiIcons.store, size: MySize.size22),
              activeColor: navigationBarTheme.selectedItemColor,
              inactiveColor: navigationBarTheme.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "Gallery",
              icon: Icon(MdiIcons.replay, size: MySize.size22),
              activeIcon: Icon(MdiIcons.replay, size: MySize.size22),
              activeColor: navigationBarTheme.selectedItemColor,
              inactiveColor: navigationBarTheme.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "Audio",
              icon: Icon(MdiIcons.fileDocumentMultiple, size: MySize.size22),
              activeIcon: Icon(MdiIcons.fileDocumentMultipleOutline,
                  size: MySize.size22),
              activeColor: navigationBarTheme.selectedItemColor,
              inactiveColor: navigationBarTheme.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "Events",
              icon: Icon(MdiIcons.calendar, size: MySize.size22),
              activeIcon: Icon(MdiIcons.calendar, size: MySize.size22),
              activeColor: navigationBarTheme.selectedItemColor,
              inactiveColor: navigationBarTheme.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "Announcement",
              icon: Icon(
                MdiIcons.accountOutline,
                size: MySize.size22,
              ),
              activeIcon: Icon(
                MdiIcons.account,
                size: MySize.size22,
              ),
              activeColor: navigationBarTheme.selectedItemColor,
              inactiveColor: navigationBarTheme.unselectedItemColor),
        ],
      ),
    );
  }

  void getHomeData() {}
}

class SharedPreferences {
}