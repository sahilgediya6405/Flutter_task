import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:blogapi/Screen/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class Speshscreen extends StatelessWidget {
  const Speshscreen({super.key});

  @override
  Widget build(BuildContext context) {
//fadeIN SplashScreen

    // return FlutterSplashScreen.fadeIn(
    //   childWidget: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         ImageNetwork(
    //             image: "assets/image/MyLogo.png", height: 150, width: 150),
    //         Padding(
    //           padding: const EdgeInsets.all(10),
    //           child: Text(
    //             'Spesh Screen',
    //             style: TextStyle(
    //                 color: Colors.black,
    //                 fontSize: 15,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   animationDuration: Duration(seconds: 15),
    //   duration: Duration(seconds: 20),
    //   backgroundColor: Colors.white,
    //   nextScreen: Screen1(),
    // );

//Gif SplashScreen

    return FlutterSplashScreen.gif(
      //useImmersiveMode: true,
      gifPath: 'assets/Splesh.gif',
      gifHeight: 150,
      gifWidth: 150,
      nextScreen: Login(),
      backgroundColor: Colors.white,
      duration: Duration(seconds: 15),
    );

//Scale splashScreen

    // return FlutterSplashScreen.scale(
    //   gradient: const LinearGradient(
    //     begin: Alignment.topCenter,
    //     end: Alignment.bottomCenter,
    //     colors: [
    //       Colors.white,
    //       Colors.white,
    //     ],
    //   ),
    //   childWidget: ImageNetwork(
    //       image: "assets/image/GLogo.gif", height: 200, width: 500),
    //   duration: const Duration(milliseconds: 20000),
    //   animationDuration: const Duration(milliseconds: 15000),
    //   onAnimationEnd: () => debugPrint("On Scale End"),
    //   nextScreen: Screen1(),
    // );
  }
}
