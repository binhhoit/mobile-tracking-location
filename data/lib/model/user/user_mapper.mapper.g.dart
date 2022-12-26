// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class UserMapperImpl extends UserMapper {
  UserMapperImpl() : super();

  @override
  User fromModel(UserDTO model) {
    final user = User(
        login: model.login,
        id: model.id,
        nodeId: model.nodeId,
        avatarUrl: model.avatarUrl,
        gravatarId: model.gravatarId,
        url: model.url,
        htmlUrl: model.htmlUrl,
        followersUrl: model.followersUrl,
        followingUrl: model.followingUrl,
        gistsUrl: model.gistsUrl,
        starredUrl: model.starredUrl,
        subscriptionsUrl: model.subscriptionsUrl,
        organizationsUrl: model.organizationsUrl,
        reposUrl: model.reposUrl,
        eventsUrl: model.eventsUrl,
        receivedEventsUrl: model.receivedEventsUrl,
        type: model.type,
        siteAdmin: model.siteAdmin);
    return user;
  }
}
