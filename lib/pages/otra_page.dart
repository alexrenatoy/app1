import 'package:flutter/material.dart';

class OtraPage extends StatefulWidget {
  const OtraPage({super.key});

  @override
  State<OtraPage> createState() => _OtraPageState();
}

class _OtraPageState extends State<OtraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Otra Page"),
      ),
      body: const Center(
        child: Text("Estás en otra page"),
      ),
    );
  }
}
