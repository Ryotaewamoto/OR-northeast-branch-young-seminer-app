import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/json_converters/union_timestamp.dart';

part 'presentation.freezed.dart';
part 'presentation.g.dart';

@freezed
class Presentation with _$Presentation {
  const factory Presentation({
    @Default('') String presentationId,
    @Default('') String presenterName,
    @Default('') String belong,
    @Default('') String title,
    @Default('') String description,
    @Default(false) bool isDone,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
        UnionTimestamp startAt,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
        UnionTimestamp endAt,
  }) = _Presentation;

  factory Presentation.fromJson(Map<String, dynamic> json) =>
      _$PresentationFromJson(json);

  factory Presentation.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return Presentation.fromJson(<String, dynamic>{
      ...data,
      'presentationId': ds.id,
    });
  }
}
