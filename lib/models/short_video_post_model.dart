import 'dart:convert';

class ShortVideoPost {
    final String? postId;
    final Creator? creator;
    final Comment? comment;
    final Reaction? reaction;
    final Submission? submission;

    ShortVideoPost({
        this.postId,
        this.creator,
        this.comment,
        this.reaction,
        this.submission,
    });

    factory ShortVideoPost.fromRawJson(String str) => ShortVideoPost.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ShortVideoPost.fromJson(Map<String, dynamic> json) => ShortVideoPost(
        postId: json["postId"],
        creator: json["creator"] == null ? null : Creator.fromJson(json["creator"]),
        comment: json["comment"] == null ? null : Comment.fromJson(json["comment"]),
        reaction: json["reaction"] == null ? null : Reaction.fromJson(json["reaction"]),
        submission: json["submission"] == null ? null : Submission.fromJson(json["submission"]),
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "creator": creator?.toJson(),
        "comment": comment?.toJson(),
        "reaction": reaction?.toJson(),
        "submission": submission?.toJson(),
    };
}

class Comment {
    final int? count;
    final bool? commentingAllowed;

    Comment({
        this.count,
        this.commentingAllowed,
    });

    factory Comment.fromRawJson(String str) => Comment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        count: json["count"],
        commentingAllowed: json["commentingAllowed"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "commentingAllowed": commentingAllowed,
    };
}

class Creator {
    final String? name;
    final String? id;
    final String? handle;
    final String? pic;

    Creator({
        this.name,
        this.id,
        this.handle,
        this.pic,
    });

    factory Creator.fromRawJson(String str) => Creator.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        name: json["name"],
        id: json["id"],
        handle: json["handle"],
        pic: json["pic"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "handle": handle,
        "pic": pic,
    };
}

class Reaction {
    final int? count;
    final bool? voted;

    Reaction({
        this.count,
        this.voted,
    });

    factory Reaction.fromRawJson(String str) => Reaction.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Reaction.fromJson(Map<String, dynamic> json) => Reaction(
        count: json["count"],
        voted: json["voted"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "voted": voted,
    };
}

class Submission {
    final String? title;
    final String? description;
    final String? mediaUrl;
    final String? thumbnail;
    final String? hyperlink;
    final String? placeholderUrl;

    Submission({
        this.title,
        this.description,
        this.mediaUrl,
        this.thumbnail,
        this.hyperlink,
        this.placeholderUrl,
    });

    factory Submission.fromRawJson(String str) => Submission.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Submission.fromJson(Map<String, dynamic> json) => Submission(
        title: json["title"],
        description: json["description"],
        mediaUrl: json["mediaUrl"],
        thumbnail: json["thumbnail"],
        hyperlink: json["hyperlink"],
        placeholderUrl: json["placeholderUrl"],
    );

    Map<String, dynamic> toJson() => {
        "title": titleValues.reverse[title],
        "description": description,
        "mediaUrl": mediaUrl,
        "thumbnail": thumbnail,
        "hyperlink": hyperlink,
        "placeholderUrl": placeholderUrl,
    };
}

enum Title { RANDOM_TITLE }

final titleValues = EnumValues({
    "Random Title": Title.RANDOM_TITLE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}