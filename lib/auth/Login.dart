import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_app/styles/AppTheme.dart';
import 'package:flutter_app/utils/SizeConfig.dart';
import 'package:flutter_app/auth/Register.dart';
import 'package:flutter_app/auth/ForgotPassword.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ThemeData themeData;
  bool _passwordVisible = true;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
            Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24),
                      child: TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email-Address cannot be empty';
                          }
                          if (!value.isValidEmail()) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
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
                        controller: password,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          if (value.length < 8) {
                            return 'Minimum 8 characters';
                          }
                          return null;
                        },
                        obscureText: _passwordVisible,
                        keyboardType: TextInputType.visiblePassword,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
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
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ForgotPasswordScreen()));
                        },
                        child: Text(
                          "Forgot Password ?",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500),
                        ),
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.only(left: MySize.size32),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(MySize.size28)),
                                color: themeData.colorScheme.primary,
                                splashColor: themeData.colorScheme.primary,
                                highlightColor: themeData.backgroundColor,
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => TabHolder()));
                                  if (_formKey.currentState.validate()) {
                                    print(email.text);
                                    print(password.text);
                                  }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "LOGIN",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          fontWeight: 600,
                                          color: themeData.backgroundColor,
                                          letterSpacing: 0.5),
                                    ),
                                    Container(
                                      margin:
                                      EdgeInsets.only(left: MySize.size16),
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: Text(
                            "I don't have an account",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
        );
  }
}
