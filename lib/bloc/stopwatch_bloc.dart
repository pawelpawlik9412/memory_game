import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memory_game/bloc/memories_set_bloc.dart';
import 'package:memory_game/data/database_helper.dart';
import 'package:memory_game/model/score.dart';
import 'package:memory_game/utils.dart';

part 'stopwatch_event.dart';
part 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {

  static int duration = 0;
  bool stopped = false;
  MemoriesSetBloc memoriesSetBloc;
  StreamSubscription streamSubscription;
  DatabaseHelper _databaseHelper = DatabaseHelper.db;


  StopwatchBloc(this.memoriesSetBloc) : super(StopwatchInitial(duration)) {
    streamSubscription = memoriesSetBloc.stream.listen((memoriesState) {
      if(memoriesState is MemoriesFinished) {
        add(PausedStopwatch());
      }
    });
  }

  @override
  Stream<StopwatchState> mapEventToState(
    StopwatchEvent event,
  ) async* {
    if (event is StartedStopwatch) {
      stopped = false;
      if (state is StopwatchInitial) {
        add(TickedStopwatch());
      }
    }
    if (event is TickedStopwatch) {
      if(!stopped) {
        duration++;
        yield StopwatchRunningInProgress(duration);
        await Future<void>.delayed(const Duration(milliseconds: 1));
        add(TickedStopwatch());
      } else {
        duration = 0;
        yield StopwatchInitial(duration);
      }
    }
    if(event is PausedStopwatch) {
      stopped = true;
      var now = DateTime.now();
      _databaseHelper.insertScore(Score(playerName: 'Pawel', time: duration, timeMinutesFormat: milisecondsConvetter(duration), date: getFormatDate(now), fullDate: now.toString(),),);
      yield StopwatchFinnish(duration);
    }
  }

  @override
  Future<void> close() async {
    streamSubscription?.cancel();
    super.close();
  }
}
