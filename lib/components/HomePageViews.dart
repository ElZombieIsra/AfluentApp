import 'package:flutter/material.dart';
import 'package:afluent/themes/style.dart';
import 'package:afluent/services/index.dart' as globals;
import 'package:afluent/components/Buttons/MainButton.dart';
import 'package:afluent/screens/ConfirmationScreen.dart';
import 'package:afluent/screens/TransactionsScreen.dart';
import 'package:afluent/screens/ConfigurationScreen.dart';
import 'package:afluent/components/CustomContainer.dart';
import 'package:afluent/components/CustomTab.dart';
import 'package:afluent/custom_icons_icons.dart';


class HomePageViews extends StatelessWidget {

  final options = globals.options;
  final _activeOptions =globals.activeOptions;
  final Map currentCard = globals.currentCard;
  final TabController tabController;
  
  HomePageViews({
    Key key,
    this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        Center(
          child: TransactionsScreen(),
        ),
        Hero(
          tag: "linkCard",
          child: Material(
            child: ListView(
              children: <Widget>[
                _activeOptions.length != 0 
                  ? CustomContainer(
                    text: "Digital Wallets",
                    button: true,
                    callback: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PageList()
                        )
                      );
                    },
                  )
                  : Container(),
                _activeOptions.length != 0 
                  ? ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: _activeOptions.length,
                    itemBuilder: (BuildContext context, int index) => Container(
                      color: Colors.black12,
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: OptionTile(
                        index: index,
                        option: _activeOptions[index],
                        currentCard: currentCard,
                        active: true,
                      ),
                    )
                  )
                  : Container(
                    color: Colors.black12,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Asocia tu tarjeta a billeteras y comercios",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 13.0,
                            ),
                          ),
                          Center(
                            child: IconButton(
                              icon: Icon(
                                CustomIcons.downward,
                                color: Colors.black45,
                                size: 15.0,
                              ),
                              onPressed: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PageList()
                                  )
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ),
              ],
            )
          )
        ),
        Center(
          child: ConfigurationScreen(),
        ),
      ],
    );
  }
}

/*

*/

class HomePageTabs extends StatelessWidget {

  final TabController tabController;
  HomePageTabs({Key key, this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      unselectedLabelColor: mutedColor,
      labelColor: mutedColor,
      tabs: <Widget>[
        Tab(
          text: "Transacciones",
          icon: Icon(Icons.loop,),
        ),
        Tab(
          text: "Asociar Tarjeta",
          icon: Icon(Icons.account_balance_wallet,),
        ),
        Tab(
          text: "Configuración",
          icon: Icon(Icons.settings),
        )
      ],
    );
  }
}

class PageList extends StatelessWidget {
  final Map currentCard = globals.currentCard;
  final List _options = globals.options;
  final List _activeOptions =globals.activeOptions;
  PageList({Key key,}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    //globals.tabController.animateTo(1);
    return Scaffold(
      appBar: AppBar(
        title: Text("Asociar tarjeta"),
      ),
      body: SafeArea(
        child: Hero(
          tag: "linkCard",
          child: Material(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
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
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomTab(
                        text: "Transacciones",
                        icon: Icons.loop,
                        callback: (){
                          globals.tabController.animateTo(0);
                          Navigator.pop(context);
                        },
                      ),
                      CustomTab(
                        icon: Icons.account_balance_wallet,
                        text: "Asociar Tarjeta",
                        isSelected: true,
                        callback: (){},
                      ),
                      CustomTab(
                        text: "Configuración",
                        icon: Icons.settings,
                        callback: (){
                          globals.tabController.animateTo(2);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      CustomContainer(
                        text: "Servicios",
                        button: true,
                        callback: (){},
                      ),
                      Container(
                        color: Colors.black12,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: _options.length,
                            itemBuilder: (BuildContext context, int index){
                              return OptionTile(
                                option: _options[index],
                                currentCard: currentCard,
                                index: index,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OptionTile extends StatefulWidget {
  final Map option;
  final Map currentCard;
  final int index;
  final bool active;
  OptionTile({
    Key key,
    @required this.option,
    @required this.currentCard,
    @required this.index,
    this.active,
  });
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset(
          "assets/images/services/${widget.option["image"]}",
          height: 40.0,
        ),
      ),
      title: Text(
        widget.option["title"],
        style: TextStyle(
          color: Colors.black45,
          fontSize: 15.0
        ),
      ),
      trailing: widget.active ?? false 
        ? Switch( 
          activeColor: Theme.of(context).primaryColor,
          value: widget.option["status"],
          onChanged: (bool status){
            setState((){
              globals.options[widget.index]["status"] = status;
              widget.option["status"] = status;
            });
          },
        )
        : Icon(CustomIcons.forward, size: 12.0,),
      onTap: (){
        if(!(widget.active ?? false)){
          globals.Messages(
            context: context
          ).showMessage(
            "Accede a tu cuenta", 
            SizedBox(
              height: 200.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextField(
                    decoration: fieldDecoration2("Usuario")
                  ),
                  TextField(
                    obscureText: true,
                    decoration: fieldDecoration2("Contraseña")
                  ),
                  MainButton(
                    text: "Entrar",
                    callback: (){
                      Navigator.of(context).pop();
                      setState(() {
                        // globals.options[widget.index]["previuosStatus"] = true; 
                        widget.option["status"] = true; 
                        globals.activeOptions.add(widget.option);
                        globals.options.removeAt(widget.index);
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ConfirmationScreen(
                            card: widget.currentCard,
                            option: widget.option,
                          ),
                        )
                      );
                    },
                  )
                ],
              ),
            )
          );
        }
      },
    );
  }
}


/*

*/