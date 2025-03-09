import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tag.dart';
import '../repositories/tag_repository.dart';

class AddTag implements UseCase<void, Tag> {
  final TagRepository repository;

  AddTag(this.repository);

  @override
  Future<Either<Failure, void>> call(Tag tag) async {
    return await repository.addTag(tag);
  }
}
