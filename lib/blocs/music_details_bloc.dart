import 'dart:async';
import '/networking/response.dart';
import '/repository/music_details_repository.dart';
import '/models/music_details.dart';

class MusicDetailsBloc {
 late  MusicDetailsRepository _musicDetailsRepository;
  late StreamController _musicDetailsController;
  int trackId;
  StreamSink<Response<MusicDetails>> get musicDetailsSink =>
      _musicDetailsController.sink as StreamSink<Response<MusicDetails>>;

  Stream<Response<MusicDetails>> get musicDetailsStream =>
      _musicDetailsController.stream as Stream<Response<MusicDetails>>;

  MusicDetailsBloc({required this.trackId}) {
    _musicDetailsController =
        StreamController<Response<MusicDetails>>.broadcast();
    _musicDetailsRepository = MusicDetailsRepository(trackId: trackId);
    //fetchMusicDetails();
  }
  fetchMusicDetails() async {
    musicDetailsSink.add(Response.loading('Loading details.. '));
    try {
      MusicDetails musicDetails =
          await _musicDetailsRepository.fetchMusicDetailsData();
      musicDetailsSink.add(Response.completed(musicDetails));
    } catch (e) {
      musicDetailsSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _musicDetailsController.close();
  }
}
