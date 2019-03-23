// To parse this JSON data, do
//
//     final playlists = playlistsFromJson(jsonString);

import 'dart:convert';

Playlists playlistsFromJson(String str) {
    final jsonData = json.decode(str);
    return Playlists.fromJson(jsonData);
}

String playlistsToJson(Playlists data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Playlists {
    String kind;
    String etag;
    String nextPageToken;
    PageInfo pageInfo;
    List<Item> items;

    Playlists({
        this.kind,
        this.etag,
        this.nextPageToken,
        this.pageInfo,
        this.items,
    });

    factory Playlists.fromJson(Map<String, dynamic> json) => new Playlists(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        items: new List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "pageInfo": pageInfo.toJson(),
        "items": new List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    String kind;
    String etag;
    String id;
    Snippet snippet;
    ContentDetails contentDetails;

    Item({
        this.kind,
        this.etag,
        this.id,
        this.snippet,
        this.contentDetails,
    });

    factory Item.fromJson(Map<String, dynamic> json) => new Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet.toJson(),
        "contentDetails": contentDetails.toJson(),
    };
}

class ContentDetails {
    String videoId;
    String videoPublishedAt;

    ContentDetails({
        this.videoId,
        this.videoPublishedAt,
    });

    factory ContentDetails.fromJson(Map<String, dynamic> json) => new ContentDetails(
        videoId: json["videoId"],
        videoPublishedAt: json["videoPublishedAt"],
    );

    Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "videoPublishedAt": videoPublishedAt,
    };
}

class Snippet {
    String publishedAt;
    String channelId;
    String title;
    String description;
    Thumbnails thumbnails;
    String channelTitle;
    String playlistId;
    int position;
    ResourceId resourceId;

    Snippet({
        this.publishedAt,
        this.channelId,
        this.title,
        this.description,
        this.thumbnails,
        this.channelTitle,
        this.playlistId,
        this.position,
        this.resourceId,
    });

    factory Snippet.fromJson(Map<String, dynamic> json) => new Snippet(
        publishedAt: json["publishedAt"],
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        playlistId: json["playlistId"],
        position: json["position"],
        resourceId: ResourceId.fromJson(json["resourceId"]),
    );

    Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt,
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitle,
        "playlistId": playlistId,
        "position": position,
        "resourceId": resourceId.toJson(),
    };
}

class ResourceId {
    String kind;
    String videoId;

    ResourceId({
        this.kind,
        this.videoId,
    });

    factory ResourceId.fromJson(Map<String, dynamic> json) => new ResourceId(
        kind: json["kind"],
        videoId: json["videoId"],
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "videoId": videoId,
    };
}

class Thumbnails {
    Thumbnail thumbnailsDefault;
    Thumbnail medium;
    Thumbnail high;
    Thumbnail standard;
    Thumbnail maxres;

    Thumbnails({
        this.thumbnailsDefault,
        this.medium,
        this.high,
        this.standard,
        this.maxres,
    });

    factory Thumbnails.fromJson(Map<String, dynamic> json) => new Thumbnails(
        thumbnailsDefault: Thumbnail.fromJson(json["default"]),
        medium: Thumbnail.fromJson(json["medium"]),
        high: Thumbnail.fromJson(json["high"]),
        standard: Thumbnail.fromJson(json["standard"]),
        maxres: Thumbnail.fromJson(json["maxres"]),
    );

    Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
        "standard": standard.toJson(),
        "maxres": maxres.toJson(),
    };
}

class Thumbnail {
    String url;
    int width;
    int height;

    Thumbnail({
        this.url,
        this.width,
        this.height,
    });

    factory Thumbnail.fromJson(Map<String, dynamic> json) => new Thumbnail(
        url: null!=json?json["url"]:"",
        width: null!=json?json["width"]:0,
        height: null!=json?json["height"]:0,
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
    };
}

class PageInfo {
    int totalResults;
    int resultsPerPage;

    PageInfo({
        this.totalResults,
        this.resultsPerPage,
    });

    factory PageInfo.fromJson(Map<String, dynamic> json) => new PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
    };
}
