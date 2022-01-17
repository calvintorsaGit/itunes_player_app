class Song  {

  final String trackUrl;
  final String artworkUrl;
  final String trackName;
  final String artistName;
  final String collectionName;

  Song(Map json)
      :
        trackUrl = json['previewUrl'],
        artworkUrl = json['artworkUrl60'],
        trackName = json['trackName'],
        artistName = json['artistName'],
        collectionName = json['collectionName'];

}
