import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:workmate/features/profile/data/models/profile_repository.dart';
 

class LocalDbService {
  static final LocalDbService _instance = LocalDbService._internal();
  factory LocalDbService() => _instance;
  LocalDbService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'workmate.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE profile(
            id TEXT PRIMARY KEY,
            name TEXT,
            email TEXT,
            avatar TEXT
          )
        ''');
      },
    );
  }

  Future<void> saveProfile(ProfileModel profile) async {
    final db = await database;
    await db.insert(
      'profile',
      profile.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<ProfileModel?> getProfile() async {
    final db = await database;
    final result = await db.query('profile', limit: 1);
    if (result.isNotEmpty) {
      return ProfileModel.fromMap(result.first);
    }
    return null;
  }

  Future<void> deleteProfile() async {
    final db = await database;
    await db.delete('profile');
  }
}
