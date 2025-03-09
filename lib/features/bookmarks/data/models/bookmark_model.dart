import 'package:floor/floor.dart';

@Entity(tableName: 'bookmarks')
class BookmarkModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String title;
  final String url;
  final int collectionId;

  BookmarkModel({
    this.id,
    required this.title,
    required this.url,
    required this.collectionId,
  });
}
