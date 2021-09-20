class Score {

  int id;
  String playerName;
  int time;
  String timeMinutesFormat;
  String date;
  String fullDate;

  Score({this.id, this.playerName, this.time, this.timeMinutesFormat, this.date, this.fullDate});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['playerName'] = playerName;
    map['time'] = time;
    map['timeMinutesFormat'] = timeMinutesFormat;
    map['date'] = date;
    map['fullDate'] = fullDate;
    return map;
  }

  Score.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.playerName = map['playerName'];
    this.time = map['time'];
    this.timeMinutesFormat = map['timeMinutesFormat'];
    this.date = map['date'];
    this.fullDate = map['fullDate'];
  }
}