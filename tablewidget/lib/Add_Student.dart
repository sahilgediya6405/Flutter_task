import 'package:flutter/material.dart';
import 'package:CRUD/Models/db_utils.dart';

class Add_Student extends StatefulWidget {
  const Add_Student({super.key});

  @override
  State<Add_Student> createState() => _Add_StudentState();
}

class _Add_StudentState extends State<Add_Student> {
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController disController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Your Details',
          style: TextStyle(
              color: Color.fromARGB(255, 99, 67, 56),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 241, 203, 131),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 99, 67, 56))),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 99, 67, 56)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 99, 67, 56)),
                  ),
                  label: Text(
                    'Title',
                    style: TextStyle(color: Color.fromARGB(255, 99, 67, 56)),
                  ),
                ),
                cursorColor: Color.fromARGB(255, 99, 67, 56),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: disController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 99, 67, 56))),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 99, 67, 56)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 99, 67, 56)),
                  ),
                  label: Text(
                    'Discription',
                    style: TextStyle(color: Color.fromARGB(255, 99, 67, 56)),
                  ),
                ),
                maxLines: 5,
                cursorColor: Color.fromARGB(255, 99, 67, 56),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                      color: Color.fromARGB(255, 99, 67, 56),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 241, 203, 131))),
                ),
                ElevatedButton(
                    onPressed: () async {
                      final Atitle = titleController.text;
                      final Adiscription = disController.text;

                      print(Atitle);
                      print(Adiscription);

                      DbUtils dbUtils = await DbUtils.singlrTonClass();
                      dbUtils.addData(context, Atitle, Adiscription);

                      Navigator.pop(context, true);
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 99, 67, 56),
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 241, 203, 131)))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
