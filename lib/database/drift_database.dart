import 'package:drift/drift.dart';
import 'package:j_planner/model/auth.dart';
import 'package:j_planner/model/plan.dart';
import 'package:j_planner/model/trip.dart';
import 'package:j_planner/model/user.dart';
import 'connection/connection.dart' as impl;
part 'drift_database.g.dart';

@DriftDatabase(tables: [
  Plans,
  Users,
  Trips,
  Auths,
])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(impl.connect());

  // Common
  Future<void> clearDb() async {
    delete(users);
    delete(trips);
    delete(auths);
    delete(plans);
  }

  // User
  Future<List<User>> selectUsers() => (select(users).get());
  Future<int> addUser(UsersCompanion user) => (into(users).insert(user));
  Future<List<User>> selectUser(String email, String pw) => (select(users)
        ..where((tbl) => tbl.userEmail.equals(email) & tbl.userPw.equals(pw)))
      .get();
  // Trip
  Future<List<Trip>> selectTrips(List<int> authIds) {
    return (select(trips)..where((tbl) => tbl.authId.isIn(authIds))).get();
  }

  Future<int> addTrip(TripsCompanion trip) {
    print("addTrip--------");
    print(trip);
    print("addTrip--------");
    return into(trips).insert(trip);
  }

  // Auth
  Future<int> addAuth(AuthsCompanion auth) => (into(auths).insert(auth));
  Future<int> addAuthOne(int userId) => (into(auths)
      .insert(AuthsCompanion(userId: Value(userId), authReadOnly: Value(0))));
  Future<List<Auth>> selectAuths(int userId) =>
      (select(auths)..where((tbl) => tbl.userId.equals(userId))).get();
  Future<List<Auth>> selectAuth(int authId, int userId) => (select(auths)
        ..where((tbl) => tbl.authId.equals(authId) & tbl.userId.equals(userId)))
      .get();
  // Plan
  @override
  int get schemaVersion => 1;
}
