import 'package:floor/floor.dart';

import '../models/bookmark_model.dart';

@dao
abstract class BookmarkDao {
  @Query('SELECT * FROM bookmarks')
  Future<List<BookmarkModel>> getAllBookmarks();

  @Query('SELECT * FROM bookmarks WHERE id = :id')
  Future<BookmarkModel?> getBookmarkById(int id);

  @insert
  Future<void> insertBookmark(BookmarkModel bookmark);

  @update
  Future<void> updateBookmark(BookmarkModel bookmark);

  @delete
  Future<void> deleteBookmark(BookmarkModel bookmark);
}
