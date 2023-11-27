// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $PlansTable extends Plans with TableInfo<$PlansTable, Plan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _authIdMeta = const VerificationMeta('authId');
  @override
  late final GeneratedColumn<int> authId = GeneratedColumn<int>(
      'auth_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _planOrderMeta =
      const VerificationMeta('planOrder');
  @override
  late final GeneratedColumn<int> planOrder = GeneratedColumn<int>(
      'plan_order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _planSubjectMeta =
      const VerificationMeta('planSubject');
  @override
  late final GeneratedColumn<String> planSubject = GeneratedColumn<String>(
      'plan_subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _planContentMeta =
      const VerificationMeta('planContent');
  @override
  late final GeneratedColumn<String> planContent = GeneratedColumn<String>(
      'plan_content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _planCategoryMeta =
      const VerificationMeta('planCategory');
  @override
  late final GeneratedColumn<int> planCategory = GeneratedColumn<int>(
      'plan_category', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _planTypeMeta =
      const VerificationMeta('planType');
  @override
  late final GeneratedColumn<int> planType = GeneratedColumn<int>(
      'plan_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _planTimeMeta =
      const VerificationMeta('planTime');
  @override
  late final GeneratedColumn<DateTime> planTime = GeneratedColumn<DateTime>(
      'plan_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _planDurationMeta =
      const VerificationMeta('planDuration');
  @override
  late final GeneratedColumn<int> planDuration = GeneratedColumn<int>(
      'plan_duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _planWalletMeta =
      const VerificationMeta('planWallet');
  @override
  late final GeneratedColumn<int> planWallet = GeneratedColumn<int>(
      'plan_wallet', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        authId,
        userId,
        planOrder,
        planSubject,
        planContent,
        planCategory,
        planType,
        planTime,
        planDuration,
        planWallet
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plans';
  @override
  VerificationContext validateIntegrity(Insertable<Plan> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('auth_id')) {
      context.handle(_authIdMeta,
          authId.isAcceptableOrUnknown(data['auth_id']!, _authIdMeta));
    } else if (isInserting) {
      context.missing(_authIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('plan_order')) {
      context.handle(_planOrderMeta,
          planOrder.isAcceptableOrUnknown(data['plan_order']!, _planOrderMeta));
    } else if (isInserting) {
      context.missing(_planOrderMeta);
    }
    if (data.containsKey('plan_subject')) {
      context.handle(
          _planSubjectMeta,
          planSubject.isAcceptableOrUnknown(
              data['plan_subject']!, _planSubjectMeta));
    } else if (isInserting) {
      context.missing(_planSubjectMeta);
    }
    if (data.containsKey('plan_content')) {
      context.handle(
          _planContentMeta,
          planContent.isAcceptableOrUnknown(
              data['plan_content']!, _planContentMeta));
    } else if (isInserting) {
      context.missing(_planContentMeta);
    }
    if (data.containsKey('plan_category')) {
      context.handle(
          _planCategoryMeta,
          planCategory.isAcceptableOrUnknown(
              data['plan_category']!, _planCategoryMeta));
    } else if (isInserting) {
      context.missing(_planCategoryMeta);
    }
    if (data.containsKey('plan_type')) {
      context.handle(_planTypeMeta,
          planType.isAcceptableOrUnknown(data['plan_type']!, _planTypeMeta));
    } else if (isInserting) {
      context.missing(_planTypeMeta);
    }
    if (data.containsKey('plan_time')) {
      context.handle(_planTimeMeta,
          planTime.isAcceptableOrUnknown(data['plan_time']!, _planTimeMeta));
    } else if (isInserting) {
      context.missing(_planTimeMeta);
    }
    if (data.containsKey('plan_duration')) {
      context.handle(
          _planDurationMeta,
          planDuration.isAcceptableOrUnknown(
              data['plan_duration']!, _planDurationMeta));
    } else if (isInserting) {
      context.missing(_planDurationMeta);
    }
    if (data.containsKey('plan_wallet')) {
      context.handle(
          _planWalletMeta,
          planWallet.isAcceptableOrUnknown(
              data['plan_wallet']!, _planWalletMeta));
    } else if (isInserting) {
      context.missing(_planWalletMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Plan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Plan(
      authId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}auth_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      planOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plan_order'])!,
      planSubject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_subject'])!,
      planContent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_content'])!,
      planCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plan_category'])!,
      planType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plan_type'])!,
      planTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}plan_time'])!,
      planDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plan_duration'])!,
      planWallet: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plan_wallet'])!,
    );
  }

  @override
  $PlansTable createAlias(String alias) {
    return $PlansTable(attachedDatabase, alias);
  }
}

class Plan extends DataClass implements Insertable<Plan> {
  final int authId;
  final int userId;
  final int planOrder;
  final String planSubject;
  final String planContent;
  final int planCategory;
  final int planType;
  final DateTime planTime;
  final int planDuration;
  final int planWallet;
  const Plan(
      {required this.authId,
      required this.userId,
      required this.planOrder,
      required this.planSubject,
      required this.planContent,
      required this.planCategory,
      required this.planType,
      required this.planTime,
      required this.planDuration,
      required this.planWallet});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['auth_id'] = Variable<int>(authId);
    map['user_id'] = Variable<int>(userId);
    map['plan_order'] = Variable<int>(planOrder);
    map['plan_subject'] = Variable<String>(planSubject);
    map['plan_content'] = Variable<String>(planContent);
    map['plan_category'] = Variable<int>(planCategory);
    map['plan_type'] = Variable<int>(planType);
    map['plan_time'] = Variable<DateTime>(planTime);
    map['plan_duration'] = Variable<int>(planDuration);
    map['plan_wallet'] = Variable<int>(planWallet);
    return map;
  }

  PlansCompanion toCompanion(bool nullToAbsent) {
    return PlansCompanion(
      authId: Value(authId),
      userId: Value(userId),
      planOrder: Value(planOrder),
      planSubject: Value(planSubject),
      planContent: Value(planContent),
      planCategory: Value(planCategory),
      planType: Value(planType),
      planTime: Value(planTime),
      planDuration: Value(planDuration),
      planWallet: Value(planWallet),
    );
  }

  factory Plan.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Plan(
      authId: serializer.fromJson<int>(json['authId']),
      userId: serializer.fromJson<int>(json['userId']),
      planOrder: serializer.fromJson<int>(json['planOrder']),
      planSubject: serializer.fromJson<String>(json['planSubject']),
      planContent: serializer.fromJson<String>(json['planContent']),
      planCategory: serializer.fromJson<int>(json['planCategory']),
      planType: serializer.fromJson<int>(json['planType']),
      planTime: serializer.fromJson<DateTime>(json['planTime']),
      planDuration: serializer.fromJson<int>(json['planDuration']),
      planWallet: serializer.fromJson<int>(json['planWallet']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'authId': serializer.toJson<int>(authId),
      'userId': serializer.toJson<int>(userId),
      'planOrder': serializer.toJson<int>(planOrder),
      'planSubject': serializer.toJson<String>(planSubject),
      'planContent': serializer.toJson<String>(planContent),
      'planCategory': serializer.toJson<int>(planCategory),
      'planType': serializer.toJson<int>(planType),
      'planTime': serializer.toJson<DateTime>(planTime),
      'planDuration': serializer.toJson<int>(planDuration),
      'planWallet': serializer.toJson<int>(planWallet),
    };
  }

  Plan copyWith(
          {int? authId,
          int? userId,
          int? planOrder,
          String? planSubject,
          String? planContent,
          int? planCategory,
          int? planType,
          DateTime? planTime,
          int? planDuration,
          int? planWallet}) =>
      Plan(
        authId: authId ?? this.authId,
        userId: userId ?? this.userId,
        planOrder: planOrder ?? this.planOrder,
        planSubject: planSubject ?? this.planSubject,
        planContent: planContent ?? this.planContent,
        planCategory: planCategory ?? this.planCategory,
        planType: planType ?? this.planType,
        planTime: planTime ?? this.planTime,
        planDuration: planDuration ?? this.planDuration,
        planWallet: planWallet ?? this.planWallet,
      );
  @override
  String toString() {
    return (StringBuffer('Plan(')
          ..write('authId: $authId, ')
          ..write('userId: $userId, ')
          ..write('planOrder: $planOrder, ')
          ..write('planSubject: $planSubject, ')
          ..write('planContent: $planContent, ')
          ..write('planCategory: $planCategory, ')
          ..write('planType: $planType, ')
          ..write('planTime: $planTime, ')
          ..write('planDuration: $planDuration, ')
          ..write('planWallet: $planWallet')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(authId, userId, planOrder, planSubject,
      planContent, planCategory, planType, planTime, planDuration, planWallet);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plan &&
          other.authId == this.authId &&
          other.userId == this.userId &&
          other.planOrder == this.planOrder &&
          other.planSubject == this.planSubject &&
          other.planContent == this.planContent &&
          other.planCategory == this.planCategory &&
          other.planType == this.planType &&
          other.planTime == this.planTime &&
          other.planDuration == this.planDuration &&
          other.planWallet == this.planWallet);
}

class PlansCompanion extends UpdateCompanion<Plan> {
  final Value<int> authId;
  final Value<int> userId;
  final Value<int> planOrder;
  final Value<String> planSubject;
  final Value<String> planContent;
  final Value<int> planCategory;
  final Value<int> planType;
  final Value<DateTime> planTime;
  final Value<int> planDuration;
  final Value<int> planWallet;
  final Value<int> rowid;
  const PlansCompanion({
    this.authId = const Value.absent(),
    this.userId = const Value.absent(),
    this.planOrder = const Value.absent(),
    this.planSubject = const Value.absent(),
    this.planContent = const Value.absent(),
    this.planCategory = const Value.absent(),
    this.planType = const Value.absent(),
    this.planTime = const Value.absent(),
    this.planDuration = const Value.absent(),
    this.planWallet = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlansCompanion.insert({
    required int authId,
    required int userId,
    required int planOrder,
    required String planSubject,
    required String planContent,
    required int planCategory,
    required int planType,
    required DateTime planTime,
    required int planDuration,
    required int planWallet,
    this.rowid = const Value.absent(),
  })  : authId = Value(authId),
        userId = Value(userId),
        planOrder = Value(planOrder),
        planSubject = Value(planSubject),
        planContent = Value(planContent),
        planCategory = Value(planCategory),
        planType = Value(planType),
        planTime = Value(planTime),
        planDuration = Value(planDuration),
        planWallet = Value(planWallet);
  static Insertable<Plan> custom({
    Expression<int>? authId,
    Expression<int>? userId,
    Expression<int>? planOrder,
    Expression<String>? planSubject,
    Expression<String>? planContent,
    Expression<int>? planCategory,
    Expression<int>? planType,
    Expression<DateTime>? planTime,
    Expression<int>? planDuration,
    Expression<int>? planWallet,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (authId != null) 'auth_id': authId,
      if (userId != null) 'user_id': userId,
      if (planOrder != null) 'plan_order': planOrder,
      if (planSubject != null) 'plan_subject': planSubject,
      if (planContent != null) 'plan_content': planContent,
      if (planCategory != null) 'plan_category': planCategory,
      if (planType != null) 'plan_type': planType,
      if (planTime != null) 'plan_time': planTime,
      if (planDuration != null) 'plan_duration': planDuration,
      if (planWallet != null) 'plan_wallet': planWallet,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlansCompanion copyWith(
      {Value<int>? authId,
      Value<int>? userId,
      Value<int>? planOrder,
      Value<String>? planSubject,
      Value<String>? planContent,
      Value<int>? planCategory,
      Value<int>? planType,
      Value<DateTime>? planTime,
      Value<int>? planDuration,
      Value<int>? planWallet,
      Value<int>? rowid}) {
    return PlansCompanion(
      authId: authId ?? this.authId,
      userId: userId ?? this.userId,
      planOrder: planOrder ?? this.planOrder,
      planSubject: planSubject ?? this.planSubject,
      planContent: planContent ?? this.planContent,
      planCategory: planCategory ?? this.planCategory,
      planType: planType ?? this.planType,
      planTime: planTime ?? this.planTime,
      planDuration: planDuration ?? this.planDuration,
      planWallet: planWallet ?? this.planWallet,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (authId.present) {
      map['auth_id'] = Variable<int>(authId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (planOrder.present) {
      map['plan_order'] = Variable<int>(planOrder.value);
    }
    if (planSubject.present) {
      map['plan_subject'] = Variable<String>(planSubject.value);
    }
    if (planContent.present) {
      map['plan_content'] = Variable<String>(planContent.value);
    }
    if (planCategory.present) {
      map['plan_category'] = Variable<int>(planCategory.value);
    }
    if (planType.present) {
      map['plan_type'] = Variable<int>(planType.value);
    }
    if (planTime.present) {
      map['plan_time'] = Variable<DateTime>(planTime.value);
    }
    if (planDuration.present) {
      map['plan_duration'] = Variable<int>(planDuration.value);
    }
    if (planWallet.present) {
      map['plan_wallet'] = Variable<int>(planWallet.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlansCompanion(')
          ..write('authId: $authId, ')
          ..write('userId: $userId, ')
          ..write('planOrder: $planOrder, ')
          ..write('planSubject: $planSubject, ')
          ..write('planContent: $planContent, ')
          ..write('planCategory: $planCategory, ')
          ..write('planType: $planType, ')
          ..write('planTime: $planTime, ')
          ..write('planDuration: $planDuration, ')
          ..write('planWallet: $planWallet, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userEmailMeta =
      const VerificationMeta('userEmail');
  @override
  late final GeneratedColumn<String> userEmail = GeneratedColumn<String>(
      'user_email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userPwMeta = const VerificationMeta('userPw');
  @override
  late final GeneratedColumn<String> userPw = GeneratedColumn<String>(
      'user_pw', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userId, userEmail, userPw, userName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('user_email')) {
      context.handle(_userEmailMeta,
          userEmail.isAcceptableOrUnknown(data['user_email']!, _userEmailMeta));
    } else if (isInserting) {
      context.missing(_userEmailMeta);
    }
    if (data.containsKey('user_pw')) {
      context.handle(_userPwMeta,
          userPw.isAcceptableOrUnknown(data['user_pw']!, _userPwMeta));
    } else if (isInserting) {
      context.missing(_userPwMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      userEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_email'])!,
      userPw: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_pw'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int userId;
  final String userEmail;
  final String userPw;
  final String userName;
  const User(
      {required this.userId,
      required this.userEmail,
      required this.userPw,
      required this.userName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['user_email'] = Variable<String>(userEmail);
    map['user_pw'] = Variable<String>(userPw);
    map['user_name'] = Variable<String>(userName);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userId: Value(userId),
      userEmail: Value(userEmail),
      userPw: Value(userPw),
      userName: Value(userName),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      userId: serializer.fromJson<int>(json['userId']),
      userEmail: serializer.fromJson<String>(json['userEmail']),
      userPw: serializer.fromJson<String>(json['userPw']),
      userName: serializer.fromJson<String>(json['userName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'userEmail': serializer.toJson<String>(userEmail),
      'userPw': serializer.toJson<String>(userPw),
      'userName': serializer.toJson<String>(userName),
    };
  }

  User copyWith(
          {int? userId, String? userEmail, String? userPw, String? userName}) =>
      User(
        userId: userId ?? this.userId,
        userEmail: userEmail ?? this.userEmail,
        userPw: userPw ?? this.userPw,
        userName: userName ?? this.userName,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('userId: $userId, ')
          ..write('userEmail: $userEmail, ')
          ..write('userPw: $userPw, ')
          ..write('userName: $userName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, userEmail, userPw, userName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.userId == this.userId &&
          other.userEmail == this.userEmail &&
          other.userPw == this.userPw &&
          other.userName == this.userName);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> userId;
  final Value<String> userEmail;
  final Value<String> userPw;
  final Value<String> userName;
  const UsersCompanion({
    this.userId = const Value.absent(),
    this.userEmail = const Value.absent(),
    this.userPw = const Value.absent(),
    this.userName = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userId = const Value.absent(),
    required String userEmail,
    required String userPw,
    required String userName,
  })  : userEmail = Value(userEmail),
        userPw = Value(userPw),
        userName = Value(userName);
  static Insertable<User> custom({
    Expression<int>? userId,
    Expression<String>? userEmail,
    Expression<String>? userPw,
    Expression<String>? userName,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (userEmail != null) 'user_email': userEmail,
      if (userPw != null) 'user_pw': userPw,
      if (userName != null) 'user_name': userName,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? userId,
      Value<String>? userEmail,
      Value<String>? userPw,
      Value<String>? userName}) {
    return UsersCompanion(
      userId: userId ?? this.userId,
      userEmail: userEmail ?? this.userEmail,
      userPw: userPw ?? this.userPw,
      userName: userName ?? this.userName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (userEmail.present) {
      map['user_email'] = Variable<String>(userEmail.value);
    }
    if (userPw.present) {
      map['user_pw'] = Variable<String>(userPw.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userId: $userId, ')
          ..write('userEmail: $userEmail, ')
          ..write('userPw: $userPw, ')
          ..write('userName: $userName')
          ..write(')'))
        .toString();
  }
}

class $TripsTable extends Trips with TableInfo<$TripsTable, Trip> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _authIdMeta = const VerificationMeta('authId');
  @override
  late final GeneratedColumn<int> authId = GeneratedColumn<int>(
      'auth_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tripStartDateMeta =
      const VerificationMeta('tripStartDate');
  @override
  late final GeneratedColumn<DateTime> tripStartDate =
      GeneratedColumn<DateTime>('trip_start_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _tripEndDateMeta =
      const VerificationMeta('tripEndDate');
  @override
  late final GeneratedColumn<DateTime> tripEndDate = GeneratedColumn<DateTime>(
      'trip_end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _tripCountryMeta =
      const VerificationMeta('tripCountry');
  @override
  late final GeneratedColumn<String> tripCountry = GeneratedColumn<String>(
      'trip_country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, authId, tripStartDate, tripEndDate, tripCountry];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trips';
  @override
  VerificationContext validateIntegrity(Insertable<Trip> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('auth_id')) {
      context.handle(_authIdMeta,
          authId.isAcceptableOrUnknown(data['auth_id']!, _authIdMeta));
    } else if (isInserting) {
      context.missing(_authIdMeta);
    }
    if (data.containsKey('trip_start_date')) {
      context.handle(
          _tripStartDateMeta,
          tripStartDate.isAcceptableOrUnknown(
              data['trip_start_date']!, _tripStartDateMeta));
    } else if (isInserting) {
      context.missing(_tripStartDateMeta);
    }
    if (data.containsKey('trip_end_date')) {
      context.handle(
          _tripEndDateMeta,
          tripEndDate.isAcceptableOrUnknown(
              data['trip_end_date']!, _tripEndDateMeta));
    } else if (isInserting) {
      context.missing(_tripEndDateMeta);
    }
    if (data.containsKey('trip_country')) {
      context.handle(
          _tripCountryMeta,
          tripCountry.isAcceptableOrUnknown(
              data['trip_country']!, _tripCountryMeta));
    } else if (isInserting) {
      context.missing(_tripCountryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Trip map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trip(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      authId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}auth_id'])!,
      tripStartDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}trip_start_date'])!,
      tripEndDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}trip_end_date'])!,
      tripCountry: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trip_country'])!,
    );
  }

  @override
  $TripsTable createAlias(String alias) {
    return $TripsTable(attachedDatabase, alias);
  }
}

class Trip extends DataClass implements Insertable<Trip> {
  final int id;
  final int authId;
  final DateTime tripStartDate;
  final DateTime tripEndDate;
  final String tripCountry;
  const Trip(
      {required this.id,
      required this.authId,
      required this.tripStartDate,
      required this.tripEndDate,
      required this.tripCountry});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['auth_id'] = Variable<int>(authId);
    map['trip_start_date'] = Variable<DateTime>(tripStartDate);
    map['trip_end_date'] = Variable<DateTime>(tripEndDate);
    map['trip_country'] = Variable<String>(tripCountry);
    return map;
  }

  TripsCompanion toCompanion(bool nullToAbsent) {
    return TripsCompanion(
      id: Value(id),
      authId: Value(authId),
      tripStartDate: Value(tripStartDate),
      tripEndDate: Value(tripEndDate),
      tripCountry: Value(tripCountry),
    );
  }

  factory Trip.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trip(
      id: serializer.fromJson<int>(json['id']),
      authId: serializer.fromJson<int>(json['authId']),
      tripStartDate: serializer.fromJson<DateTime>(json['tripStartDate']),
      tripEndDate: serializer.fromJson<DateTime>(json['tripEndDate']),
      tripCountry: serializer.fromJson<String>(json['tripCountry']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'authId': serializer.toJson<int>(authId),
      'tripStartDate': serializer.toJson<DateTime>(tripStartDate),
      'tripEndDate': serializer.toJson<DateTime>(tripEndDate),
      'tripCountry': serializer.toJson<String>(tripCountry),
    };
  }

  Trip copyWith(
          {int? id,
          int? authId,
          DateTime? tripStartDate,
          DateTime? tripEndDate,
          String? tripCountry}) =>
      Trip(
        id: id ?? this.id,
        authId: authId ?? this.authId,
        tripStartDate: tripStartDate ?? this.tripStartDate,
        tripEndDate: tripEndDate ?? this.tripEndDate,
        tripCountry: tripCountry ?? this.tripCountry,
      );
  @override
  String toString() {
    return (StringBuffer('Trip(')
          ..write('id: $id, ')
          ..write('authId: $authId, ')
          ..write('tripStartDate: $tripStartDate, ')
          ..write('tripEndDate: $tripEndDate, ')
          ..write('tripCountry: $tripCountry')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, authId, tripStartDate, tripEndDate, tripCountry);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trip &&
          other.id == this.id &&
          other.authId == this.authId &&
          other.tripStartDate == this.tripStartDate &&
          other.tripEndDate == this.tripEndDate &&
          other.tripCountry == this.tripCountry);
}

class TripsCompanion extends UpdateCompanion<Trip> {
  final Value<int> id;
  final Value<int> authId;
  final Value<DateTime> tripStartDate;
  final Value<DateTime> tripEndDate;
  final Value<String> tripCountry;
  const TripsCompanion({
    this.id = const Value.absent(),
    this.authId = const Value.absent(),
    this.tripStartDate = const Value.absent(),
    this.tripEndDate = const Value.absent(),
    this.tripCountry = const Value.absent(),
  });
  TripsCompanion.insert({
    this.id = const Value.absent(),
    required int authId,
    required DateTime tripStartDate,
    required DateTime tripEndDate,
    required String tripCountry,
  })  : authId = Value(authId),
        tripStartDate = Value(tripStartDate),
        tripEndDate = Value(tripEndDate),
        tripCountry = Value(tripCountry);
  static Insertable<Trip> custom({
    Expression<int>? id,
    Expression<int>? authId,
    Expression<DateTime>? tripStartDate,
    Expression<DateTime>? tripEndDate,
    Expression<String>? tripCountry,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (authId != null) 'auth_id': authId,
      if (tripStartDate != null) 'trip_start_date': tripStartDate,
      if (tripEndDate != null) 'trip_end_date': tripEndDate,
      if (tripCountry != null) 'trip_country': tripCountry,
    });
  }

  TripsCompanion copyWith(
      {Value<int>? id,
      Value<int>? authId,
      Value<DateTime>? tripStartDate,
      Value<DateTime>? tripEndDate,
      Value<String>? tripCountry}) {
    return TripsCompanion(
      id: id ?? this.id,
      authId: authId ?? this.authId,
      tripStartDate: tripStartDate ?? this.tripStartDate,
      tripEndDate: tripEndDate ?? this.tripEndDate,
      tripCountry: tripCountry ?? this.tripCountry,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (authId.present) {
      map['auth_id'] = Variable<int>(authId.value);
    }
    if (tripStartDate.present) {
      map['trip_start_date'] = Variable<DateTime>(tripStartDate.value);
    }
    if (tripEndDate.present) {
      map['trip_end_date'] = Variable<DateTime>(tripEndDate.value);
    }
    if (tripCountry.present) {
      map['trip_country'] = Variable<String>(tripCountry.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripsCompanion(')
          ..write('id: $id, ')
          ..write('authId: $authId, ')
          ..write('tripStartDate: $tripStartDate, ')
          ..write('tripEndDate: $tripEndDate, ')
          ..write('tripCountry: $tripCountry')
          ..write(')'))
        .toString();
  }
}

class $AuthsTable extends Auths with TableInfo<$AuthsTable, Auth> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _authIdMeta = const VerificationMeta('authId');
  @override
  late final GeneratedColumn<int> authId = GeneratedColumn<int>(
      'auth_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _authReadOnlyMeta =
      const VerificationMeta('authReadOnly');
  @override
  late final GeneratedColumn<int> authReadOnly = GeneratedColumn<int>(
      'auth_read_only', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [authId, userId, authReadOnly];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'auths';
  @override
  VerificationContext validateIntegrity(Insertable<Auth> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('auth_id')) {
      context.handle(_authIdMeta,
          authId.isAcceptableOrUnknown(data['auth_id']!, _authIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('auth_read_only')) {
      context.handle(
          _authReadOnlyMeta,
          authReadOnly.isAcceptableOrUnknown(
              data['auth_read_only']!, _authReadOnlyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {authId};
  @override
  Auth map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Auth(
      authId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}auth_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      authReadOnly: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}auth_read_only'])!,
    );
  }

  @override
  $AuthsTable createAlias(String alias) {
    return $AuthsTable(attachedDatabase, alias);
  }
}

class Auth extends DataClass implements Insertable<Auth> {
  final int authId;
  final int userId;
  final int authReadOnly;
  const Auth(
      {required this.authId, required this.userId, required this.authReadOnly});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['auth_id'] = Variable<int>(authId);
    map['user_id'] = Variable<int>(userId);
    map['auth_read_only'] = Variable<int>(authReadOnly);
    return map;
  }

  AuthsCompanion toCompanion(bool nullToAbsent) {
    return AuthsCompanion(
      authId: Value(authId),
      userId: Value(userId),
      authReadOnly: Value(authReadOnly),
    );
  }

  factory Auth.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Auth(
      authId: serializer.fromJson<int>(json['authId']),
      userId: serializer.fromJson<int>(json['userId']),
      authReadOnly: serializer.fromJson<int>(json['authReadOnly']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'authId': serializer.toJson<int>(authId),
      'userId': serializer.toJson<int>(userId),
      'authReadOnly': serializer.toJson<int>(authReadOnly),
    };
  }

  Auth copyWith({int? authId, int? userId, int? authReadOnly}) => Auth(
        authId: authId ?? this.authId,
        userId: userId ?? this.userId,
        authReadOnly: authReadOnly ?? this.authReadOnly,
      );
  @override
  String toString() {
    return (StringBuffer('Auth(')
          ..write('authId: $authId, ')
          ..write('userId: $userId, ')
          ..write('authReadOnly: $authReadOnly')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(authId, userId, authReadOnly);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Auth &&
          other.authId == this.authId &&
          other.userId == this.userId &&
          other.authReadOnly == this.authReadOnly);
}

class AuthsCompanion extends UpdateCompanion<Auth> {
  final Value<int> authId;
  final Value<int> userId;
  final Value<int> authReadOnly;
  const AuthsCompanion({
    this.authId = const Value.absent(),
    this.userId = const Value.absent(),
    this.authReadOnly = const Value.absent(),
  });
  AuthsCompanion.insert({
    this.authId = const Value.absent(),
    required int userId,
    this.authReadOnly = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<Auth> custom({
    Expression<int>? authId,
    Expression<int>? userId,
    Expression<int>? authReadOnly,
  }) {
    return RawValuesInsertable({
      if (authId != null) 'auth_id': authId,
      if (userId != null) 'user_id': userId,
      if (authReadOnly != null) 'auth_read_only': authReadOnly,
    });
  }

  AuthsCompanion copyWith(
      {Value<int>? authId, Value<int>? userId, Value<int>? authReadOnly}) {
    return AuthsCompanion(
      authId: authId ?? this.authId,
      userId: userId ?? this.userId,
      authReadOnly: authReadOnly ?? this.authReadOnly,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (authId.present) {
      map['auth_id'] = Variable<int>(authId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (authReadOnly.present) {
      map['auth_read_only'] = Variable<int>(authReadOnly.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthsCompanion(')
          ..write('authId: $authId, ')
          ..write('userId: $userId, ')
          ..write('authReadOnly: $authReadOnly')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $PlansTable plans = $PlansTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $TripsTable trips = $TripsTable(this);
  late final $AuthsTable auths = $AuthsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [plans, users, trips, auths];
}
