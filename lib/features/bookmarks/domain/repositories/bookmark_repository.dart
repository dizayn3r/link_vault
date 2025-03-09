import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../entities/bookmark.dart';

abstract class BookmarkRepository {
  Future<Either<Failure, List<Bookmark>>> getBookmarks();
  Future<Either<Failure, void>> addBookmark(Bookmark bookmark);
  Future<Either<Failure, void>> updateBookmark(Bookmark bookmark);
  Future<Either<Failure, void>> deleteBookmark(Bookmark bookmark);
}
