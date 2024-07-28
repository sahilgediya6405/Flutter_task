import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:userdataapi/Model/User.dart';
import 'package:userdataapi/Widget/ListView.dart';
import 'package:userdataapi/Widget/ShimmerLoading.dart';
import 'package:http/http.dart' as uhttp;

void main() {
  runApp(MaterialApp(
    home: Scaffold(body: User()),
  ));
}

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  late bool shimmerLoder;
  late List<userinfo> User;
  @override
  void initState() {
    super.initState();
    User = [];
    shimmerLoder = false;
    userinformation();
  }

  void userinformation() async {
    var responce =
        await uhttp.get(Uri.parse("https://api.escuelajs.co/api/v1/users"));
    print(responce.statusCode);

    if (responce.statusCode == 200) {
      List Userdata = json.decode(responce.body);

      Userdata.forEach((json) {
        User.add(userinfo(
            avatar: json["avatar"],
            name: json["name"],
            role: json["role"],
            email: json["email"]));
      });
      setState(() {
        shimmerLoder = true;
      });
    }
  }

  Widget build(BuildContext context) {
    if (shimmerLoder == true) {
      return MyListView(
        userData: User,
      );
    } else {
      return Shimmerloading();
    }
  }
}
