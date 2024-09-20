import 'package:bottomnavogationbar/widget_card.dart';
import 'package:bottomnavogationbar/widget_profile.dart';
import 'package:bottomnavogationbar/wiget_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late int currentIndex;

  void initState() {
    // super.initState();
    currentIndex = 0;
  }

  Widget? GetCurentWidget() {
    switch (this.currentIndex) {
      case 0:
        return MyWidget_home();

      case 1:
        return MyWidget_card();

      case 2:
        return MyWidget_profile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.yellow,
            currentIndex: this.currentIndex,
            onTap: (newindex) {
              setState(() {
                this.currentIndex = newindex;
              });
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.blueGrey,
                  label: "Home",
                  icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  backgroundColor: Colors.blueGrey,
                  label: "Card",
                  icon: Icon(Icons.shopping_cart_outlined)),
              BottomNavigationBarItem(
                  backgroundColor: Colors.blueGrey,
                  label: "profile",
                  icon: Icon(Icons.supervised_user_circle_outlined))
            ]),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  //controller: markController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Birth Of Date'),
                  ),
                ))),
      ),
    );
  }
}
