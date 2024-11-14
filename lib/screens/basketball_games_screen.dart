import 'package:flutter/material.dart';

class BasketballGamesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basketbol Oyunları'),
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildGameButton(context, 'Basketbolcu İsmi Tahmin Et',
                    '/basketball_player_name_game', Icons.person),
                SizedBox(height: 16),
                _buildGameButton(context, 'Basketbolcu Resmini Tahmin Et',
                    '/basketball_player_image_game', Icons.image),
                SizedBox(height: 16),
                _buildGameButton(context, 'Takım Logosu Tahmin Et',
                    '/basketball_team_logo_game', Icons.sports_basketball),
                SizedBox(height: 16),
                _buildGameButton(context, 'Basketbolcu Tahmin Oyunu',
                    '/basketball_player_hint_game', Icons.lightbulb),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGameButton(
      BuildContext context, String title, String route, IconData icon) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF2C2C2C),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, route),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: 24),
          SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
