part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState(this.todos);

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {
  const TodoInitial(super.todos);
}

class TodoLoading extends TodoState {
  const TodoLoading(super.todos);
}

class TodoFailure extends TodoState {
  const TodoFailure(super.todos);
}

class TodoGetAllSuccess extends TodoState {
  const TodoGetAllSuccess(super.todos);
}

class TodoCreateSuccess extends TodoState {
  const TodoCreateSuccess(super.todos);
}

class TodoUpdateSuccess extends TodoState {
  const TodoUpdateSuccess(super.todos);
}

class TodoDeleteSuccess extends TodoState {
  const TodoDeleteSuccess(super.todos);
}
