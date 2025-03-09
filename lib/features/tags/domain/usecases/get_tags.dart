import 'package:dartz/dartz.dart';
import 'package:link_vault/core/errors/errors/failures.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/tag.dart';
import '../repositories/tag_repository.dart';

class GetTags implements UseCase<List<Tag>, NoParams> {
  final TagRepository repository;

  GetTags(this.repository);

  @override
  Future<Either<Failure, List<Tag>>> call(NoParams params) async {
    return await repository.getTags();
  }
}
