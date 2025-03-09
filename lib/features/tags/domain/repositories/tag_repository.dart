import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../entities/tag.dart';

abstract class TagRepository {
  Future<Either<Failure, List<Tag>>> getTags();
  Future<Either<Failure, void>> addTag(Tag tag);
  Future<Either<Failure, void>> updateTag(Tag tag);
  Future<Either<Failure, void>> deleteTag(Tag tag);
}
