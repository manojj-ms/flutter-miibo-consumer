import 'package:flutter_app/styles/AppTheme.dart';
import 'package:flutter_app/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/mail/MailComposeScreen.dart';
import 'package:flutter_app/mail/MailContentScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_app/AppThemeNotifier.dart';
import 'package:hexcolor/hexcolor.dart';
class Events extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}

class SingleMail {
  String name, title, message, date;
  bool isRead;

  SingleMail(this.name, this.title, this.message, this.date, this.isRead);
}

class _EventState extends State<Events> {

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ThemeData themeData;

  List<SingleMail> _mailList;
  int _selectedPage = 0;

  get value => null;

  @override
  void initState() {
    super.initState();
    _mailList = [
      SingleMail("BookMyShow", "#stayinhome challenge is back",
          "this is dummy mail content", "25 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "21 April", true),
      SingleMail("Google Trends", "#stayinhome challenge is back",
          "this is dummy mail content", "22 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "19 Feb", false),
      SingleMail("Coursera", "#stayinhome challenge is back",
          "this is dummy mail content", "17 April", true),
      SingleMail("Lourensa", "#stayinhome challenge is back",
          "this is dummy mail content", "15 May", false),
      SingleMail("Codeforces", "#stayinhome challenge is back",
          "this is dummy mail content", "13 Jan", true),
      SingleMail("Flutter", "#stayinhome challenge is back",
          "this is dummy mail content", "28 May", true),
      SingleMail("Google", "#stayinhome challenge is back",
          "this is dummy mail content", "30 April", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "25 May", true),
      SingleMail("Google Trends", "#stayinhome challenge is back",
          "this is dummy mail content", "28 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "27 Feb", true),
      SingleMail("Coursera", "#stayinhome challenge is back",
          "this is dummy mail content", "14 May", false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xff7b1fa2);
    themeData = Theme.of(context);
       {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SafeArea(
              top: true,
              child: Scaffold(
                appBar: AppBar( centerTitle: true,
                  backgroundColor: PrimaryColor,
                  title: Text('Events', style: TextStyle(color: Color(0xffedf3ec))),
                ),
                backgroundColor: themeData.colorScheme.background,
                key: _scaffoldKey,

                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: _mailList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                    context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MailContentScreen()));
                            },
                            child: Dismissible(
                              background: Container(
                                color: themeData.primaryColor,
                                padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                                alignment: AlignmentDirectional.centerStart,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.delete,
                                      color: themeData.colorScheme.onPrimary,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: MySize.size8),
                                      child: Text("Delete",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              fontWeight: 600,
                                              color: themeData
                                                  .colorScheme.onPrimary)),
                                    )
                                  ],
                                ),
                              ),
                              secondaryBackground: Container(
                                color: themeData.primaryColor,
                                padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                                alignment: AlignmentDirectional.centerEnd,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text("Archive",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 600,
                                            color: themeData
                                                .colorScheme.onPrimary)),
                                    Padding(
                                      padding: EdgeInsets.only(left: MySize.size8),
                                      child: Icon(
                                        MdiIcons.inboxArrowDown,
                                        color: themeData.colorScheme.onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onDismissed: (direction) {
                                if (direction == DismissDirection.endToStart) {
                                  setState(() {
                                    _mailList.removeAt(index);
                                    showSnackbarWithFloating("1 Archived");
                                  });
                                } else {
                                  setState(() {
                                    _mailList.removeAt(index);
                                    showSnackbarWithFloating("1 Deleted");
                                  });
                                }
                              },
                              key: UniqueKey(),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MySize.size12, left: MySize.size16, right: MySize.size16, bottom: MySize.size12),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Image.network('http://via.placeholder.com/300',
                                        width: 45,
                                        height: 45,),

                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(left: MySize.size16),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        _mailList[index].name,
                                                        style: AppTheme.getTextStyle(
                                                            themeData.textTheme
                                                                .subtitle2,
                                                            fontWeight:
                                                            _mailList[index]
                                                                .isRead
                                                                ? 500
                                                                : 600),
                                                      )),
                                                  Text(_mailList[index].date,
                                                      style: AppTheme.getTextStyle(
                                                          themeData.textTheme
                                                              .subtitle2,
                                                          fontWeight:
                                                          _mailList[index]
                                                              .isRead
                                                              ?500
                                                              : 600))
                                                ],
                                              ),
                                              Text(_mailList[index].title,
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText2,
                                                      fontWeight:
                                                      _mailList[index]
                                                          .isRead
                                                          ? 500
                                                          : 600,
                                                      letterSpacing: 0)),
                                              Text(_mailList[index].message,
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText2,
                                                      fontWeight:500,
                                                      letterSpacing: 0))
                                            ],
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ));
      };
  }



  void showSnackbarWithFloating(String message) {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: themeData.textTheme.subtitle2
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}


