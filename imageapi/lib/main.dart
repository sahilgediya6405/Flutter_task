import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_network/image_network.dart';
import 'package:imageapi/model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MyWidget();
}

class _MyWidget extends State<MainApp> {
  late bool loading;
  late List<PhotoData> photoD = [];

  @override
  void initState() {
    super.initState();

    loading = false;
    fachData();
  }

  void fachData() async {
    var responce = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    print('responce status : ${responce.statusCode}');
    print('responce body: ${responce.body}');

    if (responce.statusCode == 200) {
      List jsonList = json.decode(responce.body);

      jsonList.forEach((photoDetails) {
        photoD.add(PhotoData(
            title: photoDetails["title"],
            thumbnailUrl: photoDetails["thumbnailUrl"]));
      });
      setState(() {
        loading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: loading == true
                ? GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: photoD.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ImageNetwork(
                                image: photoD[index].thumbnailUrl,
                                height: 150,
                                width: 150,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(photoD[index].title.toString()),
                            ),
                          ],
                        ),
                      );
                    })
                : const Center(child: CircularProgressIndicator())));
  }
}
