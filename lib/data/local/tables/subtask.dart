import 'package:drift/drift.dart';
import 'package:sqflite_drift/data/local/tables/task.dart';

class SubTasks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  BoolColumn get isDone => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  // Foreign key to Task
  IntColumn get taskId => integer().references(Tasks, #id)();
}
