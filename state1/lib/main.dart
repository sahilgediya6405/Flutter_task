import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String TEXT;

  @override
  void initState() {
    super.initState();
    TEXT = "";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          children: [
            Container(
                height: 100, width: 100, color: Colors.grey, child: Text(TEXT)),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    TEXT = " Hellow Word ";
                  });
                },
                child: Text("Hello Word")),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    TEXT = "Ok Word";
                  });
                },
                child: Text("Ok Word")),
          ],
        ),
      )),
    );
  }
}
