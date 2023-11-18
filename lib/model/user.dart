import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get userId => integer().autoIncrement()();
  TextColumn get userEmail => text()();
  TextColumn get userPw => text()();
  TextColumn get userName => text()();
}