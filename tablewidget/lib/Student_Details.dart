import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:CRUD/Add_Student.dart';
import 'package:CRUD/Models/db_utils.dart';
import 'package:CRUD/Models/model_Student.dart';
import 'package:CRUD/Show_Details.dart';
import 'package:CRUD/Update_Student.dart';

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
          title: Text(
            'Your Details',
            style: TextStyle(
                color: Color.fromARGB(255, 99, 67, 56),
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 241, 203, 131),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => Add_Student()));
            if (result == true) {
              await loadStudent();
            }
          },
          child: Icon(
            Icons.person_add_alt_1,
            color: const Color.fromARGB(255, 99, 67, 56),
          ),
          backgroundColor: Color.fromARGB(255, 241, 203, 131),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Currentstudent.length > 0
                  ? Expanded(
                      child: RefreshIndicator(
                        backgroundColor: const Color.fromARGB(255, 99, 67, 56),
                        color: Color.fromARGB(255, 241, 203, 131),
                        displacement: 0,
                        edgeOffset: 0,
                        triggerMode: RefreshIndicatorTriggerMode.anywhere,
                        onRefresh: loadStudent,
                        child: ListView.builder(
                            itemCount: Currentstudent.length,
                            itemBuilder: (context, index) {
                              final Student = Currentstudent[index];
                              String firstLetter =
                                  Student.title[0].toUpperCase();
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ShowDetails(
                                              showDetails: Student)));
                                },
                                child: Card(
                                    color: Color.fromARGB(255, 241, 203, 131),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  child: Text(
                                                    firstLetter,
                                                    style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 99, 67, 56),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                Student.title,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(
                                                        255, 99, 67, 56),
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                          Row(children: [
                                            IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  241,
                                                                  203,
                                                                  131),
                                                          title: Text(
                                                            'Delete',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                          content: Text(
                                                            'You Want To Delete Data ?',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    99,
                                                                    67,
                                                                    56)),
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  DbUtils
                                                                      dbUtils =
                                                                      await DbUtils
                                                                          .singlrTonClass();
                                                                  dbUtils.deleteData(
                                                                      Student
                                                                          .id);

                                                                  Navigator.pop(
                                                                      context);
                                                                  loadStudent;
                                                                },
                                                                child: Text(
                                                                  'Yes',
                                                                  style:
                                                                      TextStyle(
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        99,
                                                                        67,
                                                                        56),
                                                                  ),
                                                                )),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  'No',
                                                                  style:
                                                                      TextStyle(
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        99,
                                                                        67,
                                                                        56),
                                                                  ),
                                                                ))
                                                          ],
                                                        );
                                                      });
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              UpdateStudent(
                                                                  updatestudent:
                                                                      Student)));
                                                },
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: const Color.fromARGB(
                                                      255, 99, 67, 56),
                                                ))
                                          ]),
                                        ])),
                              );
                            }),
                      ),
                    )
                  : Center(
                      child: Padding(
                      padding: const EdgeInsets.only(top: 250),
                      child: Image.asset('assets/nd.gif'),
                    ))
            ])));
  }
}

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
