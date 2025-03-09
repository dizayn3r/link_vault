import 'package:dartz/dartz.dart';
import 'package:link_vault/core/errors/errors/failures.dart';

import '../entities/collection.dart';

abstract class CollectionRepository {
  Future<Either<Failure, List<Collection>>> getCollections();
  Future<Either<Failure, void>> addCollection(Collection collection);
  Future<Either<Failure, void>> updateCollection(Collection collection);
  Future<Either<Failure, void>> deleteCollection(Collection collection);
}
