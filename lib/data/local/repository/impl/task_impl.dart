import 'package:sqflite_drift/core/sqflite-drift/database.dart';
import 'package:sqflite_drift/data/local/repository/task_repository.dart';

class TaskImpl implements TaskRepository {
  final AppDatabase db;

  TaskImpl(this.db);

  @override
  Future<int> saveTask(String task) {
    return db.into(db.tasks).insert(TasksCompanion.insert(title: task));
  }

  @override
  Future<bool> toggleDone(Task task) {
    return db.update(db.tasks).replace(task.copyWith(isDone: !task.isDone));
  }

  @override
  Stream<List<Task>> watchAll() {
    return db.select(db.tasks).watch();
  }
}
