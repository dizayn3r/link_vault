import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/bookmark.dart';
import '../repositories/bookmark_repository.dart';

class GetBookmarks implements UseCase<List<Bookmark>, NoParams> {
  final BookmarkRepository repository;

  GetBookmarks(this.repository);

  @override
  Future<Either<Failure, List<Bookmark>>> call(NoParams params) async {
    return await repository.getBookmarks();
  }
}
