import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../../../bookmarks/data/datasources/local_database.dart';
import '../../domain/entities/tag.dart';
import '../../domain/repositories/tag_repository.dart';
import '../models/tag_model.dart';

class TagRepositoryImpl implements TagRepository {
  final LocalDatabase localDatabase;

  TagRepositoryImpl(this.localDatabase);

  @override
  Future<Either<Failure, List<Tag>>> getTags() async {
    try {
      final models = await localDatabase.tagDao.getAllTags();
      final tags = models
          .map((model) => Tag(
                id: model.id,
                name: model.name,
              ))
          .toList();
      return Right(tags);
    } catch (e) {
      return Left(DatabaseFailure('Failed to fetch tags: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> addTag(Tag tag) async {
    try {
      final model = TagModel(
        id: tag.id,
        name: tag.name,
      );
      await localDatabase.tagDao.insertTag(model);
      return Right(null); // Return Right with null for void methods
    } catch (e) {
      return Left(DatabaseFailure('Failed to add tag: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTag(Tag tag) async {
    try {
      final model = TagModel(
        id: tag.id,
        name: tag.name,
      );
      await localDatabase.tagDao.updateTag(model);
      return Right(null); // Return Right with null for void methods
    } catch (e) {
      return Left(DatabaseFailure('Failed to update tag: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTag(Tag tag) async {
    try {
      final model = TagModel(
        id: tag.id,
        name: tag.name,
      );
      await localDatabase.tagDao.deleteTag(model);
      return Right(null); // Return Right with null for void methods
    } catch (e) {
      return Left(DatabaseFailure('Failed to delete tag: $e'));
    }
  }
}
