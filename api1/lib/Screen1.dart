import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as libhttp;

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  final apiUrl = "http://localhost:8000/albums/";
  bool isLoad = true;

  void PostData() async {
    // step 1 --> apiuri post request --> data
    setState(() {
      isLoad = true;
    });

    try {
      final Responce = await libhttp.post(Uri.parse(apiUrl),
          headers: {'Content-Type': 'Application/json'},
          body: jsonEncode({
            'id': int.tryParse(idController.text),
            'userId': int.tryParse(userIdController.text),
            'title': titleController.text,
          }));
      //step 2 --> responce check 201

      if (Responce.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Albume Create SuccessFully!")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Fail to create albume. please try again')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
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
        title: Text('Crate New Album'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: idController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text('id')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: userIdController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text('userId')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text('title')),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: PostData, child: Text('Submit')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancel')),
            ],
          ),
        ],
      ),
    );
  }
}
