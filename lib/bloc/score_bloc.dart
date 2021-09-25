import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memory_game/data/database_helper.dart';
import 'package:memory_game/model/score.dart';

part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  DatabaseHelper _databaseHelper;
  ScoreBloc(this._databaseHelper) : super(ScoreInitial());

  @override
  Stream<ScoreState> mapEventToState(
    ScoreEvent event,
  ) async* {
    if (event is GetScores) {
      yield ScoresLoading();
      await Future<void>.delayed(const Duration(milliseconds: 100));
      List<Score> listScores = await _databaseHelper.getAllScores();
      yield ScoresLoaded(listScores);
    }
    if (event is ClearScoreBoard) {
      _databaseHelper.clearScoreboardTable();
    }
  }
}
