YoutubeUriHelper is module support check link from Youtube by Dart language 

```dart
var link = "https://www.youtube.com/watch?v=cnOIfm7imwQ";
var youYoutubeUriHelper = YoutubeUriHelper(link);
```

| Function      | Result      |  Note      |
| ------------- |-------------| -------------| 
| `.getYoutubeId()` |`cnOIfm7imwQ`| youtube id | 
| `.getListThumbnail()` |`https://i1.ytimg.com/vi/cnOIfm7imwQ/0.jpg, https://i1.ytimg.com/vi/cnOIfm7imwQ/1.jpg, https://i1.ytimg.com/vi/cnOIfm7imwQ/2.jpg, https://i1.ytimg.com/vi/cnOIfm7imwQ/3.jpg, https://i1.ytimg.com/vi/cnOIfm7imwQ/hqdefault.jpg, https://i1.ytimg.com/vi/cnOIfm7imwQ/mqdefault.jpg, https://i1.ytimg.com/vi/cnOIfm7imwQ/default.jpg, https://i1.ytimg.com/vi/cnOIfm7imwQ/sddefault.jpg, https://i1.ytimg.com/vi/cnOIfm7imwQ/maxresdefault.jpg`| <img src="https://i1.ytimg.com/vi/cnOIfm7imwQ/0.jpg" width = 200></br><img src="https://i1.ytimg.com/vi/cnOIfm7imwQ/1.jpg" width = 200></br><img src="https://i1.ytimg.com/vi/cnOIfm7imwQ/2.jpg" width = 200></br><img src="https://i1.ytimg.com/vi/cnOIfm7imwQ/3.jpg" width = 200></br><img src="https://i1.ytimg.com/vi/cnOIfm7imwQ/hqdefault.jpg" width = 200></br><img src="https://i1.ytimg.com/vi/cnOIfm7imwQ/mqdefault.jpg" width = 200></br><img src="https://i1.ytimg.com/vi/cnOIfm7imwQ/default.jpg" width = 200></br><img src="https://i1.ytimg.com/vi/cnOIfm7imwQ/sddefault.jpg" width = 200></br><img src="https://i1.ytimg.com/vi/cnOIfm7imwQ/maxresdefault.jpg" width = 200>| 

Suport get media embed

```dart
    MediaInfo.getYoutubeInfo(link).then((mediaItem) {
      print(mediaItem.html);
    });
```
| Function      | Result      | 
| ------------- |-------------|
| `.html` |`<iframe width="480" height="270" src="https://www.youtube.com/embed/cnOIfm7imwQ?feature=oembed" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>`|
| `.title` |`YÊU NHƯ NGÀY YÊU CUỐI [ OFFICIAL LYRIC MV ] MAI TIẾN DŨNG`|
| `.authorName` |`MAI TIẾN DŨNG [OFFICIAL CHANNEL]`|
| `.authorUrl` |`https://www.youtube.com/channel/UCwRbNdY2ipKp9MU_BpbTjeQ`|
| `.thumbnailUrl` |`https://i.ytimg.com/vi/cnOIfm7imwQ/hqdefault.jpg`|



