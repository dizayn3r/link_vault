import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tag.dart';
import '../repositories/tag_repository.dart';

class DeleteTag implements UseCase<void, Tag> {
  final TagRepository repository;

  DeleteTag(this.repository);

  @override
  Future<Either<Failure, void>> call(Tag tag) async {
    return await repository.deleteTag(tag);
  }
}
