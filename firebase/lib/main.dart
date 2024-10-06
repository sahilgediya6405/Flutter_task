import 'package:firebase/Auth_chek.dart';
import 'package:firebase/Login.dart';

import 'package:firebase/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  //step 1 --> firebase connection
  WidgetsFlutterBinding.ensureInitialized(); // load firebase library
  await Firebase.initializeApp(
      options:
          DefaultFirebaseOptions.currentPlatform); // conection with firebase
  runApp(MaterialApp(
    home: AuthChek(),
  ));
}
