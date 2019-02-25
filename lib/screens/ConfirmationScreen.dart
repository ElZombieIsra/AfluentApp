import 'package:flutter/material.dart';
import 'package:afluent/components/Buttons/MainButton.dart';
import 'package:afluent/themes/style.dart';
import 'package:afluent/services/index.dart' as globals;

class ConfirmationScreen extends StatelessWidget {
  final Map card;
  final Map option;

  ConfirmationScreen({
    Key key,
    @required this.card,
    @required this.option
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asociar tarjeta"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('${option["image"]}'),
            Text(
              "Asociación exitosa",
              style: title,
            ),
            Icon(
              Icons.done,
              color: Theme.of(context).primaryColor,
              size: 80.0,
            ),
            Text(
              "Ahora puedes usar esta tarjeta en ${option["title"]}",
              style: textMuted(size: 16.0),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: Image.asset("${card["image"]}"),
            ),
            Text(
              "${card["name"]}",
              style: textMuted(),
            ),
            MainButton(
              text: "Listo",
              callback: (){
                globals.notification = true;
                globals.textNotification = "¡Tu tarjeta está conectada con ${option["title"]}!";
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}