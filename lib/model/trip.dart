import 'package:drift/drift.dart';

class Trips extends Table {
  IntColumn get id => integer().autoIncrement()(); // PK
  IntColumn get authId => integer()(); // FK
  DateTimeColumn get tripStartDate => dateTime()();
  DateTimeColumn get tripEndDate => dateTime()();
  TextColumn get tripCountry => text()();
}