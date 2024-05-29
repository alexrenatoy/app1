import 'package:flutter/material.dart';

class NotFound extends StatefulWidget {
  const NotFound({super.key});

  @override
  State<NotFound> createState() => _NotFoundState();
}

class _NotFoundState extends State<NotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page no encontrada"),
      ),
      body: const Center(
        child: Text("Pa´ fuera mi loco"),
      ),
    );
  }
}
