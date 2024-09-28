import 'package:blogapi/Model/bloginfo.dart';
import 'package:blogapi/Screen/ViewBlog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBlog extends StatefulWidget {
  final List<Bloginfo> sBlog;
  const SearchBlog({super.key, required this.sBlog});

  @override
  State<SearchBlog> createState() => _SearchBlogState(sBlog: sBlog);
}

class _SearchBlogState extends State<SearchBlog> {
  final List<Bloginfo> sBlog;
  String query = '';

  _SearchBlogState({required this.sBlog});

  List<Bloginfo> get filteredPosts {
    return widget.sBlog
        .where((post) => post.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Search Blogs",
        style: GoogleFonts.dancingScript(
          fontSize: 40,
          textStyle: TextStyle(color: Color.fromARGB(255, 2, 76, 136)),
        ),
      )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (newQuery) {
                setState(() {
                  query = newQuery;
                });
              },
              decoration: InputDecoration(
                hintText: "Search by title",
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 2, 76, 136))),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 2, 76, 136)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 2, 76, 136)),
                ),
              ),
              cursorColor: Color.fromARGB(255, 2, 76, 136),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPosts.length,
              itemBuilder: (context, index) {
                final blog = filteredPosts[index];
                return ListTile(
                  title: Text(blog.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Viewblog(sendBlog: blog),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
