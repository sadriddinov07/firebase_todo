import 'package:firebase_todo/bloc/sign/sign_bloc.dart';
import 'package:firebase_todo/bloc/todo/todo_bloc.dart';
import 'package:firebase_todo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignBloc()),
        BlocProvider(create: (context) => TodoBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.dark,
        home: const HomePage(),
      ),
    );
  }
}
