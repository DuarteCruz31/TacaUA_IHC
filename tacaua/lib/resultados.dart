import 'package:flutter/material.dart';
import 'main.dart';

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
          '/': (context) => InserirResultadoScreen(),
          '/main': (context) => MyHomePage(),
        });
  }
}

class InserirResultadoScreen extends StatefulWidget {
  const InserirResultadoScreen({Key? key}) : super(key: key);

  @override
  _InserirResultadoScreenState createState() => _InserirResultadoScreenState();
}

class _InserirResultadoScreenState extends State<InserirResultadoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserir Resultado'),
      ),
      body: Center(
        child: Text('Página de inserção de resultado'),
      ),
    );
  }
}