import 'dart:convert';

import 'package:data/helpers/handle_networt_mixin.dart';
import 'package:data/helpers/list_helper.dart';
import 'package:data/model/user/user_dto.dart';
import 'package:data/model/user/user_mapper.dart';
import 'package:domain/model/result/result.dart';
import 'package:domain/model/user/user.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository with HandleNetworkMixin {
  final UserMapper userMapper;

  UserRepositoryImpl(this.userMapper);

  @override
  Future<Result<List<User>>> getFollower(int page, int pageSize) async {

    return makeRequest<List<User>>(
        call: Future.value(List<UserDTO>.from(
            json.decode(_users).map((x) => UserDTO.fromJson(x)))),
        toModel: (data) => mapToList(data, userMapper.fromModel));
  }

  static const _users = '''
  [{
    "login": "sausheong",
    "id": 5962,
    "node_id": "MDQ6VXNlcjU5NjI=",
    "avatar_url": "https://avatars.githubusercontent.com/u/5962?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/sausheong",
    "html_url": "https://github.com/sausheong",
    "followers_url": "https://api.github.com/users/sausheong/followers",
    "following_url": "https://api.github.com/users/sausheong/following{/other_user}",
    "gists_url": "https://api.github.com/users/sausheong/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/sausheong/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/sausheong/subscriptions",
    "organizations_url": "https://api.github.com/users/sausheong/orgs",
    "repos_url": "https://api.github.com/users/sausheong/repos",
    "events_url": "https://api.github.com/users/sausheong/events{/privacy}",
    "received_events_url": "https://api.github.com/users/sausheong/received_events",
    "type": "User",
    "site_admin": false
  },
  {
    "login": "linux-china",
    "id": 46711,
    "node_id": "MDQ6VXNlcjQ2NzEx",
    "avatar_url": "https://avatars.githubusercontent.com/u/46711?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/linux-china",
    "html_url": "https://github.com/linux-china",
    "followers_url": "https://api.github.com/users/linux-china/followers",
    "following_url": "https://api.github.com/users/linux-china/following{/other_user}",
    "gists_url": "https://api.github.com/users/linux-china/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/linux-china/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/linux-china/subscriptions",
    "organizations_url": "https://api.github.com/users/linux-china/orgs",
    "repos_url": "https://api.github.com/users/linux-china/repos",
    "events_url": "https://api.github.com/users/linux-china/events{/privacy}",
    "received_events_url": "https://api.github.com/users/linux-china/received_events",
    "type": "User",
    "site_admin": false
  }]
  ''';
}
