import 'package:flutter/material.dart';
import 'package:tablewidget/Models/db_utils.dart';
import 'package:tablewidget/Models/model_Student.dart';

class UpdateStudent extends StatefulWidget {
  final Student updatestudent;

  UpdateStudent({required this.updatestudent});

  @override
  State<UpdateStudent> createState() =>
      _UpdateStudentState(updatestudent: this.updatestudent);
}

class _UpdateStudentState extends State<UpdateStudent> {
  final Student updatestudent;

  _UpdateStudentState({required this.updatestudent});

  late TextEditingController nameController;
  late TextEditingController cityController;
  late TextEditingController markController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: this.updatestudent.name);
    cityController = TextEditingController(text: this.updatestudent.city);
    markController =
        TextEditingController(text: this.updatestudent.mark.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Student Details '),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Update Student ${this.updatestudent.id}',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: cityController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: markController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
                    child: Text('Back')),
                ElevatedButton(
                    onPressed: () async {
                      DbUtils dbUtils = await DbUtils.singlrTonClass();
                      dbUtils.dataUpdate(
                          context,
                          updatestudent.id,
                          updatestudent.name,
                          updatestudent.mark,
                          updatestudent.city);
                    },
                    child: Text('Update'))
              ],
            )
          ],
        ));
  }
}
