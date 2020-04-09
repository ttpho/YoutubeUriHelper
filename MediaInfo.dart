import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:timeunit/MediaItem.dart';
import 'package:timeunit/youtube_uri_helper.dart';

/*
    var link = "https://www.youtube.com/watch?v=cnOIfm7imwQ";
    var youYoutubeUriHelper = YoutubeUriHelper(link);

    MediaInfo.getYoutubeInfo(link).then((mediaItem) {
      print(mediaItem.html);
      print(mediaItem.title);
      print(mediaItem.authorName);
      print(mediaItem.authorUrl);
      print(mediaItem.thumbnailUrl);
    });
 */
class MediaInfo {
  static Future<MediaItem> getYoutubeInfo(String url) async {
    final String requestLink = YoutubeUriHelper(url).getOembedLink() ?? "";
    if (requestLink.isEmpty) return Future.error("embed link not found ");
    final response = await http.get(requestLink);
    return compute(_parseJson, response.body);
  }

  static MediaItem _parseJson(String response) =>
      MediaItem.fromJsonMap(json.decode(response));
}
