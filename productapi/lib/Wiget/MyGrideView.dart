import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class MyGrideView extends StatelessWidget {
  List dataList = [];
  MyGrideView({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: dataList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ImageNetwork(
                      image: dataList[index].image, height: 150, width: 150),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(dataList[index].price.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(dataList[index].title),
                )
              ],
            ),
          );
        });
  }
}
