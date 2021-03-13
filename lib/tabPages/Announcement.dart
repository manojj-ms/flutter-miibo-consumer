import 'package:flutter_app/styles/AppTheme.dart';
import 'package:flutter_app/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {

  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xff7b1fa2);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( centerTitle: true,
        backgroundColor: PrimaryColor,
        title: Text('Announcement', style: TextStyle(color: Color(0xffedf3ec))),
      ),
      body : Container(
        padding: Spacing.all(6),
        child: Center(
          child: Text('Announcement!'),
        ),
      ),
    );
  }

}

