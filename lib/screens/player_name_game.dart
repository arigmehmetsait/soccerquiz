import 'package:flutter/material.dart';
import 'dart:math';

class PlayerNameGame extends StatefulWidget {
  @override
  _PlayerNameGameState createState() => _PlayerNameGameState();
}

class _PlayerNameGameState extends State<PlayerNameGame> {
  // JSON formatında oyuncu adları listesi
  final String playersData = '''
  [
    "MESSI",
     "RONALDO", 
     "NEYMAR", 
     "MBAPPE",
      "SALAH",
    "HAZARD",
     "KANE", 
     "MODRIC", 
     "BENZEMA", 
     "KROOS",
    "SUAREZ", 
    "LEWANDOWSKI",
     "DE BRUYNE",
     "MANE",
     "IBRAHIMOVIC",

    "DI MARIA",
     "KANTE",
     "VERRATTI",
     "POGBA",
     "RAMOS",

    "VAN DIJK",
     "ALISSON",
     "OBLAK",
     "TER STEGEN",
     "COURTOIS",

    "PIQUE",
     "MARCELO",
     "HAALAND",
     "GRIEZMANN",
     "DYBALA",

    "SON",
     "AUBAMEYANG",
     "DEPAY",
     "SANCHO",
     "STERLING",

    "LUKAKU",
     "ERIKSEN",
     "FIRMINO",
     "JAMES",
     "THIAGO",

    "MULLER",
     "ISCO",
     "ZYECH",
     "FELIX",
     "RICHARLISON"
  ]
  ''';

  List<String> players = [];
  String currentPlayer = ''; // Başlangıç değeri olarak boş bir dize veriyoruz
  String displayName = ''; // displayName için de başlangıç değeri
  Set<String> guessedLetters = {};
  int remainingAttempts = 6;
  bool isLoading = true;

  final Random randomGenerator = Random();

  @override
  void initState() {
    super.initState();
    loadPlayers();
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
          title: Text(remainingAttempts == 0 ? 'Oyun Bitti!' : 'Tebrikler!'),
          content: Text(remainingAttempts == 0
              ? 'Doğru cevap: $currentPlayer'
              : 'Futbolcuyu doğru tahmin ettiniz!'),
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
        title: Text('Futbolcu İsmi Tahmin Et'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Kalan Deneme: $remainingAttempts',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    displayName,
                    style: TextStyle(fontSize: 32, letterSpacing: 8),
                  ),
                  SizedBox(height: 40),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').map((letter) {
                      return ElevatedButton(
                        child: Text(letter, style: TextStyle(fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: guessedLetters.contains(letter)
                              ? Colors.grey
                              : null,
                          minimumSize: Size(50, 50),
                        ),
                        onPressed: guessedLetters.contains(letter)
                            ? null
                            : () => guessLetter(letter),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
    );
  }
}
