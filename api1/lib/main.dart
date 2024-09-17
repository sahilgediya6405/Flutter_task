import 'dart:convert';
import 'package:api1/Model_albun.dart';
import 'package:api1/Screen2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as libhttp;

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: MyWidget(),
    ),
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final apiUrl = "https://jsonplaceholder.typicode.com/albums/";
  late List albumData;

  void initState() {
    albumData = [];
    getdata();
  }

  void getdata() async {
    final responce = await libhttp.get(Uri.parse(apiUrl));

    if (responce.statusCode == 200) {
      List<dynamic> jsonArrey = json.decode(responce.body);

      // json convert --> dart

      List<ModelAlbum> albumList = jsonArrey
          .map((jsonObject) => ModelAlbum.fomJsonObject(jsonObject))
          .toList();

      setState(() {
        albumData = albumList;
      });
    } else {
      print("Fail to the get data");
    }
  }

// Delete Data to Server

  void deleteData(int id) async {
    final responce = await libhttp.delete(Uri.parse(apiUrl + id.toString()));
    print(responce.statusCode);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return albumData.length > 0
        ? ListView.builder(
            itemCount: albumData.length,
            itemBuilder: (context, index) {
              ModelAlbum album = albumData[index];
              return ListTile(
                  title: Text(album.title),
                  subtitle: Text('UserID : ${album.userId}'),
                  trailing: IconButton(
                      onPressed: () {
                        deleteData(album.id);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) =>
                                Screen2(album: albumData[index])));
                  });
            })
        : Center(child: CircularProgressIndicator());
  }
}
