library custom_notifications;

import 'package:flutter/material.dart';
import 'package:afluent/themes/style.dart';

notify({
  bool notification = false,
  String text = "¡Atención!", textButton = "OK",
  @required Widget appbar,
  @required var callback,
}){
  if(!notification){
    
  return appbar;
  }
  return AppBar(
    elevation: 2.0,
    automaticallyImplyLeading: false,
    backgroundColor: secondaryColor,
    titleSpacing: 10.0,
    centerTitle: false,
    title: Text(
      "${text ?? "¡Atención!"}", 
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
      overflow: TextOverflow.fade,
    ),
    actions: <Widget>[
      SizedBox(
        width: 50.0,
        child: FlatButton(
          padding: EdgeInsets.only(right: 5.0),
          child: Text("OK", style: TextStyle(color: Colors.white),),
          onPressed: callback,
        ),
      )
    ],
  );
}