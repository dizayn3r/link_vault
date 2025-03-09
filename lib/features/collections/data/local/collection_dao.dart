import 'package:floor/floor.dart';

import '../models/collection_model.dart';

@dao
abstract class CollectionDao {
  @Query('SELECT * FROM collections')
  Future<List<CollectionModel>> getAllCollections();

  @Query('SELECT * FROM collections WHERE id = :id')
  Future<CollectionModel?> getCollectionById(int id);

  @insert
  Future<void> insertCollection(CollectionModel collection);

  @update
  Future<void> updateCollection(CollectionModel collection);

  @delete
  Future<void> deleteCollection(CollectionModel collection);
}
