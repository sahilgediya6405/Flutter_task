import 'package:api1/Model_albun.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final ModelAlbum album;
  Screen2({super.key, required this.album});

  @override
  State<Screen2> createState() => _Screen2State(this.album);
}

class _Screen2State extends State<Screen2> {
  late ModelAlbum album;
  _Screen2State(ModelAlbum this.album);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "This Data id is ${this.album.id.toString()}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(this.album.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(this.album.userId.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(this.album.title),
              ),
            ])
          ]),
        ],
      ),
    );
  }
}
