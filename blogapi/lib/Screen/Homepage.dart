import 'dart:convert';
import 'package:blogapi/Model/bloginfo.dart';
import 'package:blogapi/Screen/SearchBlog.dart';
import 'package:blogapi/Screen/ViewBlog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http; // Make sure this is imported
import 'package:image_network/image_network.dart';

class Homepage extends StatefulWidget {
  const Homepage(
      {super.key,
      required this.blogdata}); // Ensure this parameter is used correctly

  final List<Bloginfo> blogdata; // Declare the blogdata parameter

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final apiUri = 'https://api.fake-rest.refine.dev/posts/';

  late List<Bloginfo> blogData; // Define blogData as List<Bloginfo>
  late bool isLoaded;
  late bool hasError;

  @override
  void initState() {
    super.initState();
    isLoaded = false;
    hasError = false;
    blogData = []; // Initialize as an empty List<Bloginfo>
    getData();
  }

  Future<void> getData() async {
    try {
      setState(() {
        isLoaded = true;
        hasError = false;
      });
      final response = await http.get(Uri.parse(apiUri));

      if (response.statusCode == 200) {
        List<dynamic> jsonArray = json.decode(response.body);
        List<Bloginfo> blogList = jsonArray
            .map((jsonObject) =>
                Bloginfo.fromjson(jsonObject)) // Ensure fromJson is defined
            .toList();
        setState(() {
          hasError = false;
          blogData = blogList; // Assign fetched data
        });
      } else {
        throw Exception('Status Code is not 200');
      }
    } catch (e) {
      print(e.toString());
      setState(() {
        hasError = true;
      });
    } finally {
      setState(() {
        isLoaded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.blue[50]),
          child: Center(
            child: Image.asset(
              'assets/Loading.gif',
            ),
          ),
        ),
      );
    } else if (hasError) {
      return Scaffold(body: Center(child: Text("Failed to load data")));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 2, 76, 136),
                ),
                backgroundColor: Colors.white,
              ),
              Text(
                'My Blog',
                style: GoogleFonts.dancingScript(
                  fontSize: 40,
                  textStyle: TextStyle(color: Color.fromARGB(255, 2, 76, 136)),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchBlog(sBlog: blogData)));
                },
                icon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 2, 76, 136),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blue[50],
        ),
        body: RefreshIndicator(
          onRefresh: getData,
          color: Color.fromARGB(255, 2, 76, 136),
          backgroundColor: Colors.blue[50],
          child: ListView.builder(
            itemCount: blogData.length,
            itemBuilder: (context, index) {
              Bloginfo blogListMap = blogData[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Viewblog(sendBlog: blogListMap),
                    ),
                  );
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
                                        color: Color.fromARGB(255, 2, 76, 136),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 50),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text('Follow'),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  blogListMap.slug,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 2, 76, 136),
                                  ),
                                ),
                                Text(
                                  blogListMap.createdAt,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 2, 76, 136),
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          blogListMap.title,
                          style:
                              TextStyle(color: Color.fromARGB(255, 2, 76, 136)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 10),
                        child: ImageNetwork(
                          image: blogListMap.image,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.9,
                        ),
                      ),
                      Divider(height: 2),
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
                                        color: Color.fromARGB(255, 2, 76, 136)),
                                  ),
                                ),
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
                                        color: Color.fromARGB(255, 2, 76, 136)),
                                  ),
                                ),
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
                                        color: Color.fromARGB(255, 2, 76, 136)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
