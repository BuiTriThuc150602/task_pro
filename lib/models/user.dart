import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    int? id,
    required String username,
    required String password,
    String? email,
    String? avatarUrl,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _intToBool, toJson: _boolToInt)
    @Default(false)
    bool isGuest,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

bool _intToBool(dynamic value) => value == 1;
int _boolToInt(bool value) => value ? 1 : 0;
