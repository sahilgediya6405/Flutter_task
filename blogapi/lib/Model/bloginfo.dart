class Bloginfo {
  final String title;
  final String content;

  Bloginfo({required this.title, required this.content});

  factory Bloginfo.fromjson(Map<String, dynamic> json) {
    return Bloginfo(title: json['Title'], content: json['content']);
  }
}
