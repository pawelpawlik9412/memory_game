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

  List<Memory> get finalMemoryList => _finalMemoryList;
  int get chosenMemoryCardsLength => _chosenMemoryCards.length;

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

  void choseCard(String id) {
    if (_chosenMemoryCards.length == 0) {
      _chosenMemoryCards.add(id);
      changeStateCartToChosen(id);
    }
    if (_chosenMemoryCards.length == 1) {
      if (_chosenMemoryCards.contains(id)) {
        return;
      } else {
        _chosenMemoryCards.add(id);
        changeStateCartToChosen(id);
      }
    }
  }

  void changeStateCartToChosen(String id) {
    for(Memory memory in _finalMemoryList) {
      if (memory.id == id) {
        memory.cardState = CardState.Chosen;
      }
    }
  }

  bool checkMatch() {
    Memory firstMemory = getMemoryCardById(_chosenMemoryCards[0]);
    Memory secondMemory = getMemoryCardById(_chosenMemoryCards[1]);
    if (firstMemory.cardIcon == secondMemory.cardIcon &&
        firstMemory.color == secondMemory.color) {
      return true;
    } else {
      return false;
    }
  }

  Memory getMemoryCardById(String id) {
    for (var x in _finalMemoryList) {
      if (x.id == id) {
        return x;
      }
    }
  }

  void pairMatchTrue() {
    for (Memory memory in _finalMemoryList) {
      for (String id in _chosenMemoryCards) {
        if (memory.id == id) {
          memory.cardState = CardState.Guessed;
        }
      }
    }
  }

  void pairMatchFalse() {
    for (Memory memory in _finalMemoryList) {
      for (String id in _chosenMemoryCards) {
        if (memory.id == id) {
          memory.cardState = CardState.Hidden;
        }
      }
    }
  }

  bool checkIfAllMemoriesGuessed() {
    List<CardState> stateList = [];
    for (var x in _finalMemoryList) {
      stateList.add(x.cardState);
    }
    if (stateList.contains(CardState.Hidden) ||
        stateList.contains(CardState.Chosen)) {
      return false;
    } else {
      return true;
    }
  }

  void chosenMemoryCardManager() {
    checkMatch() ? pairMatchTrue() : pairMatchFalse();
    _chosenMemoryCards.clear();
  }

}