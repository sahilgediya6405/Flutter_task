import 'package:flutter/material.dart';
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
  @override
  void initState() {}
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
                  ElevatedButton(
                    onPressed: () async {
                      DbUtils dbUtils = await DbUtils.singlrTonClass();
                      List<Student> l = await dbUtils.getdata(low: false);
                      setState(() {
                        Currentstudent = l;
                      });
                    },
                    child: Text("Lowest Mark"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[100])),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        DbUtils dbUtils = await DbUtils.singlrTonClass();
                        List<Student> l = await dbUtils.getdata();
                        setState(() {
                          Currentstudent = l;
                        });
                      },
                      child: Text("Highest Mark"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[100]))),
                ],
              ),
              Currentstudent.length > 0
                  ? SingleChildScrollView(
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
                                          builder: (context) => UpdateStudent(
                                              updatestudent: student)));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ))),
                            DataCell(IconButton(
                                onPressed: () async {
                                  DbUtils dbUtils =
                                      await DbUtils.singlrTonClass();
                                  dbUtils.deleteData(student.id);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))),
                          ]);
                        }).toList(),
                      ),
                    )
                  : Center(
                      child: Card(
                        color: Colors.blue[100],
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text("Press Any Button TO Show Data"),
                        ),
                      ),
                    )
            ],
          ),
        ));
  }
}
