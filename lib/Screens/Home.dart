import 'package:fake_tinder_second/Entities/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UserDetails.dart';
import 'UserSettings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

Future<User> fetchUser(int id) async {
  final response = await http.get(
      'https://faketinder-spring-flutter.herokuapp.com/users/${id.toString()}');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}

class HomeState extends State<Home> {
  void _iconMessages() {
    print(' icon (messages) was pressed');
  }

  void _iconMatches() {
    print(' icon (messages) was pressed');
  }

  int id = 26;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.local_fire_department),
            tooltip: 'Matches',
            onPressed: _iconMatches,
          ),
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserSettings()));
            },
          ),
          IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: 'Messages',
              onPressed: _iconMessages),
        ],
      ),
      body: Center(
          child: Column(
        children: [
          InkWell(
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetails()));},
            child: Container(
              child: FutureBuilder<User>(
                  future: fetchUser(id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Stack(
                        children: <Widget>[
                          Container(
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.black
                            ),
                            margin: EdgeInsets.all(5.0),
                            height: 600,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(28.0),
                                child: new Image.asset(
                                    snapshot.data.imgUrl.toString(),
                                    fit: BoxFit.cover
                                )),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 450),
                                child: Text(
                                  snapshot.data.name.toString() +
                                      ", " +
                                      snapshot.data.age.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 490),
                                child: Text(
                                  snapshot.data.localeState.toString() +
                                      ", " +
                                      snapshot.data.localeCity.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }),
            )
          )
        ],
      )),
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 80,
                  width: 80,
                  child: FittedBox(
                    child: FloatingActionButton(
                        heroTag: null,
                        backgroundColor: Colors.blueGrey,
                        child: Icon(Icons.cancel, size: 50),
                    onPressed: () {
                          setState(() {
                            if (id == 26) {
                              id = 27;
                            } else if (id == 27) {
                              id = 28;
                            } else if (id == 28) {
                              id = 29;
                            } else if (id == 29) {
                              id = 26;
                            } else {
                              id = 26;
                            }
                          });
                    }),
                  )),
              SizedBox(
                width: 10,
              ),
              Container(
                  height: 45,
                  width: 45,
                  child: FittedBox(
                    child: FloatingActionButton(
                        heroTag: null,
                        onPressed: null,
                        backgroundColor: Colors.blueGrey),
                  )),
              SizedBox(
                width: 10,
              ),
              Container(
                  height: 80,
                  width: 80,
                  child: FittedBox(
                    child: FloatingActionButton(
                        heroTag: null,
                        onPressed: () {
                          setState(() {
                            if (id == 26) {
                              id = 27;
                            } else if (id == 27) {
                              id = 28;
                            } else if (id == 28) {
                              id = 29;
                            } else if (id == 29) {
                              id = 26;
                            } else {
                              id = 26;
                            }
                          });
                        },
                        backgroundColor: Colors.blueGrey,
                        child: Icon(Icons.favorite, size: 40)),
                  )),
            ],
          )),
    );
  }
}
