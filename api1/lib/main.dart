import 'dart:convert';
import 'package:api1/Model_albun.dart';
import 'package:api1/Screen1.dart';
import 'package:api1/Screen2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as libhttp;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Screen1()));
        },
        child: Icon(Icons.add),
      ),
      body: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final apiUrl =
      "http://localhost:8000/albums/"; // API URI Tack in 'apiUrl' varialble
  late List albumData;

  void initState() {
    //Application is start. onetime initState is called.
    albumData = [];
    getdata();
  }

  // Get Data From  Rest API

  Future<void> getdata() async {
    final responce = await libhttp
        .get(Uri.parse(apiUrl)); // Call API and Get Data From Server

    if (responce.statusCode == 200) {
      // Get Data where StatusCoade = 200
      List<dynamic> jsonArrey = json.decode(
          responce.body); // API Data tack 'jsonArrey' (List type) Variable

      // json convert --> dart (Using Model Class)

      /* 
        'jsonArrey' Stored Json object 
         this function doing API data go to MOdel_album.dart file and create Dart Object
          And Store in 'albumList' Variable.

       */
      List<ModelAlbum> albumList = jsonArrey
          .map((jsonObject) => ModelAlbum.fomJsonObject(jsonObject))
          .toList();

// Sate change and 'albumList' data is copyed 'albumData'
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
        ? RefreshIndicator(
            child: ListView.builder(
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
                }),
            onRefresh: getdata,
          )
        : Center(child: CircularProgressIndicator());
  }
}
