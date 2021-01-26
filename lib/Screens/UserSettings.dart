import 'package:fake_tinder_second/Screens/UserPost.dart';
import 'package:flutter/material.dart';
import 'UserPost.dart';


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
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
              )
          ),
        )
    );
  }

  TextStyle textStyle() {
    return TextStyle(
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title: Text('Settings',
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
                RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {

                    }
                )
              ],
            )
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