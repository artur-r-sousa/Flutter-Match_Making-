import 'package:flutter/material.dart';
import 'UserSettings.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<Home>{

  void _iconMessages(){
    print(' icon (messages) was pressed');
  }

  void _iconMatches(){
    print(' icon (messages) was pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.local_fire_department),
            tooltip: 'Matches',
            onPressed: _iconMatches,
          ),
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserSettings())
              );
            },
          ),
          IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: 'Messages',
              onPressed: _iconMessages
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      height: 600,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: new Image.asset(
                          "assets/images/girl.jpg",
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

