import 'package:flutter/material.dart';
import 'package:memory_game/screens/home_page.dart';
import 'package:memory_game/size_config.dart';

void main() {
  runApp(MemoryGame());
}

class MemoryGame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return HomePage();
            },
          );
        },
      ),
    );
  }
}
