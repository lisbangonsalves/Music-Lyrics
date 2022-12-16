import 'dart:async';
import '/networking/response.dart';
import '/repository/music_list_repository.dart';
import '/models/music_list.dart';

class MusicListBloc {
  late MusicListRepository _musicListRepository;
  late StreamController _musicListController;

  StreamSink<Response<MusicList>> get musicListSink =>
      _musicListController.sink as StreamSink<Response<MusicList>>;

  Stream<Response<MusicList>> get musicListStream =>
      _musicListController.stream as Stream<Response<MusicList>>;

  MusicListBloc() {
    _musicListController = StreamController<Response<MusicList>>.broadcast();
    _musicListRepository = MusicListRepository();
    fetchMusicList();
  }

  fetchMusicList() async {
    musicListSink.add(Response.loading('Loading list. '));
    try {
      MusicList musicList = await _musicListRepository.fetchMusicListData();
      musicListSink.add(Response.completed(musicList));
    } catch (e) {
      musicListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _musicListController.close();
  }
}
