import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/memories_set_bloc.dart';
import 'package:memory_game/bloc/score_bloc.dart';
import 'package:memory_game/bloc/stopwatch_bloc.dart';
import 'package:memory_game/data/database_helper.dart';
import 'package:memory_game/game_logic.dart';
import 'package:memory_game/screens/home_page.dart';
import 'package:memory_game/size_config.dart';

void main() {
  runApp(MemoryGame());
}

class MemoryGame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MemoriesSetBloc>(
            create: (context) => MemoriesSetBloc(GameLogic.instance),
          ),
          BlocProvider<StopwatchBloc>(
            create: (context) => StopwatchBloc(
              BlocProvider.of<MemoriesSetBloc>(context),
            ),
          ),
          BlocProvider<ScoreBloc>(
            create: (context) => ScoreBloc(DatabaseHelper.db),
          ),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
                return HomePage();
              },
            );
          },
        ),
      ),
    );
  }
}
