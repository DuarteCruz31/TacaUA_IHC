import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaçaUA',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaçaUA'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Próximos jogos',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      GameCard(
                        team1: 'Núcleo A',
                        team2: 'Núcleo B',
                        time: '14:00',
                        location: 'Campo X',
                      ),
                      GameCard(
                        team1: 'Núcleo C',
                        team2: 'Núcleo D',
                        time: '16:00',
                        location: 'Campo Y',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Resultados',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      ResultCard(
                        team1: 'Núcleo A',
                        team2: 'Núcleo B',
                        score1: 3,
                        score2: 1,
                      ),
                      ResultCard(
                        team1: 'Núcleo C',
                        team2: 'Núcleo D',
                        score1: 2,
                        score2: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final String team1;
  final String team2;
  final String time;
  final String location;

  const GameCard({
    Key? key,
    required this.team1,
    required this.team2,
    required this.time,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              team1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('vs'),
            Text(
              team2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        title: Text('Local: $location'),
        subtitle: Text('Horário: $time'),
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final String team1;
  final String team2;
  final int score1;
  final int score2;

  const ResultCard({
    Key? key,
    required this.team1,
    required this.team2,
    required this.score1,
    required this.score2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              team1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('vs'),
            Text(
              team2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        title: Text('Resultado: $score1 - $score2'),
      ),
    );
  }
}
