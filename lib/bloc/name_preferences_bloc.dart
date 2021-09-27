import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memory_game/data/preferences_repository.dart';

part 'name_preferences_event.dart';
part 'name_preferences_state.dart';

class NamePreferencesBloc extends Bloc<NamePreferencesEvent, NamePreferencesState> {

  PreferencesRepository _preferencesRepository;
  StreamSubscription _streamSubscription;

  NamePreferencesBloc(this._preferencesRepository) : super(NamePreferencesSetting()) {
    _streamSubscription = Stream.fromFuture(_preferencesRepository.readNamePreferences()).listen((name) {
      if(name == null) {
        add(NameToSet());
      } else {
        add(NameSetted(name));
      }
    });
  }

  @override
  Stream<NamePreferencesState> mapEventToState(
      NamePreferencesEvent event,
      ) async* {
    if(event is NameToSet) {
      yield NamePreferencesEmpty();
    }
    if(event is SetName) {
      yield NamePreferencesSetting();
      _preferencesRepository.saveNamePreferences(event.userName);
      await Future<void>.delayed(const Duration(milliseconds: 500));
      yield NamePreferencesSetted(event.userName);
    }
    if(event is NameSetted) {
      yield NamePreferencesSetting();
      yield NamePreferencesSetted(event.userName);
    }
    if(event is NameChanged) {
      _preferencesRepository.saveNamePreferences(event.userName);
      yield NamePreferencesSetting();
      yield NamePreferencesSetted(event.userName);
    }
  }

  @override
  Future<void> close() async {
    _streamSubscription?.cancel();
    super.close();
  }
}