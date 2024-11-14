import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeamLogoGame extends StatefulWidget {
  @override
  _TeamLogoGameState createState() => _TeamLogoGameState();
}

final List<Map<String, String>> teams = [
  {
    'name': 'Arsenal',
    'logo':
        'https://github.com/sportlogos/football.db.logos/blob/master/europe/en-england/arsenal.png?raw=true'
  },
  {
    'name': 'Chelsea',
    'logo':
        'https://github.com/sportlogos/football.db.logos/blob/master/europe/en-england/chelsea.png?raw=true'
  },
  {
    'name': 'Liverpool',
    'logo':
        'https://github.com/sportlogos/football.db.logos/blob/master/europe/en-england/liverpool.png?raw=true'
  },
  {
    'name': 'Manchester City',
    'logo':
        'https://github.com/sportlogos/football.db.logos/blob/master/europe/en-england/mancity.png?raw=true'
  },
  {
    'name': 'Manchester United',
    'logo':
        'https://github.com/sportlogos/football.db.logos/blob/master/europe/en-england/manunited.png?raw=true'
  },
  {
    'name': 'New Castle United',
    'logo':
        'https://github.com/sportlogos/football.db.logos/blob/master/europe/en-england/newcastle.png?raw=true'
  },
  {
    'name': 'Tottenham',
    'logo':
        'https://github.com/sportlogos/football.db.logos/blob/master/europe/en-england/tottenham.png?raw=true'
  },
  {
    'name': 'Westham',
    'logo':
        'https://github.com/sportlogos/football.db.logos/blob/master/europe/en-england/westham.png?raw=true'
  },
  // Add more teams as needed
];

class _TeamLogoGameState extends State<TeamLogoGame> {
  late Map<String, String> currentTeam;
  List<String> options = [];

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    setState(() {
      currentTeam = teams[Random().nextInt(teams.length)];
      options = [currentTeam['name']!];
      var otherTeams = teams
          .where((t) => t['name'] != currentTeam['name'])
          .map((t) => t['name']!)
          .toList()
        ..shuffle();
      options.addAll(otherTeams.take(3));
      options.shuffle();
    });
  }

  void checkAnswer(String selectedName) {
    if (selectedName == currentTeam['name']) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Doğru!'),
            content: Text('Tebrikler, doğru tahmin ettiniz!'),
            actions: <Widget>[
              TextButton(
                child: Text('Sonraki'),
                onPressed: () {
                  Navigator.of(context).pop();
                  startNewGame();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Yanlış!'),
            content: Text(
                'Maalesef, yanlış tahmin. Doğru cevap: ${currentTeam['name']}'),
            actions: <Widget>[
              TextButton(
                child: Text('Tekrar Dene'),
                onPressed: () {
                  Navigator.of(context).pop();
                  startNewGame();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Takım Logosunu Tahmin Et'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            currentTeam['logo']!,
            height: 100,
            width: 100,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error);
            },
          ),
          SizedBox(height: 20),
          ...options.map(
            (name) => Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ElevatedButton(
                child: Text(name, style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () => checkAnswer(name),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
