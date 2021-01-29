import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fake_tinder_second/Entities/User.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';

class UserPost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserPostState();
  }
}

Future<User> registerUser(
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
        return MyAlertDialog(title: 'backend response', content: "adicionado");
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

class UserPostState extends State<UserPost> {
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
          'New User',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                textFields("name", nameController),
                textFields("age", ageController),
                textFields("description", descController),
                textFields("state", lStateController),
                textFields("city", lCityController),
                textFields("email", emailController),
                RaisedButton(child: Text('Submit'), onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                  await registerUser(
                      null,
                      "assets/images/vaca.jpg",
                      nameController.text,
                      ageController.text,
                      lStateController.text,
                      lCityController.text,
                      descController.text,
                      emailController.text,
                      context);
                }),
              ],
            )
        ),
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    this.title,
    this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
