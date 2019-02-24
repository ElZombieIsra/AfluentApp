import 'package:flutter/material.dart';
import 'package:afluent/services/index.dart' as globals;
import 'package:afluent/components/CustomContainer.dart';

class ConfigurationScreen extends StatefulWidget {
  _ConfigurationScreenState createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  final _configs = globals.configurations;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _configs.length,
      itemBuilder: (BuildContext context, int i){
        Map _ = _configs[i];
        if (_["banner"]) {
          return Material(
            elevation: 2.0,
            child: CustomContainer(
              text: "${_["title"].toString().toUpperCase()}",
              callback: (){},
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.only(left: 20.0, right: 10.0),
          child: ListTile(
            title: Text("${_["config"]}"),
            trailing: Checkbox(
              value: globals.configurations[i]["isChecked"],
              onChanged: (_val){
                setState(() {
                  globals.configurations[i]["isChecked"] = _val;
                });
              },
            ),
          ),
        );
      },
    );
  }
}