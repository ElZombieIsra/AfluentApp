import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  
  final String text;
  final callback;
  final bool button;
  final Widget child;

  CustomContainer({
    this.text,
    this.callback,
    this.button = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                "$text".toUpperCase(),
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 11.0,
                ),
              ),
            )
          ),
          button ? IconButton(
            icon: Icon(Icons.add, size: 20.0,),
            onPressed: callback,
          ) : child ?? Container(),
        ],
      )
    );
  }
}