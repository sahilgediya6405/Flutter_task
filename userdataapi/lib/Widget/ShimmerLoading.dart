import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmerloading extends StatelessWidget {
  const Shimmerloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: ListView(),
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white);
  }
}
