import '/blocs/connectivity_bloc.dart';
import '/view/bookmarks_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '/blocs/music_list_block.dart';
import '/networking/response.dart';
import '/models/music_list.dart';
import 'musiclyrics.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConnectivityBloc _netBloc = ConnectivityBloc();
  MusicListBloc _bloc = MusicListBloc();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161728),
      
      body: StreamBuilder<ConnectivityResult>(
          stream: _netBloc.connectivityResultStream.asBroadcastStream(),
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case ConnectivityResult.mobile:
              case ConnectivityResult.wifi:
                _bloc.fetchMusicList();
                //print('NET : ');
                return RefreshIndicator(
                  onRefresh: () => _bloc.fetchMusicList(),
                  child: StreamBuilder<Response<MusicList>>(
                    stream: _bloc.musicListStream.asBroadcastStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data!.status) {
                          case Status.LOADING:
                            return Loading(
                                loadingMessage: snapshot.data!.message);
                            break;
                          case Status.COMPLETED:
                            return TrackList(musicList: snapshot.data!.data);
                            break;
                          case Status.ERROR:
                            break;
                        }
                      }
                      return Loading(loadingMessage: 'Connecting');
                    },
                  ),
                );
                break;
              case ConnectivityResult.none:
                //print('No net: ');
                return Center(
                  child: Text('No internet'),
                );
                break;
            }
            return Container();
          }),

    );
    
  }

  @override
  void dispose() {
    _netBloc.dispose();
    _bloc.dispose();
    super.dispose();
  }
}

class TrackList extends StatelessWidget {
  final MusicList musicList;
  const TrackList({Key? key, required this.musicList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          Track track = musicList.message.body.trackList[index].track;
          return TrackTile(
            track: track,
          );
        },
        itemCount: musicList.message.body.trackList.length,
        //shrinkWrap: true,
        physics: ClampingScrollPhysics(),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key? key, required this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 24,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ],
      ),
    );
  }
}

class TrackTile extends StatelessWidget {
  final Track track;
  TrackTile({
    required this.track,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //debugPrint('Calling for trackid ${track.trackId}');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GetMusicLyrics(trackCurrent: track)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 95, 93, 93), width: 1.0),
            ),
          ),
          child: ListTile(
            leading: Icon(Icons.library_music, color: Colors.white,),
            title: Text(
              track.trackName!,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(track.albumName!+" by "+ track.artistName!,style: TextStyle(color: Color.fromARGB(255, 247, 128, 209)), ),
            
          ),
        ),
      ),
    );
  }
}
