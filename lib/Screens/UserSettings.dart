import 'package:fake_tinder_second/Entities/User.dart';
import 'package:fake_tinder_second/Screens/UserPost.dart';
import 'package:flutter/material.dart';
import 'UserPost.dart';
import 'Home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<User> updateUser(
    String id,
    String imgUrl,
    String name,
    String age,
    String localeState,
    String localeCity,
    String description,
    String email, BuildContext context) async {
  var url = "https://faketinder-spring-flutter.herokuapp.com/users";
  var response = await http.post(url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        'id': id,
        'imgUrl': imgUrl,
        'name': name,
        'age': age,
        'localeState': localeState,
        'localeCity': localeCity,
        'description': description,
        'email': email,
      }));



  String responseString = response.body;
  if (response.statusCode == 201) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(title: 'backend response', content: "updated");
      },
    );
  } else {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(title: 'didnt work', content: responseString);
      },
    );
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

int activeUser = 30;

class UserSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserSettingsState();
  }
}

class UserSettingsState extends State<UserSettings> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController lStateController = TextEditingController();
  TextEditingController lCityController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Padding textFields(String text, TextEditingController controller) {
    return Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: TextFormField(
          style: textStyle(),
          controller: controller,
          validator: (String value) {
            if (value.isEmpty) {
              return 'please enter your $text';
            }
          },
          decoration: InputDecoration(
              labelText: text,
              hintText: 'Enter your $text',
              labelStyle: textStyle(),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ));
  }

  TextStyle textStyle() {
    return TextStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder<User>(
          future: fetchUser(activeUser),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Form(
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: <Widget>[
                        //name field
                        Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: TextFormField(
                              style: textStyle(),
                              controller: nameController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your name';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: snapshot.data.name.toString(),
                                  hintText: 'Enter your name',
                                  labelStyle: textStyle(),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0))),
                            )
                        ),
                        //Age Field
                        Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: TextFormField(
                              style: textStyle(),
                              controller: ageController,
                              keyboardType: TextInputType.number,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your name';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: snapshot.data.age.toString(),
                                  hintText: 'Enter your age',
                                  labelStyle: textStyle(),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0))),
                            )
                        ),
                        //Description Field
                        Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: TextFormField(
                              style: textStyle(),
                              controller: descController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Write about yourself';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: snapshot.data.description.toString(),
                                  hintText: 'Write about yourself',
                                  labelStyle: textStyle(),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0))),
                            )
                        ),

                        //L.State Field
                        Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: TextFormField(
                              style: textStyle(),
                              controller: lStateController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'State';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: snapshot.data.localeState.toString(),
                                  hintText: 'State',
                                  labelStyle: textStyle(),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0))),
                            )
                        ),

                        //L.City Field
                        Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: TextFormField(
                              style: textStyle(),
                              controller: lCityController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'City';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: snapshot.data.localeCity.toString(),
                                  hintText: 'City',
                                  labelStyle: textStyle(),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0))),
                            )
                        ),

                        //Email Field
                        Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: TextFormField(
                              style: textStyle(),
                              controller: emailController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Enter email';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: snapshot.data.email.toString(),
                                  hintText: 'Enter your email',
                                  labelStyle: textStyle(),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0))),
                            )
                        ),

                        RaisedButton(child: Text('Submit'), onPressed: () async {
                          String id = snapshot.data.id.toString();
                          String name;
                          if (nameController.text == "") {
                            name = snapshot.data.name.toString();
                          } else {
                            name = nameController.text;
                          }
                          String description;
                          if (descController.text == "") {
                            description = snapshot.data.description.toString();
                          } else {
                            description = descController.text;
                          }
                          String localeCity;
                          if (lCityController.text == "") {
                            localeCity = snapshot.data.localeCity.toString();
                          } else {
                            localeCity = lCityController.text;
                          }
                          String localeState;
                          if (lStateController.text == "") {
                            localeState = snapshot.data.localeState.toString();
                          } else {
                            localeState = lStateController.text;
                          }
                          String email;
                          if (emailController.text == "") {
                            email = snapshot.data.email.toString();
                          } else {
                            email = emailController.text;
                          }
                          String age;
                          if (ageController.text == "") {
                            age = snapshot.data.age.toString();
                          } else {
                            age = ageController.text;
                          }
                          await updateUser(id, "imgUrl", name, age, localeState, localeCity, description, email, context);
                        })

                      ],
                    )),
              );
            }else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();

          }
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          children: <Widget>[
            DrawerHeader(
              child: Text('Settings'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('User registry'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
