// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $HabitsTable extends Habits with TableInfo<$HabitsTable, Habit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _streakMeta = const VerificationMeta('streak');
  @override
  late final GeneratedColumn<int> streak = GeneratedColumn<int>(
      'streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalCompletionsMeta =
      const VerificationMeta('totalCompletions');
  @override
  late final GeneratedColumn<int> totalCompletions = GeneratedColumn<int>(
      'total_completions', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isDailyMeta =
      const VerificationMeta('isDaily');
  @override
  late final GeneratedColumn<bool> isDaily = GeneratedColumn<bool>(
      'is_daily', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_daily" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _reminderTimeMeta =
      const VerificationMeta('reminderTime');
  @override
  late final GeneratedColumn<String> reminderTime = GeneratedColumn<String>(
      'reminder_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createDateMeta =
      const VerificationMeta('createDate');
  @override
  late final GeneratedColumn<DateTime> createDate = GeneratedColumn<DateTime>(
      'create_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        streak,
        totalCompletions,
        isDaily,
        reminderTime,
        createDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits';
  @override
  VerificationContext validateIntegrity(Insertable<Habit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('streak')) {
      context.handle(_streakMeta,
          streak.isAcceptableOrUnknown(data['streak']!, _streakMeta));
    }
    if (data.containsKey('total_completions')) {
      context.handle(
          _totalCompletionsMeta,
          totalCompletions.isAcceptableOrUnknown(
              data['total_completions']!, _totalCompletionsMeta));
    }
    if (data.containsKey('is_daily')) {
      context.handle(_isDailyMeta,
          isDaily.isAcceptableOrUnknown(data['is_daily']!, _isDailyMeta));
    }
    if (data.containsKey('reminder_time')) {
      context.handle(
          _reminderTimeMeta,
          reminderTime.isAcceptableOrUnknown(
              data['reminder_time']!, _reminderTimeMeta));
    }
    if (data.containsKey('create_date')) {
      context.handle(
          _createDateMeta,
          createDate.isAcceptableOrUnknown(
              data['create_date']!, _createDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Habit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      streak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}streak'])!,
      totalCompletions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_completions'])!,
      isDaily: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_daily'])!,
      reminderTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reminder_time']),
      createDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_date'])!,
    );
  }

  @override
  $HabitsTable createAlias(String alias) {
    return $HabitsTable(attachedDatabase, alias);
  }
}

class Habit extends DataClass implements Insertable<Habit> {
  final int id;
  final String title;
  final String? description;
  final int streak;
  final int totalCompletions;
  final bool isDaily;
  final String? reminderTime;
  final DateTime createDate;
  const Habit(
      {required this.id,
      required this.title,
      this.description,
      required this.streak,
      required this.totalCompletions,
      required this.isDaily,
      this.reminderTime,
      required this.createDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['streak'] = Variable<int>(streak);
    map['total_completions'] = Variable<int>(totalCompletions);
    map['is_daily'] = Variable<bool>(isDaily);
    if (!nullToAbsent || reminderTime != null) {
      map['reminder_time'] = Variable<String>(reminderTime);
    }
    map['create_date'] = Variable<DateTime>(createDate);
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      streak: Value(streak),
      totalCompletions: Value(totalCompletions),
      isDaily: Value(isDaily),
      reminderTime: reminderTime == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderTime),
      createDate: Value(createDate),
    );
  }

  factory Habit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Habit(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      streak: serializer.fromJson<int>(json['streak']),
      totalCompletions: serializer.fromJson<int>(json['totalCompletions']),
      isDaily: serializer.fromJson<bool>(json['isDaily']),
      reminderTime: serializer.fromJson<String?>(json['reminderTime']),
      createDate: serializer.fromJson<DateTime>(json['createDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'streak': serializer.toJson<int>(streak),
      'totalCompletions': serializer.toJson<int>(totalCompletions),
      'isDaily': serializer.toJson<bool>(isDaily),
      'reminderTime': serializer.toJson<String?>(reminderTime),
      'createDate': serializer.toJson<DateTime>(createDate),
    };
  }

  Habit copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          int? streak,
          int? totalCompletions,
          bool? isDaily,
          Value<String?> reminderTime = const Value.absent(),
          DateTime? createDate}) =>
      Habit(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        streak: streak ?? this.streak,
        totalCompletions: totalCompletions ?? this.totalCompletions,
        isDaily: isDaily ?? this.isDaily,
        reminderTime:
            reminderTime.present ? reminderTime.value : this.reminderTime,
        createDate: createDate ?? this.createDate,
      );
  Habit copyWithCompanion(HabitsCompanion data) {
    return Habit(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      streak: data.streak.present ? data.streak.value : this.streak,
      totalCompletions: data.totalCompletions.present
          ? data.totalCompletions.value
          : this.totalCompletions,
      isDaily: data.isDaily.present ? data.isDaily.value : this.isDaily,
      reminderTime: data.reminderTime.present
          ? data.reminderTime.value
          : this.reminderTime,
      createDate:
          data.createDate.present ? data.createDate.value : this.createDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Habit(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('streak: $streak, ')
          ..write('totalCompletions: $totalCompletions, ')
          ..write('isDaily: $isDaily, ')
          ..write('reminderTime: $reminderTime, ')
          ..write('createDate: $createDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, streak,
      totalCompletions, isDaily, reminderTime, createDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Habit &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.streak == this.streak &&
          other.totalCompletions == this.totalCompletions &&
          other.isDaily == this.isDaily &&
          other.reminderTime == this.reminderTime &&
          other.createDate == this.createDate);
}

class HabitsCompanion extends UpdateCompanion<Habit> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> streak;
  final Value<int> totalCompletions;
  final Value<bool> isDaily;
  final Value<String?> reminderTime;
  final Value<DateTime> createDate;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.streak = const Value.absent(),
    this.totalCompletions = const Value.absent(),
    this.isDaily = const Value.absent(),
    this.reminderTime = const Value.absent(),
    this.createDate = const Value.absent(),
  });
  HabitsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.streak = const Value.absent(),
    this.totalCompletions = const Value.absent(),
    this.isDaily = const Value.absent(),
    this.reminderTime = const Value.absent(),
    this.createDate = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Habit> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? streak,
    Expression<int>? totalCompletions,
    Expression<bool>? isDaily,
    Expression<String>? reminderTime,
    Expression<DateTime>? createDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (streak != null) 'streak': streak,
      if (totalCompletions != null) 'total_completions': totalCompletions,
      if (isDaily != null) 'is_daily': isDaily,
      if (reminderTime != null) 'reminder_time': reminderTime,
      if (createDate != null) 'create_date': createDate,
    });
  }

  HabitsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<int>? streak,
      Value<int>? totalCompletions,
      Value<bool>? isDaily,
      Value<String?>? reminderTime,
      Value<DateTime>? createDate}) {
    return HabitsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      streak: streak ?? this.streak,
      totalCompletions: totalCompletions ?? this.totalCompletions,
      isDaily: isDaily ?? this.isDaily,
      reminderTime: reminderTime ?? this.reminderTime,
      createDate: createDate ?? this.createDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (streak.present) {
      map['streak'] = Variable<int>(streak.value);
    }
    if (totalCompletions.present) {
      map['total_completions'] = Variable<int>(totalCompletions.value);
    }
    if (isDaily.present) {
      map['is_daily'] = Variable<bool>(isDaily.value);
    }
    if (reminderTime.present) {
      map['reminder_time'] = Variable<String>(reminderTime.value);
    }
    if (createDate.present) {
      map['create_date'] = Variable<DateTime>(createDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('streak: $streak, ')
          ..write('totalCompletions: $totalCompletions, ')
          ..write('isDaily: $isDaily, ')
          ..write('reminderTime: $reminderTime, ')
          ..write('createDate: $createDate')
          ..write(')'))
        .toString();
  }
}

class $HabitCompletionsTable extends HabitCompletions
    with TableInfo<$HabitCompletionsTable, HabitCompletion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitCompletionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _completionDateMeta =
      const VerificationMeta('completionDate');
  @override
  late final GeneratedColumn<DateTime> completionDate =
      GeneratedColumn<DateTime>('completion_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _habitIdMeta =
      const VerificationMeta('habitId');
  @override
  late final GeneratedColumn<int> habitId = GeneratedColumn<int>(
      'habit_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, completionDate, habitId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_completions';
  @override
  VerificationContext validateIntegrity(Insertable<HabitCompletion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('completion_date')) {
      context.handle(
          _completionDateMeta,
          completionDate.isAcceptableOrUnknown(
              data['completion_date']!, _completionDateMeta));
    } else if (isInserting) {
      context.missing(_completionDateMeta);
    }
    if (data.containsKey('habit_id')) {
      context.handle(_habitIdMeta,
          habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta));
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitCompletion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitCompletion(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      completionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}completion_date'])!,
      habitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}habit_id'])!,
    );
  }

  @override
  $HabitCompletionsTable createAlias(String alias) {
    return $HabitCompletionsTable(attachedDatabase, alias);
  }
}

class HabitCompletion extends DataClass implements Insertable<HabitCompletion> {
  final int id;
  final DateTime completionDate;
  final int habitId;
  const HabitCompletion(
      {required this.id, required this.completionDate, required this.habitId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['completion_date'] = Variable<DateTime>(completionDate);
    map['habit_id'] = Variable<int>(habitId);
    return map;
  }

  HabitCompletionsCompanion toCompanion(bool nullToAbsent) {
    return HabitCompletionsCompanion(
      id: Value(id),
      completionDate: Value(completionDate),
      habitId: Value(habitId),
    );
  }

  factory HabitCompletion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitCompletion(
      id: serializer.fromJson<int>(json['id']),
      completionDate: serializer.fromJson<DateTime>(json['completionDate']),
      habitId: serializer.fromJson<int>(json['habitId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'completionDate': serializer.toJson<DateTime>(completionDate),
      'habitId': serializer.toJson<int>(habitId),
    };
  }

  HabitCompletion copyWith({int? id, DateTime? completionDate, int? habitId}) =>
      HabitCompletion(
        id: id ?? this.id,
        completionDate: completionDate ?? this.completionDate,
        habitId: habitId ?? this.habitId,
      );
  HabitCompletion copyWithCompanion(HabitCompletionsCompanion data) {
    return HabitCompletion(
      id: data.id.present ? data.id.value : this.id,
      completionDate: data.completionDate.present
          ? data.completionDate.value
          : this.completionDate,
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitCompletion(')
          ..write('id: $id, ')
          ..write('completionDate: $completionDate, ')
          ..write('habitId: $habitId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, completionDate, habitId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitCompletion &&
          other.id == this.id &&
          other.completionDate == this.completionDate &&
          other.habitId == this.habitId);
}

class HabitCompletionsCompanion extends UpdateCompanion<HabitCompletion> {
  final Value<int> id;
  final Value<DateTime> completionDate;
  final Value<int> habitId;
  const HabitCompletionsCompanion({
    this.id = const Value.absent(),
    this.completionDate = const Value.absent(),
    this.habitId = const Value.absent(),
  });
  HabitCompletionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime completionDate,
    required int habitId,
  })  : completionDate = Value(completionDate),
        habitId = Value(habitId);
  static Insertable<HabitCompletion> custom({
    Expression<int>? id,
    Expression<DateTime>? completionDate,
    Expression<int>? habitId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (completionDate != null) 'completion_date': completionDate,
      if (habitId != null) 'habit_id': habitId,
    });
  }

  HabitCompletionsCompanion copyWith(
      {Value<int>? id, Value<DateTime>? completionDate, Value<int>? habitId}) {
    return HabitCompletionsCompanion(
      id: id ?? this.id,
      completionDate: completionDate ?? this.completionDate,
      habitId: habitId ?? this.habitId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (completionDate.present) {
      map['completion_date'] = Variable<DateTime>(completionDate.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<int>(habitId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitCompletionsCompanion(')
          ..write('id: $id, ')
          ..write('completionDate: $completionDate, ')
          ..write('habitId: $habitId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HabitsTable habits = $HabitsTable(this);
  late final $HabitCompletionsTable habitCompletions =
      $HabitCompletionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [habits, habitCompletions];
}

typedef $$HabitsTableCreateCompanionBuilder = HabitsCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> description,
  Value<int> streak,
  Value<int> totalCompletions,
  Value<bool> isDaily,
  Value<String?> reminderTime,
  Value<DateTime> createDate,
});
typedef $$HabitsTableUpdateCompanionBuilder = HabitsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> description,
  Value<int> streak,
  Value<int> totalCompletions,
  Value<bool> isDaily,
  Value<String?> reminderTime,
  Value<DateTime> createDate,
});

class $$HabitsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get streak => $composableBuilder(
      column: $table.streak, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalCompletions => $composableBuilder(
      column: $table.totalCompletions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDaily => $composableBuilder(
      column: $table.isDaily, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reminderTime => $composableBuilder(
      column: $table.reminderTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createDate => $composableBuilder(
      column: $table.createDate, builder: (column) => ColumnFilters(column));
}

class $$HabitsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get streak => $composableBuilder(
      column: $table.streak, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalCompletions => $composableBuilder(
      column: $table.totalCompletions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDaily => $composableBuilder(
      column: $table.isDaily, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reminderTime => $composableBuilder(
      column: $table.reminderTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createDate => $composableBuilder(
      column: $table.createDate, builder: (column) => ColumnOrderings(column));
}

class $$HabitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get streak =>
      $composableBuilder(column: $table.streak, builder: (column) => column);

  GeneratedColumn<int> get totalCompletions => $composableBuilder(
      column: $table.totalCompletions, builder: (column) => column);

  GeneratedColumn<bool> get isDaily =>
      $composableBuilder(column: $table.isDaily, builder: (column) => column);

  GeneratedColumn<String> get reminderTime => $composableBuilder(
      column: $table.reminderTime, builder: (column) => column);

  GeneratedColumn<DateTime> get createDate => $composableBuilder(
      column: $table.createDate, builder: (column) => column);
}

class $$HabitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HabitsTable,
    Habit,
    $$HabitsTableFilterComposer,
    $$HabitsTableOrderingComposer,
    $$HabitsTableAnnotationComposer,
    $$HabitsTableCreateCompanionBuilder,
    $$HabitsTableUpdateCompanionBuilder,
    (Habit, BaseReferences<_$AppDatabase, $HabitsTable, Habit>),
    Habit,
    PrefetchHooks Function()> {
  $$HabitsTableTableManager(_$AppDatabase db, $HabitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> streak = const Value.absent(),
            Value<int> totalCompletions = const Value.absent(),
            Value<bool> isDaily = const Value.absent(),
            Value<String?> reminderTime = const Value.absent(),
            Value<DateTime> createDate = const Value.absent(),
          }) =>
              HabitsCompanion(
            id: id,
            title: title,
            description: description,
            streak: streak,
            totalCompletions: totalCompletions,
            isDaily: isDaily,
            reminderTime: reminderTime,
            createDate: createDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            Value<int> streak = const Value.absent(),
            Value<int> totalCompletions = const Value.absent(),
            Value<bool> isDaily = const Value.absent(),
            Value<String?> reminderTime = const Value.absent(),
            Value<DateTime> createDate = const Value.absent(),
          }) =>
              HabitsCompanion.insert(
            id: id,
            title: title,
            description: description,
            streak: streak,
            totalCompletions: totalCompletions,
            isDaily: isDaily,
            reminderTime: reminderTime,
            createDate: createDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HabitsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HabitsTable,
    Habit,
    $$HabitsTableFilterComposer,
    $$HabitsTableOrderingComposer,
    $$HabitsTableAnnotationComposer,
    $$HabitsTableCreateCompanionBuilder,
    $$HabitsTableUpdateCompanionBuilder,
    (Habit, BaseReferences<_$AppDatabase, $HabitsTable, Habit>),
    Habit,
    PrefetchHooks Function()>;
typedef $$HabitCompletionsTableCreateCompanionBuilder
    = HabitCompletionsCompanion Function({
  Value<int> id,
  required DateTime completionDate,
  required int habitId,
});
typedef $$HabitCompletionsTableUpdateCompanionBuilder
    = HabitCompletionsCompanion Function({
  Value<int> id,
  Value<DateTime> completionDate,
  Value<int> habitId,
});

class $$HabitCompletionsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitCompletionsTable> {
  $$HabitCompletionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completionDate => $composableBuilder(
      column: $table.completionDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get habitId => $composableBuilder(
      column: $table.habitId, builder: (column) => ColumnFilters(column));
}

class $$HabitCompletionsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitCompletionsTable> {
  $$HabitCompletionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completionDate => $composableBuilder(
      column: $table.completionDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get habitId => $composableBuilder(
      column: $table.habitId, builder: (column) => ColumnOrderings(column));
}

class $$HabitCompletionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitCompletionsTable> {
  $$HabitCompletionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get completionDate => $composableBuilder(
      column: $table.completionDate, builder: (column) => column);

  GeneratedColumn<int> get habitId =>
      $composableBuilder(column: $table.habitId, builder: (column) => column);
}

class $$HabitCompletionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HabitCompletionsTable,
    HabitCompletion,
    $$HabitCompletionsTableFilterComposer,
    $$HabitCompletionsTableOrderingComposer,
    $$HabitCompletionsTableAnnotationComposer,
    $$HabitCompletionsTableCreateCompanionBuilder,
    $$HabitCompletionsTableUpdateCompanionBuilder,
    (
      HabitCompletion,
      BaseReferences<_$AppDatabase, $HabitCompletionsTable, HabitCompletion>
    ),
    HabitCompletion,
    PrefetchHooks Function()> {
  $$HabitCompletionsTableTableManager(
      _$AppDatabase db, $HabitCompletionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitCompletionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitCompletionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitCompletionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> completionDate = const Value.absent(),
            Value<int> habitId = const Value.absent(),
          }) =>
              HabitCompletionsCompanion(
            id: id,
            completionDate: completionDate,
            habitId: habitId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime completionDate,
            required int habitId,
          }) =>
              HabitCompletionsCompanion.insert(
            id: id,
            completionDate: completionDate,
            habitId: habitId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HabitCompletionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HabitCompletionsTable,
    HabitCompletion,
    $$HabitCompletionsTableFilterComposer,
    $$HabitCompletionsTableOrderingComposer,
    $$HabitCompletionsTableAnnotationComposer,
    $$HabitCompletionsTableCreateCompanionBuilder,
    $$HabitCompletionsTableUpdateCompanionBuilder,
    (
      HabitCompletion,
      BaseReferences<_$AppDatabase, $HabitCompletionsTable, HabitCompletion>
    ),
    HabitCompletion,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HabitsTableTableManager get habits =>
      $$HabitsTableTableManager(_db, _db.habits);
  $$HabitCompletionsTableTableManager get habitCompletions =>
      $$HabitCompletionsTableTableManager(_db, _db.habitCompletions);
}
