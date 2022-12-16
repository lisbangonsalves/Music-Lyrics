import '/constants.dart';
import '/models/music_lyrics.dart';
import '/networking/api_provider.dart';
import 'dart:async';

class MusicLyricsRepository {
  final int trackId;
  MusicLyricsRepository({required this.trackId});
  ApiProvider _provider = ApiProvider();
  Future<MusicLyrics> fetchMusicDetailsData() async {
    final response = await _provider
        .get("track.lyrics.get?track_id=$trackId&apikey=$apikey");
    return MusicLyrics.fromJson(response);
  }
}
