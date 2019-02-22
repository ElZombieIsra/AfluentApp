import 'package:flutter/material.dart';
import 'package:afluent/themes/style.dart';

class NotificationToast extends StatefulWidget {
  
  bool notification = false;
  String text, textButton = "OK";
  Widget appbar;
  var callback;

  NotificationToast({
    Key key,
    @required this.notification,
    @required this.appbar,
    @required this.text,
    @required this.callback,
    this.textButton,
  }) : super(key: key);

  _NotificationToastState createState() => _NotificationToastState();
}

class _NotificationToastState extends State<NotificationToast> {
  @override
  Widget build(BuildContext context) {
    return !widget.notification 
      ? widget.appbar
      : AppBar(
        elevation: 2.0,
        backgroundColor: secondaryColor,
        leading: Container(),
        title: Text(
          "${widget.text}", 
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("OK", style: TextStyle(color: Colors.white),),
            onPressed: widget.callback,
          )
        ],
      );
  }
}