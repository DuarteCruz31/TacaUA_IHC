import 'package:flutter/material.dart';
import 'package:tacaua/admin.dart';
import 'package:tacaua/resultadoJogo.dart';
import 'main.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TaçaUA',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        routes: {
          '/': (context) => addResultPage(),
          '/main': (context) => MyHomePage(),
          '/resultadoJogo': (context) => ResultadoJogo(),
        });
  }
}

class addResultPage extends StatefulWidget {
  @override
  _addResultDemoState createState() => _addResultDemoState();
}

class _addResultDemoState extends State<addResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add Result Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Text('Add Result Page',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            /* const Text(
              'Admin Login Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ), */
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 50.0),
              child: Center(
                child: Container(
                  width: 400,
                  height: 150,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'E. Informática',
                            ),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'E. Mecânica',
                            ),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ResultadoJogo()));
                },
                child: const Text(
                  'Adicionar',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}