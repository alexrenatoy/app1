import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Calculadora';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 191, 230, 255)
                      .withOpacity(0.5), 
                  spreadRadius: 7, 
                  blurRadius: 5, 
                  offset: const Offset(2, 4),
                )
              ],
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: const Color.fromARGB(255, 174, 174, 174), width: 4.0),
            ),
            padding: const EdgeInsets.all(16.0), 
            child: FractionallySizedBox(
              widthFactor: 0.3,
              heightFactor: 0.7,
              child: Calculator(),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notificaciones',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _displayText = '';
  String _result = '';

  void _handleButtonClick(String value) {
    setState(() {
      if (value == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(_displayText);
          ContextModel cm = ContextModel();
          _result = exp.evaluate(EvaluationType.REAL, cm).toString();
          _displayText = _result;
          print('resultado:' + _result);
        } catch (e) {
          _result = 'Error';
        }
      } else if (value == 'C') {
        _displayText = '';
        _result = '';
      } else {
        _displayText += value;
        _result = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            // color: Color.fromARGB(255, 205, 205, 205),
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(15.0),

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromARGB(255, 186, 190, 198),
                border: const Border(
                  bottom: BorderSide(
                      color:  Color.fromARGB(255, 116, 116, 116), width: 1.0),
                )),
            child: Text(
              _displayText.isEmpty ? _result : _displayText,
              style: TextStyle(fontSize: 45.0), //tamaño de texto
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              _buildButton('C'),
              _buildButton('0'),
              _buildButton('='),
              _buildButton('+'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String label) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          _handleButtonClick(label);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 51, 120, 176)), // Color del botón
          foregroundColor:
              MaterialStateProperty.all<Color>(Colors.white), // Color del texto
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 40.0), // tamaño de texto boton
        ),
      ),
    );
  }
}