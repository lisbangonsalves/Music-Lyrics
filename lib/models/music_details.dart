class MusicDetails {
  late Message message;

  MusicDetails({required this.message});

  MusicDetails.fromJson(Map<String, dynamic> json) {
    message =
        (json['message'] != null ? new Message.fromJson(json['message']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message.toJson();
    }
    return data;
  }
}

class Message {
  late Header header;
  late Body body;

  Message({required this.header, required this.body});

  Message.fromJson(Map<String, dynamic> json) {
    header =
        (json['header'] != null ? new Header.fromJson(json['header']) : null)!;
    body = (json['body'] != null ? new Body.fromJson(json['body']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.header != null) {
      data['header'] = this.header.toJson();
    }
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class Header {
  late int statusCode;
  late double executeTime;

  Header({required this.statusCode, required this.executeTime});

  Header.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    executeTime = json['execute_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['execute_time'] = this.executeTime;
    return data;
  }
}

class Body {
  late Track track;

  Body({required this.track});

  Body.fromJson(Map<String, dynamic> json) {
    track = (json['track'] != null ? new Track.fromJson(json['track']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.track != null) {
      data['track'] = this.track.toJson();
    }
    return data;
  }
}

class Track {
 late int trackId;
  late String trackName;
  late List<Null> trackNameTranslationList;
  late int trackRating;
  late int commontrackId;
  late int instrumental;
  late int explicit;
  late int hasLyrics;
  late int hasSubtitles;
  late int hasRichsync;
  late int numFavourite;
  late int albumId;
  late String albumName;
  late int artistId;
  late String artistName;
  late String trackShareUrl;
  late String trackEditUrl;
  late int restricted;
  late String updatedTime;
  late PrimaryGenres primaryGenres;

  Track(
      {required this.trackId,
      required this.trackName,
      required this.trackNameTranslationList,
      required this.trackRating,
      required this.commontrackId,
      required this.instrumental,
      required this.explicit,
      required this.hasLyrics,
      required this.hasSubtitles,
      required this.hasRichsync,
      required this.numFavourite,
      required this.albumId,
      required this.albumName,
      required this.artistId,
      required this.artistName,
      required this.trackShareUrl,
      required this.trackEditUrl,
      required this.restricted,
      required this.updatedTime,
      required this.primaryGenres});

  Track.fromJson(Map<String, dynamic> json) {
    trackId = json['track_id'];
    trackName = json['track_name'];
    trackRating = json['track_rating'];
    commontrackId = json['commontrack_id'];
    instrumental = json['instrumental'];
    explicit = json['explicit'];
    hasLyrics = json['has_lyrics'];
    hasSubtitles = json['has_subtitles'];
    hasRichsync = json['has_richsync'];
    numFavourite = json['num_favourite'];
    albumId = json['album_id'];
    albumName = json['album_name'];
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    trackShareUrl = json['track_share_url'];
    trackEditUrl = json['track_edit_url'];
    restricted = json['restricted'];
    updatedTime = json['updated_time'];
    primaryGenres = (json['primary_genres'] != null
        ? new PrimaryGenres.fromJson(json['primary_genres'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['track_id'] = this.trackId;
    data['track_name'] = this.trackName;
    data['track_rating'] = this.trackRating;
    data['commontrack_id'] = this.commontrackId;
    data['instrumental'] = this.instrumental;
    data['explicit'] = this.explicit;
    data['has_lyrics'] = this.hasLyrics;
    data['has_subtitles'] = this.hasSubtitles;
    data['has_richsync'] = this.hasRichsync;
    data['num_favourite'] = this.numFavourite;
    data['album_id'] = this.albumId;
    data['album_name'] = this.albumName;
    data['artist_id'] = this.artistId;
    data['artist_name'] = this.artistName;
    data['track_share_url'] = this.trackShareUrl;
    data['track_edit_url'] = this.trackEditUrl;
    data['restricted'] = this.restricted;
    data['updated_time'] = this.updatedTime;
    if (this.primaryGenres != null) {
      data['primary_genres'] = this.primaryGenres.toJson();
    }
    return data;
  }
}

class PrimaryGenres {
  late List<Null> musicGenreList;

  PrimaryGenres({required this.musicGenreList});

  PrimaryGenres.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
