import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Affluent', style: TextStyle(color: Colors.white),),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            title: Text('Cerrar Sesión'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/LoginPage");
            },
          )
        ],
      ),
    );
  }
}