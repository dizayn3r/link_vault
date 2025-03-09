class Bookmark {
  final int? id; // Ensure this field exists
  final String title;
  final String url;
  final int collectionId;

  Bookmark(
      {this.id,
      required this.title,
      required this.url,
      required this.collectionId});
}
