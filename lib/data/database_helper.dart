import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:memory_game/model/score.dart';


class DatabaseHelper {

  String id = 'id';
  String scoreTable = 'scoreTable';
  String time = 'time';
  String timeMinutesFormat = 'timeMinutesFormat';
  String date = 'date';
  String fullDate = 'fullDate';
  String playerName = 'playerName';

  static Database _database;
  DatabaseHelper._();
  static final DatabaseHelper db = DatabaseHelper._();


  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  get _dbPath async {
    var documentsDirectory = await _localPath;
    var path = p.join(documentsDirectory, '$scoreTable.db');
    print(path);
    return path;
  }

  Future get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<bool> dbExists() async {
    return File(await _dbPath).exists();
  }

  initDB() async {
    String path = await _dbPath;
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $scoreTable($id INTEGER PRIMARY KEY AUTOINCREMENT, $playerName TEXT, $time INTEGER, $timeMinutesFormat TEXT, $date TEXT, $fullDate TEXT)");
    });
  }

  closeDB() {
    if (_database != null) {
      _database.close();
    }
  }

  Future<List<Score>> getAllScores() async {
    var db = await this.database;
    var map = await db.rawQuery('SELECT * FROM $scoreTable ORDER BY $time, $fullDate LIMIT 10');
    List<Score> scoreList = [];
    for(var x = 0; x < map.length; x++) {
      scoreList.add(Score.fromMapObject(map[x]));
    }
    return scoreList;
  }

  Future<int> insertScore(Score score) async {
    var db = await this.database;
    var result = await db.insert(scoreTable, score.toMap());
    return result;
  }

  Future<int> clearScoreboardTable() async {
    var db = await this.database;
    var result = await db.rawDelete('DELETE FROM $scoreTable');
    return result;
  }
}