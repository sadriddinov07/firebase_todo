import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_todo/main.dart';
import 'package:firebase_todo/models/todo_model.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc()
      : super(
          const TodoInitial([]),
        ) {
    on<GetAll>(
      (event, emit) async {
        emit(
          TodoLoading(state.todos),
        );
        var list = await service.todos();
        emit(
          TodoGetAllSuccess(list),
        );
      },
    );
    on<CreateTodo>(
      (event, emit) async {
        emit(
          TodoLoading(state.todos),
        );
        service.insert(event.todo);
        var list = await service.todos();
        emit(
          TodoGetAllSuccess(list),
        );
      },
    );
    on<UpdateTodo>(
      (event, emit) async {
        emit(
          TodoLoading(state.todos),
        );
        service.update(event.todo);
        var list = await service.todos();
        emit(
          TodoGetAllSuccess(list),
        );
      },
    );
    on<DeleteTodo>(
      (event, emit) async {
        emit(
          TodoLoading(state.todos),
        );
        service.delete(event.id);
        var list = await service.todos();
        emit(
          TodoGetAllSuccess(list),
        );
      },
    );
  }
}
