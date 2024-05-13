import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static const String _title = 'Ejemplo N.= 01';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyCount(),
    );
  }
}

class MyCount extends StatefulWidget {
  const MyCount({super.key});

  @override
  State<MyCount> createState() => _MyCountState();
}

class _MyCountState extends State<MyCount> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ejemplo N.-01',
          style: TextStyle(fontSize: 35.0, fontFamily: 'cursive'),
          //selectionColor: Color.fromARGB(9, 141, 10, 10),
        ),
        backgroundColor: const Color.fromARGB(255, 190, 26, 223),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 180.0,
            ),
            Text(
              'El numero es:  $_count',
              style: const TextStyle(
                  fontSize: 30.0, color: Color.fromARGB(255, 68, 18, 148)),
            ),
            const Image(
              image: AssetImage('images/lobo.jpg'),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 20.0,
          color: Colors.blueAccent,
        ),
      ),
      floatingActionButton: _crearButtoms(),
    );
  }

  Widget _crearButtoms() {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
          child: const Icon(Icons.restore),
          onPressed: () {
            _count = 0;
          },
          tooltip: 'Poner el contador en cero 0',
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          child: Icon(Icons.add), // podemos utilizar el background
          onPressed: () {
            _count++;
          },
          tooltip: 'Se incrementa el contador',
        ),
      ],
    );
  }
}
