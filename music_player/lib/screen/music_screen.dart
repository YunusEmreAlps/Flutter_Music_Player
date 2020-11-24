import 'package:flutter/material.dart';
import 'package:music_player/res/color.dart';
import 'package:music_player/res/style.dart';
import 'package:music_player/screen/now_playing.dart';
import 'package:music_player/widget/songs_widget.dart';
import 'package:music_player/widget/recent_widget.dart';


class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 110,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colorAppYellow, colorAppOrange],
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: colorAppYellow.withOpacity(0.5),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  // AppBar
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.library_music,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Music Player',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Medium',
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final result = await showSearch(
                              context: context,
                              delegate: CustomSearch(hintText: "Search"),
                            );
                          },
                          child: Icon(
                            Icons.search,
                            size: 22,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // TabBar
                  Expanded(
                    child: Container(
                      child: TabBar(
                        controller: _controller,
                        indicatorColor: Colors.white,
                        indicatorWeight: 3,
                        isScrollable: true,
                        labelStyle: tabTextStyle,
                        unselectedLabelColor: Colors.white.withOpacity(0.5),
                        tabs: [
                          Tab(
                            text: 'Now Playing',
                          ),
                          Tab(
                            text: 'Playlist',
                          ),
                          Tab(
                            text: 'Songs',
                          ),
                          Tab(
                            text: 'Artist',
                          ),
                          Tab(
                            text: 'Album',
                          ),
                          Tab(
                            text: 'Genres',
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Pages
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: _controller,
                  children: [
                    // Now Playing
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            // NowPlaying(),
                          ],
                        ),
                      ),  
                    ),
                    // Playlist
                    Container(
                      child: Center(
                        child: Text(
                          'Playlist',
                          style: TextStyle(
                            color: colorBlack,
                            fontSize: 18,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                    ),
                    // All Songs
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: RecentWidget(),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'All Songs',
                                  style: TextStyle(
                                    color: colorGrey,
                                    fontFamily: 'Medium',
                                    fontSize: 14,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.shuffle,
                                  color: colorAppYellow,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Shuffle All',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Medium',
                                    color: colorAppYellow,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            SongsWidget(),
                          ],
                        ),
                      ),
                    ),
                    // Artist
                    Container(
                      child: Center(
                        child: Text(
                          'Artist',
                          style: TextStyle(
                            color: colorBlack,
                            fontSize: 18,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                    ),
                    // Album
                    Container(
                      child: Center(
                        child: Text(
                          'Album',
                          style: TextStyle(
                            color: colorBlack,
                            fontSize: 18,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                    ),
                    // Genres
                    Container(
                      child: Center(
                        child: Text(
                          'Genres',
                          style: TextStyle(
                            color: colorBlack,
                            fontSize: 18,
                            fontFamily: 'Medium',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate<String> {
  CustomSearch({
    String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  Widget buildSuggestions(BuildContext context) => Text("");

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            SongsWidget(),
          ],
        ),
      ),
    );
  }
}
