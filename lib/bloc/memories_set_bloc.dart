import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memory_game/game_logic.dart';
import 'package:memory_game/model/memory.dart';

part 'memories_set_event.dart';
part 'memories_set_state.dart';

class MemoriesSetBloc extends Bloc<MemoriesSetEvent, MemoriesSetState> {

  GameLogic _gameLogic;
  MemoriesSetBloc(this._gameLogic,) : super(MemoriesSetInitial());

  @override
  Stream<MemoriesSetState> mapEventToState(
    MemoriesSetEvent event,
  ) async* {
    if(event is GenerateMemoriesSet) {
      try {
        yield MemoriesSetLoading();
        _gameLogic.generateListOfMemory(8);
        List<Memory> memoriesSet = _gameLogic.finalMemoryList;
        await Future<void>.delayed(const Duration(milliseconds: 500));
        yield MemoriesSetLoaded(memoriesSet);
      }
      catch(e) {
        yield MemoriesSetError();
      }
    }
  }
}
