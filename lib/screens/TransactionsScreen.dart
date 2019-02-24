import 'package:flutter/material.dart';
import 'package:afluent/themes/style.dart';
import 'package:afluent/services/index.dart' as globals;
import 'package:afluent/components/CustomContainer.dart';

class TransactionsScreen extends StatefulWidget {
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final _items = globals.transactions;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length + 1,
      itemBuilder: (BuildContext context, int index){
        if(index == 0){
          return Material(
            child: CustomContainer(
              text: "Movimientos",
              child: Padding(
                padding: EdgeInsets.only(right: 30.0),
                child: Text(
                  "Monto".toUpperCase(),
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 11.0,
                  ),
                ),
              ),
            ),
            elevation: 2.0,
          );
        }
        index -= 1;
        return Container(
          color: Colors.black12,
          child: ListTile(
            subtitle: Text(
              _items[index]["transaction"],
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14.0
              ),
            ),
            title: Text(
              _items[index]["date"],
              style: textMuted(),
            ),
            trailing: Text(
              "${_items[index]["expense"] ? "-" : "+"}\$${_items[index]["amount"]}",
              style: textMuted(size: 14.0),
            ),
          ),
        );
      } ,
    );
  }
}