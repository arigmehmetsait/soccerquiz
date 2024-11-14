import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class BasketballPlayerNameGame extends StatefulWidget {
  @override
  _BasketballPlayerNameGameState createState() =>
      _BasketballPlayerNameGameState();
}

class _BasketballPlayerNameGameState extends State<BasketballPlayerNameGame>
    with SingleTickerProviderStateMixin {
  final String playersData = '''
  [
  "LEBRON",
  "CURRY",
  "DURANT",
  "ANTETOKOUNMPO",
  "JOKIC",
  "DONCIC",
  "EMBIID",
  "LILLARD",
  "HARDEN",
  "TATUM",
  "IRVING",
  "DAVIS",
  "BOOKER",
  "MITCHELL",
  "YOUNG",
  "BUTLER",
  "GEORGE",
  "WILLIAMSON",
  "MORANT",
  "BEAL",
  "WESTBROOK",
  "PAUL",
  "TOWNS",
  "SIMMONS",
  "INIGANOBI",
  "BROWN",
  "AYTON",
  "FOX",
  "PORZINGIS",
  "HOLIDAY",
  "LAVINE",
  "MIDDLETON",
  "RANDLE",
  "GRIFFIN",
  "ROSE",
  "DRUMMOND",
  "GOBERT",
  "GILGEOUS",
  "JACKSON",
  "VUCEVIC",
  "BROGDON",
  "VALANCIUNAS",
  "GALLINARI",
  "COLLINS",
  "GREEN",
  "THOMPSON",
  "HARRIS",
  "BERTANS",
  "LOPEZ",
  "JORDAN",
  "SMITH",
  "BALL",
  "BRIDGES",
  "BARNES",
  "GRAHAM",
  "JARRETT",
  "BURKE",
  "CARROLL",
  "CONLEY",
  "HILL",
  "WIGGINS",
  "CRAWFORD",
  "JOHNSON",
  "IGUODALA",
  "HOWARD",
  "BLAZEMORE",
  "COVINGTON",
  "PARKER",
  "MILLS",
  "OKORO",
  "HARRELL",
  "MCDERMOTT",
  "CRABBE",
  "JONES",
  "CARTER",
  "ALLEN",
  "PORTER",
  "ROBINSON",
  "EDWARDS",
  "ZUBAC",
  "WHITE",
  "SHRODER",
  "ONEAL",
  "MURRAY",
  "PLUMLEE",
  "GREENE",
  "MORRIS",
  "CROWDER",
  "HOUSTON",
  "MACK",
  "MARTIN",
  "GAY",
  "HERNANGOMEZ",
  "BOL",
  "ANTHONY",
  "BRYANT",
  "JOHNSON",
  "JOSEPH",
  "BAYNES",
  "NANCE",
  "NOAH",
  "PATTERSON",
  "MAHINMI",
  "MCGEE",
  "CLEMONS",
  "BAZLEY",
  "CANAAN",
  "MELO"
]

  ''';

  List<String> players = [];
  String currentPlayer = '';
  String displayName = '';
  Set<String> guessedLetters = {};
  int remainingAttempts = 6;
  bool isLoading = true;

  late AnimationController _controller;
  late Animation<double> _animation;
  final Random randomGenerator = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    loadPlayers();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void loadPlayers() {
    // JSON verisini List olarak ayrıştırıyoruz
    players = List<String>.from(playersData
        .replaceAll(RegExp(r'[\[\]" ,]'), '')
        .split('\n')
        .map((e) => e.trim())
        .where((name) => name.isNotEmpty));

    setState(() {
      isLoading = false;
    });
    startNewGame();
  }

  void startNewGame() {
    setState(() {
      String newPlayer;
      do {
        newPlayer = players[randomGenerator.nextInt(players.length)];
      } while (newPlayer == currentPlayer);

      currentPlayer = newPlayer;
      guessedLetters.clear();
      remainingAttempts = 6;
      updateDisplayName();
    });
    _controller.reset();
  }

  void updateDisplayName() {
    setState(() {
      displayName = currentPlayer.split('').map((letter) {
        if (letter == ' ') return ' '; // Boşluk karakterini olduğu gibi bırak
        return guessedLetters.contains(letter.toUpperCase()) ? letter : '_';
      }).join();
    });
  }

  void guessLetter(String letter) {
    letter = letter.toUpperCase();

    if (guessedLetters.contains(letter)) return;

    setState(() {
      guessedLetters.add(letter);
      if (!currentPlayer.contains(letter)) {
        remainingAttempts--;
        _controller.forward(from: 0.0);
      }
      updateDisplayName();
    });

    if (remainingAttempts == 0 || !displayName.contains('_')) {
      showGameOverDialog();
    }
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            remainingAttempts == 0 ? 'Oyun Bitti!' : 'Tebrikler!',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                remainingAttempts == 0
                    ? 'Doğru cevap: $currentPlayer'
                    : 'Basketbolcuyu doğru tahmin ettiniz!',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              SizedBox(height: 20),
              Icon(
                remainingAttempts == 0
                    ? Icons.sentiment_dissatisfied
                    : Icons.sentiment_very_satisfied,
                color: remainingAttempts == 0 ? Colors.red : Colors.green,
                size: 60,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yeni Oyun'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basketbolcu İsmi Tahmin Et'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
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
                          scale: 1.0 - (_animation.value * 0.1),
                          child: Text(
                            'Kalan Deneme: $remainingAttempts',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      displayName,
                      style: TextStyle(
                          fontSize: 36,
                          letterSpacing: 8,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').map((letter) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: ElevatedButton(
                            child: Text(letter, style: TextStyle(fontSize: 18)),
                            onPressed: guessedLetters.contains(letter)
                                ? null
                                : () => guessLetter(letter),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: guessedLetters.contains(letter)
                                  ? Theme.of(context)
                                      .colorScheme
                                      .surface
                                      .withOpacity(0.5)
                                  : Theme.of(context).colorScheme.primary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              padding: EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
