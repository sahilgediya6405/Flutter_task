import 'dart:convert';

import 'package:blogapi/Model/bloginfo.dart';
import 'package:blogapi/Screen/ViewBlog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as Https;
import 'package:image_network/image_network.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required List<Bloginfo> blogdata});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final apiUri = 'https://api.fake-rest.refine.dev/posts/';

  late List blocgData = [];
  late bool isLoaded;
  late bool haseError;

  @override
  void initState() {
    super.initState();
    isLoaded = false;
    haseError = false;
    blocgData = [];
    getdata();
  }

  void getdata() async {
    try {
      setState(() {
        isLoaded = true;
        haseError = false;
      });
      final responce = await Https.get(Uri.parse(apiUri));

      if (responce.statusCode == 200) {
        List<dynamic> jsonArrey = json.decode(responce.body);
        List<Bloginfo> BlogList = jsonArrey
            .map((jsonObject) => Bloginfo.fromjson(jsonObject))
            .toList();
        setState(() {
          haseError = false;
          blocgData = BlogList;
        });
      } else {
        throw Error.safeToString('SattusCoad is not 200');
      }
    } catch (e) {
      print(e.toString());
      setState(() {
        haseError = true;
      });
    } finally {
      setState(() {
        isLoaded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded == true) {
      return Center(
        child: Image.asset('assets/Loading.gif'),
      );
    } else {
      if (haseError) {
        return Scaffold(body: Text("Fail to load data"));
      } else {
        return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 2, 76, 136),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Text(
                    'My Blog',
                    style: GoogleFonts.dancingScript(
                        fontSize: 40,
                        textStyle:
                            TextStyle(color: Color.fromARGB(255, 2, 76, 136))),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 2, 76, 136),
                      ))
                ],
              ),
              backgroundColor: Colors.blue[50],
            ),
            body: ListView.builder(
                itemCount: blocgData.length,
                itemBuilder: (context, index) {
                  Bloginfo BlogListMAp = blocgData[index];
                  // final firstLetter = BlogListMAp.title[0].toUpperCase;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Viewblog(sendBlog: BlogListMAp)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.blue[50]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.person,
                                    color: Color.fromARGB(255, 2, 76, 136),
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "User_name",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 2, 76, 136)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 50),
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Text('Follow')),
                                        )
                                      ],
                                    ),
                                    Text(
                                      BlogListMAp.slug,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromARGB(255, 2, 76, 136)),
                                    ),
                                    Text(
                                      BlogListMAp.createdAt,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 2, 76, 136),
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              BlogListMAp.title,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 76, 136)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ImageNetwork(
                                image: BlogListMAp.image,
                                height: 250,
                                width: 300),
                          ),
                          Divider(
                            height: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.thumb_up_alt_outlined,
                                      color: Color.fromARGB(255, 2, 76, 136),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        'Like',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 2, 76, 136)),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.comment,
                                      color: Color.fromARGB(255, 2, 76, 136),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        'Comment',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 2, 76, 136)),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.share,
                                      color: Color.fromARGB(255, 2, 76, 136),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        'Share',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 2, 76, 136)),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }));
      }
    }
  }
}
