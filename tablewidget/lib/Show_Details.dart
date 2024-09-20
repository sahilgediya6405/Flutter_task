import 'package:flutter/material.dart';
import 'package:CRUD/Models/db_utils.dart';
import 'package:CRUD/Models/model_Student.dart';
import 'package:CRUD/Update_Student.dart';

class ShowDetails extends StatefulWidget {
  final Student showDetails;
  const ShowDetails({super.key, required this.showDetails});

  @override
  State<ShowDetails> createState() =>
      _ShowDetailsState(showDetails: showDetails);
}

class _ShowDetailsState extends State<ShowDetails> {
  final Student showDetails;

  _ShowDetailsState({required this.showDetails});

  @override
  Widget build(BuildContext context) {
    print('Show data clss ${showDetails.title}');
    print('show data class ${showDetails.discription}');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Details',
          style: TextStyle(
              color: const Color.fromARGB(255, 99, 67, 56),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 241, 203, 131),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 9,
              child: Column(
                children: [
                  Text(
                    showDetails.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: const Color.fromARGB(255, 99, 67, 56)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7, top: 15, bottom: 15, right: 7),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            showDetails.discription,
                            style: TextStyle(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 99, 67, 56)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            color: Color.fromARGB(255, 248, 225, 183),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpdateStudent(updatestudent: showDetails)));
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
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Color.fromARGB(255, 241, 203, 131),
                            title: Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ),
                            content: Text(
                              'You Want To Delete Data ?',
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color.fromARGB(255, 99, 67, 56),
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () async {
                                    DbUtils dbUtils =
                                        await DbUtils.singlrTonClass();
                                    dbUtils.deleteData(showDetails.id);

                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 99, 67, 56),
                                    ),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 99, 67, 56),
                                    ),
                                  ))
                            ],
                          );
                        });
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 99, 67, 56),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 241, 203, 131))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
