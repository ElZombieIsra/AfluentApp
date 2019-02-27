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

import 'dart:async';

class HomePageViews extends StatefulWidget {
  final TabController tabController;
  
  HomePageViews({
    Key key,
    this.tabController,
  }) : super(key: key);

  _HomePageViewsState createState() => _HomePageViewsState();
}

class _HomePageViewsState extends State<HomePageViews> {
  final Map currentCard = globals.currentCard;
  final List options = globals.options;
  List _activeOptions = [];

  @override
  Widget build(BuildContext context) {
    _activeOptions = [];
    options.forEach((_option){
      if (_option["linked"]) {
        _activeOptions.add(_option);
      }
    });
    return Container(
      child: Hero(
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
                          child: AnimatedDownArrowButton(
                            callback: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PageList()
                                )
                              );
                            },
                          )
                        )
                      ],
                    ),
                  )
                ),
              _activeOptions.length != 0
                ? Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  color: Colors.black12,
                  child: OptionTile(
                    currentCard: currentCard,
                    index: 0,
                    option: options[0],
                    active: false,
                    action: false,
                  ),
                )
                : Container()
            ],
          )
        )
      ),
    );
  }
}

class HomePageTabs extends StatelessWidget {

  final TabController tabController;
  HomePageTabs({Key key, this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomTab(
          text: "Transacciones",
          //icon: Icons.loop,
          icon: "assets/images/refresh.png",
          callback: (){},
        ),
        CustomTab(
          //icon: Icons.account_balance_wallet,
          icon: "assets/images/cartera.png",
          text: "Asociar Tarjeta",
          isSelected: true,
          callback: (){},
        ),
        CustomTab(
          text: "Configuración",
          icon: "assets/images/config.png",
          //icon: Icons.settings,
          callback: (){},
        ),
      ],
    );
  }
}

class PageList extends StatelessWidget {
  final Map currentCard = globals.currentCard;
  final List _options = globals.options;
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
                  child: HomePageTabs(),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black12,
                    padding: EdgeInsets.only(top: 10.0),
                    child: ListView(
                      children: <Widget>[
                        Text(
                          "Asocia tu tarjeta a billeteras y comercios",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: _options.length,
                            itemBuilder: (BuildContext context, int index){
                              return !_options[index]["linked"] ? OptionTile(
                                option: _options[index],
                                currentCard: currentCard,
                                index: index,
                                blink: index == 1,
                              ) : Container();
                            },
                          ),
                        ),
                      ],
                    ),
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
  final bool active, action, blink;
  OptionTile({
    Key key,
    @required this.option,
    @required this.currentCard,
    @required this.index,
    this.active,
    this.action = true,
    this.blink = false,
  });
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    final CurvedAnimation curve = CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _colorTween = ColorTween(
      begin: Colors.transparent, 
      end: Colors.blue
    ).animate(curve);
    _colorTween.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        Timer(Duration(seconds: 2), (){
          _animationController.forward();
        });
      }
      setState(() {});
    });
    _animationController.forward();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) => Container(
        color: widget.blink ? _colorTween.value : Colors.transparent,
          child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
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
          trailing: widget.action 
            ? (widget.active ?? false 
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
              : Icon(CustomIcons.forward, size: 15.0,))
            : Container(width: 0.0,),
          onTap: (){
            if(widget.action && !(widget.active ?? false) && widget.blink){
              _animationController.reset();
              _animationController.stop();
              TextEditingController _userController = TextEditingController();
              TextEditingController _passwordController = TextEditingController();
              FocusNode _focus = FocusNode();
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
                        controller: _userController,
                        decoration: fieldDecoration2("Usuario"),
                        enabled: true,
                        style: textMuted(size: 14.0),
                        onTap: (){
                          _userController.text = globals.userData["user"];
                          _passwordController.text = globals.userData["password"];
                          _focus.unfocus();
                        },
                        focusNode: _focus,
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: fieldDecoration2("Contraseña"),
                        enabled: true,
                        focusNode: _focus,
                        onTap: (){
                          _userController.text = globals.userData["user"];
                          _passwordController.text = globals.userData["password"];
                          _focus.unfocus();
                        },
                      ),
                      MainButton(
                        text: "Entrar",
                        callback: (){
                          Navigator.of(context).pop();
                          setState(() {
                            // globals.options[widget.index]["previuosStatus"] = true; 
                            widget.option["status"] = true; 
                            widget.option["linked"] = true;
                            globals.options[widget.index]["linked"] = true;
                            globals.options[widget.index]["status"] = true;
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
        ),
      )
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}


/*

*/