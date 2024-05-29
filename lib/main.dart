import 'package:app1/pages/home_page.dart';
import 'package:app1/pages/not_found.dart';
import 'package:app1/pages/otra_page.dart';
import 'package:app1/src/app.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Login',
      initialRoute: "/",
      routes: {
        '/': (context) => const MyAppFrom(),
        '/homePage': (context) => const HomePage(),
        '/otra': (context) => const OtraPage(),
        // '/otra': (context) => const NotFound(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFound());
      },
    );
  }
}
