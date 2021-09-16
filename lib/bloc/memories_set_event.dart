part of 'memories_set_bloc.dart';

abstract class MemoriesSetEvent extends Equatable {
  const MemoriesSetEvent();
}

class GenerateMemoriesSet extends MemoriesSetEvent {
  const GenerateMemoriesSet();

  @override
  List<Object> get props => [];
}

class ChosseMemoryFromSet extends MemoriesSetEvent {
  final String cardId;
  const ChosseMemoryFromSet(this.cardId);

  @override
  List<Object> get props => [];
}
