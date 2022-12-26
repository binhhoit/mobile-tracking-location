import 'dart:convert';

import 'package:data/helpers/handle_network_mixin.dart';
import 'package:data/helpers/list_helper.dart';
import 'package:data/model/failures/failure.dart';
import 'package:data/model/user/user.dart';
import 'package:data/repositories/user_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository with HandleNetworkMixin {

  @override
  Future<Either<List<User>, Failure>> getFollower(int page, int pageSize) async {
    try {
      var data = await Future.value(List<User>.from(
          json.decode(_users).map((x) => User.fromJson(x))));
      return Either.left(data);
    } on Exception catch (exception) {
      return Either.right(handleError(exception));
    }
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
