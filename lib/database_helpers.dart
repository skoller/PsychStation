// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';

//     // database table and column names
//     final String table_localPatients = 'patients';
//     final String column_ptId = '_id';
//     final String column_ptName = 'name';
//     final String column_archived = 'archived';

//     // data model class
//     class LocalPatient {

//       int id;
//       String name;
//       String archived;

//       LocalPatient();

//       // convenience constructor to create a Word object
//       LocalPatient.fromMap(Map<String, dynamic> map) {
//         id = map[column_ptId];
//         name = map[column_ptName];
//         archived = map[column_archived];
//       }

//       // convenience method to create a Map from this Word object
//       Map<String, dynamic> toMap() {
//         var map = <String, dynamic>{
//           column_ptName: name,
//           column_archived: archived
//         };
//         if (id != null) {
//           map[column_ptId] = id;
//         }
//         return map;
//       }
//     }

//     // singleton class to manage the database
//     class DatabaseHelper {

//       // This is the actual database filename that is saved in the docs directory.
//       static final _databaseName = "Ldb.db";
//       // Increment this version when you need to change the schema.
//       static final _databaseVersion = 1;

//       // Make this a singleton class.
//       DatabaseHelper._privateConstructor();
//       static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//       // Only allow a single open connection to the database.
//       static Database _database;
//       Future<Database> get database async {
//         if (_database != null) return _database;
//         _database = await _initDatabase();
//         return _database;
//       }

//       // open the database
//       _initDatabase() async {
//         // The path_provider plugin gets the right directory for Android or iOS.
//         Directory documentsDirectory = await getApplicationDocumentsDirectory();
//         String path = join(documentsDirectory.path, _databaseName);
//         // Open the database. Can also add an onUpdate callback parameter.
//         return await openDatabase(path,
//             version: _databaseVersion,
//             onCreate: _onCreate);
//       }

//       // SQL string to create the database 
//       Future _onCreate(Database db, int version) async {
//         await db.execute('''
//               CREATE TABLE $table_localPatients (
//                 $column_ptId INTEGER PRIMARY KEY,
//                 $column_ptName TEXT NOT NULL,
//                 $column_archived TEXT NOT NULL
//               )
//               ''');
//       }

//       // Database helper methods:

//       Future<int> insert(LocalPatient pt) async {
//         Database db = await database;
//         int id = await db.insert(table_localPatients, pt.toMap());
//         return id;
//       }



//       Future<LocalPatient> queryLocalPatients(int id) async {
//         Database db = await database;
//         List<Map> maps = await db.query(table_localPatients,
//             columns: [column_ptId, column_ptName, column_archived],
//             where: '$column_ptId = ?',
//             whereArgs: [id]);
//         if (maps.length > 0) {
//           return LocalPatient.fromMap(maps.first);
//         }
//         return null;
//       }

//       // TODO: queryAllWords()
//       // TODO: delete(int id)
//       // TODO: update(Word word)
//     }

//     //https://pusher.com/tutorials/local-data-flutter