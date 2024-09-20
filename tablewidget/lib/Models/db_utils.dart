import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:CRUD/Models/model_Student.dart';

// create  Singleton class
class DbUtils {
  static final DbUtils database = DbUtils._privatevariable();
  static Future<DbUtils> singlrTonClass() async {
    await initDb();
    return database;
  }

  DbUtils._privatevariable();
  static late Database CurrentDB;

// Create databases

  static Future<void> initDb() async {
    CurrentDB = await openDatabase("mydb.db", version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE student(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT,discription TEXT)");
      await db.execute(
          "INSERT INTO student(id,title,discription) VALUES(1, 'Rohit', 'Good IN Learning')");
    });
  }

// getdata from database and  sort by mark

  // Future<List<Student>> getdata({bool low = true}) async {
  //   String quary;
  //   if (low == true) {
  //     quary = ("SELECT * FROM student ORDER BY mark  ASC");
  //   } else {
  //     quary = ("SELECT * FROM student ORDER BY mark DESC");
  //   }

// Read Data
  Future<List<Student>> getdata({bool low = true}) async {
    List<Map<String, dynamic>> studentMapList =
        await CurrentDB.rawQuery('SELECT * FROM student');

    List<Student> listStudent = List.generate(studentMapList.length, (i) {
      return Student.FromMap(studentMapList[i]);
    });
    return listStudent;
  }
// Add Data

  Future<void> addData(
      BuildContext context, String title, String discription) async {
    CurrentDB.transaction((txn) async {
      await txn.rawQuery('INSERT INTO student(title,discription) VALUES(?,?)',
          [title, discription]);
    });

    Fluttertoast.showToast(
      msg: "Student Details Saved",
      backgroundColor: Color.fromARGB(255, 241, 203, 131),
      gravity: ToastGravity.BOTTOM,
      textColor: const Color.fromARGB(255, 99, 67, 56),
    );
  }

  //Delete Data

  Future<void> deleteData(int id) async {
    await CurrentDB.delete("student", where: 'id=?', whereArgs: [id]);

    Fluttertoast.showToast(
      msg: "Student Details Deleted",
      backgroundColor: Color.fromARGB(255, 241, 203, 131),
      gravity: ToastGravity.BOTTOM,
      textColor: const Color.fromARGB(255, 99, 67, 56),
    );
  }

  // Update Data

  Future<void> dataUpdate(
      BuildContext context, int id, String title, String discription) async {
    Map<String, dynamic> newValues = {
      'id': id,
      'title': title,
      'discription': discription
    };

    int result = await CurrentDB.update('student', newValues,
        where: 'id=?', whereArgs: [id]);

    if (result == 0) {
      Fluttertoast.showToast(
        msg: "Update Failed",
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Student Details Updated",
        backgroundColor: Color.fromARGB(255, 241, 203, 131),
        gravity: ToastGravity.BOTTOM,
        textColor: const Color.fromARGB(255, 99, 67, 56),
      );
    }
  }
}
