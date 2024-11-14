import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/football_games_screen.dart';
import 'screens/basketball_games_screen.dart';
import 'screens/player_name_game.dart';
import 'screens/player_image_game.dart';
import 'screens/team_logo_game.dart';
import 'screens/player_hint_game.dart';
import 'screens/basketball_player_name_game.dart';
import 'package:soccerquiz/screens/basketball_player_image_game.dart'
    as playerImage;
import 'package:soccerquiz/screens/basketball_team_logo_game.dart' as teamLogo;
import 'screens/basketball_player_hint_game.dart';

void main() {
  runApp(SportsQuizApp());
}

class SportsQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Quiz',
      theme: ThemeData(
        primaryColor: Color(0xFF1A1A1A),
        scaffoldBackgroundColor: Color(0xFF121212),
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF4A90E2),
          secondary: Colors.white,
          surface: Color(0xFF2C2C2C),
          background: Color(0xFF121212),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4A90E2),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: Color(0xFF2C2C2C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/football_games': (context) => FootballGamesScreen(),
        '/basketball_games': (context) => BasketballGamesScreen(),
        '/player_name_game': (context) => PlayerNameGame(),
        '/player_image_game': (context) => PlayerImageGame(),
        '/team_logo_game': (context) => TeamLogoGame(),
        '/player_hint_game': (context) => PlayerHintGame(),
        '/basketball_player_name_game': (context) => BasketballPlayerNameGame(),
        '/basketball_player_image_game': (context) =>
            playerImage.BasketballPlayerImageGame(),
        '/basketball_team_logo_game': (context) =>
            teamLogo.BasketballPlayerImageGame(),
        '/basketball_player_hint_game': (context) => BasketballPlayerHintGame(),
      },
    );
  }
}
