part of 'name_preferences_bloc.dart';

abstract class NamePreferencesState extends Equatable {
  const NamePreferencesState();
}

class NamePreferencesEmpty extends NamePreferencesState {
  const NamePreferencesEmpty();

  @override
  List<Object> get props => [];
}

class NamePreferencesSetted extends NamePreferencesState {
  final String userName;
  const NamePreferencesSetted(this.userName);

  @override
  List<Object> get props => [userName];
}

class NamePreferencesSetting extends NamePreferencesState {
  @override
  List<Object> get props => [];
}


