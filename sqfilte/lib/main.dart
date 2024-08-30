import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MainApp());
}

late Database database;

Future<Database> createDataBase() async {
  return openDatabase("car_dabase.db",
      version: 1,
      onCreate: (db, version) => db.execute(
          'CREATE TABLE cars(id INTEGER PRIMARY KEY,color TEXT,owner TEXT, numberplat TEXT)'));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () async {
                  final db = await createDataBase();
                  await db.execute(
                    "INSERT INTO cars (id, color, owner, numberplat) VALUES (1, 'red', 'owner1', 'GJ01FW1234')",
                  );
                  print("Ensert One Recod");
                },
                child: Text("Plase press me"))),
      ),
    );
  }
}
