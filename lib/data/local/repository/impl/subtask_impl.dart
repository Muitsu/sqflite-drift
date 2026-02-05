import 'package:sqflite_drift/core/sqflite-drift/database.dart';
import 'package:sqflite_drift/data/local/repository/subtask_repository.dart';

class SubtaskImpl implements SubTaskRepository {
  final AppDatabase db;

  SubtaskImpl(this.db);

  @override
  Stream<List<SubTask>> watchByTaskId(int taskId) {
    return (db.select(
      db.subTasks,
    )..where((t) => t.taskId.equals(taskId))).watch();
  }

  @override
  Future<void> toggleDone(SubTask subTask) {
    return db
        .update(db.subTasks)
        .replace(subTask.copyWith(isDone: !subTask.isDone));
  }
}
