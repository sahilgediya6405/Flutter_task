import 'package:flutter/material.dart';
import 'package:navigationdrower/File.dart';
import 'package:navigationdrower/Setting.dart';
import 'package:navigationdrower/home.dart';
import 'package:navigationdrower/share.dart';

void main() {
  runApp(MyDrawer());
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDrawerApp(),
    );
  }
}

class MyDrawerApp extends StatefulWidget {
  @override
  State<MyDrawerApp> createState() => _MyDrawerAppState();
}

class _MyDrawerAppState extends State<MyDrawerApp> {
  late int drawerindex;
  void initState() {
    drawerindex = 0;
  }

  Widget? CurrentWidget() {
    switch (drawerindex) {
      case 0:
        return My_Home();
      case 1:
        return My_Share();
      case 2:
        return My_File();
      case 3:
        return My_setting();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      body: CurrentWidget(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("User123"),
              accountEmail: Text("user123@gmail.com"),
              currentAccountPicture: CircleAvatar(child: Text("U")),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  drawerindex = 0;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
              selectedColor: Colors.blue,
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  drawerindex = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text("My File"),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  drawerindex = 2;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings & Account"),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  drawerindex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
