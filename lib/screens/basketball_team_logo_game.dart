import 'package:flutter/material.dart';
import 'dart:math';

class BasketballPlayerImageGame extends StatefulWidget {
  @override
  _BasketballPlayerImageGameState createState() =>
      _BasketballPlayerImageGameState();
}

class _BasketballPlayerImageGameState extends State<BasketballPlayerImageGame> {
  final List<Map<String, String>> players = [
    {'name': 'LeBron James', 'image': 'https://example.com/lebron.jpg'},
    {'name': 'Stephen Curry', 'image': 'https://example.com/curry.jpg'},
    {'name': 'Kevin Durant', 'image': 'https://example.com/durant.jpg'},
    {
      'name': 'Giannis Antetokounmpo',
      'image': 'https://example.com/giannis.jpg'
    },
  ];

  late Map<String, String> currentPlayer;
  List<String> options = [];

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    setState(() {
      currentPlayer = players[Random().nextInt(players.length)];
      options = [currentPlayer['name']!]
        ..addAll(players
            .where((p) => p['name'] != currentPlayer['name'])
            .map((p) => p['name']!)
            .toList()
          ..shuffle())
        ..shuffle();
      options = options.sublist(0, 4);
    });
  }

  void checkAnswer(String selectedName) {
    if (selectedName == currentPlayer['name']) {
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
                'Maalesef, yanlış tahmin. Doğru cevap: ${currentPlayer['name']}'),
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
        title: Text('Basketbolcu Resmini Tahmin Et'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A1A),
              Color(0xFF121212),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                currentPlayer['image']!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              ...options.map(
                (name) => Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ElevatedButton(
                    child: Text(name),
                    onPressed: () => checkAnswer(name),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .surface, // Arka plan rengi
                      foregroundColor:
                          Theme.of(context).colorScheme.onSurface, // Yazı rengi
                      minimumSize: Size(double.infinity,
                          50), // Genişlik için sonsuz, yükseklik için 50
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
