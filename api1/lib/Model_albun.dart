class ModelAlbum {
  final int userId;
  final int id;
  final String title;

  ModelAlbum({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory ModelAlbum.fomJsonObject(Map<String, dynamic> json) {
    return ModelAlbum(
        userId: json['userId'], id: json['id'], title: json['title']);
  }
}
