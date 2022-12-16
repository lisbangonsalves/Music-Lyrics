import '/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/models/music_list.dart' as ListTrack;

class BookmarkView extends StatefulWidget {
  @override
  _BookmarkViewState createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  late List<String> trackIdList;
  late List<String> trackNameList;
  late List<String> trackAlbumList;
  late List<String> trackArtistList;
  @override
  void initState() {
    super.initState();
  }

  void sharedPref() async {
    final perfs = await SharedPreferences.getInstance();
    setState(() {
      trackIdList = perfs.getStringList('bookmarkList')!;
      trackNameList = perfs.getStringList('nameList')!;
      trackAlbumList = perfs.getStringList('albumList')!;
      trackAlbumList = perfs.getStringList('artistList')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    sharedPref();
    return Scaffold(
      
      backgroundColor: Color(0xff161728),
      body: (trackIdList == null || trackIdList.length == 0)
          ? Center(
              child: Text(
                'No bookmarks added',
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
            )
          : listViewBuilder(),
    );
  }

  listViewBuilder() {
    return ListView.builder(
        itemBuilder: (context, index) {
          ListTrack.Track track = ListTrack.Track();
          track.trackId = int.parse(trackIdList[index]);
          track.trackName = trackNameList[index];
          track.albumName = trackAlbumList[index];
          track.artistName = trackAlbumList[index];
          return TrackTile(
            track: track,
          );
        },
        itemCount: trackIdList.length);
  }
}
