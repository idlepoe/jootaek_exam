// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExamChoice {

 int get no; String get text;
/// Create a copy of ExamChoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamChoiceCopyWith<ExamChoice> get copyWith => _$ExamChoiceCopyWithImpl<ExamChoice>(this as ExamChoice, _$identity);

  /// Serializes this ExamChoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamChoice&&(identical(other.no, no) || other.no == no)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,no,text);

@override
String toString() {
  return 'ExamChoice(no: $no, text: $text)';
}


}

/// @nodoc
abstract mixin class $ExamChoiceCopyWith<$Res>  {
  factory $ExamChoiceCopyWith(ExamChoice value, $Res Function(ExamChoice) _then) = _$ExamChoiceCopyWithImpl;
@useResult
$Res call({
 int no, String text
});




}
/// @nodoc
class _$ExamChoiceCopyWithImpl<$Res>
    implements $ExamChoiceCopyWith<$Res> {
  _$ExamChoiceCopyWithImpl(this._self, this._then);

  final ExamChoice _self;
  final $Res Function(ExamChoice) _then;

/// Create a copy of ExamChoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? no = null,Object? text = null,}) {
  return _then(_self.copyWith(
no: null == no ? _self.no : no // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExamChoice].
extension ExamChoicePatterns on ExamChoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExamChoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExamChoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExamChoice value)  $default,){
final _that = this;
switch (_that) {
case _ExamChoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExamChoice value)?  $default,){
final _that = this;
switch (_that) {
case _ExamChoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int no,  String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExamChoice() when $default != null:
return $default(_that.no,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int no,  String text)  $default,) {final _that = this;
switch (_that) {
case _ExamChoice():
return $default(_that.no,_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int no,  String text)?  $default,) {final _that = this;
switch (_that) {
case _ExamChoice() when $default != null:
return $default(_that.no,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExamChoice implements ExamChoice {
  const _ExamChoice({required this.no, required this.text});
  factory _ExamChoice.fromJson(Map<String, dynamic> json) => _$ExamChoiceFromJson(json);

@override final  int no;
@override final  String text;

/// Create a copy of ExamChoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamChoiceCopyWith<_ExamChoice> get copyWith => __$ExamChoiceCopyWithImpl<_ExamChoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExamChoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamChoice&&(identical(other.no, no) || other.no == no)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,no,text);

@override
String toString() {
  return 'ExamChoice(no: $no, text: $text)';
}


}

/// @nodoc
abstract mixin class _$ExamChoiceCopyWith<$Res> implements $ExamChoiceCopyWith<$Res> {
  factory _$ExamChoiceCopyWith(_ExamChoice value, $Res Function(_ExamChoice) _then) = __$ExamChoiceCopyWithImpl;
@override @useResult
$Res call({
 int no, String text
});




}
/// @nodoc
class __$ExamChoiceCopyWithImpl<$Res>
    implements _$ExamChoiceCopyWith<$Res> {
  __$ExamChoiceCopyWithImpl(this._self, this._then);

  final _ExamChoice _self;
  final $Res Function(_ExamChoice) _then;

/// Create a copy of ExamChoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? no = null,Object? text = null,}) {
  return _then(_ExamChoice(
no: null == no ? _self.no : no // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ExamQuestion {

 String get id;@JsonKey(name: 'exam_type') String get examType;@JsonKey(name: 'exam_session') String get examSession; String get subject;@JsonKey(name: 'question_number') int get questionNumber;@JsonKey(name: 'question_text') String get questionText; List<ExamChoice> get choices;@JsonKey(name: 'correct_answer') int get correctAnswer;
/// Create a copy of ExamQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamQuestionCopyWith<ExamQuestion> get copyWith => _$ExamQuestionCopyWithImpl<ExamQuestion>(this as ExamQuestion, _$identity);

  /// Serializes this ExamQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.examType, examType) || other.examType == examType)&&(identical(other.examSession, examSession) || other.examSession == examSession)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.questionNumber, questionNumber) || other.questionNumber == questionNumber)&&(identical(other.questionText, questionText) || other.questionText == questionText)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,examType,examSession,subject,questionNumber,questionText,const DeepCollectionEquality().hash(choices),correctAnswer);

@override
String toString() {
  return 'ExamQuestion(id: $id, examType: $examType, examSession: $examSession, subject: $subject, questionNumber: $questionNumber, questionText: $questionText, choices: $choices, correctAnswer: $correctAnswer)';
}


}

/// @nodoc
abstract mixin class $ExamQuestionCopyWith<$Res>  {
  factory $ExamQuestionCopyWith(ExamQuestion value, $Res Function(ExamQuestion) _then) = _$ExamQuestionCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'exam_type') String examType,@JsonKey(name: 'exam_session') String examSession, String subject,@JsonKey(name: 'question_number') int questionNumber,@JsonKey(name: 'question_text') String questionText, List<ExamChoice> choices,@JsonKey(name: 'correct_answer') int correctAnswer
});




}
/// @nodoc
class _$ExamQuestionCopyWithImpl<$Res>
    implements $ExamQuestionCopyWith<$Res> {
  _$ExamQuestionCopyWithImpl(this._self, this._then);

  final ExamQuestion _self;
  final $Res Function(ExamQuestion) _then;

/// Create a copy of ExamQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? examType = null,Object? examSession = null,Object? subject = null,Object? questionNumber = null,Object? questionText = null,Object? choices = null,Object? correctAnswer = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,examType: null == examType ? _self.examType : examType // ignore: cast_nullable_to_non_nullable
as String,examSession: null == examSession ? _self.examSession : examSession // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,questionNumber: null == questionNumber ? _self.questionNumber : questionNumber // ignore: cast_nullable_to_non_nullable
as int,questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<ExamChoice>,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExamQuestion].
extension ExamQuestionPatterns on ExamQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExamQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExamQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExamQuestion value)  $default,){
final _that = this;
switch (_that) {
case _ExamQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExamQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _ExamQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'exam_type')  String examType, @JsonKey(name: 'exam_session')  String examSession,  String subject, @JsonKey(name: 'question_number')  int questionNumber, @JsonKey(name: 'question_text')  String questionText,  List<ExamChoice> choices, @JsonKey(name: 'correct_answer')  int correctAnswer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExamQuestion() when $default != null:
return $default(_that.id,_that.examType,_that.examSession,_that.subject,_that.questionNumber,_that.questionText,_that.choices,_that.correctAnswer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'exam_type')  String examType, @JsonKey(name: 'exam_session')  String examSession,  String subject, @JsonKey(name: 'question_number')  int questionNumber, @JsonKey(name: 'question_text')  String questionText,  List<ExamChoice> choices, @JsonKey(name: 'correct_answer')  int correctAnswer)  $default,) {final _that = this;
switch (_that) {
case _ExamQuestion():
return $default(_that.id,_that.examType,_that.examSession,_that.subject,_that.questionNumber,_that.questionText,_that.choices,_that.correctAnswer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'exam_type')  String examType, @JsonKey(name: 'exam_session')  String examSession,  String subject, @JsonKey(name: 'question_number')  int questionNumber, @JsonKey(name: 'question_text')  String questionText,  List<ExamChoice> choices, @JsonKey(name: 'correct_answer')  int correctAnswer)?  $default,) {final _that = this;
switch (_that) {
case _ExamQuestion() when $default != null:
return $default(_that.id,_that.examType,_that.examSession,_that.subject,_that.questionNumber,_that.questionText,_that.choices,_that.correctAnswer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExamQuestion implements ExamQuestion {
  const _ExamQuestion({required this.id, @JsonKey(name: 'exam_type') required this.examType, @JsonKey(name: 'exam_session') required this.examSession, required this.subject, @JsonKey(name: 'question_number') required this.questionNumber, @JsonKey(name: 'question_text') required this.questionText, required final  List<ExamChoice> choices, @JsonKey(name: 'correct_answer') required this.correctAnswer}): _choices = choices;
  factory _ExamQuestion.fromJson(Map<String, dynamic> json) => _$ExamQuestionFromJson(json);

@override final  String id;
@override@JsonKey(name: 'exam_type') final  String examType;
@override@JsonKey(name: 'exam_session') final  String examSession;
@override final  String subject;
@override@JsonKey(name: 'question_number') final  int questionNumber;
@override@JsonKey(name: 'question_text') final  String questionText;
 final  List<ExamChoice> _choices;
@override List<ExamChoice> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}

@override@JsonKey(name: 'correct_answer') final  int correctAnswer;

/// Create a copy of ExamQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamQuestionCopyWith<_ExamQuestion> get copyWith => __$ExamQuestionCopyWithImpl<_ExamQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExamQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.examType, examType) || other.examType == examType)&&(identical(other.examSession, examSession) || other.examSession == examSession)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.questionNumber, questionNumber) || other.questionNumber == questionNumber)&&(identical(other.questionText, questionText) || other.questionText == questionText)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,examType,examSession,subject,questionNumber,questionText,const DeepCollectionEquality().hash(_choices),correctAnswer);

@override
String toString() {
  return 'ExamQuestion(id: $id, examType: $examType, examSession: $examSession, subject: $subject, questionNumber: $questionNumber, questionText: $questionText, choices: $choices, correctAnswer: $correctAnswer)';
}


}

/// @nodoc
abstract mixin class _$ExamQuestionCopyWith<$Res> implements $ExamQuestionCopyWith<$Res> {
  factory _$ExamQuestionCopyWith(_ExamQuestion value, $Res Function(_ExamQuestion) _then) = __$ExamQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'exam_type') String examType,@JsonKey(name: 'exam_session') String examSession, String subject,@JsonKey(name: 'question_number') int questionNumber,@JsonKey(name: 'question_text') String questionText, List<ExamChoice> choices,@JsonKey(name: 'correct_answer') int correctAnswer
});




}
/// @nodoc
class __$ExamQuestionCopyWithImpl<$Res>
    implements _$ExamQuestionCopyWith<$Res> {
  __$ExamQuestionCopyWithImpl(this._self, this._then);

  final _ExamQuestion _self;
  final $Res Function(_ExamQuestion) _then;

/// Create a copy of ExamQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? examType = null,Object? examSession = null,Object? subject = null,Object? questionNumber = null,Object? questionText = null,Object? choices = null,Object? correctAnswer = null,}) {
  return _then(_ExamQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,examType: null == examType ? _self.examType : examType // ignore: cast_nullable_to_non_nullable
as String,examSession: null == examSession ? _self.examSession : examSession // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,questionNumber: null == questionNumber ? _self.questionNumber : questionNumber // ignore: cast_nullable_to_non_nullable
as int,questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<ExamChoice>,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ExamSessionsManifest {

 List<String> get sessions;
/// Create a copy of ExamSessionsManifest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamSessionsManifestCopyWith<ExamSessionsManifest> get copyWith => _$ExamSessionsManifestCopyWithImpl<ExamSessionsManifest>(this as ExamSessionsManifest, _$identity);

  /// Serializes this ExamSessionsManifest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamSessionsManifest&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'ExamSessionsManifest(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $ExamSessionsManifestCopyWith<$Res>  {
  factory $ExamSessionsManifestCopyWith(ExamSessionsManifest value, $Res Function(ExamSessionsManifest) _then) = _$ExamSessionsManifestCopyWithImpl;
@useResult
$Res call({
 List<String> sessions
});




}
/// @nodoc
class _$ExamSessionsManifestCopyWithImpl<$Res>
    implements $ExamSessionsManifestCopyWith<$Res> {
  _$ExamSessionsManifestCopyWithImpl(this._self, this._then);

  final ExamSessionsManifest _self;
  final $Res Function(ExamSessionsManifest) _then;

/// Create a copy of ExamSessionsManifest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessions = null,}) {
  return _then(_self.copyWith(
sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExamSessionsManifest].
extension ExamSessionsManifestPatterns on ExamSessionsManifest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExamSessionsManifest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExamSessionsManifest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExamSessionsManifest value)  $default,){
final _that = this;
switch (_that) {
case _ExamSessionsManifest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExamSessionsManifest value)?  $default,){
final _that = this;
switch (_that) {
case _ExamSessionsManifest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExamSessionsManifest() when $default != null:
return $default(_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> sessions)  $default,) {final _that = this;
switch (_that) {
case _ExamSessionsManifest():
return $default(_that.sessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> sessions)?  $default,) {final _that = this;
switch (_that) {
case _ExamSessionsManifest() when $default != null:
return $default(_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExamSessionsManifest implements ExamSessionsManifest {
  const _ExamSessionsManifest({required final  List<String> sessions}): _sessions = sessions;
  factory _ExamSessionsManifest.fromJson(Map<String, dynamic> json) => _$ExamSessionsManifestFromJson(json);

 final  List<String> _sessions;
@override List<String> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of ExamSessionsManifest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamSessionsManifestCopyWith<_ExamSessionsManifest> get copyWith => __$ExamSessionsManifestCopyWithImpl<_ExamSessionsManifest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExamSessionsManifestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamSessionsManifest&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'ExamSessionsManifest(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$ExamSessionsManifestCopyWith<$Res> implements $ExamSessionsManifestCopyWith<$Res> {
  factory _$ExamSessionsManifestCopyWith(_ExamSessionsManifest value, $Res Function(_ExamSessionsManifest) _then) = __$ExamSessionsManifestCopyWithImpl;
@override @useResult
$Res call({
 List<String> sessions
});




}
/// @nodoc
class __$ExamSessionsManifestCopyWithImpl<$Res>
    implements _$ExamSessionsManifestCopyWith<$Res> {
  __$ExamSessionsManifestCopyWithImpl(this._self, this._then);

  final _ExamSessionsManifest _self;
  final $Res Function(_ExamSessionsManifest) _then;

/// Create a copy of ExamSessionsManifest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessions = null,}) {
  return _then(_ExamSessionsManifest(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
