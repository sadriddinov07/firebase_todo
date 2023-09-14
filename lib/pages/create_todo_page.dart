import 'package:firebase_todo/bloc/todo/todo_bloc.dart';
import 'package:firebase_todo/models/todo_model.dart';
import 'package:firebase_todo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void create() async {
    String title = titleController.text;
    String description = descriptionController.text;

    if (title.isEmpty || description.isEmpty) {
      debugPrint("Empty values!");
      return;
    }

    Todo todo = Todo(
      id: BlocProvider.of<TodoBloc>(context).state.todos.length,
      title: title,
      description: description,
      isCompleted: false,
    );

    BlocProvider.of<TodoBloc>(context).add(
      CreateTodo(todo),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Todo"),
        actions: [
          IconButton(
            onPressed: create,
            icon: const Icon(Icons.create),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Create Todo",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 20,
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: "Title",
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 20,
                child: TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: "Description",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
