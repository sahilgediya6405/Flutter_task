import 'package:flutter/material.dart';
import 'package:CRUD/Models/db_utils.dart';
import 'package:CRUD/Models/model_Student.dart';

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

  late TextEditingController UtitleController;
  late TextEditingController UdisController;

  @override
  void initState() {
    super.initState();
    UtitleController = TextEditingController(text: this.updatestudent.title);
    UdisController =
        TextEditingController(text: this.updatestudent.discription);

    print('update controller feom add data${this.UtitleController}');
    print(' update controller from add data ${this.UdisController}');
  }

  @override
  Widget build(BuildContext context) {
    print('update class near build ${UtitleController}');
    print('update class  near build ${UdisController}');

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Your Details',
            style: TextStyle(
                color: const Color.fromARGB(255, 99, 67, 56),
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 241, 203, 131),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Update Details ${this.updatestudent.id}',
                style: TextStyle(
                    fontSize: 25, color: const Color.fromARGB(255, 99, 67, 56)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: UtitleController,
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
                ),
                cursorColor: Color.fromARGB(255, 99, 67, 56),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: UdisController,
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
                ),
                cursorColor: Color.fromARGB(255, 99, 67, 56),
                maxLines: 5,
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
                    'Back',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 99, 67, 56),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 241, 203, 131))),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final utitle = UtitleController.text;
                    final udiscription = UdisController.text;

                    DbUtils dbUtils = await DbUtils.singlrTonClass();

                    dbUtils.dataUpdate(
                        context, updatestudent.id, utitle, udiscription);
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 99, 67, 56),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 241, 203, 131))),
                )
              ],
            )
          ],
        ));
  }
}
