import 'package:auto_size_text/auto_size_text.dart';
import 'package:fake_tinder_second/Entities/User.dart';
import 'package:fake_tinder_second/Screens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  @override
  State<UserDetails> createState() {
    return UserDetailsState();
  }
}

class UserDetailsState extends State<UserDetails> {
  void _iconMessages() {
    print(' icon (messages) was pressed');
  }

  void _iconMatches() {
    print(' icon (messages) was pressed');
  }

  static int id;

  static void setId(int id2) {
    id = id2;
  }

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
                icon: Icon(Icons.more_horiz),
                tooltip: 'Messages',
                onPressed: _iconMessages),
          ],
        ),
        body: Center(
            child: ListView(
          children: [
            Column(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserDetails()));
                    },
                    child: Container(
                      child: FutureBuilder<User>(
                          future: fetchUser(id),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.black),
                                    margin: EdgeInsets.all(5.0),
                                    height: 400,
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                        child: new Image.asset(
                                            snapshot.data.imgUrl.toString(),
                                            fit: BoxFit.cover)),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 15, top: 420),
                                        child: Text(
                                          snapshot.data.name.toString() +
                                              ", " +
                                              snapshot.data.age.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 15, top: 460),
                                        child: Text(
                                          snapshot.data.localeState.toString() +
                                              ", " +
                                              snapshot.data.localeCity
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: 15, top: 480),
                                      child: Text(
                                        "_____________________________________",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )),
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: 15, top: 520),
                                      child: AutoSizeText(
                                        snapshot.data.description.toString(),
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        minFontSize: 18,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return CircularProgressIndicator();
                          }),
                    ))
              ],
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
            )));
  }
}
