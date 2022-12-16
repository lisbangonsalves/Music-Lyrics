import 'package:flutter/material.dart';
import 'package:music_lyrics/view/bookmarks_view.dart';
import 'package:music_lyrics/view/homepage.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Lyrics',
      home: TopAppBar(),
    );
  }
}

class TopAppBar extends StatefulWidget {
  const TopAppBar({super.key});

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: NewGradientAppBar(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xffff3cf7), Color(0xffff4545)], ),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.bookmark)),
               
              ],
            ),
            title: const Text('Music Lyrics'),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              HomePage(),
              BookmarkView(),
            ],
          ),
        ),
      );

  }
}
