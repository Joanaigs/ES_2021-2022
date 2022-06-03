import 'dart:async';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uni/model/entities/eat_at_feup_preference.dart';

/// Manages the Eat@Feup preferences database.
///
/// This database stores information about the user's food type preferences.
class EatAtFeupDatabase extends AppDatabase {
  static final createScript = //display INTEGER 0 or 1 as boolean
  '''CREATE TABLE eatAtFeupPreferences(foodType TEXT, display INTEGER, 
          order_ INTEGER)''';

  EatAtFeupDatabase()
      : super(
      'eatAtFeupPreferences.db',
      [
        createScript,
      ],
      onUpgrade: migrate,
      version: 3);

  /// Replaces all of the data in this database with [preferences].
  saveNewPreferences(List<EatAtFeupPreference> preferences) async {
    await deletePreferences();
    await _insertPreferences(preferences);
  }

  /// Returns a list containing all of the lectures stored in this database.
  Future<List<EatAtFeupPreference>> preferences() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    // Query the table for All The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('eatAtFeupPreferences');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return EatAtFeupPreference.fromDB(
        maps[i]['foodType'],
        maps[i]['display'],
        maps[i]['order_'],
      );
    });
  }

  /// Adds all items from [preferences] to this database.
  ///
  /// If a row with the same data is present, it will be replaced.
  Future<void> _insertPreferences(List<EatAtFeupPreference> preferences) async {
    for (EatAtFeupPreference pref in preferences) {
      await this.insertInDatabase(
        'eatAtFeupPreferences',
        pref.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  /// Deletes all of the data stored in this database.
  Future<void> deletePreferences() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    await db.delete('eatAtFeupPreferences');
  }

  /// Migrates [db] from [oldVersion] to [newVersion].
  ///
  /// *Note:* This operation only updates the schema of the tables present in
  /// the database and, as such, all data is lost.
  static FutureOr<void> migrate(
      Database db, int oldVersion, int newVersion) async {
    final batch = db.batch();
      batch.execute('DROP TABLE IF EXISTS eatAtFeupPreferences');
      batch.execute(createScript);
    await batch.commit();
  }
}
