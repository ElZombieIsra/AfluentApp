import 'package:flutter/material.dart';
import 'package:afluent/themes/style.dart';
import 'package:afluent/services/index.dart' as globals;
import 'package:afluent/components/Buttons/MainButton.dart';
import 'package:afluent/screens/ConfirmationScreen.dart';


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
          child: Text("Aquí no hay nada :("),
        ),
        Hero(
          tag: "linkCard",
          child: Material(
            child: ListView(
              children: <Widget>[
                _activeOptions.length != 0 
                  ? _CustomContainer(
                    text: "Digital Wallets",
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
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                                size: 40.0,
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
          child: Text('Aquí menos'),
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
                HomePageTabs(
                  tabController: globals.tabController,
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      _CustomContainer(
                        text: "Servicios",
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

/*
_activeOptions.length != 0
                       ? _CustomContainer(
                         text: "Digital Wallets",
                       )
                      : Container(),
                      _activeOptions.length != 0
                        ? Container(
                          color: Colors.black12,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: _activeOptions.length,
                              itemBuilder: (BuildContext context, int index){
                                return  OptionTile(
                                    option: _activeOptions[index],
                                    currentCard: currentCard,
                                    index: index,
                                    active: true,
                                  );
                              },
                            )
                          ),
                        )
                        : Container(),
*/

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
      leading: Text("Image"), // TODO: Show option images
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
        : Icon(Icons.forward),
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
                        globals.activeOptions.insert(widget.index, widget.option);
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

class _CustomContainer extends StatelessWidget {
  final String text;
  final callback;
  _CustomContainer({
    this.text,
    @required this.callback
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                "$text".toUpperCase(),
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 11.0,
                ),
              ),
            )
          ),
          IconButton(
            icon: Icon(Icons.add, size: 20.0,),
            onPressed: callback,
          )
        ],
      )
    );
  }
}


/*

*/