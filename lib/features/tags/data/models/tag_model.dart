import 'package:floor/floor.dart';

@Entity(tableName: 'tags') // Add @Entity annotation
class TagModel {
  @PrimaryKey(autoGenerate: true) // Add @PrimaryKey annotation
  final int? id;

  final String name;

  TagModel({this.id, required this.name});
}
