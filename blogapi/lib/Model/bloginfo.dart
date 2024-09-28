import 'package:flutter/material.dart';

class Bloginfo {
  final String title;
  final String content;
  final String createdAt;
  final String publishedAt;
  final String slug;
  final String image;
  final int hit;

  Bloginfo(
      {required this.title,
      required this.content,
      required this.createdAt,
      required this.publishedAt,
      required this.slug,
      required this.image,
      required this.hit});

  factory Bloginfo.fromjson(Map<String, dynamic> json) {
    String imageUrl;
    if (json['image'] != null && json['image'].isNotEmpty) {
      imageUrl = json['image'][0]['url'];
    } else {
      imageUrl =
          'https://media.istockphoto.com/id/1674415520/photo/3d-rendering-of-stacks-of-100-us-dollar-notes-bundles-of-united-states-currency-notes.jpg?s=1024x1024&w=is&k=20&c=IXv_2rwS0XhH_Q-yWH6traOBeYT9pMJHnT1P0ogcz_U=';
    }

    return Bloginfo(
        title: json['title'] ?? '',
        content: json['content'] ?? '',
        createdAt: json['createdAt'] ?? '',
        publishedAt: json['publishedAt'] ?? '',
        slug: json['slug'] ?? '',
        image: imageUrl,
        hit: json['hit'] ?? 0);
  }

  where(Function(dynamic post) param0) {}
}
