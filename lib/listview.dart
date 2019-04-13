import 'package:flutter/material.dart';
import 'package:music_app/model/song_data.dart';

class listview_builder extends StatelessWidget {
  SongData songData;

  listview_builder(this.songData);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.play_arrow,color: Colors.white,),
            ),
          );
        });
  }
}
