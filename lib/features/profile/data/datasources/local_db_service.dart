// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:workmate/features/profile/data/models/profile_repository.dart';

// class LocalDbService {
//   static final LocalDbService _instance = LocalDbService._internal();
//   factory LocalDbService() => _instance;
//   LocalDbService._internal();

//   Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDb();
//     return _database!;
//   }

//   Future<Database> _initDb() async {
//     final path = join(await getDatabasesPath(), 'workmate.db');

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE profile(
//             id TEXT PRIMARY KEY,
//             name TEXT,
//             email TEXT,
//             avatar TEXT
//           )
//         ''');
//       },
//       onUpgrade: (db, oldVersion, newVersion) async {
//         // Handle future migrations here
//         // Example:
//         // if (oldVersion < 2) { await db.execute("ALTER TABLE profile ADD COLUMN phone TEXT"); }
//       },
//     );
//   }

//   Future<void> saveProfile(ProfileModel profile) async {
//     final db = await database;
//     try {
//       await db.insert(
//         'profile',
//         profile.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     } catch (e) {
//       throw Exception("Failed to save profile: $e");
//     }
//   }

//   Future<ProfileModel?> getProfile() async {
//     final db = await database;
//     try {
//       final result = await db.query('profile', limit: 1);
//       if (result.isNotEmpty) {
//         return ProfileModel.fromMap(result.first);
//       }
//       return null;
//     } catch (e) {
//       throw Exception("Failed to fetch profile: $e");
//     }
//   }

//   Future<void> deleteProfile() async {
//     final db = await database;
//     try {
//       await db.delete('profile');
//     } catch (e) {
//       throw Exception("Failed to delete profile: $e");
//     }
//   }
// }


// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:workmate/features/profile/data/models/profile_repository.dart';
//   // Corrected import

// class LocalDbService {
//   static final LocalDbService _instance = LocalDbService._internal();
//   factory LocalDbService() => _instance;
//   LocalDbService._internal();

//   Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDb();
//     return _database!;
//   }

//   Future<Database> _initDb() async {
//     final path = join(await getDatabasesPath(), 'workmate.db');

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE profile(
//             id TEXT PRIMARY KEY,
//             name TEXT,
//             email TEXT,
//             avatar TEXT
//           )
//         ''');
//       },
//       onUpgrade: (db, oldVersion, newVersion) async {
//         // Handle future migrations here
//       }
//     );
//   }

//   Future<void> saveProfile(ProfileModel profile) async {
//     final db = await database;
//     try {
//       await db.insert(
//         'profile',
//         profile.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     } catch (e) {
//       throw Exception("Failed to save profile: $e");
//     }
//   }

//   Future<ProfileModel?> getProfile() async {
//     final db = await database;
//     try {
//       final result = await db.query('profile', limit: 1);
//       if (result.isNotEmpty) {
//         return ProfileModel.fromMap(result.first);
//       }
//       return null;
//     } catch (e) {
//       throw Exception("Failed to fetch profile: $e");
//     }
//   }

//   Future<void> deleteProfile() async {
//     final db = await database;
//     try {
//       await db.delete('profile');
//     } catch (e) {
//       throw Exception("Failed to delete profile: $e");
//     }
//   }
// }

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 
import 'package:workmate/features/profile/data/models/profile_repository.dart'; // Corrected import

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
      onUpgrade: (db, oldVersion, newVersion) async {
        // Handle future migrations here
      }
    );
  }

  Future<void> saveProfile(ProfileModel profile) async {
    final db = await database;
    try {
      await db.insert(
        'profile',
        profile.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw Exception("Failed to save profile: $e");
    }
  }

  Future<ProfileModel?> getProfile() async {
    final db = await database;
    try {
      final result = await db.query('profile', limit: 1);
      if (result.isNotEmpty) {
        return ProfileModel.fromMap(result.first);
      }
      return null;
    } catch (e) {
      throw Exception("Failed to fetch profile: $e");
    }
  }

  Future<void> deleteProfile() async {
    final db = await database;
    try {
      await db.delete('profile');
    } catch (e) {
      throw Exception("Failed to delete profile: $e");
    }
  }
}