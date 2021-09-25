part of 'score_bloc.dart';

abstract class ScoreState extends Equatable {
  const ScoreState();
}

class ScoreInitial extends ScoreState {
  @override
  List<Object> get props => [];
}

class ScoresLoading extends ScoreState {
  @override
  List<Object> get props => [];
}

class ScoresLoaded extends ScoreState {
  final List<Score> listScores;

  const ScoresLoaded(this.listScores);

  @override
  List<Object> get props => [listScores];
}
