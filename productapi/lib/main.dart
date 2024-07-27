import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productapi/Wiget/Loading.dart';
import 'package:productapi/Wiget/MyGrideView.dart';
import 'package:http/http.dart' as phttps;
import 'package:productapi/model/modelclass.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Ecommers(),
    ),
  ));
}

class Ecommers extends StatefulWidget {
  const Ecommers({super.key});

  @override
  State<Ecommers> createState() => _EcommersState();
}

class _EcommersState extends State<Ecommers> {
  late bool Loadding;
  late List<Prodect> ProductDataList;
  @override
  void initState() {
    super.initState();
    ProductDataList = [];
    Loadding = false;
    product();
  }

  void product() async {
    var responce =
        await phttps.get(Uri.parse("https://fakestoreapi.com/products"));
    print('responce status : ${responce.statusCode}');
    print('responce body: ${responce.body}');
    if (responce.statusCode == 200) {
      List dataList = json.decode(responce.body);

      dataList.forEach((productDetails) {
        ProductDataList.add(Prodect(
            title: productDetails["title"],
            image: productDetails["image"],
            price: productDetails["price"]));
      });

      setState(() {
        Loadding = true;
      });
    }
  }

  //
  Widget build(BuildContext context) {
    if (Loadding == true) {
      return MyGrideView(dataList: ProductDataList);
    } else {
      return LoadingBar();
    }
  }
}
