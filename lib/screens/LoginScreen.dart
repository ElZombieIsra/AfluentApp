import 'package:flutter/material.dart';
import 'package:afluent/themes/style.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
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
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(
                            Icons.account_balance,
                            size: 120.0,
                            color: Colors.white,
                          ),
                        ),
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
                        controller: _userController,
                        decoration: fieldDecoration('Usuario'),
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
                        obscureText: true,
                        controller: _passwordController,
                        decoration: fieldDecoration('Contraseña'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,)
                
                ,RaisedButton(
                  child: Text(
                    "Enviar",
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed("/HomePage");
                  },
                ) // TODO: Remove button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
      