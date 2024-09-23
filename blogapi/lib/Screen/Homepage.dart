import 'dart:convert';

import 'package:blogapi/Model/bloginfo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as Https;

class Homepage extends StatefulWidget {
  const Homepage({super.key, required List<Bloginfo> blogdata});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final apiUri = 'https://api.fake-rest.refine.dev/blog_posts/';
  late List blocgData = [];

  void initState() {
    blocgData = [];
    getdata();
  }

  void getdata() async {
    final responce = await Https.get(Uri.parse(apiUri));

    if (responce.statusCode == 200) {
      List<dynamic> jsonArrey = json.decode(responce.body);
      List<Bloginfo> BlogList =
          jsonArrey.map((jsonObject) => Bloginfo.fromjson(jsonObject)).toList();
      print(responce.statusCode);
      setState(() {
        blocgData = BlogList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Blog',
            style: GoogleFonts.dancingScript(
                fontSize: 40,
                textStyle: TextStyle(color: Color.fromARGB(255, 2, 76, 136))),
          ),
          backgroundColor: Colors.blue[50],
        ),
        body: blocgData.length > 0
            ? ListView.builder(
                itemCount: blocgData.length,
                itemBuilder: (context, index) {
                  Bloginfo BlogListMAp = blocgData[index] ?? 'No Tital';
                  return Card(
                    color: Colors.blue[50],
                    child: Row(
                      children: [
                        CircleAvatar(),
                        Text(BlogListMAp.title),
                        //Text(BlogListMAp.content)
                      ],
                    ),
                  );
                })
            : Center(
                child: Image.asset('assets/Loading.gif'),
              ));
  }
}
