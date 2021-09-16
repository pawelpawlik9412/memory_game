part of 'memories_set_bloc.dart';

abstract class MemoriesSetState extends Equatable {
  const MemoriesSetState();
}

class MemoriesSetInitial extends MemoriesSetState {
  @override
  List<Object> get props => [];
}

class MemoriesSetLoading extends MemoriesSetState {
  @override
  List<Object> get props => [];
}

class MemoriesSetLoaded extends MemoriesSetState {
  final List<Memory> memoriesSet;

  const MemoriesSetLoaded(this.memoriesSet);

  @override
  List<Object> get props => [];
}

class MemoriesSetUpdated extends MemoriesSetState {
  final List<Memory> memoriesSet;

  const MemoriesSetUpdated(this.memoriesSet);

  @override
  List<Object> get props => [];
}

class MemoriesFinished extends MemoriesSetState {
  @override
  List<Object> get props => [];
}

class MemoriesSetError extends MemoriesSetState {
  @override
  List<Object> get props => [];
}