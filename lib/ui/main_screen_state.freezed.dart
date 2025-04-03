// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MainScreenState {
  int get selectedIndex;

  /// Create a copy of MainScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MainScreenStateCopyWith<MainScreenState> get copyWith =>
      _$MainScreenStateCopyWithImpl<MainScreenState>(
          this as MainScreenState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MainScreenState &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex);

  @override
  String toString() {
    return 'MainScreenState(selectedIndex: $selectedIndex)';
  }
}

/// @nodoc
abstract mixin class $MainScreenStateCopyWith<$Res> {
  factory $MainScreenStateCopyWith(
          MainScreenState value, $Res Function(MainScreenState) _then) =
      _$MainScreenStateCopyWithImpl;
  @useResult
  $Res call({int selectedIndex});
}

/// @nodoc
class _$MainScreenStateCopyWithImpl<$Res>
    implements $MainScreenStateCopyWith<$Res> {
  _$MainScreenStateCopyWithImpl(this._self, this._then);

  final MainScreenState _self;
  final $Res Function(MainScreenState) _then;

  /// Create a copy of MainScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_self.copyWith(
      selectedIndex: null == selectedIndex
          ? _self.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _MainScreenState implements MainScreenState {
  const _MainScreenState({this.selectedIndex = 0});

  @override
  @JsonKey()
  final int selectedIndex;

  /// Create a copy of MainScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MainScreenStateCopyWith<_MainScreenState> get copyWith =>
      __$MainScreenStateCopyWithImpl<_MainScreenState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MainScreenState &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex);

  @override
  String toString() {
    return 'MainScreenState(selectedIndex: $selectedIndex)';
  }
}

/// @nodoc
abstract mixin class _$MainScreenStateCopyWith<$Res>
    implements $MainScreenStateCopyWith<$Res> {
  factory _$MainScreenStateCopyWith(
          _MainScreenState value, $Res Function(_MainScreenState) _then) =
      __$MainScreenStateCopyWithImpl;
  @override
  @useResult
  $Res call({int selectedIndex});
}

/// @nodoc
class __$MainScreenStateCopyWithImpl<$Res>
    implements _$MainScreenStateCopyWith<$Res> {
  __$MainScreenStateCopyWithImpl(this._self, this._then);

  final _MainScreenState _self;
  final $Res Function(_MainScreenState) _then;

  /// Create a copy of MainScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_MainScreenState(
      selectedIndex: null == selectedIndex
          ? _self.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
