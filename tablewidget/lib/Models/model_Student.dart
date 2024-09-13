// Create student model

class Student {
  int id;
  String name;
  int mark;
  String city;

  Student(
      {required this.id,
      required this.name,
      required this.city,
      required this.mark});

  factory Student.FromMap(Map<String, dynamic> map) {
    return Student(
        id: map['id'], name: map['name'], city: map['city'], mark: map['mark']);
  }
}
