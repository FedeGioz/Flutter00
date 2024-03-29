import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<String> fields = ["A", "B", "C", "D"];

  // This widget is the root of your application.
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Anagrafica",
      home: MyHomePage(),
    );
  }

    void getNomeCognome(){
      print(fields);
    }
  }

class MyHomePage extends StatefulWidget{
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{
  static const List<String> fields = ['3AINF', '4AINF', '5AINF'];

  String classe = fields.first;

  TextEditingController ctrNome = TextEditingController();
  TextEditingController ctrCognome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Anagrafica",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Anagrafica"), backgroundColor: Colors.yellow, centerTitle: true,
        ),
        body: Column(children: [
          TextField(
              decoration: InputDecoration(
                labelText: "Nome",
                hintText: "Nome",
                border: OutlineInputBorder(),
              ),
          controller: ctrNome,),
          TextField(
              decoration: InputDecoration(
                labelText: "Cognome",
                hintText: "Cognome",
                border: OutlineInputBorder(),
              ),
          controller: ctrCognome,
          ),
          DropdownButton<String>(
              value: classe,
              // map visita la collezione e per ogni dato, ne crea una copia applicando su di esso il metodo o funzione lambda passata
              items: fields.map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),);}).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      classe = newValue!;
                    });
                  }
          ),
          ElevatedButton(
              onPressed: () { print(ctrNome.text + " " + ctrCognome.text + " " + classe); },
              child: const Text("Clicca")
          )
        ],),
        backgroundColor: Colors.red,
      ),
    );

  }
}