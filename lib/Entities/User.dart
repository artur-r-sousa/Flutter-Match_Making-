import 'dart:convert';


User userJson(String str) => User.fromJson(json.decode(str));

String userToJson(User user) => json.encode(user.toJson());

class User {
  String id;
  String imgUrl;
  String name;
  String age;
  String localeState;
  String localeCity;
  String description;
  String email;

  User(
      {this.id,
        this.imgUrl,
        this.name,
        this.age,
        this.localeState,
        this.localeCity,
        this.description,
        this.email});

//
  factory User.fromJson(Map<String, dynamic> json) => User (
    id: json['id'],
    imgUrl: json['imgUrl'],
    name: json['name'],
    age: json['age'],
    localeState: json['localeState'],
    localeCity: json['localeCity'],
    description: json['description'],
    email: json['email'],
  );


  Map<String, dynamic> toJson() => {
    'id':id,
    'imgUrl': imgUrl,
    'name': name,
    'age':age,
    'localeState': localeState,
    'localeCity': localeCity,
    'description': description,
    'email': email,
  };
}

String get id => id;
String get imgUrl => imgUrl;
String get name => name;
String get age => age;
String get localeState => localeState;
String get localeCity => localeCity;
String get description => description;
String get email => email;
