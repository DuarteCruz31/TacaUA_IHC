import 'package:flutter/material.dart';
import 'login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'filter.dart';
import 'economia.dart';
import 'mainPaginas/volei.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaçaUA',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(),
      },
      home: AnimatedSplashScreen(
        splash: 'assets/TacaUA_logo.png', // use any widget here
        nextScreen: EconomiaPage(),
        splashTransition: SplashTransition.rotationTransition,
        duration: 3000,
        splashIconSize: 2200,
      ),
    );
  }
}

class EconomiaCruz extends StatefulWidget {
  const EconomiaCruz({Key? key}) : super(key: key);

  @override
  State<EconomiaCruz> createState() => _EconomiaCruzPageState();
}

class _EconomiaCruzPageState extends State<EconomiaCruz> {
  DateTime _selectedDate = DateTime.now();

  void _previousDay() {
    setState(() {
      _selectedDate = _selectedDate.subtract(const Duration(days: 1));
    });
  }

  void _nextDay() {
    setState(() {
      _selectedDate = _selectedDate.add(const Duration(days: 1));
    });
  }

  String _selectedTab = 'resultados';
  final List<String> _sports = [
    '⚽️',
    '🏀',
    '🏐',
    '🤾',
    '🏸',
    '🏉',
    '🏓',
  ];
  int _selectedSportIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Logotipo
        title: const Text('TaçaUA'),
        centerTitle: true,
        actions: [
          // Botao de login
          IconButton(
            icon: const Icon(Icons.admin_panel_settings_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          // Botão de pesquisa (não sei se queriam isto ou aquela merda do dropdown)
          FilterButton(),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            // Botao de Resultados e Classificações
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedTab = 'resultados';
                      });
                    },
                    child: const Text('Resultados'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedTab = 'classificacoes';
                      });
                    },
                    child: Text('Classificações'),
                  ),
                ),
              ],
            ),
          ),
          // Scrollbar horizontal
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _sports.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedSportIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _selectedSportIndex == index
                          ? Colors.blueGrey[100]
                          : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _sports[index],
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Volleyball',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        iconSize: 14,
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // Ação a ser executada quando o botão for pressionado
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VoleiPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Isto aqui é o que muda entre resultados e classificações, é tipo aquela merda no html do onclick que vai para uma função
          Expanded(
            child: _selectedTab == 'resultados'
                ? _buildResultados()
                : _buildClassificacoes(),
          ),
        ],
      ),
    );
  }

  // Função que mete la os resultados para as diferentes modalidades
  // Depois é assim, ou se faz varias funções para cada modalidade ou se faz uma função que recebe como argumento a modalidade
  // e depois dependendo de uma api ou wtv vai buscar dados
  // Decidam o que querem fazer
  Widget _buildResultados() {
    return ListView(
      children: [
                  Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(
                'Jogos por ocorrer: ',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0),
              GameCard(
                team1: 'Matemática',
                team2: 'Design',
                time: '22:00',
                location: 'Pavilhão Aristides Hall',
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(
              'Jogos terminados: ',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        SizedBox(height: 0),
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0),
              GameCard(
                team1: 'E. Civil',
                team2: 'Gestão',
                score1: 3,
                score2: 1,
                location: 'Pavilhão Aristides Hall',
              ),
              GameCard(
                team1: 'E. de Ambiente',
                team2: 'Economia',
                score1: 2,
                score2: 2,
                location: 'Pavilhão Aristides Hall ',
              ),
              GameCard(
                team1: 'Educação Básica',
                team2: 'E. Informática',
                score1: 4,
                score2: 5,
                location: 'Pavilhão Aristides Hall',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Função que mete la as classificações para as diferentes modalidades
  // Mesma coisa que escrevi na função de cima
  Widget _buildClassificacoes() {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Classificações',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ClassificacaoCard(
              team: 'E. Informática',
              position: 1,
              points: 6,
              goalsScored: 5,
              goalsConceded: 2,
            ),
            ClassificacaoCard(
              team: 'E. Mecânica',
              position: 2,
              points: 3,
              goalsScored: 3,
              goalsConceded: 4,
            ),
            ClassificacaoCard(
              team: 'E. Química',
              position: 3,
              points: 1,
              goalsScored: 2,
              goalsConceded: 2,
            ),
            ClassificacaoCard(
              team: 'E. Civil',
              position: 4,
              points: 1,
              goalsScored: 2,
              goalsConceded: 2,
            ),
            ClassificacaoCard(
              team: 'Design',
              position: 5,
              points: 1,
              goalsScored: 2,
              goalsConceded: 2,
            ),
            ClassificacaoCard(
              team: 'Economia',
              position: 6,
              points: 1,
              goalsScored: 2,
              goalsConceded: 2,
            ),
            ClassificacaoCard(
              team: 'Física',
              position: 7,
              points: 1,
              goalsScored: 2,
              goalsConceded: 2,
            ),
            ],
          ),
        ),
      ],
    );
  }
}

// Cards para as classificações
class ClassificacaoCard extends StatelessWidget {
  final String team;
  final int position;
  final int points;
  final int goalsScored;
  final int goalsConceded;

  const ClassificacaoCard({
    Key? key,
    required this.team,
    required this.position,
    required this.points,
    required this.goalsScored,
    required this.goalsConceded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        leading: Text(
          position.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                team,
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              'Pontos: $points',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Golos marcados: $goalsScored'),
            Text('Golos sofridos: $goalsConceded'),
          ],
        ),
      ),
    );
  }
}

// Cards para os jogos
class GameCard extends StatelessWidget {
  final String team1;
  final String team2;
  final String? time;
  final String location;
  final int score1;
  final int score2;

  const GameCard({
    Key? key,
    required this.team1,
    required this.team2,
    this.time,
    required this.location,
    this.score1 = -1,
    this.score2 = -1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool gamePlayed = score1 >= 0 && score2 >= 0;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: Center(
                child: Text(gamePlayed
                    ? 'Local: $location'
                    : 'Horário: ${time ?? ''} - Local: $location'),
              ),
            ),
            if (gamePlayed)
              Text(
                '$score1 - $score2',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
