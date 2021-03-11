import 'dart:html';

import 'package:flutter_app/class/event.dart';
import 'package:flutter_app/styles/AppTheme.dart';
import 'package:flutter_app/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Events extends StatefulWidget {
  final List<Event> data;

  const Events({Key key, @required this.data}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  ThemeData themeData;

  Widget singleEvent({int id, String date, String name, String description}) {
    return Container(
      padding: Spacing.all(16),
      margin: Spacing.fromLTRB(24, 8, 24, 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
          boxShadow: [],
          border: Border.all(color: Colors.black12, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: Spacing.all(6),
            decoration:
            BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            child: Icon(
              MdiIcons.plus,
              color: Colors.white,
              size: MySize.size20,
            ),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: Spacing.top(2),
                    child: Text(
                      description,
                      style: AppTheme.getTextStyle(
                        themeData.textTheme.caption,
                        color:
                        themeData.colorScheme.onBackground.withAlpha(160),
                        fontWeight: 600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                date,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    fontSize: 12,
                    letterSpacing: 0.2,
                    color: themeData.colorScheme.onBackground,
                    muted: true,
                    fontWeight: 600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    var id;
    return SafeArea(
        child: Scaffold(
          body: Container(
            child: ListView(padding: Spacing.zero, children: <Widget>[
              Container(
                margin: Spacing.fromLTRB(24, 16, 24, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Container(
                          child: Text(
                            "Events",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: Spacing.fromLTRB(0, 8, 0, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Container(
                      //   margin: Spacing.fromLTRB(24, 16, 0, 0),
                      //   child: Text(
                      //     "UPCOMING",
                      //     style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      //         fontWeight: 700,
                      //         muted: true,
                      //         color: themeData.colorScheme.onBackground),
                      //   ),
                      // ),
                      // Spacing
                      SizedBox(
                        height: 20,
                      ),
                      // All events starts here
                      for (var event in widget.data)
                        singleEvent(
                            id: event.id,
                            name: event.name,
                            description: event.description,
                            date: event.date)
                    ]),
              ),
            ]),
          ),
        ));
  }
}
