// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    json['url'] as String,
    json['repository_url'] as String,
    json['labels_url'] as String,
    json['comments_url'] as String,
    json['events_url'] as String,
    json['html_url'] as String,
    json['id'] as int,
    json['node_id'] as String,
    json['number'] as int,
    json['title'] as String,
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['labels'] as List,
    json['state'] as String,
    json['locked'] as bool,
    json['assignee'] == null
        ? null
        : Assignee.fromJson(json['assignee'] as Map<String, dynamic>),
    (json['assignees'] as List)
        ?.map((e) =>
            e == null ? null : Assignees.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['comments'] as int,
    json['created_at'] as String,
    json['updated_at'] as String,
    json['author_association'] as String,
    json['body'] as String,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'url': instance.url,
      'repository_url': instance.repositoryUrl,
      'labels_url': instance.labelsUrl,
      'comments_url': instance.commentsUrl,
      'events_url': instance.eventsUrl,
      'html_url': instance.htmlUrl,
      'id': instance.id,
      'node_id': instance.nodeId,
      'number': instance.number,
      'title': instance.title,
      'user': instance.user,
      'labels': instance.labels,
      'state': instance.state,
      'locked': instance.locked,
      'assignee': instance.assignee,
      'assignees': instance.assignees,
      'comments': instance.comments,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'author_association': instance.authorAssociation,
      'body': instance.body,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['login'] as String,
    json['id'] as int,
    json['node_id'] as String,
    json['avatar_url'] as String,
    json['gravatar_id'] as String,
    json['url'] as String,
    json['html_url'] as String,
    json['followers_url'] as String,
    json['following_url'] as String,
    json['gists_url'] as String,
    json['starred_url'] as String,
    json['subscriptions_url'] as String,
    json['organizations_url'] as String,
    json['repos_url'] as String,
    json['events_url'] as String,
    json['received_events_url'] as String,
    json['type'] as String,
    json['site_admin'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'gists_url': instance.gistsUrl,
      'starred_url': instance.starredUrl,
      'subscriptions_url': instance.subscriptionsUrl,
      'organizations_url': instance.organizationsUrl,
      'repos_url': instance.reposUrl,
      'events_url': instance.eventsUrl,
      'received_events_url': instance.receivedEventsUrl,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
    };

Assignee _$AssigneeFromJson(Map<String, dynamic> json) {
  return Assignee(
    json['login'] as String,
    json['id'] as int,
    json['node_id'] as String,
    json['avatar_url'] as String,
    json['gravatar_id'] as String,
    json['url'] as String,
    json['html_url'] as String,
    json['followers_url'] as String,
    json['following_url'] as String,
    json['gists_url'] as String,
    json['starred_url'] as String,
    json['subscriptions_url'] as String,
    json['organizations_url'] as String,
    json['repos_url'] as String,
    json['events_url'] as String,
    json['received_events_url'] as String,
    json['type'] as String,
    json['site_admin'] as bool,
  );
}

Map<String, dynamic> _$AssigneeToJson(Assignee instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'gists_url': instance.gistsUrl,
      'starred_url': instance.starredUrl,
      'subscriptions_url': instance.subscriptionsUrl,
      'organizations_url': instance.organizationsUrl,
      'repos_url': instance.reposUrl,
      'events_url': instance.eventsUrl,
      'received_events_url': instance.receivedEventsUrl,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
    };

Assignees _$AssigneesFromJson(Map<String, dynamic> json) {
  return Assignees(
    json['login'] as String,
    json['id'] as int,
    json['node_id'] as String,
    json['avatar_url'] as String,
    json['gravatar_id'] as String,
    json['url'] as String,
    json['html_url'] as String,
    json['followers_url'] as String,
    json['following_url'] as String,
    json['gists_url'] as String,
    json['starred_url'] as String,
    json['subscriptions_url'] as String,
    json['organizations_url'] as String,
    json['repos_url'] as String,
    json['events_url'] as String,
    json['received_events_url'] as String,
    json['type'] as String,
    json['site_admin'] as bool,
  );
}

Map<String, dynamic> _$AssigneesToJson(Assignees instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'gists_url': instance.gistsUrl,
      'starred_url': instance.starredUrl,
      'subscriptions_url': instance.subscriptionsUrl,
      'organizations_url': instance.organizationsUrl,
      'repos_url': instance.reposUrl,
      'events_url': instance.eventsUrl,
      'received_events_url': instance.receivedEventsUrl,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
    };
