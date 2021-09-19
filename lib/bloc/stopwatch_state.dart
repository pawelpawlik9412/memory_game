part of 'stopwatch_bloc.dart';

abstract class StopwatchState extends Equatable {
  final int duration;
  const StopwatchState(this.duration);

  @override
  List<Object> get props => [duration];
}

class StopwatchInitial extends StopwatchState {

  const StopwatchInitial(int duration) : super(duration);

  @override
  List<Object> get props => [duration];
}

class StopwatchRunningInProgress extends StopwatchState {

  const StopwatchRunningInProgress(int duration) : super(duration);

  @override
  List<Object> get props => [duration];
}

class StopwatchFinnish extends StopwatchState {
  const StopwatchFinnish(int duration) : super(duration);

  @override
  List<Object> get props => [duration];
}

