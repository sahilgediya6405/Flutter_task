import 'dart:convert';

import 'package:blogapi/Model/bloginfo.dart';
import 'package:blogapi/Widgrt/blogpost.dart';
import 'package:blogapi/Widgrt/shimmerloder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as bhttp;

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Blog()));
}

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  late bool shimmerloder;
  late List<Bloginfo> Bloginformation;
  @override
  void initState() {
    super.initState();
    shimmerloder = false;
    Bloginformation = [];
    blogapi();
  }

  void blogapi() async {
    var responce = await bhttp
        .get(Uri.parse("https://api.fake-rest.refine.dev/blog_posts"));

    print(responce.statusCode);

    if (responce.statusCode == 200) {
      List myblog = json.decode(responce.body);

      myblog.forEach((json) {
        Bloginformation.add(
            Bloginfo(title: json["title"], content: json["content"]));
      });
      setState(() {
        shimmerloder = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "My Blogs",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          backgroundColor: const Color.fromARGB(110, 158, 158, 158),
        ),
        body: shimmerloder == true
            ? MyScreen(blogdata: Bloginformation)
            : Shimmerloder());
  }
}
