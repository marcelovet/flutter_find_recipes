// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_recipe_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrentRecipeData {
  List<Recipe> get currentRecipes;
  List<Ingredient> get currentIngredients;

  /// Create a copy of CurrentRecipeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurrentRecipeDataCopyWith<CurrentRecipeData> get copyWith =>
      _$CurrentRecipeDataCopyWithImpl<CurrentRecipeData>(
          this as CurrentRecipeData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurrentRecipeData &&
            const DeepCollectionEquality()
                .equals(other.currentRecipes, currentRecipes) &&
            const DeepCollectionEquality()
                .equals(other.currentIngredients, currentIngredients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentRecipes),
      const DeepCollectionEquality().hash(currentIngredients));

  @override
  String toString() {
    return 'CurrentRecipeData(currentRecipes: $currentRecipes, currentIngredients: $currentIngredients)';
  }
}

/// @nodoc
abstract mixin class $CurrentRecipeDataCopyWith<$Res> {
  factory $CurrentRecipeDataCopyWith(
          CurrentRecipeData value, $Res Function(CurrentRecipeData) _then) =
      _$CurrentRecipeDataCopyWithImpl;
  @useResult
  $Res call({List<Recipe> currentRecipes, List<Ingredient> currentIngredients});
}

/// @nodoc
class _$CurrentRecipeDataCopyWithImpl<$Res>
    implements $CurrentRecipeDataCopyWith<$Res> {
  _$CurrentRecipeDataCopyWithImpl(this._self, this._then);

  final CurrentRecipeData _self;
  final $Res Function(CurrentRecipeData) _then;

  /// Create a copy of CurrentRecipeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentRecipes = null,
    Object? currentIngredients = null,
  }) {
    return _then(_self.copyWith(
      currentRecipes: null == currentRecipes
          ? _self.currentRecipes
          : currentRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      currentIngredients: null == currentIngredients
          ? _self.currentIngredients
          : currentIngredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ));
  }
}

/// @nodoc

class _CurrentRecipeData implements CurrentRecipeData {
  const _CurrentRecipeData(
      {final List<Recipe> currentRecipes = const <Recipe>[],
      final List<Ingredient> currentIngredients = const <Ingredient>[]})
      : _currentRecipes = currentRecipes,
        _currentIngredients = currentIngredients;

  final List<Recipe> _currentRecipes;
  @override
  @JsonKey()
  List<Recipe> get currentRecipes {
    if (_currentRecipes is EqualUnmodifiableListView) return _currentRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentRecipes);
  }

  final List<Ingredient> _currentIngredients;
  @override
  @JsonKey()
  List<Ingredient> get currentIngredients {
    if (_currentIngredients is EqualUnmodifiableListView)
      return _currentIngredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentIngredients);
  }

  /// Create a copy of CurrentRecipeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurrentRecipeDataCopyWith<_CurrentRecipeData> get copyWith =>
      __$CurrentRecipeDataCopyWithImpl<_CurrentRecipeData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrentRecipeData &&
            const DeepCollectionEquality()
                .equals(other._currentRecipes, _currentRecipes) &&
            const DeepCollectionEquality()
                .equals(other._currentIngredients, _currentIngredients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_currentRecipes),
      const DeepCollectionEquality().hash(_currentIngredients));

  @override
  String toString() {
    return 'CurrentRecipeData(currentRecipes: $currentRecipes, currentIngredients: $currentIngredients)';
  }
}

/// @nodoc
abstract mixin class _$CurrentRecipeDataCopyWith<$Res>
    implements $CurrentRecipeDataCopyWith<$Res> {
  factory _$CurrentRecipeDataCopyWith(
          _CurrentRecipeData value, $Res Function(_CurrentRecipeData) _then) =
      __$CurrentRecipeDataCopyWithImpl;
  @override
  @useResult
  $Res call({List<Recipe> currentRecipes, List<Ingredient> currentIngredients});
}

/// @nodoc
class __$CurrentRecipeDataCopyWithImpl<$Res>
    implements _$CurrentRecipeDataCopyWith<$Res> {
  __$CurrentRecipeDataCopyWithImpl(this._self, this._then);

  final _CurrentRecipeData _self;
  final $Res Function(_CurrentRecipeData) _then;

  /// Create a copy of CurrentRecipeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentRecipes = null,
    Object? currentIngredients = null,
  }) {
    return _then(_CurrentRecipeData(
      currentRecipes: null == currentRecipes
          ? _self._currentRecipes
          : currentRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      currentIngredients: null == currentIngredients
          ? _self._currentIngredients
          : currentIngredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ));
  }
}

// dart format on
