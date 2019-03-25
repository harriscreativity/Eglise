import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:background_audio/background_audio.dart';

class MediaPlayer extends StatefulWidget {
  _MediaPlayerState createState() => _MediaPlayerState();

  final double duration;
  
  MediaPlayer({
    this.duration,
  });

}

class _MediaPlayerState extends State<MediaPlayer> {

  double position = 0.0;
  double duration = 0.0;
  String status = 'stopped';


  @override
    void initState() {
      super.initState();
      

      BackgroundAudio.onTogglePlayback((bool playing) {
        setState(() => status = playing ? 'play' : 'pause');
        print(playing);
      });

      setState(() { this.duration = widget.duration; });

      BackgroundAudio.onPosition((value){
        setState(() { this.position = value.toDouble(); });
      });


      // BackgroundAudio.onStop(() {
      //   setState(() => status = 'stopped');
      // });

    }

    //MEDIA PLAYER FUNCTION

    toggle() {
      BackgroundAudio.toggle();
    }

    toggleRepeat() async {
      await BackgroundAudio.toggleRepeat();
      setState(() {});
    }

    toggleShuffle() async {
      await BackgroundAudio.toggleShuffle();
      setState(() {});
    }

  // play() async {
  //   await BackgroundAudio.setPlaylist(playlists[0]);
  //   BackgroundAudio.play(0);
  // }

  get durationText =>
      Duration(seconds: this.duration.toInt()) != null ?  
      Duration(seconds: this.duration.toInt()).toString().split('.').first : '';
   get positionText =>
      Duration(seconds: this.position.toInt()) != null ? 
      Duration(seconds: this.position.toInt()).toString().split('.').first : '';


  @override
  Widget build(BuildContext context) {

    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: <Color>[Colors.blue, Color(0xFFF95B57)],
          ),
        ),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: BackButton(color: Colors.white),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(height: 20.0,),
                          Container(
                            height: fullHeight * .45,
                            width: fullWidth * .85,
                            child: Material(
                              elevation: 8.0,
                              color: Colors.transparent,
                              child: Hero(
                                tag: 'albumArt',
                                child: Image.asset("assets/images/AudioBible.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0)
                            ),
                          ),
                          Container(
                            width: fullWidth * .85,
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              children: <Widget>[
                                Text(this.positionText.substring(2),
                                  style: TextStyle(color: Colors.white),
                                ),
                                Expanded(
                                  child: Slider(
                                    min: 0.0,
                                    onChanged: (e){},
                                    max: this.position > this.duration ? 5000.0 : this.duration,
                                    value: this.position,
                                    activeColor: Colors.red[400],
                                    inactiveColor: Colors.red[200],
                                  ),
                                ),
                                Text(this.durationText.substring(2),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Title",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text("Today is an amazing day for us ...",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: fullHeight * .04 ),
                            child: Material(
                                color: Colors.transparent,
                                child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(FeatherIcons.skipBack),
                                    onPressed: (){},
                                    color: Colors.white,
                                  ),
                                  
                                  status == 'pause' ?
                                  
                                  IconButton(
                                    icon: Icon(FeatherIcons.pauseCircle),
                                    onPressed: (){},
                                    iconSize: 70.0,
                                    color: Colors.white,
                                  ) 
                                  
                                  :
                                  
                                  IconButton(
                                    icon: Icon(FeatherIcons.playCircle),
                                    onPressed: (){},
                                    iconSize: 70.0,
                                    color: Colors.white,
                                  ),
                                  
                                  IconButton(
                                    icon: Icon(FeatherIcons.skipForward),
                                    color: Colors.white,
                                    onPressed: (){},
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                )
              )
            )
          ],
        ),
      ),
    );
  }
}
