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
    print("clearDb");
    await delete(users).go();
    await delete(trips).go();
    await delete(auths).go();
    await delete(plans).go();
  }

  // User
  Future<List<User>> selectUsers() => (select(users).get());
  Future<int> addUser(UsersCompanion user) => (into(users).insert(user));
  Future<List<User>> selectUser(String email, String pw) => (select(users)
        ..where((tbl) => tbl.userEmail.equals(email) & tbl.userPw.equals(pw)))
      .get();
  // Trip
  Future<List<Trip>> selectTrips(List<int> authIds) =>
      (select(trips)..where((tbl) => tbl.authId.isIn(authIds))).get();
  Future<List<Trip>> selectTrip(int tripId) =>
      (select(trips)..where((tbl) => tbl.tripId.equals(tripId))).get();
  Future<int> addTrip(TripsCompanion trip) => into(trips).insert(trip);

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
  Future<List<Plan>> selectPlans(int tripId) =>
      (select(plans)..where((tbl) => tbl.tripId.equals(tripId))).get();
  Future<int> addPlan(PlansCompanion plan) => (into(plans).insert(plan));
  @override
  int get schemaVersion => 1;
}
