import 'package:blogapi/Screen/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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
                      'Join With Us',
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
            'assets/Screen1Logo.gif',
            height: screenHeight * 0.3,
            width: screenWidth * 0.3,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            child: TextField(
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
                  hintText: 'Username',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 151, 186, 214),
                  ),
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 151, 186, 214)),
                  label: Text(
                    'Username',
                    style: TextStyle(color: Color.fromARGB(255, 2, 76, 136)),
                  )),
              cursorColor: Color.fromARGB(255, 2, 76, 136),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            child: TextField(
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
                  hintText: 'Enter Your Email or Phone',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 151, 186, 214),
                  ),
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 151, 186, 214)),
                  label: Text(
                    'Email or Phone',
                    style: TextStyle(color: Color.fromARGB(255, 2, 76, 136)),
                  )),
              cursorColor: Color.fromARGB(255, 2, 76, 136),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            child: TextField(
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
                    Icons.visibility,
                    color: Color.fromARGB(255, 151, 186, 214),
                  ),
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 151, 186, 214))),
              cursorColor: Color.fromARGB(255, 2, 76, 136),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'SignUp',
                style: TextStyle(color: Color.fromARGB(255, 3, 64, 114)),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[50])),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an Account',
              ),
              Text(' ?'),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 7, 82, 143),
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: Divider(
              color: const Color.fromARGB(255, 7, 82, 143),
              height: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'assets/google.png',
                height: 25,
                width: 25,
              ),
              style: ElevatedButton.styleFrom(
                  shape: ContinuousRectangleBorder(),
                  backgroundColor: Colors.blue.shade50),
              label: Text('Sign Up with Google'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'assets/facebook.png',
                height: 25,
                width: 25,
              ),
              style: ElevatedButton.styleFrom(
                  shape: ContinuousRectangleBorder(),
                  backgroundColor: Colors.blue.shade50),
              label: Text('Sign Up with Facebook'),
            ),
          ),
        ],
      )),
    );
  }
}
