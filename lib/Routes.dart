import 'package:flutter/material.dart';
import 'themes/style.dart';

import 'package:afluent/screens/LoginScreen.dart';
import 'package:afluent/screens/HomeScreen.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/HomePage": (BuildContext context) => HomeScreen(),
  };

  Routes() {
    runApp(
      new MaterialApp(
        title: "Affluent",
        home: new LoginScreen(),
        theme: appTheme,
        routes: routes,
      )
    );
  }
}