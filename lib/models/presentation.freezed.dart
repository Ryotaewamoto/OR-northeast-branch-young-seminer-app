// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'presentation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Presentation _$PresentationFromJson(Map<String, dynamic> json) {
  return _Presentation.fromJson(json);
}

/// @nodoc
mixin _$Presentation {
  String get presentationId => throw _privateConstructorUsedError;
  String get presenterName => throw _privateConstructorUsedError;
  String get belong => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  bool get isSession => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get startAt => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get endAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PresentationCopyWith<Presentation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresentationCopyWith<$Res> {
  factory $PresentationCopyWith(
          Presentation value, $Res Function(Presentation) then) =
      _$PresentationCopyWithImpl<$Res, Presentation>;
  @useResult
  $Res call(
      {String presentationId,
      String presenterName,
      String belong,
      String title,
      String description,
      bool isDone,
      bool isSession,
      @alwaysUseServerTimestampUnionTimestampConverter UnionTimestamp startAt,
      @alwaysUseServerTimestampUnionTimestampConverter UnionTimestamp endAt});

  $UnionTimestampCopyWith<$Res> get startAt;
  $UnionTimestampCopyWith<$Res> get endAt;
}

/// @nodoc
class _$PresentationCopyWithImpl<$Res, $Val extends Presentation>
    implements $PresentationCopyWith<$Res> {
  _$PresentationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presentationId = null,
    Object? presenterName = null,
    Object? belong = null,
    Object? title = null,
    Object? description = null,
    Object? isDone = null,
    Object? isSession = null,
    Object? startAt = null,
    Object? endAt = null,
  }) {
    return _then(_value.copyWith(
      presentationId: null == presentationId
          ? _value.presentationId
          : presentationId // ignore: cast_nullable_to_non_nullable
              as String,
      presenterName: null == presenterName
          ? _value.presenterName
          : presenterName // ignore: cast_nullable_to_non_nullable
              as String,
      belong: null == belong
          ? _value.belong
          : belong // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isSession: null == isSession
          ? _value.isSession
          : isSession // ignore: cast_nullable_to_non_nullable
              as bool,
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      endAt: null == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get startAt {
    return $UnionTimestampCopyWith<$Res>(_value.startAt, (value) {
      return _then(_value.copyWith(startAt: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get endAt {
    return $UnionTimestampCopyWith<$Res>(_value.endAt, (value) {
      return _then(_value.copyWith(endAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PresentationCopyWith<$Res>
    implements $PresentationCopyWith<$Res> {
  factory _$$_PresentationCopyWith(
          _$_Presentation value, $Res Function(_$_Presentation) then) =
      __$$_PresentationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String presentationId,
      String presenterName,
      String belong,
      String title,
      String description,
      bool isDone,
      bool isSession,
      @alwaysUseServerTimestampUnionTimestampConverter UnionTimestamp startAt,
      @alwaysUseServerTimestampUnionTimestampConverter UnionTimestamp endAt});

  @override
  $UnionTimestampCopyWith<$Res> get startAt;
  @override
  $UnionTimestampCopyWith<$Res> get endAt;
}

/// @nodoc
class __$$_PresentationCopyWithImpl<$Res>
    extends _$PresentationCopyWithImpl<$Res, _$_Presentation>
    implements _$$_PresentationCopyWith<$Res> {
  __$$_PresentationCopyWithImpl(
      _$_Presentation _value, $Res Function(_$_Presentation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presentationId = null,
    Object? presenterName = null,
    Object? belong = null,
    Object? title = null,
    Object? description = null,
    Object? isDone = null,
    Object? isSession = null,
    Object? startAt = null,
    Object? endAt = null,
  }) {
    return _then(_$_Presentation(
      presentationId: null == presentationId
          ? _value.presentationId
          : presentationId // ignore: cast_nullable_to_non_nullable
              as String,
      presenterName: null == presenterName
          ? _value.presenterName
          : presenterName // ignore: cast_nullable_to_non_nullable
              as String,
      belong: null == belong
          ? _value.belong
          : belong // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isSession: null == isSession
          ? _value.isSession
          : isSession // ignore: cast_nullable_to_non_nullable
              as bool,
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      endAt: null == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Presentation implements _Presentation {
  const _$_Presentation(
      {this.presentationId = '',
      this.presenterName = '',
      this.belong = '',
      this.title = '',
      this.description = '',
      this.isDone = false,
      this.isSession = false,
      @alwaysUseServerTimestampUnionTimestampConverter
          this.startAt = const UnionTimestamp.serverTimestamp(),
      @alwaysUseServerTimestampUnionTimestampConverter
          this.endAt = const UnionTimestamp.serverTimestamp()});

  factory _$_Presentation.fromJson(Map<String, dynamic> json) =>
      _$$_PresentationFromJson(json);

  @override
  @JsonKey()
  final String presentationId;
  @override
  @JsonKey()
  final String presenterName;
  @override
  @JsonKey()
  final String belong;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool isDone;
  @override
  @JsonKey()
  final bool isSession;
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp startAt;
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp endAt;

  @override
  String toString() {
    return 'Presentation(presentationId: $presentationId, presenterName: $presenterName, belong: $belong, title: $title, description: $description, isDone: $isDone, isSession: $isSession, startAt: $startAt, endAt: $endAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Presentation &&
            (identical(other.presentationId, presentationId) ||
                other.presentationId == presentationId) &&
            (identical(other.presenterName, presenterName) ||
                other.presenterName == presenterName) &&
            (identical(other.belong, belong) || other.belong == belong) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.isSession, isSession) ||
                other.isSession == isSession) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, presentationId, presenterName,
      belong, title, description, isDone, isSession, startAt, endAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PresentationCopyWith<_$_Presentation> get copyWith =>
      __$$_PresentationCopyWithImpl<_$_Presentation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PresentationToJson(
      this,
    );
  }
}

abstract class _Presentation implements Presentation {
  const factory _Presentation(
      {final String presentationId,
      final String presenterName,
      final String belong,
      final String title,
      final String description,
      final bool isDone,
      final bool isSession,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp startAt,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp endAt}) = _$_Presentation;

  factory _Presentation.fromJson(Map<String, dynamic> json) =
      _$_Presentation.fromJson;

  @override
  String get presentationId;
  @override
  String get presenterName;
  @override
  String get belong;
  @override
  String get title;
  @override
  String get description;
  @override
  bool get isDone;
  @override
  bool get isSession;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get startAt;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get endAt;
  @override
  @JsonKey(ignore: true)
  _$$_PresentationCopyWith<_$_Presentation> get copyWith =>
      throw _privateConstructorUsedError;
}
