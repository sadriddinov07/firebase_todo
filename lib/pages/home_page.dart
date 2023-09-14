import 'package:firebase_todo/bloc/todo/todo_bloc.dart';
import 'package:firebase_todo/pages/create_todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void goToCreateTodoPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateTodoPage(),
      ),
    );
  }

  void delete(int id) {
    BlocProvider.of<TodoBloc>(context).add(
      DeleteTodo(id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: BlocBuilder<TodoBloc, TodoState>(
          bloc: BlocProvider.of<TodoBloc>(context),
          builder: (context, state) {
            return ListView.builder(
              itemCount: BlocProvider.of<TodoBloc>(context).state.todos.length,
              itemBuilder: (context, i) {
                var todo = BlocProvider.of<TodoBloc>(context).state.todos[i];
                return Card(
                  child: ListTile(
                    leading: Text(
                      todo.id.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                    trailing: IconButton(
                      onPressed: () => delete(todo.id),
                      color: Colors.red,
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToCreateTodoPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
