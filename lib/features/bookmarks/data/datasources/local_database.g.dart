// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $LocalDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $LocalDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $LocalDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<LocalDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorLocalDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $LocalDatabaseBuilderContract databaseBuilder(String name) =>
      _$LocalDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $LocalDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$LocalDatabaseBuilder(null);
}

class _$LocalDatabaseBuilder implements $LocalDatabaseBuilderContract {
  _$LocalDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $LocalDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $LocalDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<LocalDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$LocalDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$LocalDatabase extends LocalDatabase {
  _$LocalDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BookmarkDao? _bookmarkDaoInstance;

  CollectionDao? _collectionDaoInstance;

  TagDao? _tagDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `bookmarks` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `url` TEXT NOT NULL, `collectionId` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `collections` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tags` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BookmarkDao get bookmarkDao {
    return _bookmarkDaoInstance ??= _$BookmarkDao(database, changeListener);
  }

  @override
  CollectionDao get collectionDao {
    return _collectionDaoInstance ??= _$CollectionDao(database, changeListener);
  }

  @override
  TagDao get tagDao {
    return _tagDaoInstance ??= _$TagDao(database, changeListener);
  }
}

class _$BookmarkDao extends BookmarkDao {
  _$BookmarkDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _bookmarkModelInsertionAdapter = InsertionAdapter(
            database,
            'bookmarks',
            (BookmarkModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'url': item.url,
                  'collectionId': item.collectionId
                }),
        _bookmarkModelUpdateAdapter = UpdateAdapter(
            database,
            'bookmarks',
            ['id'],
            (BookmarkModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'url': item.url,
                  'collectionId': item.collectionId
                }),
        _bookmarkModelDeletionAdapter = DeletionAdapter(
            database,
            'bookmarks',
            ['id'],
            (BookmarkModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'url': item.url,
                  'collectionId': item.collectionId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BookmarkModel> _bookmarkModelInsertionAdapter;

  final UpdateAdapter<BookmarkModel> _bookmarkModelUpdateAdapter;

  final DeletionAdapter<BookmarkModel> _bookmarkModelDeletionAdapter;

  @override
  Future<List<BookmarkModel>> getAllBookmarks() async {
    return _queryAdapter.queryList('SELECT * FROM bookmarks',
        mapper: (Map<String, Object?> row) => BookmarkModel(
            id: row['id'] as int?,
            title: row['title'] as String,
            url: row['url'] as String,
            collectionId: row['collectionId'] as int));
  }

  @override
  Future<BookmarkModel?> getBookmarkById(int id) async {
    return _queryAdapter.query('SELECT * FROM bookmarks WHERE id = ?1',
        mapper: (Map<String, Object?> row) => BookmarkModel(
            id: row['id'] as int?,
            title: row['title'] as String,
            url: row['url'] as String,
            collectionId: row['collectionId'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertBookmark(BookmarkModel bookmark) async {
    await _bookmarkModelInsertionAdapter.insert(
        bookmark, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateBookmark(BookmarkModel bookmark) async {
    await _bookmarkModelUpdateAdapter.update(
        bookmark, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteBookmark(BookmarkModel bookmark) async {
    await _bookmarkModelDeletionAdapter.delete(bookmark);
  }
}

class _$CollectionDao extends CollectionDao {
  _$CollectionDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _collectionModelInsertionAdapter = InsertionAdapter(
            database,
            'collections',
            (CollectionModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _collectionModelUpdateAdapter = UpdateAdapter(
            database,
            'collections',
            ['id'],
            (CollectionModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _collectionModelDeletionAdapter = DeletionAdapter(
            database,
            'collections',
            ['id'],
            (CollectionModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CollectionModel> _collectionModelInsertionAdapter;

  final UpdateAdapter<CollectionModel> _collectionModelUpdateAdapter;

  final DeletionAdapter<CollectionModel> _collectionModelDeletionAdapter;

  @override
  Future<List<CollectionModel>> getAllCollections() async {
    return _queryAdapter.queryList('SELECT * FROM collections',
        mapper: (Map<String, Object?> row) => CollectionModel(
            id: row['id'] as int?, name: row['name'] as String));
  }

  @override
  Future<CollectionModel?> getCollectionById(int id) async {
    return _queryAdapter.query('SELECT * FROM collections WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            CollectionModel(id: row['id'] as int?, name: row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertCollection(CollectionModel collection) async {
    await _collectionModelInsertionAdapter.insert(
        collection, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCollection(CollectionModel collection) async {
    await _collectionModelUpdateAdapter.update(
        collection, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCollection(CollectionModel collection) async {
    await _collectionModelDeletionAdapter.delete(collection);
  }
}

class _$TagDao extends TagDao {
  _$TagDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _tagModelInsertionAdapter = InsertionAdapter(
            database,
            'tags',
            (TagModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _tagModelUpdateAdapter = UpdateAdapter(
            database,
            'tags',
            ['id'],
            (TagModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _tagModelDeletionAdapter = DeletionAdapter(
            database,
            'tags',
            ['id'],
            (TagModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TagModel> _tagModelInsertionAdapter;

  final UpdateAdapter<TagModel> _tagModelUpdateAdapter;

  final DeletionAdapter<TagModel> _tagModelDeletionAdapter;

  @override
  Future<List<TagModel>> getAllTags() async {
    return _queryAdapter.queryList('SELECT * FROM tags',
        mapper: (Map<String, Object?> row) =>
            TagModel(id: row['id'] as int?, name: row['name'] as String));
  }

  @override
  Future<TagModel?> getTagById(int id) async {
    return _queryAdapter.query('SELECT * FROM tags WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            TagModel(id: row['id'] as int?, name: row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertTag(TagModel tag) async {
    await _tagModelInsertionAdapter.insert(tag, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTag(TagModel tag) async {
    await _tagModelUpdateAdapter.update(tag, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTag(TagModel tag) async {
    await _tagModelDeletionAdapter.delete(tag);
  }
}
