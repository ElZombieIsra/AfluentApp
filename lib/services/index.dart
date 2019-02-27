library services.globals;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String numberFormat(num){
  var f = NumberFormat("#,##0.00", "es_MX");
  return "${f.format(num)}";
}

void resetState(){
  for (var i = 0; i < options.length; i++) {
    options[i]["status"] = false;
    options[i]["linked"] = false;
  }
}

String textNotification;

bool notification = false;

TabController tabController;
setTabController(_tabController){ 
  tabController = _tabController;
}

List options = [
  {
    "title": "Samsung Pay",
    "status": false,
    "linked": false,
    "image":"pay.png",
  },{
    "title": "Uber",
    "status": false,
    "linked": false,
    "image":"uber.png",
  },{
    "title": "Netflix",
    "status": false,
    "linked": false,
    "image":"netflix.png",
  },{
    "title": "Amazon",
    "status": false,
    "linked": false,
    "image":"amazon.png",
  },{
    "title": "Paypal",
    "status": false,
    "linked": false,
    "image": "paypal.png",
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

Map currentCard = cards[0], userData = {
  "user": "jimena789",
  "password": "224466"
};

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