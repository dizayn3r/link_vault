# Create the root lib directory
New-Item -ItemType Directory -Path "lib" -Force

# Create core directories
New-Item -ItemType Directory -Path "lib/core" -Force
New-Item -ItemType Directory -Path "lib/core/constants" -Force
New-Item -ItemType Directory -Path "lib/core/errors" -Force
New-Item -ItemType Directory -Path "lib/core/usecases" -Force
New-Item -ItemType Directory -Path "lib/core/utils" -Force

# Create usecase.dart file
New-Item -ItemType File -Path "lib/core/usecases/usecase.dart" -Force

# Create features directory
New-Item -ItemType Directory -Path "lib/features" -Force

# Create bookmarks feature directories and files
New-Item -ItemType Directory -Path "lib/features/bookmarks" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/data" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/data/datasources" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/data/models" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/data/repositories" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/data/local" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/domain" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/domain/entities" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/domain/repositories" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/domain/usecases" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/presentation" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/presentation/providers" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/presentation/pages" -Force
New-Item -ItemType Directory -Path "lib/features/bookmarks/presentation/widgets" -Force
New-Item -ItemType File -Path "lib/features/bookmarks/data/datasources/local_database.dart" -Force
New-Item -ItemType File -Path "lib/features/bookmarks/data/models/bookmark_model.dart" -Force
New-Item -ItemType File -Path "lib/features/bookmarks/data/repositories/bookmark_repository_impl.dart" -Force
New-Item -ItemType File -Path "lib/features/bookmarks/data/local/bookmark_dao.dart" -Force
New-Item -ItemType File -Path "lib/features/bookmarks/domain/entities/bookmark.dart" -Force
New-Item -ItemType File -Path "lib/features/bookmarks/domain/repositories/bookmark_repository.dart" -Force
New-Item -ItemType File -Path "lib/features/bookmarks/domain/usecases/get_bookmarks.dart" -Force
New-Item -ItemType File -Path "lib/features/bookmarks/presentation/providers/bookmark_provider.dart" -Force
New-Item -ItemType File -Path "lib/features/bookmarks/presentation/pages/bookmark_list_screen.dart" -Force
New-Item -ItemType File -Path "lib/features/bookmarks/presentation/widgets/bookmark_item.dart" -Force

# Create collections feature directories and files
New-Item -ItemType Directory -Path "lib/features/collections" -Force
New-Item -ItemType Directory -Path "lib/features/collections/data" -Force
New-Item -ItemType Directory -Path "lib/features/collections/data/models" -Force
New-Item -ItemType Directory -Path "lib/features/collections/data/repositories" -Force
New-Item -ItemType Directory -Path "lib/features/collections/data/local" -Force
New-Item -ItemType Directory -Path "lib/features/collections/domain" -Force
New-Item -ItemType Directory -Path "lib/features/collections/domain/entities" -Force
New-Item -ItemType Directory -Path "lib/features/collections/domain/repositories" -Force
New-Item -ItemType Directory -Path "lib/features/collections/domain/usecases" -Force
New-Item -ItemType Directory -Path "lib/features/collections/presentation" -Force
New-Item -ItemType Directory -Path "lib/features/collections/presentation/providers" -Force
New-Item -ItemType Directory -Path "lib/features/collections/presentation/pages" -Force
New-Item -ItemType File -Path "lib/features/collections/data/models/collection_model.dart" -Force
New-Item -ItemType File -Path "lib/features/collections/data/repositories/collection_repository_impl.dart" -Force
New-Item -ItemType File -Path "lib/features/collections/data/local/collection_dao.dart" -Force
New-Item -ItemType File -Path "lib/features/collections/domain/entities/collection.dart" -Force
New-Item -ItemType File -Path "lib/features/collections/domain/repositories/collection_repository.dart" -Force
New-Item -ItemType File -Path "lib/features/collections/domain/usecases/get_collections.dart" -Force
New-Item -ItemType File -Path "lib/features/collections/presentation/providers/collection_provider.dart" -Force
New-Item -ItemType File -Path "lib/features/collections/presentation/pages/collection_list_screen.dart" -Force

# Create tags feature directories and files
New-Item -ItemType Directory -Path "lib/features/tags" -Force
New-Item -ItemType Directory -Path "lib/features/tags/data" -Force
New-Item -ItemType Directory -Path "lib/features/tags/data/models" -Force
New-Item -ItemType Directory -Path "lib/features/tags/data/repositories" -Force
New-Item -ItemType Directory -Path "lib/features/tags/data/local" -Force
New-Item -ItemType Directory -Path "lib/features/tags/domain" -Force
New-Item -ItemType Directory -Path "lib/features/tags/domain/entities" -Force
New-Item -ItemType Directory -Path "lib/features/tags/domain/repositories" -Force
New-Item -ItemType Directory -Path "lib/features/tags/domain/usecases" -Force
New-Item -ItemType Directory -Path "lib/features/tags/presentation" -Force
New-Item -ItemType Directory -Path "lib/features/tags/presentation/providers" -Force
New-Item -ItemType Directory -Path "lib/features/tags/presentation/pages" -Force
New-Item -ItemType File -Path "lib/features/tags/data/models/tag_model.dart" -Force
New-Item -ItemType File -Path "lib/features/tags/data/repositories/tag_repository_impl.dart" -Force
New-Item -ItemType File -Path "lib/features/tags/data/local/tag_dao.dart" -Force
New-Item -ItemType File -Path "lib/features/tags/domain/entities/tag.dart" -Force
New-Item -ItemType File -Path "lib/features/tags/domain/repositories/tag_repository.dart" -Force
New-Item -ItemType File -Path "lib/features/tags/domain/usecases/get_tags.dart" -Force
New-Item -ItemType File -Path "lib/features/tags/presentation/providers/tag_provider.dart" -Force
New-Item -ItemType File -Path "lib/features/tags/presentation/pages/tag_list_screen.dart" -Force