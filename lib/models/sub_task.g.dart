// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubTaskImpl _$$SubTaskImplFromJson(Map<String, dynamic> json) =>
    _$SubTaskImpl(
      id: (json['id'] as num?)?.toInt(),
      taskId: (json['taskId'] as num).toInt(),
      title: json['title'] as String,
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
          TaskStatus.TODO,
    );

Map<String, dynamic> _$$SubTaskImplToJson(_$SubTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'title': instance.title,
      'status': _$TaskStatusEnumMap[instance.status]!,
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
