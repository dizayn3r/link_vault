import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/collection.dart';
import '../repositories/collection_repository.dart';

class AddCollection implements UseCase<void, Collection> {
  final CollectionRepository repository;

  AddCollection(this.repository);

  @override
  Future<Either<Failure, void>> call(Collection collection) async {
    return await repository.addCollection(collection);
  }
}
