import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/collection.dart';
import '../repositories/collection_repository.dart';

class UpdateCollection implements UseCase<void, Collection> {
  final CollectionRepository repository;

  UpdateCollection(this.repository);

  @override
  Future<Either<Failure, void>> call(Collection collection) async {
    return await repository.updateCollection(collection);
  }
}
