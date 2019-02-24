library services.globals;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String numberFormat(num){
  var f = NumberFormat("#,##0.00", "es_MX");
  return "${f.format(num)}";
}

String textNotification;

bool notification = false;

TabController tabController;
setTabController(_tabController){ 
  tabController = _tabController;
}

List activeOptions = [
  
];
List options = [
  {
    "title": "Uber",
    "status": false,
    "image":"",
  },{
    "title": "Samsung Pay",
    "status": false,
    "image":"",
  },{
    "title": "Netflix",
    "status": false,
    "image":"",
  },{
    "title": "Amazon",
    "status": false,
    "image":"",
  },{
    "title": "Paypal",
    "status": false,
    "image":"",
  }
], cards = [{
  "name": "FDNB Visa_1234",
  "balance": 2867.00,
  "image": "assets/images/card.png",
}], transactions = [
  {
    "transaction": "Pago honorarios",
    "amount": 5000.00,
    "date": "20-Feb-2019",
    "expense": false,
  },
  {
    "transaction": "Comida rápida",
    "amount": 327.00,
    "date": "19-Feb-2019",
    "expense": true,
  }
], configurations = [
  {
    "banner": true,
    "title": "Push notifications",
  },
  {
    "banner": false,
    "config": "Gastos",
    "isChecked": true,
  },
  {
    "banner": false,
    "config": "Ingresos",
    "isChecked": true,
  },
  {
    "banner": true,
    "title": "Email notifications",
  },
  {
    "banner": false,
    "config": "Gastos",
    "isChecked": false,
  },
  {
    "banner": false,
    "config": "Ingresos",
    "isChecked": false,
  },
];

Map currentCard = cards[0];

void setCurrentCard(Map _card){
  currentCard =_card;
}

class Messages {
  final BuildContext context;
  Messages({
    @required this.context,
  });

  void showMessage(String title, var content){
    showDialog(
      context: this.context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Center(
            child: Text(
              "$title",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
          ),
          content: content,
        );
      }
    );
  }
}