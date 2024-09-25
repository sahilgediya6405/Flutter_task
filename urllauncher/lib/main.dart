import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Url_Luuncher());
}

class Url_Luuncher extends StatefulWidget {
  const Url_Luuncher({super.key});

  @override
  State<Url_Luuncher> createState() => _Url_LuuncherState();
}

class _Url_LuuncherState extends State<Url_Luuncher> {
  void dielPed() async {
    final Uri launcher = Uri(scheme: 'tel', path: '+91 8469621125');
    await launchUrl(launcher);
  }

  void webApp() async {
    final Uri launcher = Uri(scheme: 'https', path: 'www.facebook.com');
    await launchUrl(launcher);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(onPressed: dielPed, child: Text('+91 8469621125')),
          TextButton(onPressed: webApp, child: Text('Facebook.com')),
        ],
      )),
    ));
  }
}
