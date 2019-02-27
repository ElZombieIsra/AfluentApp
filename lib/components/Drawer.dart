import 'package:flutter/material.dart';
import 'package:afluent/services/index.dart' as globals;

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
            child: Text('NHPP', style: TextStyle(color: Colors.white),),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            title: Text('Cerrar Sesión'),
            onTap: (){
              globals.resetState();
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/LoginPage");
            },
          )
        ],
      ),
    );
  }
}