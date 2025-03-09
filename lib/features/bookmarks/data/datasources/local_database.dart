import 'dart:async'; // Add this import for StreamController

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../collections/data/local/collection_dao.dart';
import '../../../collections/data/models/collection_model.dart';
import '../../../tags/data/local/tag_dao.dart';
import '../../../tags/data/models/tag_model.dart';
import '../local/bookmark_dao.dart';
import '../models/bookmark_model.dart'; // Add this import for sqflite

part 'local_database.g.dart'; // Generated file

@Database(
  version: 1,
  entities: [BookmarkModel, CollectionModel, TagModel],
)
abstract class LocalDatabase extends FloorDatabase {
  BookmarkDao get bookmarkDao;
  CollectionDao get collectionDao;
  TagDao get tagDao;
}
