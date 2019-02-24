import 'package:flutter/material.dart';
import 'themes/style.dart';

import 'package:afluent/screens/LoginScreen.dart';
import 'package:afluent/screens/HomeScreen.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/HomePage": (BuildContext context) => HomeScreen(),
    "/LoginPage": (BuildContext context) => LoginScreen(),
  };

  Routes() {
    runApp(
      new MaterialApp(
        title: "Affluent",
        home: LoginScreen(),
        theme: appTheme,
        routes: routes,
      )
    );
  }
}