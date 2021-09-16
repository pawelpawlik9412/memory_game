import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/memories_set_bloc.dart';
import 'package:memory_game/custom_widgets/gradient_button.dart';
import 'package:memory_game/custom_widgets/memory_card.dart';
import 'package:memory_game/model/memory.dart';
import 'package:memory_game/size_config.dart';

class GamePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 2.6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: _buildGameScreenTitle(),
            ),
            Expanded(
              flex: 10,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildScoreView(),
                    ),
                    Expanded(
                      flex: 10,
                      child: BlocBuilder<MemoriesSetBloc, MemoriesSetState>(
                        builder: (context, state) {
                          if(state is MemoriesSetLoading) {
                            return Center(child: CircularProgressIndicator(),);
                          }
                          if(state is MemoriesSetLoaded) {
                            return _buildGameCardsGridView(state.memoriesSet);
                          }
                          if(state is MemoriesSetUpdated) {
                            return _buildGameCardsGridView(state.memoriesSet);
                          }
                          if(state is MemoriesSetInitial) {
                            return Center(
                              child: GradientButton(label: 'Play', onPressed: () {
                                BlocProvider.of<MemoriesSetBloc>(context)
                                    .add(GenerateMemoriesSet());
                              }
                              ),
                            );
                          }
                          if(state is MemoriesFinished) {
                            return GradientButton(label: 'Play again', onPressed: () {
                              BlocProvider.of<MemoriesSetBloc>(context)
                                  .add(GenerateMemoriesSet());
                            },);
                          }
                          else {
                            return Center(child: Text('Something goes wrong'),);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center _buildGameScreenTitle() {
    return Center(
      child: Hero(
        tag: 'title',
        child: Text(
          'Memory Game',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Caveat',
            color: Colors.tealAccent,
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.textMultiplier * 6.3,
          ),
        ),
      ),
    );
  }

  Row _buildScoreView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Level:',
          style: TextStyle(
            fontFamily: 'Caveat',
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.textMultiplier * 3.8,
          ),
        ),
        Text(
          'Time: 00:00:00',
          style: TextStyle(
            fontFamily: 'Caveat',
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.textMultiplier * 3.8,
          ),
        ),
      ],
    );
  }

  Container _buildGameCardsGridView(List<Memory> list) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3.7),
      child: GridView.builder(
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MemoryCard(
            id: list[index].id,
            cardColor: list[index].color,
            cardIcon: list[index].cardIcon,
            cardState: list[index].cardState,
          );
        },
      ),
    );
  }
}

