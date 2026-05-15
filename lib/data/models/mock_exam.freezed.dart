// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mock_exam.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MockExamState {

 String get subject; List<ExamQuestion> get questions; List<int?> get answers; int get startedAt; int get currentIndex;
/// Create a copy of MockExamState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MockExamStateCopyWith<MockExamState> get copyWith => _$MockExamStateCopyWithImpl<MockExamState>(this as MockExamState, _$identity);

  /// Serializes this MockExamState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MockExamState&&(identical(other.subject, subject) || other.subject == subject)&&const DeepCollectionEquality().equals(other.questions, questions)&&const DeepCollectionEquality().equals(other.answers, answers)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subject,const DeepCollectionEquality().hash(questions),const DeepCollectionEquality().hash(answers),startedAt,currentIndex);

@override
String toString() {
  return 'MockExamState(subject: $subject, questions: $questions, answers: $answers, startedAt: $startedAt, currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class $MockExamStateCopyWith<$Res>  {
  factory $MockExamStateCopyWith(MockExamState value, $Res Function(MockExamState) _then) = _$MockExamStateCopyWithImpl;
@useResult
$Res call({
 String subject, List<ExamQuestion> questions, List<int?> answers, int startedAt, int currentIndex
});




}
/// @nodoc
class _$MockExamStateCopyWithImpl<$Res>
    implements $MockExamStateCopyWith<$Res> {
  _$MockExamStateCopyWithImpl(this._self, this._then);

  final MockExamState _self;
  final $Res Function(MockExamState) _then;

/// Create a copy of MockExamState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subject = null,Object? questions = null,Object? answers = null,Object? startedAt = null,Object? currentIndex = null,}) {
  return _then(_self.copyWith(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<ExamQuestion>,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<int?>,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as int,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MockExamState].
extension MockExamStatePatterns on MockExamState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MockExamState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MockExamState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MockExamState value)  $default,){
final _that = this;
switch (_that) {
case _MockExamState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MockExamState value)?  $default,){
final _that = this;
switch (_that) {
case _MockExamState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String subject,  List<ExamQuestion> questions,  List<int?> answers,  int startedAt,  int currentIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MockExamState() when $default != null:
return $default(_that.subject,_that.questions,_that.answers,_that.startedAt,_that.currentIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String subject,  List<ExamQuestion> questions,  List<int?> answers,  int startedAt,  int currentIndex)  $default,) {final _that = this;
switch (_that) {
case _MockExamState():
return $default(_that.subject,_that.questions,_that.answers,_that.startedAt,_that.currentIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String subject,  List<ExamQuestion> questions,  List<int?> answers,  int startedAt,  int currentIndex)?  $default,) {final _that = this;
switch (_that) {
case _MockExamState() when $default != null:
return $default(_that.subject,_that.questions,_that.answers,_that.startedAt,_that.currentIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MockExamState implements MockExamState {
  const _MockExamState({required this.subject, required final  List<ExamQuestion> questions, required final  List<int?> answers, required this.startedAt, required this.currentIndex}): _questions = questions,_answers = answers;
  factory _MockExamState.fromJson(Map<String, dynamic> json) => _$MockExamStateFromJson(json);

@override final  String subject;
 final  List<ExamQuestion> _questions;
@override List<ExamQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  List<int?> _answers;
@override List<int?> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

@override final  int startedAt;
@override final  int currentIndex;

/// Create a copy of MockExamState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MockExamStateCopyWith<_MockExamState> get copyWith => __$MockExamStateCopyWithImpl<_MockExamState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MockExamStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MockExamState&&(identical(other.subject, subject) || other.subject == subject)&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._answers, _answers)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subject,const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_answers),startedAt,currentIndex);

@override
String toString() {
  return 'MockExamState(subject: $subject, questions: $questions, answers: $answers, startedAt: $startedAt, currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class _$MockExamStateCopyWith<$Res> implements $MockExamStateCopyWith<$Res> {
  factory _$MockExamStateCopyWith(_MockExamState value, $Res Function(_MockExamState) _then) = __$MockExamStateCopyWithImpl;
@override @useResult
$Res call({
 String subject, List<ExamQuestion> questions, List<int?> answers, int startedAt, int currentIndex
});




}
/// @nodoc
class __$MockExamStateCopyWithImpl<$Res>
    implements _$MockExamStateCopyWith<$Res> {
  __$MockExamStateCopyWithImpl(this._self, this._then);

  final _MockExamState _self;
  final $Res Function(_MockExamState) _then;

/// Create a copy of MockExamState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subject = null,Object? questions = null,Object? answers = null,Object? startedAt = null,Object? currentIndex = null,}) {
  return _then(_MockExamState(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<ExamQuestion>,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<int?>,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as int,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MockExamHistoryEntry {

 String get subject; List<ExamQuestion> get questions; List<int?> get answers; int? get startedAt; int get endedAt; int get correctCount; bool get isPassed;
/// Create a copy of MockExamHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MockExamHistoryEntryCopyWith<MockExamHistoryEntry> get copyWith => _$MockExamHistoryEntryCopyWithImpl<MockExamHistoryEntry>(this as MockExamHistoryEntry, _$identity);

  /// Serializes this MockExamHistoryEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MockExamHistoryEntry&&(identical(other.subject, subject) || other.subject == subject)&&const DeepCollectionEquality().equals(other.questions, questions)&&const DeepCollectionEquality().equals(other.answers, answers)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.isPassed, isPassed) || other.isPassed == isPassed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subject,const DeepCollectionEquality().hash(questions),const DeepCollectionEquality().hash(answers),startedAt,endedAt,correctCount,isPassed);

@override
String toString() {
  return 'MockExamHistoryEntry(subject: $subject, questions: $questions, answers: $answers, startedAt: $startedAt, endedAt: $endedAt, correctCount: $correctCount, isPassed: $isPassed)';
}


}

/// @nodoc
abstract mixin class $MockExamHistoryEntryCopyWith<$Res>  {
  factory $MockExamHistoryEntryCopyWith(MockExamHistoryEntry value, $Res Function(MockExamHistoryEntry) _then) = _$MockExamHistoryEntryCopyWithImpl;
@useResult
$Res call({
 String subject, List<ExamQuestion> questions, List<int?> answers, int? startedAt, int endedAt, int correctCount, bool isPassed
});




}
/// @nodoc
class _$MockExamHistoryEntryCopyWithImpl<$Res>
    implements $MockExamHistoryEntryCopyWith<$Res> {
  _$MockExamHistoryEntryCopyWithImpl(this._self, this._then);

  final MockExamHistoryEntry _self;
  final $Res Function(MockExamHistoryEntry) _then;

/// Create a copy of MockExamHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subject = null,Object? questions = null,Object? answers = null,Object? startedAt = freezed,Object? endedAt = null,Object? correctCount = null,Object? isPassed = null,}) {
  return _then(_self.copyWith(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<ExamQuestion>,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<int?>,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as int?,endedAt: null == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as int,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,isPassed: null == isPassed ? _self.isPassed : isPassed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MockExamHistoryEntry].
extension MockExamHistoryEntryPatterns on MockExamHistoryEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MockExamHistoryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MockExamHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MockExamHistoryEntry value)  $default,){
final _that = this;
switch (_that) {
case _MockExamHistoryEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MockExamHistoryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _MockExamHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String subject,  List<ExamQuestion> questions,  List<int?> answers,  int? startedAt,  int endedAt,  int correctCount,  bool isPassed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MockExamHistoryEntry() when $default != null:
return $default(_that.subject,_that.questions,_that.answers,_that.startedAt,_that.endedAt,_that.correctCount,_that.isPassed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String subject,  List<ExamQuestion> questions,  List<int?> answers,  int? startedAt,  int endedAt,  int correctCount,  bool isPassed)  $default,) {final _that = this;
switch (_that) {
case _MockExamHistoryEntry():
return $default(_that.subject,_that.questions,_that.answers,_that.startedAt,_that.endedAt,_that.correctCount,_that.isPassed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String subject,  List<ExamQuestion> questions,  List<int?> answers,  int? startedAt,  int endedAt,  int correctCount,  bool isPassed)?  $default,) {final _that = this;
switch (_that) {
case _MockExamHistoryEntry() when $default != null:
return $default(_that.subject,_that.questions,_that.answers,_that.startedAt,_that.endedAt,_that.correctCount,_that.isPassed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MockExamHistoryEntry implements MockExamHistoryEntry {
  const _MockExamHistoryEntry({required this.subject, required final  List<ExamQuestion> questions, required final  List<int?> answers, this.startedAt, required this.endedAt, required this.correctCount, required this.isPassed}): _questions = questions,_answers = answers;
  factory _MockExamHistoryEntry.fromJson(Map<String, dynamic> json) => _$MockExamHistoryEntryFromJson(json);

@override final  String subject;
 final  List<ExamQuestion> _questions;
@override List<ExamQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  List<int?> _answers;
@override List<int?> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

@override final  int? startedAt;
@override final  int endedAt;
@override final  int correctCount;
@override final  bool isPassed;

/// Create a copy of MockExamHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MockExamHistoryEntryCopyWith<_MockExamHistoryEntry> get copyWith => __$MockExamHistoryEntryCopyWithImpl<_MockExamHistoryEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MockExamHistoryEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MockExamHistoryEntry&&(identical(other.subject, subject) || other.subject == subject)&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._answers, _answers)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.isPassed, isPassed) || other.isPassed == isPassed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subject,const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_answers),startedAt,endedAt,correctCount,isPassed);

@override
String toString() {
  return 'MockExamHistoryEntry(subject: $subject, questions: $questions, answers: $answers, startedAt: $startedAt, endedAt: $endedAt, correctCount: $correctCount, isPassed: $isPassed)';
}


}

/// @nodoc
abstract mixin class _$MockExamHistoryEntryCopyWith<$Res> implements $MockExamHistoryEntryCopyWith<$Res> {
  factory _$MockExamHistoryEntryCopyWith(_MockExamHistoryEntry value, $Res Function(_MockExamHistoryEntry) _then) = __$MockExamHistoryEntryCopyWithImpl;
@override @useResult
$Res call({
 String subject, List<ExamQuestion> questions, List<int?> answers, int? startedAt, int endedAt, int correctCount, bool isPassed
});




}
/// @nodoc
class __$MockExamHistoryEntryCopyWithImpl<$Res>
    implements _$MockExamHistoryEntryCopyWith<$Res> {
  __$MockExamHistoryEntryCopyWithImpl(this._self, this._then);

  final _MockExamHistoryEntry _self;
  final $Res Function(_MockExamHistoryEntry) _then;

/// Create a copy of MockExamHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subject = null,Object? questions = null,Object? answers = null,Object? startedAt = freezed,Object? endedAt = null,Object? correctCount = null,Object? isPassed = null,}) {
  return _then(_MockExamHistoryEntry(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<ExamQuestion>,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<int?>,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as int?,endedAt: null == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as int,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,isPassed: null == isPassed ? _self.isPassed : isPassed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
