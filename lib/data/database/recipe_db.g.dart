// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_db.dart';

// ignore_for_file: type=lint
class $DbRecipeTable extends DbRecipe
    with TableInfo<$DbRecipeTable, DbRecipeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbRecipeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bookmarkedMeta =
      const VerificationMeta('bookmarked');
  @override
  late final GeneratedColumn<bool> bookmarked = GeneratedColumn<bool>(
      'bookmarked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("bookmarked" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, label, image, description, bookmarked];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_recipe';
  @override
  VerificationContext validateIntegrity(Insertable<DbRecipeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('bookmarked')) {
      context.handle(
          _bookmarkedMeta,
          bookmarked.isAcceptableOrUnknown(
              data['bookmarked']!, _bookmarkedMeta));
    } else if (isInserting) {
      context.missing(_bookmarkedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbRecipeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbRecipeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      bookmarked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}bookmarked'])!,
    );
  }

  @override
  $DbRecipeTable createAlias(String alias) {
    return $DbRecipeTable(attachedDatabase, alias);
  }
}

class DbRecipeData extends DataClass implements Insertable<DbRecipeData> {
  final int id;
  final String label;
  final String image;
  final String description;
  final bool bookmarked;
  const DbRecipeData(
      {required this.id,
      required this.label,
      required this.image,
      required this.description,
      required this.bookmarked});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    map['image'] = Variable<String>(image);
    map['description'] = Variable<String>(description);
    map['bookmarked'] = Variable<bool>(bookmarked);
    return map;
  }

  DbRecipeCompanion toCompanion(bool nullToAbsent) {
    return DbRecipeCompanion(
      id: Value(id),
      label: Value(label),
      image: Value(image),
      description: Value(description),
      bookmarked: Value(bookmarked),
    );
  }

  factory DbRecipeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbRecipeData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      image: serializer.fromJson<String>(json['image']),
      description: serializer.fromJson<String>(json['description']),
      bookmarked: serializer.fromJson<bool>(json['bookmarked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'image': serializer.toJson<String>(image),
      'description': serializer.toJson<String>(description),
      'bookmarked': serializer.toJson<bool>(bookmarked),
    };
  }

  DbRecipeData copyWith(
          {int? id,
          String? label,
          String? image,
          String? description,
          bool? bookmarked}) =>
      DbRecipeData(
        id: id ?? this.id,
        label: label ?? this.label,
        image: image ?? this.image,
        description: description ?? this.description,
        bookmarked: bookmarked ?? this.bookmarked,
      );
  DbRecipeData copyWithCompanion(DbRecipeCompanion data) {
    return DbRecipeData(
      id: data.id.present ? data.id.value : this.id,
      label: data.label.present ? data.label.value : this.label,
      image: data.image.present ? data.image.value : this.image,
      description:
          data.description.present ? data.description.value : this.description,
      bookmarked:
          data.bookmarked.present ? data.bookmarked.value : this.bookmarked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbRecipeData(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('image: $image, ')
          ..write('description: $description, ')
          ..write('bookmarked: $bookmarked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label, image, description, bookmarked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbRecipeData &&
          other.id == this.id &&
          other.label == this.label &&
          other.image == this.image &&
          other.description == this.description &&
          other.bookmarked == this.bookmarked);
}

class DbRecipeCompanion extends UpdateCompanion<DbRecipeData> {
  final Value<int> id;
  final Value<String> label;
  final Value<String> image;
  final Value<String> description;
  final Value<bool> bookmarked;
  const DbRecipeCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.image = const Value.absent(),
    this.description = const Value.absent(),
    this.bookmarked = const Value.absent(),
  });
  DbRecipeCompanion.insert({
    this.id = const Value.absent(),
    required String label,
    required String image,
    required String description,
    required bool bookmarked,
  })  : label = Value(label),
        image = Value(image),
        description = Value(description),
        bookmarked = Value(bookmarked);
  static Insertable<DbRecipeData> custom({
    Expression<int>? id,
    Expression<String>? label,
    Expression<String>? image,
    Expression<String>? description,
    Expression<bool>? bookmarked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (image != null) 'image': image,
      if (description != null) 'description': description,
      if (bookmarked != null) 'bookmarked': bookmarked,
    });
  }

  DbRecipeCompanion copyWith(
      {Value<int>? id,
      Value<String>? label,
      Value<String>? image,
      Value<String>? description,
      Value<bool>? bookmarked}) {
    return DbRecipeCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      image: image ?? this.image,
      description: description ?? this.description,
      bookmarked: bookmarked ?? this.bookmarked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (bookmarked.present) {
      map['bookmarked'] = Variable<bool>(bookmarked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbRecipeCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('image: $image, ')
          ..write('description: $description, ')
          ..write('bookmarked: $bookmarked')
          ..write(')'))
        .toString();
  }
}

class $DbIngredientTable extends DbIngredient
    with TableInfo<$DbIngredientTable, DbIngredientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbIngredientTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, recipeId, name, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_ingredient';
  @override
  VerificationContext validateIntegrity(Insertable<DbIngredientData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbIngredientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbIngredientData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}recipe_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
    );
  }

  @override
  $DbIngredientTable createAlias(String alias) {
    return $DbIngredientTable(attachedDatabase, alias);
  }
}

class DbIngredientData extends DataClass
    implements Insertable<DbIngredientData> {
  final int id;
  final int recipeId;
  final String name;
  final double amount;
  const DbIngredientData(
      {required this.id,
      required this.recipeId,
      required this.name,
      required this.amount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['name'] = Variable<String>(name);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  DbIngredientCompanion toCompanion(bool nullToAbsent) {
    return DbIngredientCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      name: Value(name),
      amount: Value(amount),
    );
  }

  factory DbIngredientData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbIngredientData(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      name: serializer.fromJson<String>(json['name']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'name': serializer.toJson<String>(name),
      'amount': serializer.toJson<double>(amount),
    };
  }

  DbIngredientData copyWith(
          {int? id, int? recipeId, String? name, double? amount}) =>
      DbIngredientData(
        id: id ?? this.id,
        recipeId: recipeId ?? this.recipeId,
        name: name ?? this.name,
        amount: amount ?? this.amount,
      );
  DbIngredientData copyWithCompanion(DbIngredientCompanion data) {
    return DbIngredientData(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      name: data.name.present ? data.name.value : this.name,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbIngredientData(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('name: $name, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recipeId, name, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbIngredientData &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.name == this.name &&
          other.amount == this.amount);
}

class DbIngredientCompanion extends UpdateCompanion<DbIngredientData> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<String> name;
  final Value<double> amount;
  const DbIngredientCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
  });
  DbIngredientCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    required String name,
    required double amount,
  })  : recipeId = Value(recipeId),
        name = Value(name),
        amount = Value(amount);
  static Insertable<DbIngredientData> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<String>? name,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (name != null) 'name': name,
      if (amount != null) 'amount': amount,
    });
  }

  DbIngredientCompanion copyWith(
      {Value<int>? id,
      Value<int>? recipeId,
      Value<String>? name,
      Value<double>? amount}) {
    return DbIngredientCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      name: name ?? this.name,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbIngredientCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('name: $name, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

abstract class _$RecipeDatabase extends GeneratedDatabase {
  _$RecipeDatabase(QueryExecutor e) : super(e);
  $RecipeDatabaseManager get managers => $RecipeDatabaseManager(this);
  late final $DbRecipeTable dbRecipe = $DbRecipeTable(this);
  late final $DbIngredientTable dbIngredient = $DbIngredientTable(this);
  late final RecipeDao recipeDao = RecipeDao(this as RecipeDatabase);
  late final IngredientDao ingredientDao =
      IngredientDao(this as RecipeDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbRecipe, dbIngredient];
}

typedef $$DbRecipeTableCreateCompanionBuilder = DbRecipeCompanion Function({
  Value<int> id,
  required String label,
  required String image,
  required String description,
  required bool bookmarked,
});
typedef $$DbRecipeTableUpdateCompanionBuilder = DbRecipeCompanion Function({
  Value<int> id,
  Value<String> label,
  Value<String> image,
  Value<String> description,
  Value<bool> bookmarked,
});

class $$DbRecipeTableFilterComposer
    extends Composer<_$RecipeDatabase, $DbRecipeTable> {
  $$DbRecipeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get bookmarked => $composableBuilder(
      column: $table.bookmarked, builder: (column) => ColumnFilters(column));
}

class $$DbRecipeTableOrderingComposer
    extends Composer<_$RecipeDatabase, $DbRecipeTable> {
  $$DbRecipeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get bookmarked => $composableBuilder(
      column: $table.bookmarked, builder: (column) => ColumnOrderings(column));
}

class $$DbRecipeTableAnnotationComposer
    extends Composer<_$RecipeDatabase, $DbRecipeTable> {
  $$DbRecipeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get bookmarked => $composableBuilder(
      column: $table.bookmarked, builder: (column) => column);
}

class $$DbRecipeTableTableManager extends RootTableManager<
    _$RecipeDatabase,
    $DbRecipeTable,
    DbRecipeData,
    $$DbRecipeTableFilterComposer,
    $$DbRecipeTableOrderingComposer,
    $$DbRecipeTableAnnotationComposer,
    $$DbRecipeTableCreateCompanionBuilder,
    $$DbRecipeTableUpdateCompanionBuilder,
    (
      DbRecipeData,
      BaseReferences<_$RecipeDatabase, $DbRecipeTable, DbRecipeData>
    ),
    DbRecipeData,
    PrefetchHooks Function()> {
  $$DbRecipeTableTableManager(_$RecipeDatabase db, $DbRecipeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbRecipeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbRecipeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbRecipeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> label = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<bool> bookmarked = const Value.absent(),
          }) =>
              DbRecipeCompanion(
            id: id,
            label: label,
            image: image,
            description: description,
            bookmarked: bookmarked,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String label,
            required String image,
            required String description,
            required bool bookmarked,
          }) =>
              DbRecipeCompanion.insert(
            id: id,
            label: label,
            image: image,
            description: description,
            bookmarked: bookmarked,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DbRecipeTableProcessedTableManager = ProcessedTableManager<
    _$RecipeDatabase,
    $DbRecipeTable,
    DbRecipeData,
    $$DbRecipeTableFilterComposer,
    $$DbRecipeTableOrderingComposer,
    $$DbRecipeTableAnnotationComposer,
    $$DbRecipeTableCreateCompanionBuilder,
    $$DbRecipeTableUpdateCompanionBuilder,
    (
      DbRecipeData,
      BaseReferences<_$RecipeDatabase, $DbRecipeTable, DbRecipeData>
    ),
    DbRecipeData,
    PrefetchHooks Function()>;
typedef $$DbIngredientTableCreateCompanionBuilder = DbIngredientCompanion
    Function({
  Value<int> id,
  required int recipeId,
  required String name,
  required double amount,
});
typedef $$DbIngredientTableUpdateCompanionBuilder = DbIngredientCompanion
    Function({
  Value<int> id,
  Value<int> recipeId,
  Value<String> name,
  Value<double> amount,
});

class $$DbIngredientTableFilterComposer
    extends Composer<_$RecipeDatabase, $DbIngredientTable> {
  $$DbIngredientTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));
}

class $$DbIngredientTableOrderingComposer
    extends Composer<_$RecipeDatabase, $DbIngredientTable> {
  $$DbIngredientTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));
}

class $$DbIngredientTableAnnotationComposer
    extends Composer<_$RecipeDatabase, $DbIngredientTable> {
  $$DbIngredientTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get recipeId =>
      $composableBuilder(column: $table.recipeId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);
}

class $$DbIngredientTableTableManager extends RootTableManager<
    _$RecipeDatabase,
    $DbIngredientTable,
    DbIngredientData,
    $$DbIngredientTableFilterComposer,
    $$DbIngredientTableOrderingComposer,
    $$DbIngredientTableAnnotationComposer,
    $$DbIngredientTableCreateCompanionBuilder,
    $$DbIngredientTableUpdateCompanionBuilder,
    (
      DbIngredientData,
      BaseReferences<_$RecipeDatabase, $DbIngredientTable, DbIngredientData>
    ),
    DbIngredientData,
    PrefetchHooks Function()> {
  $$DbIngredientTableTableManager(_$RecipeDatabase db, $DbIngredientTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbIngredientTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbIngredientTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbIngredientTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> recipeId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> amount = const Value.absent(),
          }) =>
              DbIngredientCompanion(
            id: id,
            recipeId: recipeId,
            name: name,
            amount: amount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int recipeId,
            required String name,
            required double amount,
          }) =>
              DbIngredientCompanion.insert(
            id: id,
            recipeId: recipeId,
            name: name,
            amount: amount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DbIngredientTableProcessedTableManager = ProcessedTableManager<
    _$RecipeDatabase,
    $DbIngredientTable,
    DbIngredientData,
    $$DbIngredientTableFilterComposer,
    $$DbIngredientTableOrderingComposer,
    $$DbIngredientTableAnnotationComposer,
    $$DbIngredientTableCreateCompanionBuilder,
    $$DbIngredientTableUpdateCompanionBuilder,
    (
      DbIngredientData,
      BaseReferences<_$RecipeDatabase, $DbIngredientTable, DbIngredientData>
    ),
    DbIngredientData,
    PrefetchHooks Function()>;

class $RecipeDatabaseManager {
  final _$RecipeDatabase _db;
  $RecipeDatabaseManager(this._db);
  $$DbRecipeTableTableManager get dbRecipe =>
      $$DbRecipeTableTableManager(_db, _db.dbRecipe);
  $$DbIngredientTableTableManager get dbIngredient =>
      $$DbIngredientTableTableManager(_db, _db.dbIngredient);
}

mixin _$RecipeDaoMixin on DatabaseAccessor<RecipeDatabase> {
  $DbRecipeTable get dbRecipe => attachedDatabase.dbRecipe;
}
mixin _$IngredientDaoMixin on DatabaseAccessor<RecipeDatabase> {
  $DbIngredientTable get dbIngredient => attachedDatabase.dbIngredient;
}
