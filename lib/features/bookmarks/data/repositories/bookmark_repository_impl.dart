import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../../domain/entities/bookmark.dart';
import '../../domain/repositories/bookmark_repository.dart';
import '../datasources/local_database.dart';
import '../models/bookmark_model.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final LocalDatabase localDatabase;

  BookmarkRepositoryImpl(this.localDatabase);

  @override
  Future<Either<Failure, List<Bookmark>>> getBookmarks() async {
    try {
      final models = await localDatabase.bookmarkDao.getAllBookmarks();
      final bookmarks = models
          .map((model) => Bookmark(
                id: model.id,
                title: model.title,
                url: model.url,
                collectionId: model.collectionId,
              ))
          .toList();
      return Right(bookmarks);
    } catch (e) {
      return Left(DatabaseFailure('Failed to fetch bookmarks: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> addBookmark(Bookmark bookmark) async {
    try {
      final model = BookmarkModel(
        id: bookmark.id,
        title: bookmark.title,
        url: bookmark.url,
        collectionId: bookmark.collectionId,
      );
      await localDatabase.bookmarkDao.insertBookmark(model);
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to add bookmark: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateBookmark(Bookmark bookmark) async {
    try {
      final model = BookmarkModel(
        id: bookmark.id,
        title: bookmark.title,
        url: bookmark.url,
        collectionId: bookmark.collectionId,
      );
      await localDatabase.bookmarkDao.updateBookmark(model);
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to update bookmark: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteBookmark(Bookmark bookmark) async {
    try {
      final model = BookmarkModel(
        id: bookmark.id,
        title: bookmark.title,
        url: bookmark.url,
        collectionId: bookmark.collectionId,
      );
      await localDatabase.bookmarkDao.deleteBookmark(model);
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to delete bookmark: $e'));
    }
  }
}
