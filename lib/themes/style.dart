import 'package:flutter/material.dart';

ThemeData appTheme = new ThemeData(
  primaryColor: primaryColor,
  hintColor: Colors.black45,
  //fontFamily: 'Graphie',
);

TextStyle textStyle = const TextStyle(
  color: Colors.white,
  fontSize: 16.0,
  fontWeight: FontWeight.w300,
  //fontFamily: 'Graphie',
);

TextStyle textMuted({size = 12.0}) => TextStyle(
  color: mutedColor,
  fontSize: size,
  fontWeight: FontWeight.w300,
);

TextStyle bigTitle = TextStyle(
  color: textColor,
  fontSize: 25.0,
  fontWeight: FontWeight.w400,
);

TextStyle title = TextStyle(
  color: mutedColor,
  fontSize: 25.0,
  fontWeight: FontWeight.w300,
);

const double letterSpacingRhode = 3.0;
const double letterSpacingTaller = 8.0;

const Color primaryColor = Color.fromRGBO(29, 33, 107, 1.0);
const Color secondaryColor = Color.fromRGBO(57, 173, 74, 1.0);
const Color thirdColor = const Color.fromRGBO(16, 124, 121, 1.0);
const Color mutedColor = Colors.black38;
const Color textColor = Colors.white;

InputDecoration fieldDecoration(hint) => InputDecoration(
  hintText: hint,
  border: InputBorder.none,
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(5.0)
);

InputDecoration fieldDecoration2(hint) => InputDecoration(
  hintText: hint,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.zero,
    ),
    borderSide: BorderSide(
      color: Colors.black,
      width: 1.0
    )
  ),
  fillColor: Colors.white,
  filled: false,
  contentPadding: EdgeInsets.all(10.0),
  suffixIcon: Icon(
    Icons.more,
    color: Colors.black54,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.zero,
    ),
    borderSide: BorderSide(
      color: Colors.lightBlue,
    )
  )
);