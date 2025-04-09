// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      isGuest: json['isGuest'] == null ? false : _intToBool(json['isGuest']),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'isGuest': _boolToInt(instance.isGuest),
    };
