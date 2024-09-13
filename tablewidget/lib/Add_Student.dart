import 'package:flutter/material.dart';
import 'package:tablewidget/Models/db_utils.dart';

class Add_Student extends StatefulWidget {
  const Add_Student({super.key});

  @override
  State<Add_Student> createState() => _Add_StudentState();
}

class _Add_StudentState extends State<Add_Student> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController markController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student Details'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Student Name'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
                controller: cityController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Student City'),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: markController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Student Mark'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[200])),
              ),
              ElevatedButton(
                onPressed: () async {
                  DbUtils dbUtils = await DbUtils.singlrTonClass();
                  dbUtils.addData(context, nameController.text,
                      int.parse(markController.text), cityController.text);
                },
                child: Text("Save"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[200])),
              )
            ],
          )
        ],
      ),
    );
  }
}
