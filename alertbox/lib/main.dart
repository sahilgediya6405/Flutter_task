import 'package:alertbox/imageslider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(body: MainApp()),
  ));
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(body: MyApp()),
//   ));
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Alert Dialog'),
                      content: Text('this is basic dialog in flutter'),
                      actions: [
                        TextButton(
                            onPressed: Navigator.of(context).pop,
                            child: Text("Ok"))
                      ],
                    );
                  });
            },
            child: Text("Press me")));
  }
}
