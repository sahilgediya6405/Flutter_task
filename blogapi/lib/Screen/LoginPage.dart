import 'dart:convert';
import 'package:blogapi/Screen/Homepage.dart';
import 'package:blogapi/Screen/Signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as https;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  String? token;
  Future<void> loginApp() async {
    try {
      var responce =
          await https.post(Uri.parse('https://dummyjson.com/auth/login'),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'username': userNameController.text,
                'password': passwordController.text,
                'expiresInMins': 1,
              }));
      if (responce.statusCode == 200) {
        var responceData = jsonDecode(responce.body);

        setState(() {
          token = responceData['token'];
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Signup Sucessfully!")));

        print("Token: ${token}");

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Homepage(
                      blogdata: [],
                    )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Pls velid username and password")));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 50),
              child: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wel-Come',
                        style: GoogleFonts.dancingScript(
                            fontSize: 40,
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 2, 76, 136))),
                      ),
                      Text(
                        'Create your blogs...',
                        style: GoogleFonts.dancingScript(
                            fontSize: 20,
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 12, 136, 238))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/Login.gif',
              height: screenHeight * 0.4,
              width: screenWidth * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: userNameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 2, 76, 136))),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 2, 76, 136)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 2, 76, 136)),
                    ),
                    hintText: 'Enter Your Email or Username',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 151, 186, 214),
                    ),
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 151, 186, 214)),
                    label: Text(
                      'Email or Username',
                      style: TextStyle(color: Color.fromARGB(255, 2, 76, 136)),
                    )),
                cursorColor: Color.fromARGB(255, 2, 76, 136),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 2, 76, 136))),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 2, 76, 136)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 2, 76, 136)),
                    ),
                    label: Text(
                      'Password',
                      style: TextStyle(color: Color.fromARGB(255, 2, 76, 136)),
                    ),
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 151, 186, 214),
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: Color.fromARGB(255, 151, 186, 214),
                    ),
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 151, 186, 214))),
                cursorColor: Color.fromARGB(255, 2, 76, 136),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: loginApp,
                child: Text(
                  'Login',
                  style: TextStyle(color: Color.fromARGB(255, 3, 64, 114)),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[50])),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signin()));
                    },
                    child: Text(
                      'Create a new Account',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 7, 82, 143)),
                    )),
                Text('or'),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 7, 82, 143)),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
