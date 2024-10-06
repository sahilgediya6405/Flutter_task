import 'package:firebase/Home.dart';
import 'package:firebase/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthChek extends StatefulWidget {
  const AuthChek({super.key});

  @override
  State<AuthChek> createState() => _AuthChekState();
}

class _AuthChekState extends State<AuthChek> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyWidget();
          } else {
            return Authentication();
          }
        });
  }
}
