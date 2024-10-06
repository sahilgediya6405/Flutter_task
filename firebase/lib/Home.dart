import 'package:firebase/firebase_db.dart';
import 'package:firebase/firebase_options.dart';
import 'package:firebase/model_employ.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final FirebaseDb firebaseDb = FirebaseDb();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController designaationController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: designaationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Designation"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: salaryController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("salary"),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Employ employee = Employ(
                    id: firebaseDb.databaseReference.push().key!,
                    name: nameController.text,
                    designation: designaationController.text,
                    salary: int.parse(salaryController.text));

                firebaseDb.addEmploys(employee);
                nameController.clear();
                designaationController.clear();
                salaryController.clear();
              },
              child: Text("Submit")),
          Expanded(
              child: StreamBuilder(
                  stream: firebaseDb.getAllVAlue(),
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      Map<dynamic, dynamic> employees = snapshot
                          .data!.snapshot.value as Map<dynamic, dynamic>;
                      List<Employ> employList = employees.entries.map((entry) {
                        return Employ.fromMAp({
                          'id': entry.key,
                          ...entry.value,
                        });
                      }).toList();

                      return ListView.builder(
                        itemCount: employList.length,
                        itemBuilder: (context, index) {
                          Employ employ = employList[index];
                          return ListTile(
                            title: Text(employ.name),
                            subtitle: Text(
                                '${employ.designation},\$${employ.salary}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {
                                      firebaseDb.deleteData(employ.id);
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
