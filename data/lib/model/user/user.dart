import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {

  const User._();

  factory User({
    @JsonKey(name: 'login')
    String? login,
    @JsonKey(name: 'id')
    int? id,
    @JsonKey(name: 'avatar_url')
    String? avatarUrl,
    @JsonKey(name: 'url')
    String? url
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
