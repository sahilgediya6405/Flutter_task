// Create student model

class Student {
  int id;
  String title;
  String discription;

  Student({
    required this.id,
    required this.title,
    required this.discription,
  });

  factory Student.FromMap(Map<String, dynamic> map) {
    return Student(
        id: map["id"], title: map["title"], discription: map["discription"]);
  }
}
