import 'package:flutter/material.dart';

import 'package:afluent/themes/style.dart';
import 'package:afluent/services/index.dart' as globals;
import 'package:afluent/components/Buttons/MainButton.dart';

class LoginScreen extends StatefulWidget {
  final Widget child;

  LoginScreen({Key key, this.child}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _focus =FocusNode();
  bool _enabled = true;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/home.png", height: 200.0,),
                        Text(
                          'Bienvenido a',
                          textAlign: TextAlign.center,
                          style: bigTitle,
                        ),
                        Text(
                          'tu Banca Móvil',
                          textAlign: TextAlign.center,
                          style: bigTitle,
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          "Usuario",
                          textAlign: TextAlign.end,
                          style: textStyle,
                        ),
                      )
                    ),
                    SizedBox(
                      width: screenSize.width / 2,
                      child: TextField(
                        enabled: _enabled,
                        controller: _userController,
                        decoration: fieldDecoration('Usuario'),
                        style: textMuted(size: 14.0),
                        onTap: _onTap,
                        focusNode: _focus,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          "Contraseña",
                          textAlign: TextAlign.end,
                          style: textStyle,
                        ),
                      )
                    ),
                    SizedBox(
                      width: screenSize.width / 2,
                      child: TextField(
                        enabled: _enabled,
                        obscureText: true,
                        controller: _passwordController,
                        decoration: fieldDecoration('Contraseña'),
                        onTap: _onTap,
                        focusNode: _focus,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                MainButton(
                  text: "Enviar",
                  callback: (){
                    if (_userController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                      Navigator.of(context).pushNamed("/HomePage");
                    }
                  },
                ), // TODO: Remove button
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onTap (){
    setState((){
      _userController.text = globals.userData["user"];
      _passwordController.text = globals.userData["password"];
      _focus.unfocus();
    });
  }
}