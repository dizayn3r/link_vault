import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/collection.dart';
import '../repositories/collection_repository.dart';

class GetCollections implements UseCase<List<Collection>, NoParams> {
  final CollectionRepository repository;

  GetCollections(this.repository);

  @override
  Future<Either<Failure, List<Collection>>> call(NoParams params) async {
    return await repository.getCollections();
  }
}
