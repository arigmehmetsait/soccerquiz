import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';

class BasketballPlayerImageGame extends StatefulWidget {
  @override
  _BasketballPlayerImageGameState createState() =>
      _BasketballPlayerImageGameState();
}

class _BasketballPlayerImageGameState extends State<BasketballPlayerImageGame>
    with SingleTickerProviderStateMixin {
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
  int score = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    startNewGame();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    _controller.reset();
  }

  void checkAnswer(String selectedName) {
    bool isCorrect = selectedName == currentPlayer['name'];
    _controller.forward(from: 0.0);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            isCorrect ? 'Doğru!' : 'Yanlış!',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isCorrect
                    ? 'Tebrikler, doğru tahmin ettiniz!'
                    : 'Maalesef, yanlış tahmin. Doğru cevap: ${currentPlayer['name']}',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              SizedBox(height: 20),
              Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? Colors.green : Colors.red,
                size: 60,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Devam Et'),
              onPressed: () {
                Navigator.of(context).pop();
                if (isCorrect) {
                  setState(() {
                    score++;
                  });
                }
                startNewGame();
              },
            ),
          ],
        );
      },
    );
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
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + (_animation.value * 0.1),
                    child: Text(
                      'Skor: $score',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Hero(
                tag: 'playerImage',
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: currentPlayer['image']!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ...options.map(
                (name) => Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ElevatedButton(
                    child: Text(name, style: TextStyle(fontSize: 18)),
                    onPressed: () => checkAnswer(name),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .surface, // Arka plan rengi
                      foregroundColor: Theme.of(context).colorScheme.onSurface,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(double.infinity, 60),
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
