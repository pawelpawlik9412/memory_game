import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/score_bloc.dart';
import 'package:memory_game/screens/game_page.dart';
import 'package:memory_game/screens/score_page.dart';
import 'package:memory_game/screens/settings_page.dart';
import 'package:memory_game/size_config.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentPage(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildCurrentPage() {
    if(_currentPage == 0) {
      return GamePage();
    }
    else if(_currentPage == 1) {
      BlocProvider.of<ScoreBloc>(context).add(GetScores());
      return ScorePage();
    }
    else if(_currentPage == 2) {
      return SettingsPage();
    }
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
