import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tag.dart';
import '../repositories/tag_repository.dart';

class UpdateTag implements UseCase<void, Tag> {
  final TagRepository repository;

  UpdateTag(this.repository);

  @override
  Future<Either<Failure, void>> call(Tag tag) async {
    return await repository.updateTag(tag);
  }
}
