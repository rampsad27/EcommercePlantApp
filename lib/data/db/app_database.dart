import 'dart:developer' as developer;
import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:plant_app/data/db/converters/source_converter.dart';
import 'package:plant_app/data/db/news/news_dao.dart';
import 'package:plant_app/data/db/news/news_table.dart';
import 'package:plant_app/data/models/news_model.dart';
import 'package:sqlite3/sqlite3.dart' as s;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [NewsTable],
  daos: [NewsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          log("Schema Migration $m $from $to");
          if (from < schemaVersion) {
            for (var element in allTables) {
              await m.deleteTable(element.actualTableName);
              await m.createTable(element);
            }
          }
        },
      );
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    developer.log("Path is ${file.path}");

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    s.sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}


/* 

Users = [
  {
  'id': 23,
  'name': 'John Doe',
},
{
  'id': 24,
  'name': 'Jane Doe',
},
{
  'id': 25,
  'name': 'John Smith',
},

];


UserContact = [
  {
    "id": 23,
    "phone": "1234567890",
  },
  {
    "id": 24,
    "phone": "1234567891",
  },
  {
    "id": 25,
    "phone": "1234567892",
  },
  {
    "id": 26,
    "phone": "1234567893",
  }
];


UserData = [
  {
    "id": "23",
    "phone": "sdsd",
    "name": "John Doe",
  },
  {
    "id": "24",
    "phone": "sdsd",
    "name": "Jane Doe",
  },
  {
    "id": "25",
    "phone": "sdsd",
    "name": "John Smith",
  },
];

*/