import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository {

  String name = 'name';
  bool nameDefaultValue;

  static final PreferencesRepository _singleton = PreferencesRepository._();
  static PreferencesRepository get instance => _singleton;
  PreferencesRepository._();

  readNamePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    var x = prefs.getString(name);
    if (x == null) {
      return nameDefaultValue;
    }
    return x;
  }

  saveNamePreferences(String newValue) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(name, newValue);
  }

  removeNamePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(name);
  }
}