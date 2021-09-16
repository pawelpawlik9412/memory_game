import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:memory_game/constants/enums.dart';


class Memory extends Equatable {
  Memory(
      {@required this.id,
        @required this.color,
        @required this.cardIcon,
        @required this.cardState});

  String id;
  IconData cardIcon;
  Color color;
  CardState cardState;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['cardIcon'] = cardIcon;
    map['color'] = color;
    map['cardState'] = cardState;
    return map;
  }

  Memory.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.cardIcon = map['image'];
    this.color = map['color'];
    this.cardState = map['cardState'];
  }

  @override
  List<Object> get props => [id, cardIcon, color, cardState];
}