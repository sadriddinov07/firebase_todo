part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetAll extends TodoEvent {
  const GetAll();
}

class CreateTodo extends TodoEvent {
  final Todo todo;

  const CreateTodo(this.todo);
}

class UpdateTodo extends TodoEvent {
  final Todo todo;

  const UpdateTodo(this.todo);
}

class DeleteTodo extends TodoEvent {
  final int id;

  const DeleteTodo(this.id);
}
