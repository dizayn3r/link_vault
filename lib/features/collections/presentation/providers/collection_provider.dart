import 'package:flutter/material.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/collection.dart';
import '../../domain/usecases/add_collection.dart';
import '../../domain/usecases/delete_collection.dart';
import '../../domain/usecases/get_collections.dart';
import '../../domain/usecases/update_collection.dart';

class CollectionProvider with ChangeNotifier {
  final GetCollections getCollectionsUsecase;
  final AddCollection addCollectionUsecase;
  final UpdateCollection updateCollectionUsecase;
  final DeleteCollection deleteCollectionUsecase;

  List<Collection> _collections = [];
  List<Collection> get collections => _collections;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  CollectionProvider({
    required this.getCollectionsUsecase,
    required this.addCollectionUsecase,
    required this.updateCollectionUsecase,
    required this.deleteCollectionUsecase,
  });

  Future<void> fetchCollections() async {
    final result = await getCollectionsUsecase(NoParams());
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
      },
      (collections) {
        _collections = collections;
        _errorMessage = null;
        notifyListeners();
      },
    );
  }

  Future<void> addCollection(Collection collection) async {
    final result = await addCollectionUsecase(collection);
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
      },
      (_) {
        _collections.add(collection);
        _errorMessage = null;
        notifyListeners();
      },
    );
  }

  Future<void> updateCollection(Collection collection) async {
    final result = await updateCollectionUsecase(collection);
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
      },
      (_) {
        final index = _collections.indexWhere((c) => c.id == collection.id);
        if (index != -1) {
          _collections[index] = collection;
          _errorMessage = null;
          notifyListeners();
        }
      },
    );
  }

  Future<void> deleteCollection(Collection collection) async {
    final result = await deleteCollectionUsecase(collection);
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
      },
      (_) {
        _collections.removeWhere((c) => c.id == collection.id);
        _errorMessage = null;
        notifyListeners();
      },
    );
  }
}
