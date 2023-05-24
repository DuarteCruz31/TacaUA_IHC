import 'package:flutter/material.dart';
import 'package:tacaua/admin.dart';
import 'package:tacaua/resultadoJogo.dart';
import 'JogoAddConfirmado.dart';
import 'main.dart';
import 'adicionarJogo.dart';
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
        '/': (context) => addJogoPage(),
        '/main': (context) => MyHomePage(),
        '/resultadoJogo': (context) => ResultadoJogo(),
        '/adicionarJogo': (context) => addJogoPage(),
      },
    );
  }
}

class addJogoPage extends StatefulWidget {
  @override
  _addJogoDemoState createState() => _addJogoDemoState();
}

class _addJogoDemoState extends State<addJogoPage> {
  String? selectedTeam1;
  String? selectedTeam2;
  String? selectedLocation;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  List<String> teams = [
    'E. Informática',
    'Economia',
    'Educação Física',
    'E. Ambiental',
    'E. Biomédica',
    'E. de Materiais',
    'E. Mecânica',
    'E. Eletrónica'
  ];

  List<String> locations = [
    'Pavilhão Aristides Hall',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Adicionar Jogo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Text(
                'Adicionar Jogo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Center(
                child: Container(
                  width: 300,
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: selectedTeam1,
                        items: teams.map((String team) {
                          return DropdownMenuItem<String>(
                            value: team,
                            child: Text(team),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedTeam1 = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Equipe 1',
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: selectedTeam2,
                        items: teams.map((String team) {
                          return DropdownMenuItem<String>(
                            value: team,
                            child: Text(team),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedTeam2 = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Equipe 2',
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: selectedLocation,
                        items: locations.map((String location) {
                          return DropdownMenuItem<String>(
                            value: location,
                            child: Text(location),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedLocation = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Pavilhão',
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Dia do Jogo',
                                ),
                                child: Text(
                                  '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _selectTime(context);
                              },
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Hora do Jogo',
                                ),
                                child: Text(
                                  '${_selectedTime.hour}:${_selectedTime.minute}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: () {
                  String team1 = selectedTeam1 ?? '';
                  String team2 = selectedTeam2 ?? '';
                  String location = selectedLocation ?? '';

                  // Aqui você pode realizar a lógica para adicionar o jogo com os dados fornecidos

                  // Exemplo de exibição dos dados adicionados:
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Informações do Jogo'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Equipe 1: $team1'),
                          Text('Equipe 2: $team2'),
                          Text('Dia do Jogo: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
                          Text('Hora do Jogo: ${_selectedTime.hour}:${_selectedTime.minute}'),
                          Text('Local do Jogo: $location'),
                        ],
                      ),
                      actions: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyConfirmPage()),
                                );
                              },
                              child: Text('Adicionar'),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                // Aqui você pode adicionar a lógica para o botão de editar
                                Navigator.pop(context);
                              },
                              child: Text('Editar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
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
