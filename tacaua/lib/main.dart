import 'package:flutter/material.dart';
import 'login.dart';

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
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// Lista de emojis para a scrollbar horizontal
class _HomePageState extends State<HomePage> {
  String _selectedTab = 'resultados';
  final List<String> _sports = [
    '⚽️',
    '🏀',
    '🏐',
    '🤾',
    '🏸',
    '🏉',
    '🥎',
    '🏓',
    '🏸',
    '🏒',
    '🏑',
    '🏏',
    '🥍',
  ];
  int _selectedSportIndex = 0;

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
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Falta meter aqui a ação de pesquisa
            },
          ),
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
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Próximos jogos',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
              GameCard(
                team1: 'Núcleo E',
                team2: 'Núcleo F',
                time: '18:00',
                location: 'Campo Z',
              ),
              GameCard(
                team1: 'Núcleo G',
                team2: 'Núcleo H',
                time: '20:00',
                location: 'Campo W',
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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                team: 'Núcleo A',
                points: 6,
                goalsScored: 5,
                goalsConceded: 2,
              ),
              ClassificacaoCard(
                team: 'Núcleo B',
                points: 3,
                goalsScored: 3,
                goalsConceded: 4,
              ),
              ClassificacaoCard(
                team: 'Núcleo C',
                points: 1,
                goalsScored: 2,
                goalsConceded: 2,
              ),
              ClassificacaoCard(
                team: 'Núcleo D',
                points: 1,
                goalsScored: 2,
                goalsConceded: 2,
              ),
              ClassificacaoCard(
                team: 'Núcleo E',
                points: 1,
                goalsScored: 2,
                goalsConceded: 2,
              ),
              ClassificacaoCard(
                team: 'Núcleo F',
                points: 1,
                goalsScored: 2,
                goalsConceded: 2,
              ),
              ClassificacaoCard(
                team: 'Núcleo G',
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
  final int points;
  final int goalsScored;
  final int goalsConceded;

  const ClassificacaoCard({
    Key? key,
    required this.team,
    required this.points,
    required this.goalsScored,
    required this.goalsConceded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Text(
          team,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        title: Text('Pontos: $points'),
        subtitle: Text('Golos marcados: $goalsScored'),
        trailing: Text('Golos sofridos: $goalsConceded'),
      ),
    );
  }
}

// Cards para os jogos
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

// Cards para os resultados
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
