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
  int itemCount;

  ContentDetails({
    this.itemCount,
  });

  factory ContentDetails.fromJson(Map<String, dynamic> json) => new ContentDetails(
    itemCount: json["itemCount"],
  );

  Map<String, dynamic> toJson() => {
    "itemCount": itemCount,
  };
}

class Snippet {
  String publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  Localized localized;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.localized,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => new Snippet(
    publishedAt: json["publishedAt"],
    channelId: json["channelId"],
    title: json["title"],
    description: json["description"],
    thumbnails: Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: json["channelTitle"],
    localized: Localized.fromJson(json["localized"]),
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt,
    "channelId": channelId,
    "title": title,
    "description": description,
    "thumbnails": thumbnails.toJson(),
    "channelTitle": channelTitle,
    "localized": localized.toJson(),
  };
}

class Localized {
  String title;
  String description;

  Localized({
    this.title,
    this.description,
  });

  factory Localized.fromJson(Map<String, dynamic> json) => new Localized(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}

class Thumbnails {
  Default thumbnailsDefault;
  Default medium;
  Default high;

  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => new Thumbnails(
    thumbnailsDefault: Default.fromJson(json["default"]),
    medium: Default.fromJson(json["medium"]),
    high: Default.fromJson(json["high"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault.toJson(),
    "medium": medium.toJson(),
    "high": high.toJson(),
  };
}

class Default {
  String url;
  int width;
  int height;

  Default({
    this.url,
    this.width,
    this.height,
  });

  factory Default.fromJson(Map<String, dynamic> json) => new Default(
    url: json["url"],
    width: json["width"],
    height: json["height"],
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
