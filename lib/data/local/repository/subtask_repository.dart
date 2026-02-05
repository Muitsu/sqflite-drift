import 'package:sqflite_drift/core/sqflite-drift/database.dart';

abstract class SubTaskRepository {
  Stream<List<SubTask>> watchByTaskId(int taskId);
  Future<void> toggleDone(SubTask subTask);
}
