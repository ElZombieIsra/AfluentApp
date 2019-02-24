import 'package:flutter/material.dart';
import 'package:afluent/components/Drawer.dart';
import 'package:afluent/themes/style.dart';
import 'package:afluent/services/index.dart' as globals;
import 'package:afluent/components/HomePageViews.dart';
import 'package:afluent/services/NotificationService.dart' as cn;
//import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  final List cards = globals.cards;
  final Map currentCard = globals.currentCard;
  TabController _tabController;

  void initState() { 
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    globals.setTabController(_tabController);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: cn.notify(
        notification: globals.notification,
        text: globals.textNotification,
        appbar: AppBar(
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.monetization_on,
                color: Colors.white,
              ),
              onPressed: (){},
            )
          ],
        ),
        callback: (){
          setState(() {
            globals.notification = false;
          });
        },
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: screenSize.height / 3,
                child: Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  SizedBox(
                    height: 200.0,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Expanded(child: Container(),)
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Image.asset(cards[0]["image"],),
                    ),
                  )
                ],
              ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "${currentCard["name"]}",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: mutedColor
                      ),
                    ),
                    Text(
                      "\$${globals.numberFormat(currentCard["balance"])}",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                      ),
                    ),
                    HomePageTabs(
                      tabController: _tabController,
                    ),
                    Expanded(
                      child: HomePageViews(
                        tabController: _tabController,
                      ),
                    ), 
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*

                   
                            
*/