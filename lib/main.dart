import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/bookmarks/data/datasources/local_database.dart';
import 'features/bookmarks/data/repositories/bookmark_repository_impl.dart';
import 'features/bookmarks/domain/usecases/add_bookmark.dart';
import 'features/bookmarks/domain/usecases/delete_bookmark.dart';
import 'features/bookmarks/domain/usecases/get_bookmarks.dart';
import 'features/bookmarks/domain/usecases/update_bookmark.dart';
import 'features/bookmarks/presentation/providers/bookmark_provider.dart';
import 'features/collections/data/repositories/collection_repository_impl.dart';
import 'features/collections/domain/usecases/add_collection.dart';
import 'features/collections/domain/usecases/delete_collection.dart';
import 'features/collections/domain/usecases/get_collections.dart';
import 'features/collections/domain/usecases/update_collection.dart';
import 'features/collections/presentation/providers/collection_provider.dart';
import 'features/settings/presentation/providers/theme_provider.dart';
import 'features/splash/persentation/pages/splash_screen.dart';
import 'features/tags/data/repositories/tag_repository_impl.dart';
import 'features/tags/domain/usecases/add_tag.dart';
import 'features/tags/domain/usecases/delete_tag.dart';
import 'features/tags/domain/usecases/get_tags.dart';
import 'features/tags/domain/usecases/update_tag.dart';
import 'features/tags/presentation/providers/tag_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = ThemeProvider();
  await themeProvider.init(); // Initialize theme before running the app

  final database =
      await $FloorLocalDatabase.databaseBuilder('app_database.db').build();
  final bookmarkRepository = BookmarkRepositoryImpl(database);
  final collectionRepository = CollectionRepositoryImpl(database);
  final tagRepository = TagRepositoryImpl(database);

  final getBookmarksUsecase = GetBookmarks(bookmarkRepository);
  final addBookmarkUsecase = AddBookmark(bookmarkRepository);
  final updateBookmarkUsecase = UpdateBookmark(bookmarkRepository);
  final deleteBookmarkUsecase = DeleteBookmark(bookmarkRepository);
  final getCollectionsUsecase = GetCollections(collectionRepository);
  final addCollectionUsecase = AddCollection(collectionRepository);
  final updateCollectionUsecase = UpdateCollection(collectionRepository);
  final deleteCollectionUsecase = DeleteCollection(collectionRepository);

  final getTagsUsecase = GetTags(tagRepository);
  final addTagUsecase = AddTag(tagRepository);
  final updateTagUsecase = UpdateTag(tagRepository);
  final deleteTagUsecase = DeleteTag(tagRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => BookmarkProvider(
            getBookmarksUsecase: getBookmarksUsecase,
            addBookmarkUsecase: addBookmarkUsecase,
            updateBookmarkUsecase: updateBookmarkUsecase,
            deleteBookmarkUsecase: deleteBookmarkUsecase,
          )..fetchBookmarks(),
        ),
        ChangeNotifierProvider(
          create: (_) => CollectionProvider(
            getCollectionsUsecase: getCollectionsUsecase,
            addCollectionUsecase: addCollectionUsecase,
            updateCollectionUsecase: updateCollectionUsecase,
            deleteCollectionUsecase: deleteCollectionUsecase,
          )..fetchCollections(),
        ),
        ChangeNotifierProvider(
          create: (_) => TagProvider(
            getTagsUsecase: getTagsUsecase,
            addTagUsecase: addTagUsecase,
            updateTagUsecase: updateTagUsecase,
            deleteTagUsecase: deleteTagUsecase,
          )..fetchTags(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Bookmark Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      home: const SplashScreen(),
    );
  }
}
