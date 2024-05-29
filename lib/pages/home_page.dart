import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina Principal"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // MaterialPageRoute route =
            //     MaterialPageRoute(builder: (context) => const OtraPage());
            // Navigator.push(context, route);
            Navigator.pushNamed(context, "/otra");
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 176, 51, 51)), // Color del botón
            foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white), // Color del texto
          ),
          child: const Text('Navegar'),
        ),
      ),
    );
  }
}
