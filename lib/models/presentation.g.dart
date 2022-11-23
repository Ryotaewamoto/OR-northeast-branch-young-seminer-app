// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Presentation _$$_PresentationFromJson(Map<String, dynamic> json) =>
    _$_Presentation(
      presentationId: json['presentationId'] as String? ?? '',
      presenterName: json['presenterName'] as String? ?? '',
      belong: json['belong'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      isDone: json['isDone'] as bool? ?? false,
      startAt: json['startAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['startAt'] as Object),
      endAt: json['endAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['endAt'] as Object),
    );

Map<String, dynamic> _$$_PresentationToJson(_$_Presentation instance) =>
    <String, dynamic>{
      'presentationId': instance.presentationId,
      'presenterName': instance.presenterName,
      'belong': instance.belong,
      'title': instance.title,
      'description': instance.description,
      'isDone': instance.isDone,
      'startAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.startAt),
      'endAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.endAt),
    };
