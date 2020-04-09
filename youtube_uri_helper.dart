// Uri syntax
// https://upload.wikimedia.org/wikipedia/commons/d/d6/URI_syntax_diagram.svg
class YoutubeUriHelper {
  /*
7 thumbnails guaranteed

| Thumbnail Name      | Size (px) | URL                                              |
|---------------------|-----------|--------------------------------------------------|
| Player Background   | 480x360   | https://i1.ytimg.com/vi/<VIDEO ID>/0.jpg         |
| Start               | 120x90    | https://i1.ytimg.com/vi/<VIDEO ID>/1.jpg         |
| Middle              | 120x90    | https://i1.ytimg.com/vi/<VIDEO ID>/2.jpg         |
| End                 | 120x90    | https://i1.ytimg.com/vi/<VIDEO ID>/3.jpg         |
| High Quality        | 480x360   | https://i1.ytimg.com/vi/<VIDEO ID>/hqdefault.jpg |
| Medium Quality      | 320x180   | https://i1.ytimg.com/vi/<VIDEO ID>/mqdefault.jpg |
| Normal Quality      | 120x90    | https://i1.ytimg.com/vi/<VIDEO ID>/default.jpg   |

high-quality

| Thumbnail Name      | Size (px) | URL                                                  |
|---------------------|-----------|------------------------------------------------------|
| Standard Definition | 640x480   | https://i1.ytimg.com/vi/<VIDEO ID>/sddefault.jpg     |
| Maximum Resolution  | 1920x1080 | https://i1.ytimg.com/vi/<VIDEO ID>/maxresdefault.jpg |
   */
  static const String _C_URL_THUMBNAIL_FORMAT = "https://i1.ytimg.com/vi/";
  static const List<String> _C_FILE_NAME_THUMBNAIL_FORMAT = [
    "0.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "hqdefault.jpg",
    "mqdefault.jpg",
    "default.jpg",
    "sddefault.jpg",
    "maxresdefault.jpg"
  ];

  static const String _C_URL_OEMBED_FORMAT =
      "https://www.youtube.com/oembed?format=json&url=";

  final String link;

  YoutubeUriHelper(this.link);

  Uri uri() => Uri.parse(this.link);

  bool isHttp() => "http" == uri().scheme;

  bool isHttps() => "https" == uri().scheme;

  String _domain() {
    String host = uri()?.host ?? "";
    if (host.startsWith("www.")) {
      return host.replaceAll("www.", "");
    }
    if (host.startsWith("m.")) {
      return host.replaceAll("m.", "");
    }
    return host;
  }

  String _findValueFromQueryParameterKey(String keyParam) {
    String valueQueryParameter;
    uri().queryParameters?.forEach((key, value) {
      if (key == keyParam) {
        valueQueryParameter = value;
      }
    });
    return valueQueryParameter;
  }

  isYoutubeLink() => "youtube.com" == _domain();

  String getYoutubeId() {
    if (isYoutubeLink()) {
      return _findValueFromQueryParameterKey("v");
    }
    return null;
  }

  bool _isYoutubeWithMedia() {
    if (!isYoutubeLink()) return false;
    if ((getYoutubeId() ?? "").isEmpty) return false;
    return true;
  }

  List<String> getListThumbnail() {
    if (!_isYoutubeWithMedia()) return List();

    final String formatWithId = _C_URL_THUMBNAIL_FORMAT + getYoutubeId() + "/";
    return _C_FILE_NAME_THUMBNAIL_FORMAT
        .map((fileName) => formatWithId + fileName)
        .toList();
  }

  String getOembedLink() =>
      _isYoutubeWithMedia() ? Uri.encodeFull(_C_URL_OEMBED_FORMAT + link) : "";
}
