import 'package:floor/floor.dart';

@Entity(tableName: 'collections')
class CollectionModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;

  CollectionModel({this.id, required this.name});
}
