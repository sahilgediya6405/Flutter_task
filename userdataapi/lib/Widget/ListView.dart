import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class MyListView extends StatelessWidget {
  List userData = [];
  MyListView({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userData.length,
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageNetwork(
                  image: userData[index].avatar, height: 100, width: 100),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      userData[index].name,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(userData[index].role,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text(userData[index].email,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(Icons.arrow_forward_ios_outlined),
              )
            ],
          ),
        );
      },
    );
  }
}
