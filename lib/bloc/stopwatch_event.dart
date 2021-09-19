part of 'stopwatch_bloc.dart';

abstract class StopwatchEvent extends Equatable {
  const StopwatchEvent();
}

class StartedStopwatch extends StopwatchEvent {
  const StartedStopwatch();

  @override
  List<Object> get props => [];
}


class TickedStopwatch extends StopwatchEvent {
  const TickedStopwatch();

  @override
  List<Object> get props => [];
}

class PausedStopwatch extends StopwatchEvent {
  const PausedStopwatch();

  @override
  List<Object> get props => [];
}

