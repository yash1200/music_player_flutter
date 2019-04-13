import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:music_app/listview.dart';
import 'package:music_app/model/song_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SongData songData;

  @override
  void initState() {
    super.initState();
    getSongsList();
  }

  @override
  void dispose() {
    super.dispose();
    songData.audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music"),
        elevation: 5,
      ),
      body: listview_builder(songData),
    );
  }

  void getSongsList() async {
    var songs;
    try {
      songs = await MusicFinder.allSongs();
    } catch (e) {
      print("Failed to get songs: '${e.message}'.");
    }
    print(songs);

    if (!mounted) return;
    setState(() {
      songData = new SongData((songs));
    });
  }
}
