part of 'score_bloc.dart';

abstract class ScoreEvent extends Equatable {
  const ScoreEvent();
}

class GetScores extends ScoreEvent {
  const GetScores();

  @override
  List<Object> get props => [];
}

class AddScore extends ScoreEvent {
  final Score _score;
  const AddScore(this._score);

  @override
  List<Object> get props => [_score];
}

class ClearScoreBoard extends ScoreEvent {
  const ClearScoreBoard();

  @override
  List<Object> get props => [];
}
