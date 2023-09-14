import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_todo/services/sql_service.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';

import 'app.dart';

SQLService service = SQLService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final databasePath = await getDatabasesPath();
  final path = join(databasePath, "TodoApp.db");
  await service.open(path);


  runApp(const TodoApp());
}
