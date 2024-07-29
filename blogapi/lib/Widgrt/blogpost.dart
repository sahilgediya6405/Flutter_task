import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  late List blogdata = [];
  MyScreen({super.key, required this.blogdata});

  @override
  Widget build(BuildCcontext) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: ListView.builder(
          itemCount: blogdata.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 2, color: Colors.black)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                blogdata[index].title,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(blogdata[index].content),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
