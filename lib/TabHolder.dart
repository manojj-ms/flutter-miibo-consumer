import 'dart:convert';

import 'package:flutter_app/class/event.dart';
import 'package:flutter_app/auth/Register.dart';
import 'package:flutter_app/auth/Login.dart';
import 'package:flutter_app/auth/ForgotPassword.dart';
import 'package:flutter_app/environment.dart';
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

import 'class/merchant.dart';


class TabHolder extends StatefulWidget {
  @override
  _TabHolderPageState createState() => _TabHolderPageState();
}

class _TabHolderPageState extends State<TabHolder> {
  int _currentIndex = 0;
  ThemeData themeData;
  PageController _pageController;

  NavigationBarTheme navigationBarTheme;

  // Env
  Environment env = new Environment();
  // All Data
  SharedPreferences prefs;
  List<Event> events = [];
  List<String> slider = [];
  List<FeatureMerchant> shops = [];

  @override
  void initState() {
    super.initState();
    initprefs();
    _pageController = PageController();
    getHomeData();
  }

  void initprefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  getHomeData() async {
    List<String> images = [];
    List<FeatureMerchant> mercshop = [];
    var datum = await http.get(env.sliderURL());
    if (datum.statusCode == 200) {
      Iterable l = json.decode(datum.body);
      images = List<String>.from(l.map((model) => model['image'].toString()));
    }
    var mshops = await http.get(env.featureMerchantURL());
    if (mshops.statusCode == 200) {
      Iterable l = json.decode(mshops.body);
      mercshop = List<FeatureMerchant>.from(
          l.map((model) => FeatureMerchant.fromJson(model)));
    }
    setState(() {
      slider = images;
      shops = mercshop;
    });
  }

  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    navigationBarTheme = AppTheme.getNavigationThemeFromMode(1);
    const IconData announcement_outlined = IconData(0xf072, fontFamily: 'MaterialIcons');
    const IconData volume_up_rounded = IconData(0xf531, fontFamily: 'MaterialIcons');
    const IconData person_pin_rounded = IconData(0xf385, fontFamily: 'MaterialIcons');
    const IconData house_outlined = IconData(0xe236, fontFamily: 'MaterialIcons');
    const IconData house_rounded = IconData(0xf265, fontFamily: 'MaterialIcons');




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
                List<Event> evelist =
                List<Event>.from(l.map((model) => Event.fromJson(model)));
                setState(() {
                  events = evelist;
                });
                break;
              case 4:
                break;
            }
          },
          children: <Widget>[
            Gallery(),
            Audio(),
            Home(),
            Events(),
            Announcement()
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
              title: "Gallery",
              icon: Icon(
                person_pin_rounded,
                size: MySize.size22,
              ),
              activeIcon: Icon(
                person_pin_rounded,
                size: MySize.size22,
              ),
              activeColor: navigationBarTheme.selectedItemColor,
              inactiveColor: navigationBarTheme.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "Audio",
              icon: Icon(volume_up_rounded, size: MySize.size22),
              activeIcon: Icon(volume_up_rounded,
                  size: MySize.size22),
              activeColor: navigationBarTheme.selectedItemColor,
              inactiveColor: navigationBarTheme.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "Home",
              icon: Icon(house_rounded, size: MySize.size22),
              activeIcon: Icon(house_outlined, size: MySize.size22),
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
              icon: Icon(announcement_outlined, size: MySize.size22),
              activeIcon: Icon(announcement_outlined, size: MySize.size22),
              activeColor: navigationBarTheme.selectedItemColor,
              inactiveColor: navigationBarTheme.unselectedItemColor),
        ],
      ),
    );
  }
}
