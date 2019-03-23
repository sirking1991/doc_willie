import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:cached_network_image/cached_network_image.dart';

final String YT_API_KEY = "AIzaSyBFlY_O8wo9YlArb-35P8zZ_zVbq-rSiJU";

class Videos extends StatefulWidget {
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  final TextEditingController _textController = new TextEditingController();
  List<Item> items = [];
  var youtube = new FlutterYoutube();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox.fromSize(
          size: Size(0, 10),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.blue),
              borderRadius: BorderRadius.circular(10)),
          child: new TextField(
            textInputAction: TextInputAction.search,
            controller: _textController,
            onSubmitted: (String text) => print(text),
            decoration:
                new InputDecoration.collapsed(hintText: "Search videos"),
          ),
        ),
        SizedBox.fromSize(
          size: Size(0, 10),
        ),
        Expanded(
          child: VideoItems()
        ),
      ],
    );
  }
}

class DataRetriever {
  Future<List<Item>> fetchUsersFromGitHub() async {
    Playlists playlists;
    final String url =
        'https://www.googleapis.com/youtube/v3/playlistItems?key='+YT_API_KEY+'&part=snippet,contentDetails&playlistId=PLqxfhR260JI7V4ELdNqtIFzCqi6Rtjt7x&maxResults=50';

    http.Response response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    if (200 == response.statusCode) {
        playlists = Playlists.fromJson(json.decode(response.body));
        return playlists.items;
    } else {
      throw Exception('Failed to load playlist');
    }
  }
}

class VideoItems extends StatefulWidget {
  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  List<Item> items;
  DataRetriever dataRetriever = new DataRetriever();
  items = await dataRetriever.fetchUsersFromGitHub();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            FlutterYoutube.playYoutubeVideoById(
                apiKey: YT_API_KEY,
                videoId: items[index].snippet.resourceId.videoId,
                autoPlay: false,
                fullScreen: false //default false
            );
          },
          child: Card(
            child: Padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FadeInImage(
                    width: 100,
                    placeholder:
                    new AssetImage('images/yt_placeholder.png'),
                    image: new CachedNetworkImageProvider(items[index]
                        .snippet
                        .thumbnails
                        .thumbnailsDefault
                        .url),
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    fadeInDuration: new Duration(milliseconds: 500),
                    fadeInCurve: Curves.linear,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(items[index].snippet.title),
                        ],
                      )),
                ],
              ),
              padding: EdgeInsets.all(10),
            ),
          ),
        );
      },
    );
  }
}

