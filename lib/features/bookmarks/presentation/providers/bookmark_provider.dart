import 'package:flutter/material.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/bookmark.dart';
import '../../domain/usecases/add_bookmark.dart';
import '../../domain/usecases/delete_bookmark.dart';
import '../../domain/usecases/get_bookmarks.dart';
import '../../domain/usecases/update_bookmark.dart';

class BookmarkProvider with ChangeNotifier {
  final GetBookmarks getBookmarksUsecase;
  final AddBookmark addBookmarkUsecase;
  final UpdateBookmark updateBookmarkUsecase;
  final DeleteBookmark deleteBookmarkUsecase;

  List<Bookmark> _bookmarks = [];
  List<Bookmark> get bookmarks => _bookmarks;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  BookmarkProvider({
    required this.getBookmarksUsecase,
    required this.addBookmarkUsecase,
    required this.updateBookmarkUsecase,
    required this.deleteBookmarkUsecase,
  });

  Future<void> fetchBookmarks() async {
    final result = await getBookmarksUsecase(NoParams());
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
      },
      (bookmarks) {
        _bookmarks = bookmarks;
        _errorMessage = null;
        notifyListeners();
      },
    );
  }

  Future<void> addBookmark(Bookmark bookmark) async {
    final result = await addBookmarkUsecase(bookmark);
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
      },
      (_) {
        _bookmarks.add(bookmark);
        _errorMessage = null;
        notifyListeners();
      },
    );
  }

  Future<void> updateBookmark(Bookmark bookmark) async {
    final result = await updateBookmarkUsecase(bookmark);
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
      },
      (_) {
        final index = _bookmarks.indexWhere((b) => b.id == bookmark.id);
        if (index != -1) {
          _bookmarks[index] = bookmark;
          _errorMessage = null;
          notifyListeners();
        }
      },
    );
  }

  Future<void> deleteBookmark(Bookmark bookmark) async {
    final result = await deleteBookmarkUsecase(bookmark);
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        notifyListeners();
      },
      (_) {
        _bookmarks.removeWhere((b) => b.id == bookmark.id);
        _errorMessage = null;
        notifyListeners();
      },
    );
  }
}
