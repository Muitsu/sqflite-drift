import 'package:sqflite_drift/core/sqflite-drift/database.dart';

abstract class TaskRepository {
  Future<int> saveTask(String task);
  Future<bool> toggleDone(Task task);
  Stream<List<Task>> watchAll();
}
