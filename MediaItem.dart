class MediaItem {
  String thumbnailUrl;
  String html;
  int width;
  String authorUrl;
  int height;
  String authorName;
  String version;
  String providerUrl;
  String title;
  int thumbnailHeight;
  String providerName;
  int thumbnailWidth;
  String type;

  MediaItem.fromJsonMap(Map<String, dynamic> map)
      : thumbnailUrl = map["thumbnail_url"],
        html = map["html"],
        width = map["width"],
        authorUrl = map["author_url"],
        height = map["height"],
        authorName = map["author_name"],
        version = map["version"],
        providerUrl = map["provider_url"],
        title = map["title"],
        thumbnailHeight = map["thumbnail_height"],
        providerName = map["provider_name"],
        thumbnailWidth = map["thumbnail_width"],
        type = map["type"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail_url'] = thumbnailUrl;
    data['html'] = html;
    data['width'] = width;
    data['author_url'] = authorUrl;
    data['height'] = height;
    data['author_name'] = authorName;
    data['version'] = version;
    data['provider_url'] = providerUrl;
    data['title'] = title;
    data['thumbnail_height'] = thumbnailHeight;
    data['provider_name'] = providerName;
    data['thumbnail_width'] = thumbnailWidth;
    data['type'] = type;
    return data;
  }
}
