import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class Sermons extends StatelessWidget {

  final Function onDetail;
  final List playList;
  final Function play;
  final Function toggle;
  final String status;
  final Map currentSong;


  Sermons({ this.onDetail,
    @required this.playList,
    @required this.play,
    @required this.toggle,
    @required this.status,
    @required this.currentSong,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: ListView(
        children: <Widget>[
          Column(
          children: this.playList
              .map(
                (song) => 
                Column(
                  children: <Widget>[
                    ListTile(
                      onTap: (){ play(song["id"]); },
                      title: Text(song["author"]),
                      subtitle: Text(song['title']),
                      trailing: IconButton(
                        icon: Icon( currentSong["id"] == song["id"] ?
                          status == "pause" ? FeatherIcons.playCircle 
                           : FeatherIcons.pauseCircle : FeatherIcons.playCircle
                         ),
                        onPressed: currentSong["id"] == song["id"] ? toggle 
                          : (){ play(song["id"].toInt()); },
                      ),
                      leading: Container(
                        width: 60.0,
                        height: 60.0,
                        child: Hero(
                            tag: song["pubDate"],
                            child: Image.asset(song["albumArt"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Divider()
                  ],
                )
              )
              .toList(),
          ),
          SizedBox(height: 70.0)
        ],
      ),
    );
  }
}
