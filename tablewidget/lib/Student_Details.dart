import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tablewidget/Add_Student.dart';
import 'package:tablewidget/Models/db_utils.dart';
import 'package:tablewidget/Models/model_Student.dart';
import 'package:tablewidget/Update_Student.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  List<Student> Currentstudent = [];
  List<Student> l = [];
  @override
  void initState() {
    super.initState();

    loadStudent();
  }

  Future<void> loadStudent() async {
    DbUtils dbUtils = await DbUtils.singlrTonClass();
    List<Student> students = await dbUtils.getdata();
    setState(() {
      Currentstudent = students;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Student Details'),
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Add_Student()));
          },
          child: Icon(
            Icons.person_add_alt_1,
            color: Colors.blue,
          ),
          backgroundColor: Colors.blueGrey[100],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     DbUtils dbUtils = await DbUtils.singlrTonClass();
                  //     List<Student> l = await dbUtils.getdata(low: false);
                  //     setState(() {
                  //       Currentstudent = l;
                  //     });
                  //   },
                  //   child: Text(
                  //     "Lowest Mark",
                  //     style: TextStyle(
                  //         color: const Color.fromARGB(255, 2, 137, 248)),
                  //   ),
                  //   style: ButtonStyle(
                  //       backgroundColor:
                  //           MaterialStateProperty.all(Colors.blue[50])),
                  // ),
                  // ElevatedButton(
                  //     onPressed: () async {
                  //       DbUtils dbUtils = await DbUtils.singlrTonClass();
                  //       List<Student> l = await dbUtils.getdata();
                  //       setState(() {
                  //         Currentstudent = l;
                  //       });
                  //     },
                  //     child: Text(
                  //       "Highest data",
                  //       style: TextStyle(
                  //           color: const Color.fromARGB(255, 2, 138, 250)),
                  //     ),
                  //     style: ButtonStyle(
                  //         backgroundColor:
                  //             MaterialStateProperty.all(Colors.blue[50]))),
                ],
              ),
              // Currentstudent.length > 0 ?
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('City')),
                    DataColumn(label: Text('Marks')),
                    DataColumn(label: Text('Edit')),
                    DataColumn(label: Text('Delete')),
                  ],
                  rows: Currentstudent.map((student) {
                    return DataRow(cells: [
                      DataCell(Text(student.name)),
                      DataCell(Text(student.city)),
                      DataCell(Text(student.mark.toString())),
                      DataCell(IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateStudent(updatestudent: student)));
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ))),
                      DataCell(IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    content: Text(
                                      'You Want To Delete Data ?',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            DbUtils dbUtils =
                                                await DbUtils.singlrTonClass();
                                            dbUtils.deleteData(student.id);

                                            Navigator.pop(context);
                                            loadStudent;
                                          },
                                          child: Text(
                                            'Yes',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'No',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))),
                    ]);
                  }).toList(),
                ),
              )
              // : Center(
              //     child: Padding(
              //       padding: const EdgeInsets.all(20),
              //       child: Card(
              //         color: Colors.blue[100],
              //         child: Padding(
              //           padding: const EdgeInsets.all(15),
              //           child: Text("Emty! Pls Add Student Details"),
              //         ),
              //       ),
              //     ),
              //   )
            ],
          ),
        ));
  }
}
