import 'package:blogapi/Model/bloginfo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';

class Viewblog extends StatefulWidget {
  final Bloginfo sendBlog;
  const Viewblog({super.key, required this.sendBlog});

  @override
  State<Viewblog> createState() => _ViewblogState(sendBlog: sendBlog);
}

class _ViewblogState extends State<Viewblog> {
  final Bloginfo sendBlog;

  _ViewblogState({required this.sendBlog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blog",
          style: GoogleFonts.dancingScript(
              color: Color.fromARGB(255, 2, 76, 136), fontSize: 40),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(color: Colors.blue[50]),
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 35,
                        color: Color.fromARGB(255, 2, 76, 136),
                      ),
                      backgroundColor: Colors.white,
                      maxRadius: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'User_Name',
                        style: TextStyle(
                            color: Color.fromARGB(255, 2, 76, 136),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        sendBlog.slug,
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 76, 136),
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text(sendBlog.title,
                    style: TextStyle(
                        color: Color.fromARGB(255, 2, 76, 136),
                        fontWeight: FontWeight.bold,
                        fontSize: 20))),
            ImageNetwork(image: sendBlog.image, height: 250, width: 300),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(sendBlog.content),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text('created At: '),
                  Text(sendBlog.createdAt),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [Text('publishedAt: '), Text(sendBlog.publishedAt)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.remove_red_eye_sharp,
                    color: Color.fromARGB(255, 2, 76, 136),
                  ),
                  Text('${sendBlog.hit}')
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 2, 76, 136),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
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
                          style:
                              TextStyle(color: Color.fromARGB(255, 2, 76, 136)),
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
                          style:
                              TextStyle(color: Color.fromARGB(255, 2, 76, 136)),
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
                          style:
                              TextStyle(color: Color.fromARGB(255, 2, 76, 136)),
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
  }
}
