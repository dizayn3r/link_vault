import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/bookmark.dart';
import '../repositories/bookmark_repository.dart';

class UpdateBookmark implements UseCase<void, Bookmark> {
  final BookmarkRepository repository;

  UpdateBookmark(this.repository);

  @override
  Future<Either<Failure, void>> call(Bookmark bookmark) async {
    return await repository.updateBookmark(bookmark);
  }
}
