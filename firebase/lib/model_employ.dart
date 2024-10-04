class Employ {
  String id;
  String name;
  String designation;
  int salary;

  Employ(
      {required this.id,
      required this.name,
      required this.designation,
      required this.salary});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'salary': salary,
    };
  }

  factory Employ.fromMAp(Map<String, dynamic> Map) {
    return Employ(
        id: Map['id'],
        name: Map['name'],
        designation: Map['designation'],
        salary: Map['salary']);
  }
}
