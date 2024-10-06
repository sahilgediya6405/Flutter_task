import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  String? errorMessage;
  bool isLogin = true;

  Widget getLogin() {
    return Column(
      children: [
        Text("This is Login Widget, Login to continue...."),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Enter Your Email"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Enter your Password"),
            ),
          ),
        ),
        if (errorMessage != null)
          Text(
            errorMessage!,
            style: TextStyle(color: Colors.red),
          ),
        Row(children: [
          ElevatedButton(
              onPressed: () async {
                try {
                  await auth.signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                } catch (e) {
                  setState(() {
                    errorMessage = e.toString();
                  });
                }
              },
              child: Text("Login")),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isLogin = false;
                });
              },
              child: Text("SignUp")),
        ])
      ],
    );
  }

  Widget getSignup() {
    return Column(
      children: [
        Text("This is SignUp Widget, SignUp to continue...."),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Enter Your new Email"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Enter your new Password"),
            ),
          ),
        ),
        if (errorMessage != null)
          Text(
            errorMessage!,
            style: TextStyle(color: Colors.red),
          ),
        Row(children: [
          ElevatedButton(
              onPressed: () async {
                try {
                  await auth.createUserWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                } catch (e) {
                  setState(() {
                    errorMessage = e.toString();
                  });
                }
              },
              child: Text("Create account")),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isLogin = true;
                });
              },
              child: Text("Go to Login Widget")),
        ])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: isLogin ? getLogin() : getSignup(),
    ));
  }
}
