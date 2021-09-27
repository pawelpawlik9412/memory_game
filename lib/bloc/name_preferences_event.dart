part of 'name_preferences_bloc.dart';

abstract class NamePreferencesEvent extends Equatable {
  const NamePreferencesEvent();
}

class SetName extends NamePreferencesEvent {
  final String userName;
  const SetName(this.userName);

  @override
  List<Object> get props => [userName];
}

class NameToSet extends NamePreferencesEvent {
  @override
  List<Object> get props => [];
}

class NameSetted extends NamePreferencesEvent {
  final String userName;
  const NameSetted(this.userName);
  @override
  List<Object> get props => [userName];
}

class NameChanged extends NamePreferencesEvent {
  final String userName;
  const NameChanged(this.userName);

  @override
  List<Object> get props => [userName];
}

