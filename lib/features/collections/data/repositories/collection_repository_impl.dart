import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../../../bookmarks/data/datasources/local_database.dart';
import '../../domain/entities/collection.dart';
import '../../domain/repositories/collection_repository.dart';
import '../models/collection_model.dart';

class CollectionRepositoryImpl implements CollectionRepository {
  final LocalDatabase localDatabase;

  CollectionRepositoryImpl(this.localDatabase);

  @override
  Future<Either<Failure, List<Collection>>> getCollections() async {
    try {
      final models = await localDatabase.collectionDao.getAllCollections();
      final collections = models
          .map((model) => Collection(
                id: model.id,
                name: model.name,
              ))
          .toList();
      return Right(collections);
    } catch (e) {
      return Left(DatabaseFailure('Failed to fetch collections: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> addCollection(Collection collection) async {
    try {
      final model = CollectionModel(
        id: collection.id,
        name: collection.name,
      );
      await localDatabase.collectionDao.insertCollection(model);
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to add collection: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateCollection(Collection collection) async {
    try {
      final model = CollectionModel(
        id: collection.id,
        name: collection.name,
      );
      await localDatabase.collectionDao.updateCollection(model);
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to update collection: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCollection(Collection collection) async {
    try {
      final model = CollectionModel(
        id: collection.id,
        name: collection.name,
      );
      await localDatabase.collectionDao.deleteCollection(model);
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to delete collection: $e'));
    }
  }
}
