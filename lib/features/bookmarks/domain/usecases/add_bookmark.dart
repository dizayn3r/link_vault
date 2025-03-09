import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/bookmark.dart';
import '../repositories/bookmark_repository.dart';

class AddBookmark implements UseCase<void, Bookmark> {
  final BookmarkRepository repository;

  AddBookmark(this.repository);

  @override
  Future<Either<Failure, void>> call(Bookmark bookmark) async {
    return await repository.addBookmark(bookmark);
  }
}
