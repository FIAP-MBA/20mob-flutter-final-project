// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieModelDao _movieModelDaoInstance;

  ProfileModelDao _profileModelDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MovieModel` (`backdropPath` TEXT, `favorite` INTEGER, `homepage` TEXT, `id` INTEGER, `originalLanguage` TEXT, `originalTitle` TEXT, `overview` TEXT, `popularity` TEXT, `posterPath` TEXT, `releaseDate` TEXT, `title` TEXT, `uid` INTEGER, `voteAverage` TEXT, `voteCount` INTEGER, `year` TEXT, `idResponse` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProfileModel` (`id` INTEGER, `positionImage` INTEGER, `name` TEXT, `email` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieModelDao get movieModelDao {
    return _movieModelDaoInstance ??= _$MovieModelDao(database, changeListener);
  }

  @override
  ProfileModelDao get profileModelDao {
    return _profileModelDaoInstance ??=
        _$ProfileModelDao(database, changeListener);
  }
}

class _$MovieModelDao extends MovieModelDao {
  _$MovieModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _movieModelInsertionAdapter = InsertionAdapter(
            database,
            'MovieModel',
            (MovieModel item) => <String, dynamic>{
                  'backdropPath': item.backdropPath,
                  'favorite': item.favorite,
                  'homepage': item.homepage,
                  'id': item.id,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'releaseDate': item.releaseDate,
                  'title': item.title,
                  'uid': item.uid,
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount,
                  'year': item.year,
                  'idResponse': item.idResponse
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieModel> _movieModelInsertionAdapter;

  @override
  Future<List<MovieModel>> findAll(int idResponse) async {
    return _queryAdapter.queryList(
        'SELECT * FROM MovieModel WHERE idResponse = ?',
        arguments: <dynamic>[idResponse],
        mapper: (Map<String, dynamic> row) => MovieModel(
            backdropPath: row['backdropPath'] as String,
            favorite: row['favorite'] as int,
            homepage: row['homepage'] as String,
            id: row['id'] as int,
            originalLanguage: row['originalLanguage'] as String,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as String,
            posterPath: row['posterPath'] as String,
            releaseDate: row['releaseDate'] as String,
            title: row['title'] as String,
            uid: row['uid'] as int,
            voteAverage: row['voteAverage'] as String,
            voteCount: row['voteCount'] as int,
            year: row['year'] as String,
            idResponse: row['idResponse'] as int));
  }

  @override
  Future<int> insertMovie(MovieModel movie) {
    return _movieModelInsertionAdapter.insertAndReturnId(
        movie, OnConflictStrategy.replace);
  }
}

class _$ProfileModelDao extends ProfileModelDao {
  _$ProfileModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _profileModelInsertionAdapter = InsertionAdapter(
            database,
            'ProfileModel',
            (ProfileModel item) => <String, dynamic>{
                  'id': item.id,
                  'positionImage': item.positionImage,
                  'name': item.name,
                  'email': item.email
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProfileModel> _profileModelInsertionAdapter;

  @override
  Future<ProfileModel> findBy(int id) async {
    return _queryAdapter.query('SELECT * FROM ProfileModel WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => ProfileModel(
            row['positionImage'] as int,
            row['name'] as String,
            row['email'] as String));
  }

  @override
  Future<int> insertProfile(ProfileModel profile) {
    return _profileModelInsertionAdapter.insertAndReturnId(
        profile, OnConflictStrategy.replace);
  }
}
