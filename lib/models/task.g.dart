// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
          TaskStatus.TODO,
      level: $enumDecodeNullable(_$TaskLevelEnumMap, json['level']) ??
          TaskLevel.NONE,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'dueDate': instance.dueDate?.toIso8601String(),
      'status': _$TaskStatusEnumMap[instance.status]!,
      'level': _$TaskLevelEnumMap[instance.level]!,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.TODO: 'TODO',
  TaskStatus.IN_PROGRESS: 'IN_PROGRESS',
  TaskStatus.PULL_REQUEST: 'PULL_REQUEST',
  TaskStatus.DONE: 'DONE',
  TaskStatus.ASIGNED: 'ASIGNED',
  TaskStatus.IN_REVIEW: 'IN_REVIEW',
  TaskStatus.BLOCKED: 'BLOCKED',
  TaskStatus.CANCELED: 'CANCELED',
  TaskStatus.ON_HOLD: 'ON_HOLD',
};

const _$TaskLevelEnumMap = {
  TaskLevel.NONE: 'NONE',
  TaskLevel.LOW: 'LOW',
  TaskLevel.MEDIUM: 'MEDIUM',
  TaskLevel.HIGH: 'HIGH',
  TaskLevel.URGENT: 'URGENT',
  TaskLevel.CRITICAL: 'CRITICAL',
  TaskLevel.BLOCKER: 'BLOCKER',
  TaskLevel.TRIVIAL: 'TRIVIAL',
  TaskLevel.MAJOR: 'MAJOR',
  TaskLevel.MINOR: 'MINOR',
};
