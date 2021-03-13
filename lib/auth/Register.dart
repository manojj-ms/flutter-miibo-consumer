import 'package:flutter/material.dart';
import 'package:flutter_app/auth/Login.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_app/utils/SizeConfig.dart';
import 'package:flutter_app/styles/AppTheme.dart';
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ThemeData themeData;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        body: Container(
          padding: EdgeInsets.only(left: MySize.size24, right: MySize.size24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/logo.png', width: 150),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: MySize.size24),
                  child: TextFormField(
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        letterSpacing: 0.1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      hintStyle: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.surface,
                              width: 1.2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.surface,
                              width: 1.2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.surface,
                              width: 1.2)),
                      prefixIcon: Icon(
                        MdiIcons.emailOutline,
                        size: 22,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size16),
                  child: TextFormField(
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        letterSpacing: 0.1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintText: "Email address",
                      hintStyle: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.surface,
                              width: 1.2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.surface,
                              width: 1.2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.surface,
                              width: 1.2)),
                      prefixIcon: Icon(
                        MdiIcons.emailOutline,
                        size: 22,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size16),
                  child: TextFormField(
                    obscureText: _passwordVisible,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        letterSpacing: 0.1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintStyle: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.surface,
                              width: 1.2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.surface,
                              width: 1.2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.surface,
                              width: 1.2)),
                      prefixIcon: Icon(
                        MdiIcons.lockOutline,
                        size: 22,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(
                          _passwordVisible
                              ? MdiIcons.eyeOutline
                              : MdiIcons.eyeOffOutline,
                          size: MySize.size22,
                        ),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size16),
                  child: TextFormField(
                    obscureText: _passwordVisible,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        letterSpacing: 0.1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintStyle: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.surface,
                              width: 1.2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.surface,
                              width: 1.2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.surface,
                              width: 1.2)),
                      prefixIcon: Icon(
                        MdiIcons.lockOutline,
                        size: 22,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(
                          _passwordVisible
                              ? MdiIcons.eyeOutline
                              : MdiIcons.eyeOffOutline,
                          size: MySize.size22,
                        ),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size28)),
                            boxShadow: [
                              BoxShadow(
                                color: themeData.cardTheme.shadowColor
                                    .withAlpha(18),
                                blurRadius: 4,
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(top: MySize.size24),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(MySize.size28)),
                            color: themeData.colorScheme.primary,
                            splashColor: themeData.colorScheme.primary,
                            highlightColor: themeData.backgroundColor,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "CREATE ACCOUNT",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 600,
                                      color: themeData.backgroundColor,
                                      letterSpacing: 0.5),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: MySize.size16),
                                  child: Icon(
                                    MdiIcons.chevronRight,
                                    color: themeData.backgroundColor,
                                    size: MySize.size18,
                                  ),
                                )
                              ],
                            ),
                            padding: EdgeInsets.only(
                                top: MySize.size12, bottom: MySize.size12),
                          ),
                        ),
                      ),
                    ],
                  ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size16),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Already have an account",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ));
  }
}
