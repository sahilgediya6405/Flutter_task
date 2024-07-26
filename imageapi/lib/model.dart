class PhotoData {
  final String title;
  final String thumbnailUrl;

  PhotoData({required this.title, required this.thumbnailUrl});

  factory PhotoData.fromJson(json) {
    return PhotoData(
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
