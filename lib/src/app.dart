import 'package:flutter/material.dart';

class MyAppFrom extends StatefulWidget {
  const MyAppFrom({super.key});

  @override
  State<MyAppFrom> createState() => _MyAppFromState();
}

class _MyAppFromState extends State<MyAppFrom> {
  late String? _id;
  late String _nombre;
  late String? _apellidos;
  late String? _email;
  late String? _edad;
  late String _genero = 'Masculino';
  late String _estadoCivil = 'Soltero';
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 82, 152, 196),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 90.0,
          horizontal: 30.0,
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100.0,
                backgroundColor: Color.fromRGBO(91, 169, 243, 0.941),
                backgroundImage: AssetImage("images/lobo.jpg"),
              ),
              const Text("Quien se junto con lobos,",
                  style: TextStyle(
                      fontSize: 50.0, fontFamily: "RedditSansCondensed")),
              const Text("Aullar aprende",
                  style: TextStyle(
                      fontSize: 25.0, fontFamily: "RedditSansCondensed")),
              TextField(
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    hintText: "Ingresa Tu nombre",
                    labelText: "Nombres",
                    suffixIcon: Icon(Icons.verified_user),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _nombre = valor;
                  print("El nombre es: $_nombre");
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    hintText: "Ingresa tus Apellidos",
                    labelText: "Apellidos",
                    suffixIcon: Icon(Icons.verified_user),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _apellidos = valor;
                  print("El nombre es: $_apellidos");
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    hintText: "Ingresa número de cédula",
                    labelText: "Número de Cédula",
                    suffixIcon: Icon(Icons.perm_identity),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _id = valor;
                  print("El nombre es: $_id");
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    hintText: "Ingresa tu correo",
                    labelText: "Email",
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _email = valor;
                  print("El email es: $_email");
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                enableInteractiveSelection: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "IIngresa tu Edad",
                    labelText: "Edad",
                    suffixIcon: Icon(Icons.cake),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _edad = valor;
                  print("El email es: $_edad");
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _dateController,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  hintText: "Ingresa tu Fecha de Nacimiento",
                  labelText: "Fecha de Nacimiento",
                  suffixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      _dateController.text =
                          "${picked.toLocal()}".split(' ')[0];
                    });
                  }
                },
              ),
              SizedBox(height: 20.0),
              Text('Género',          
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, ),
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Masculino',
                    groupValue: _genero,
                    onChanged: (String? value) {
                      setState(() {
                        _genero = value!;
                      });
                    },
                  ),
                  Text('Masculino'),
                  Radio<String>(
                    value: 'Femenino',
                    groupValue: _genero,
                    onChanged: (String? value) {
                      setState(() {
                        _genero = value!;
                      });
                    },
                  ),
                  Text('Femenino'),                 
                ],
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: _estadoCivil,
                decoration: InputDecoration(
                  hintText: "Selecciona tu Estado Civil",
                  labelText: "Estado Civil",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                items: <String>['Soltero', 'Casado', 'Divorciado', 'Viudo']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _estadoCivil = newValue!;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/homePage");
                  print("El email es: $_nombre");
                  print("El email es: $_email");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 61, 120, 168)), // Color del botón
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  // padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(20, 10, 20, 10))
                ),
                child: const Text('Anterior'),
              ),
              ElevatedButton(
                onPressed: () {
                  // MaterialPageRoute route =
                  //     MaterialPageRoute(builder: (context) => const HomePage());
                  // Navigator.push(context, route);
                  Navigator.pushNamed(context, "/homePage");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(
                          255, 176, 51, 51)), // Color del botón
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white), // Color del texto
                ),
                child: const Text('Salir'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
