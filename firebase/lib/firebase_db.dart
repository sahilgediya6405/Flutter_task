import 'package:firebase/model_employ.dart';
import 'package:firebase_database/firebase_database.dart';

//firebase realtime connection
class FirebaseDb {
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child("Employ");

// save to remote firebase db
  void addEmploys(Employ e) async {
    String? key = databaseReference.push().key;
    if (key != null) {
      e.id = key; // assign key to employee's ID // like - 3q3fe4e43f
      await databaseReference.child(key).set(e.toMap());
    }

    databaseReference.push().set(e.toMap());
  }

  Stream<DatabaseEvent> getAllVAlue() {
    return databaseReference.onValue;
  }

  void deleteData(String id) async {
    await databaseReference.child(id).remove();
  }
}
