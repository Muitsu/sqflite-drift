abstract class DriftRepository<T, ID> {
  /// Basic Save method with insert or update
  /// return db.into(db.tasks).insertOnConflictUpdate(entity.toCompanion(true));
  Future<ID> save(T entity) =>
      throw UnimplementedError('save() not implemented');

  /// Basic findById method
  /// return (db.select(  db.tasks,  )..where((t) => t.id.equals(id))).getSingleOrNull();
  Future<T?> findById(ID id) =>
      throw UnimplementedError('findById() not implemented');

  /// Basic findAll method
  /// return db.select(db.tasks).get();
  Future<List<T>> findAll() =>
      throw UnimplementedError('findAll() not implemented');

  /// Basic deleteById method
  /// return (db.delete(db.tasks)..where((t) => t.id.equals(id))).go();
  Future<void> deleteById(ID id) =>
      throw UnimplementedError('deleteById() not implemented');

  /// Optional reactive query with default null
  /// Basic watchAll method
  /// db.select(db.tasks).watch();
  Stream<List<T>>? watchAll() => null;
}
