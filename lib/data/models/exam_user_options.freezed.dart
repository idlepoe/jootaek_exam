// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_user_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExamUserOptions {

 ExamThemeMode get themeMode; String get correctHighlightHex; String get correctHighlightTextHex; String get pickChoiceHighlightHex; String get pickChoiceHighlightTextHex; StickyButtonHeight get stickyButtonHeight; QuestionTextSize get questionTextSize; StickyButtonOrder get stickyButtonOrder;
/// Create a copy of ExamUserOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamUserOptionsCopyWith<ExamUserOptions> get copyWith => _$ExamUserOptionsCopyWithImpl<ExamUserOptions>(this as ExamUserOptions, _$identity);

  /// Serializes this ExamUserOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamUserOptions&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.correctHighlightHex, correctHighlightHex) || other.correctHighlightHex == correctHighlightHex)&&(identical(other.correctHighlightTextHex, correctHighlightTextHex) || other.correctHighlightTextHex == correctHighlightTextHex)&&(identical(other.pickChoiceHighlightHex, pickChoiceHighlightHex) || other.pickChoiceHighlightHex == pickChoiceHighlightHex)&&(identical(other.pickChoiceHighlightTextHex, pickChoiceHighlightTextHex) || other.pickChoiceHighlightTextHex == pickChoiceHighlightTextHex)&&(identical(other.stickyButtonHeight, stickyButtonHeight) || other.stickyButtonHeight == stickyButtonHeight)&&(identical(other.questionTextSize, questionTextSize) || other.questionTextSize == questionTextSize)&&(identical(other.stickyButtonOrder, stickyButtonOrder) || other.stickyButtonOrder == stickyButtonOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,correctHighlightHex,correctHighlightTextHex,pickChoiceHighlightHex,pickChoiceHighlightTextHex,stickyButtonHeight,questionTextSize,stickyButtonOrder);

@override
String toString() {
  return 'ExamUserOptions(themeMode: $themeMode, correctHighlightHex: $correctHighlightHex, correctHighlightTextHex: $correctHighlightTextHex, pickChoiceHighlightHex: $pickChoiceHighlightHex, pickChoiceHighlightTextHex: $pickChoiceHighlightTextHex, stickyButtonHeight: $stickyButtonHeight, questionTextSize: $questionTextSize, stickyButtonOrder: $stickyButtonOrder)';
}


}

/// @nodoc
abstract mixin class $ExamUserOptionsCopyWith<$Res>  {
  factory $ExamUserOptionsCopyWith(ExamUserOptions value, $Res Function(ExamUserOptions) _then) = _$ExamUserOptionsCopyWithImpl;
@useResult
$Res call({
 ExamThemeMode themeMode, String correctHighlightHex, String correctHighlightTextHex, String pickChoiceHighlightHex, String pickChoiceHighlightTextHex, StickyButtonHeight stickyButtonHeight, QuestionTextSize questionTextSize, StickyButtonOrder stickyButtonOrder
});




}
/// @nodoc
class _$ExamUserOptionsCopyWithImpl<$Res>
    implements $ExamUserOptionsCopyWith<$Res> {
  _$ExamUserOptionsCopyWithImpl(this._self, this._then);

  final ExamUserOptions _self;
  final $Res Function(ExamUserOptions) _then;

/// Create a copy of ExamUserOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? correctHighlightHex = null,Object? correctHighlightTextHex = null,Object? pickChoiceHighlightHex = null,Object? pickChoiceHighlightTextHex = null,Object? stickyButtonHeight = null,Object? questionTextSize = null,Object? stickyButtonOrder = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ExamThemeMode,correctHighlightHex: null == correctHighlightHex ? _self.correctHighlightHex : correctHighlightHex // ignore: cast_nullable_to_non_nullable
as String,correctHighlightTextHex: null == correctHighlightTextHex ? _self.correctHighlightTextHex : correctHighlightTextHex // ignore: cast_nullable_to_non_nullable
as String,pickChoiceHighlightHex: null == pickChoiceHighlightHex ? _self.pickChoiceHighlightHex : pickChoiceHighlightHex // ignore: cast_nullable_to_non_nullable
as String,pickChoiceHighlightTextHex: null == pickChoiceHighlightTextHex ? _self.pickChoiceHighlightTextHex : pickChoiceHighlightTextHex // ignore: cast_nullable_to_non_nullable
as String,stickyButtonHeight: null == stickyButtonHeight ? _self.stickyButtonHeight : stickyButtonHeight // ignore: cast_nullable_to_non_nullable
as StickyButtonHeight,questionTextSize: null == questionTextSize ? _self.questionTextSize : questionTextSize // ignore: cast_nullable_to_non_nullable
as QuestionTextSize,stickyButtonOrder: null == stickyButtonOrder ? _self.stickyButtonOrder : stickyButtonOrder // ignore: cast_nullable_to_non_nullable
as StickyButtonOrder,
  ));
}

}


/// Adds pattern-matching-related methods to [ExamUserOptions].
extension ExamUserOptionsPatterns on ExamUserOptions {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExamUserOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExamUserOptions() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExamUserOptions value)  $default,){
final _that = this;
switch (_that) {
case _ExamUserOptions():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExamUserOptions value)?  $default,){
final _that = this;
switch (_that) {
case _ExamUserOptions() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ExamThemeMode themeMode,  String correctHighlightHex,  String correctHighlightTextHex,  String pickChoiceHighlightHex,  String pickChoiceHighlightTextHex,  StickyButtonHeight stickyButtonHeight,  QuestionTextSize questionTextSize,  StickyButtonOrder stickyButtonOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExamUserOptions() when $default != null:
return $default(_that.themeMode,_that.correctHighlightHex,_that.correctHighlightTextHex,_that.pickChoiceHighlightHex,_that.pickChoiceHighlightTextHex,_that.stickyButtonHeight,_that.questionTextSize,_that.stickyButtonOrder);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ExamThemeMode themeMode,  String correctHighlightHex,  String correctHighlightTextHex,  String pickChoiceHighlightHex,  String pickChoiceHighlightTextHex,  StickyButtonHeight stickyButtonHeight,  QuestionTextSize questionTextSize,  StickyButtonOrder stickyButtonOrder)  $default,) {final _that = this;
switch (_that) {
case _ExamUserOptions():
return $default(_that.themeMode,_that.correctHighlightHex,_that.correctHighlightTextHex,_that.pickChoiceHighlightHex,_that.pickChoiceHighlightTextHex,_that.stickyButtonHeight,_that.questionTextSize,_that.stickyButtonOrder);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ExamThemeMode themeMode,  String correctHighlightHex,  String correctHighlightTextHex,  String pickChoiceHighlightHex,  String pickChoiceHighlightTextHex,  StickyButtonHeight stickyButtonHeight,  QuestionTextSize questionTextSize,  StickyButtonOrder stickyButtonOrder)?  $default,) {final _that = this;
switch (_that) {
case _ExamUserOptions() when $default != null:
return $default(_that.themeMode,_that.correctHighlightHex,_that.correctHighlightTextHex,_that.pickChoiceHighlightHex,_that.pickChoiceHighlightTextHex,_that.stickyButtonHeight,_that.questionTextSize,_that.stickyButtonOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExamUserOptions implements ExamUserOptions {
  const _ExamUserOptions({this.themeMode = ExamThemeMode.system, this.correctHighlightHex = '#ffcccc', this.correctHighlightTextHex = '#ffffff', this.pickChoiceHighlightHex = '#1565c0', this.pickChoiceHighlightTextHex = '#ffffff', this.stickyButtonHeight = StickyButtonHeight.normal, this.questionTextSize = QuestionTextSize.md, this.stickyButtonOrder = StickyButtonOrder.prevNext});
  factory _ExamUserOptions.fromJson(Map<String, dynamic> json) => _$ExamUserOptionsFromJson(json);

@override@JsonKey() final  ExamThemeMode themeMode;
@override@JsonKey() final  String correctHighlightHex;
@override@JsonKey() final  String correctHighlightTextHex;
@override@JsonKey() final  String pickChoiceHighlightHex;
@override@JsonKey() final  String pickChoiceHighlightTextHex;
@override@JsonKey() final  StickyButtonHeight stickyButtonHeight;
@override@JsonKey() final  QuestionTextSize questionTextSize;
@override@JsonKey() final  StickyButtonOrder stickyButtonOrder;

/// Create a copy of ExamUserOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamUserOptionsCopyWith<_ExamUserOptions> get copyWith => __$ExamUserOptionsCopyWithImpl<_ExamUserOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExamUserOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamUserOptions&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.correctHighlightHex, correctHighlightHex) || other.correctHighlightHex == correctHighlightHex)&&(identical(other.correctHighlightTextHex, correctHighlightTextHex) || other.correctHighlightTextHex == correctHighlightTextHex)&&(identical(other.pickChoiceHighlightHex, pickChoiceHighlightHex) || other.pickChoiceHighlightHex == pickChoiceHighlightHex)&&(identical(other.pickChoiceHighlightTextHex, pickChoiceHighlightTextHex) || other.pickChoiceHighlightTextHex == pickChoiceHighlightTextHex)&&(identical(other.stickyButtonHeight, stickyButtonHeight) || other.stickyButtonHeight == stickyButtonHeight)&&(identical(other.questionTextSize, questionTextSize) || other.questionTextSize == questionTextSize)&&(identical(other.stickyButtonOrder, stickyButtonOrder) || other.stickyButtonOrder == stickyButtonOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,correctHighlightHex,correctHighlightTextHex,pickChoiceHighlightHex,pickChoiceHighlightTextHex,stickyButtonHeight,questionTextSize,stickyButtonOrder);

@override
String toString() {
  return 'ExamUserOptions(themeMode: $themeMode, correctHighlightHex: $correctHighlightHex, correctHighlightTextHex: $correctHighlightTextHex, pickChoiceHighlightHex: $pickChoiceHighlightHex, pickChoiceHighlightTextHex: $pickChoiceHighlightTextHex, stickyButtonHeight: $stickyButtonHeight, questionTextSize: $questionTextSize, stickyButtonOrder: $stickyButtonOrder)';
}


}

/// @nodoc
abstract mixin class _$ExamUserOptionsCopyWith<$Res> implements $ExamUserOptionsCopyWith<$Res> {
  factory _$ExamUserOptionsCopyWith(_ExamUserOptions value, $Res Function(_ExamUserOptions) _then) = __$ExamUserOptionsCopyWithImpl;
@override @useResult
$Res call({
 ExamThemeMode themeMode, String correctHighlightHex, String correctHighlightTextHex, String pickChoiceHighlightHex, String pickChoiceHighlightTextHex, StickyButtonHeight stickyButtonHeight, QuestionTextSize questionTextSize, StickyButtonOrder stickyButtonOrder
});




}
/// @nodoc
class __$ExamUserOptionsCopyWithImpl<$Res>
    implements _$ExamUserOptionsCopyWith<$Res> {
  __$ExamUserOptionsCopyWithImpl(this._self, this._then);

  final _ExamUserOptions _self;
  final $Res Function(_ExamUserOptions) _then;

/// Create a copy of ExamUserOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? correctHighlightHex = null,Object? correctHighlightTextHex = null,Object? pickChoiceHighlightHex = null,Object? pickChoiceHighlightTextHex = null,Object? stickyButtonHeight = null,Object? questionTextSize = null,Object? stickyButtonOrder = null,}) {
  return _then(_ExamUserOptions(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ExamThemeMode,correctHighlightHex: null == correctHighlightHex ? _self.correctHighlightHex : correctHighlightHex // ignore: cast_nullable_to_non_nullable
as String,correctHighlightTextHex: null == correctHighlightTextHex ? _self.correctHighlightTextHex : correctHighlightTextHex // ignore: cast_nullable_to_non_nullable
as String,pickChoiceHighlightHex: null == pickChoiceHighlightHex ? _self.pickChoiceHighlightHex : pickChoiceHighlightHex // ignore: cast_nullable_to_non_nullable
as String,pickChoiceHighlightTextHex: null == pickChoiceHighlightTextHex ? _self.pickChoiceHighlightTextHex : pickChoiceHighlightTextHex // ignore: cast_nullable_to_non_nullable
as String,stickyButtonHeight: null == stickyButtonHeight ? _self.stickyButtonHeight : stickyButtonHeight // ignore: cast_nullable_to_non_nullable
as StickyButtonHeight,questionTextSize: null == questionTextSize ? _self.questionTextSize : questionTextSize // ignore: cast_nullable_to_non_nullable
as QuestionTextSize,stickyButtonOrder: null == stickyButtonOrder ? _self.stickyButtonOrder : stickyButtonOrder // ignore: cast_nullable_to_non_nullable
as StickyButtonOrder,
  ));
}


}

// dart format on
