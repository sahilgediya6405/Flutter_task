import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'package:imageapi/model.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MyWidget();
}

class _MyWidget extends State<MainApp> {
  late bool Loading = false;
  late List PhotoD = [];

  @override
  void initState() {
    super.initState();
    FachData();
  }

  void FachData() async {
    setState(() {
      Loading = true;
    });
    var responce = await Http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    // print('responce status : ${responce.statusCode}');
    // print('responce body: ${responce.body}');

    if (responce.statusCode == 200) {
      List jsonList = json.decode(responce.body);

      jsonList.forEach((json) {
        PhotoD.add(PhotoData.fromJson(json));
      });
      setState(() {
        Loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Loading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: PhotoD.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 80,
                                width: 80,
                                child: CachedNetworkImage(
                                  imageUrl: PhotoD[index].thumbnailUrl,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(PhotoD[index].title.toString()),
                            ),
                          ],
                        ),
                      );
                    })));
  }
}
