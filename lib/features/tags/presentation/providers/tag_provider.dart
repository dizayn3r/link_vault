import 'package:flutter/material.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/tag.dart';
import '../../domain/usecases/add_tag.dart';
import '../../domain/usecases/delete_tag.dart';
import '../../domain/usecases/get_tags.dart';
import '../../domain/usecases/update_tag.dart';

class TagProvider with ChangeNotifier {
  final GetTags getTagsUsecase;
  final AddTag addTagUsecase;
  final UpdateTag updateTagUsecase;
  final DeleteTag deleteTagUsecase;

  List<Tag> _tags = [];
  List<Tag> get tags => _tags;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  TagProvider({
    required this.getTagsUsecase,
    required this.addTagUsecase,
    required this.updateTagUsecase,
    required this.deleteTagUsecase,
  });

  Future<void> fetchTags() async {
    final result = await getTagsUsecase(NoParams());
    result.fold(
      (failure) {
        _errorMessage = failure.message; // Set error message
        notifyListeners();
      },
      (tags) {
        _tags = tags;
        _errorMessage = null; // Clear error message
        notifyListeners();
      },
    );
  }

  Future<void> addTag(Tag tag) async {
    final result = await addTagUsecase(tag);
    result.fold(
      (failure) {
        _errorMessage = failure.message; // Set error message
        notifyListeners();
      },
      (_) {
        _tags.add(tag);
        _errorMessage = null; // Clear error message
        notifyListeners();
      },
    );
  }

  Future<void> updateTag(Tag tag) async {
    final result = await updateTagUsecase(tag);
    result.fold(
      (failure) {
        _errorMessage = failure.message; // Set error message
        notifyListeners();
      },
      (_) {
        final index = _tags.indexWhere((t) => t.id == tag.id);
        if (index != -1) {
          _tags[index] = tag;
          _errorMessage = null; // Clear error message
          notifyListeners();
        }
      },
    );
  }

  Future<void> deleteTag(Tag tag) async {
    final result = await deleteTagUsecase(tag);
    result.fold(
      (failure) {
        _errorMessage = failure.message; // Set error message
        notifyListeners();
      },
      (_) {
        _tags.removeWhere((t) => t.id == tag.id);
        _errorMessage = null; // Clear error message
        notifyListeners();
      },
    );
  }
}
