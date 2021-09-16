import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/constants/enums.dart';
import 'package:memory_game/model/memory.dart';
import 'package:random_color/random_color.dart';
import 'package:uuid/uuid.dart';


List<IconData> listIcon = [
  Icons.ac_unit_rounded,
  Icons.stream,
  Icons.padding,
  Icons.accessible_forward_rounded,
  Icons.add,
  Icons.event,
  Icons.margin,
  Icons.list,
  Icons.label,
  Icons.gamepad,
  Icons.fastfood_rounded,
  Icons.directions_car,
  Icons.format_align_justify_outlined,
  Icons.settings,
];

class GameLogic {



  static final GameLogic _singleton = GameLogic._();
  static GameLogic get instance => _singleton;
  GameLogic._();

  List<Memory> _finalMemoryList = [];
  List<String> _chosenMemoryCards = [];

  get finalMemoryList => _finalMemoryList;
  get chosenMemoryCardsLength => _chosenMemoryCards.length;

  bool generateListOfMemory(int numberOfMemoryCard) {
    _chosenMemoryCards.clear();
    Uuid _uuid = Uuid();
    List<Memory> _newFinalMemoryList = [];

    while(_newFinalMemoryList.length < numberOfMemoryCard) {
      IconData randomIcon = getRandomIcon(listIcon);
      Color randomColor = getRandomColor();

      Memory memoryOne = Memory(id: _uuid.v4(), color: randomColor, cardIcon: randomIcon, cardState: CardState.Hidden);
      Memory memoryTwo = Memory(id: _uuid.v4(), color: randomColor, cardIcon: randomIcon, cardState: CardState.Hidden);

      _newFinalMemoryList.addAll([memoryOne, memoryTwo]);
    }
    _newFinalMemoryList.shuffle();
    _finalMemoryList = _newFinalMemoryList;
    return true;
  }


  // Methods to generate random Images and Colors for Memory Cards Sets
  IconData getRandomIcon(List list) {
    var random = Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  Color getRandomColor() {
    return RandomColor().randomColor(
      colorHue: ColorHue.random,
      colorSaturation: ColorSaturation.highSaturation,
      colorBrightness: ColorBrightness.light,
    );
  }
}