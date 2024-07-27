import 'dart:convert';

import 'package:clothproductapi/Model/Product.dart';
import 'package:clothproductapi/widget/LoadingBar.dart';
import 'package:clothproductapi/widget/MyGrideview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as apihttp;

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: ClothApp(),
    ),
  ));
}

class ClothApp extends StatefulWidget {
  const ClothApp({super.key});

  @override
  State<ClothApp> createState() => _ClothAppState();
}

class _ClothAppState extends State<ClothApp> {
  late bool Loading;
  late List<Cloth> productList;
  @override
  void initState() {
    super.initState();
    Loading = false;
    productList = [];
    product();
  }

  void product() async {
    var responce = await apihttp
        .get(Uri.parse("https://api.escuelajs.co/api/v1/categories"));
    print(responce.statusCode);
    print(responce.body);

    if (responce.statusCode == 200) {
      List productDetails = json.decode(responce.body);
      productDetails.forEach((jason) {
        productList.add(Cloth(image: jason["image"], name: jason["name"]));
      });
      setState(() {
        Loading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Loading == true) {
      return Mygrideview(
        prodectData: productList,
      );
    } else {
      return CirculerBar();
    }
  }
}
