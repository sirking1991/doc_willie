import 'dart:core';

import 'package:flutter/material.dart';
import "package:doc_willie_ong/playlist_model.dart";

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Videos extends StatefulWidget {
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(height: 200, color: Colors.green, margin: EdgeInsets.only(top: 3), child: VideoPlaylist()),
        Container(color: Colors.blue, margin: EdgeInsets.only(top: 3), child: PlaylistVideos()),
      ],
    );
  }
}

class VideoPlaylist extends StatefulWidget {
  @override
  _VideoPlaylistState createState() => _VideoPlaylistState();
}

class _VideoPlaylistState extends State<VideoPlaylist> {
  List<Item> items = [];
  bool isLoading = true;

  @override
  void initState() {
    isLoading = true;
    retrieveVideoPlaylist().then((value) {
      setState(() {
        items = value;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return Center(child: ScalingText("Loading videos..."));

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        // filter out these playlists
        if ('Favorites' == items[index].snippet.title ||
            'Music Doc Willie' == items[index].snippet.title ||
            'Lawyer Tips - with Doc Willie at Liza' ==
                items[index].snippet.title) return SizedBox();

        return GestureDetector(
          onTap: ()=>print("tapped: "+items[index].id),
          child: Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                FadeInImage(
                  width: 200,
                  placeholder: new AssetImage('images/yt_placeholder.png'),
                  image: new CachedNetworkImageProvider(
                      items[index].snippet.thumbnails.medium.url),
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.only(top: 2, left: 5, right: 5,bottom: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(items[index].snippet.title),
                        Text(
                          items[index].contentDetails.itemCount.toString() +
                              " videos",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

//    return ListView.builder(
//        itemCount: items.length,
//        itemBuilder: (BuildContext context, int index) {
//          if( 'Favorites'==items[index].snippet.title ||
//              'Music Doc Willie'==items[index].snippet.title ||
//              'Lawyer Tips - with Doc Willie at Liza'==items[index].snippet.title) return SizedBox();
//          return GestureDetector(
//            onTap: ()=>print("tapped:"+items[index].id),
//            child: Card(
//              child: Row(
//                children: <Widget>[
//                  FadeInImage(
//                    width: 100,
//                    placeholder: new AssetImage('images/yt_placeholder.png'),
//                    image: new CachedNetworkImageProvider(
//                        items[index].snippet.thumbnails.thumbnailsDefault.url),
//                    fit: BoxFit.contain,
//                    alignment: Alignment.center,
//                    fadeInDuration: new Duration(milliseconds: 500),
//                    fadeInCurve: Curves.linear,
//                  ),
//                  SizedBox(
//                    width: 10,
//                  ),
//                  Expanded(
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Text(items[index].snippet.title),
//                        Text(items[index].contentDetails.itemCount.toString()+" videos", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),)
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          );
//        });
  }

  Future<List<Item>> retrieveVideoPlaylist() async {
    final response = await http.get(
        "https://www.googleapis.com/youtube/v3/playlists?key=AIzaSyBFlY_O8wo9YlArb-35P8zZ_zVbq-rSiJU&part=snippet,contentDetails&channelId=UCR6n79EOdY406JlZD8FEgyg&maxResults=50");

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Playlists.fromJson(json.decode(response.body)).items.toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}


class PlaylistVideos extends StatefulWidget {
  @override
  _PlaylistVideosState createState() => _PlaylistVideosState();
}

class _PlaylistVideosState extends State<PlaylistVideos> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(child: Text("Item one"),),
        Card(child: Text("Item two"),),
        Card(child: Text("Item three"),),
        Card(child: Text("Item four"),),
        Card(child: Text("Item five"),),
      ],
    );
  }
}
