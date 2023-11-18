import 'package:drift/drift.dart';

class Auths extends Table {
  IntColumn get authId => integer().autoIncrement()(); // PK
  IntColumn get userId => integer()(); // FK
  IntColumn get authReadOnly => integer()();
}