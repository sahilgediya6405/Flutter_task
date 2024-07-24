import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

//
void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MyWidget();
}

class _MyWidget extends State<MainApp> {
  late bool isDataLoaded;
  late List user = [];
  @override
  void initState() {
    super.initState();
    isDataLoaded = false;
  }

  void DataFach() async {
    var response =
        await Http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    print('response status: ${response.statusCode}');
    print('response body: ${response.body}');

    if (response.statusCode == 200) {
      user = json.decode(response.body);
      setState(() {
        isDataLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DataFach();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: isDataLoaded == true
              ? ListView.builder(
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user[index]['name']),
                            Text(user[index]['email']),
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
