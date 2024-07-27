import 'package:flutter/material.dart';

class CirculerBar extends StatelessWidget {
  const CirculerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text("Loading..."),
        )
      ],
    ));
  }
}
