import 'package:floor/floor.dart';

import '../models/tag_model.dart';

@dao
abstract class TagDao {
  @Query('SELECT * FROM tags')
  Future<List<TagModel>> getAllTags();

  @Query('SELECT * FROM tags WHERE id = :id')
  Future<TagModel?> getTagById(int id);

  @insert
  Future<void> insertTag(TagModel tag);

  @update
  Future<void> updateTag(TagModel tag);

  @delete
  Future<void> deleteTag(TagModel tag);
}
