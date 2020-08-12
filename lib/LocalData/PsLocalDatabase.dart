// import 'package:moor_ffi/moor_ffi.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
// import 'package:moor/moor.dart';
// import 'dart:io';

// part 'PsLocalDatabase.g.dart';

// class Patients extends Table {
//   IntColumn get id => integer().autoIncrement().call();
//   TextColumn get ptName => text().withLength(min: 2, max: 4)();
//   DateTimeColumn get dateCreated => dateTime().nullable()();
//   BoolColumn get archived => boolean().withDefault(Constant(false))();
// }

// class Gad7s extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   IntColumn get ptID => integer()();
//   DateTimeColumn get dateCreated => dateTime()();
//   DateTimeColumn get dateLastUpdated => dateTime()();
//   IntColumn get q1 => integer().withDefault(Constant(0))();
//   IntColumn get q2 => integer().withDefault(Constant(0))();
//   IntColumn get q3 => integer().withDefault(Constant(0))();
//   IntColumn get q4 => integer().withDefault(Constant(0))();
//   IntColumn get q5 => integer().withDefault(Constant(0))();
//   IntColumn get q6 => integer().withDefault(Constant(0))();
//   IntColumn get q7 => integer().withDefault(Constant(0))();
// }

// // @UseMoor(tables: [Patients])
// // class PsychStationLocalDatabase extends _$PsychStationLocalDatabse {
// //   PsychStationLocalDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'PsychStationLocalDb.sqlite', logStatements: true));

// // @override
// // //implements schema version
// // int get schemaVersion => 1;
// // }

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'PsLocalDb1.sqlite'));
//     return VmDatabase(file);
//   });
// }

// @UseMoor(tables: [Patients, Gad7s])
// class PsLocalDb extends _$PsLocalDb {
//   PsLocalDb() : super(_openConnection());


//   @override
//   int get schemaVersion => 1;



// // Queries: to be placed in DataAccessObjects (DOAs) later

// //Patients
// Future<List<Patient>> getAllPatients() => select(patients).get();
// Stream<List<Patient>> watchAllPatients() => select(patients).watch();

// Future insertPatient(Patient pt) => into(patients).insert(pt);
// Future updatePatient(Patient pt) => update(patients).replace(pt);
// Future deletePatient(Patient pt) => delete(patients).delete(pt);

// //Gad7s

// Future<List<Gad7>> getAllGad7s() => select(gad7s).get();
// Stream<List<Gad7>> watchAllGad7s() => select(gad7s).watch();

// Future insertGad7(Gad7 gad7) => into(gad7s).insert(gad7);
// Future updateGad7(Gad7 gad7) => update(gad7s).replace(gad7);
// Future deleteGad7(Gad7 gad7) => delete(gad7s).delete(gad7);


//   }
