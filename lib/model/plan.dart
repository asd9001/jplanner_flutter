import 'package:drift/drift.dart';

class Plans extends Table {
  IntColumn get tripId => integer()(); // FK
  // IntColumn get userId => integer()(); // FK
  DateTimeColumn get planDate => dateTime()();
  IntColumn get planOrder => integer()();
  TextColumn get planSubject => text()();
  TextColumn get planContent => text()();
  IntColumn get planCategory => integer()();
  IntColumn get planType => integer()();
  DateTimeColumn get planTime => dateTime()();
  IntColumn get planDuration => integer()();
  IntColumn get planWallet => integer()();
  DateTimeColumn get planCreated => dateTime().withDefault(currentDateAndTime)();
}