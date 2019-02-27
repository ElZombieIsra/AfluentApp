import 'package:flutter/material.dart';

import 'package:afluent/themes/style.dart';

class CustomTab extends StatefulWidget {
  final callback;
  final icon;
  final String text;
  final bool isSelected;
  CustomTab({
    @required this.text,
    @required this.callback,
    @required this.icon,
    this.isSelected = false,
  });
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  final _width = 120.0;
  @override
  Widget build(BuildContext context) {
    return Container(
       child: FlatButton(
         padding: EdgeInsets.zero,
         onPressed: widget.callback,
         child: Container(
           height: 70.0,
           width: _width,
           child: Column(
             mainAxisSize: MainAxisSize.max,
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                /*
                Icon(
                  widget.icon,
                  color: mutedColor,
                ),*/
                SizedBox(
                  width: 30.0,
                  child: Image.asset(widget.icon),
                ),
                SizedBox(height: 10.0,),
                Container(
                  width: 85.0,
                  child: Text(
                    widget.text,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: textMuted(size: 14.0, weight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                widget.isSelected ? Container(
                  width: _width,
                  height: 2.2,
                  color: Colors.blue,
                ) : Container(width: _width,),
             ],
           ),
         ),
       ),
    );
  }
}