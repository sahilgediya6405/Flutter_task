import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tablewidget/Models/model_Student.dart';

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
          "CREATE TABLE student(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, mark INTEGER, city TEXT)");
      await db.execute(
          "INSERT INTO student(id, name, mark, city) VALUES(1, 'Rohit', 77, 'Surat'), (2, 'Sahil', 70, 'Ahemdabad'), (3, 'Rutu', 74, 'Mumbai')");
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
      BuildContext context, String name, int mark, String city) async {
    CurrentDB.transaction((txn) async {
      await txn.rawQuery('INSERT INTO student(name, mark, city) VALUES(?,?,?)',
          [name, mark, city]);
    });

    Fluttertoast.showToast(
      msg: "Student Details Saved",
      backgroundColor: Colors.blueGrey,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.black,
    );
  }

  //Delete Data

  Future<void> deleteData(int id) async {
    await CurrentDB.delete("student", where: 'id=?', whereArgs: [id]);

    Fluttertoast.showToast(
      msg: "Student Details Deleted",
      backgroundColor: Colors.blueGrey,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.black,
    );
  }

  // Update Data

  Future<void> dataUpdate(
      BuildContext context, int id, String name, int mark, String city) async {
    Map<String, dynamic> newValues = {'name': name, 'city': city, 'mark': mark};

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
        backgroundColor: Colors.blueGrey,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.black,
      );
    }
  }
}
