import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:memory_game/constants/enums.dart';


class Memory extends Equatable {
  Memory(
      {@required this.id,
        @required this.color,
        @required this.image,
        @required this.cardState});

  String id;
  String image;
  Color color;
  CardState cardState;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['image'] = image;
    map['color'] = color;
    map['cardState'] = cardState;
    return map;
  }

  Memory.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.image = map['image'];
    this.color = map['color'];
    this.cardState = map['cardState'];
  }

  @override
  List<Object> get props => [id, image, color, cardState];
}