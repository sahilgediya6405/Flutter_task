import 'package:flutter/material.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text("Pls...Wait..."),
          ),
        ],
      ),
    );
  }
}
