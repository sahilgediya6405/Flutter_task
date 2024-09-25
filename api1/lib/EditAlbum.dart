import 'dart:convert';

import 'package:api1/Model_albun.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as libhttp;

class Editalbum extends StatefulWidget {
  final ModelAlbum modelAlbum;
  Editalbum({super.key, required this.modelAlbum});

  @override
  State<Editalbum> createState() => _EditState(modelAlbum: this.modelAlbum);
}

class _EditState extends State<Editalbum> {
  final ModelAlbum modelAlbum;

  _EditState({required this.modelAlbum});
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  final apiUrl = "http://localhost:8000/album/";

  bool isLoad = true;

  @override
  void initState() {
    titleController.text = this.modelAlbum.title;
    userIdController.text = this.modelAlbum.userId.toString();
  }

  Future<void> editData() async {
    // step 1 --> apiuri post request --> data
    setState(() {
      isLoad = true;
    });

    try {
      final Responce =
          await libhttp.patch(Uri.parse(apiUrl + modelAlbum.id.toString()),
              headers: {'Content-Type': 'Application/json'},
              body: jsonEncode({
                'userId': int.tryParse(userIdController.text),
                'title': titleController.text,
              }));
      //step 2 --> responce check 201

      if (Responce.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Albume Edit SuccessFully!")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Fail to Edit albume. please try again')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again.')),
      );
    } finally {
      setState(() {
        isLoad = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editalbum ${modelAlbum.id}"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: userIdController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('userId')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('title')),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: editData, child: const Text('Submit')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('cancel')),
            ],
          ),
        ],
      ),
    );
  }
}
