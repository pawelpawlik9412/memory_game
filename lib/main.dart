import 'package:flutter/material.dart';
import 'package:memory_game/screens/game_page.dart';
import 'package:memory_game/size_config.dart';

void main() {
  runApp(MemoryGame());
}

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return Scaffold(
                body: GamePage(),
                bottomNavigationBar: _buildBottomNavigationBar(),
              );
            },
          );
        },
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0.0,
      selectedItemColor: Colors.tealAccent,
      currentIndex: _currentPage,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.gamepad,
            size: SizeConfig.textMultiplier * 4.1,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.score_rounded,
            size: SizeConfig.textMultiplier * 4.1,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.settings,
            size: SizeConfig.textMultiplier * 4.1,
          ),
        ),
      ],
      onTap: (index) {
        setState(
          () {
            _currentPage = index;
          },
        );
      },
    );
  }
}
