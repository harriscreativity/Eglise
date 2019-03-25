import 'package:eglise/data/data.dart';
import 'package:eglise/screens/Annoucement.dart';
import 'package:eglise/screens/EventDetails.dart';
import 'package:eglise/screens/FullMedia.dart';
import 'package:eglise/screens/Login.dart';
import 'package:eglise/screens/SermonDetail.dart';
import 'package:eglise/screens/events.dart';
import 'package:eglise/screens/home.dart';
import 'package:eglise/screens/others.dart';
import 'package:eglise/screens/sermons.dart';
import 'package:eglise/widgets/MediaItem.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:background_audio/background_audio.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:flutter_downloader/flutter_downloader.dart';


class Main extends StatefulWidget{
  _MainState createState() => _MainState();
}

class _MainState extends State<Main>{

  bool fullMedia = false;
  String status = 'stop';
  List playList = [];
  int position = 0;
  int duration = 0;
  Map currentSong = {
    "title":"",
    "author":"",
    "albumArt":"assets/images/youth.png"
  };

  String path = "/storage/emulated/0/Android/data/com.example.eglise/audio/";

  onDisplay(){
    setState(()=> fullMedia =! fullMedia );
  }

  onClose(){
    setState(()=> fullMedia =! fullMedia );
  }

  _openFile() async {
    // try {
    //   var _path = await FilePicker.getFilePath(type: FileType.ANY);
    //   print(_path);
    // } catch (e) {
    //   print("Unsupported operation" + e.toString());
    // }
   // var newPath = await getApplicationDocumentsDirectory();
   // print(newPath);
    
  }

  //INIT AUDIO PLAYER
  initAudio()async{
    BackgroundAudio.init().then((e)async{
      print(e);
      for(var song in songs[0].toMap()["songs"]){
        playList.add(song);
      }
      if (BackgroundAudio.playlist != null) {
        if (BackgroundAudio.playing) {
          setState(() => status = 'play');
        } else {
          setState(() => status = 'pause');
        }
      }
      await this.setPlayList();
      await this.setControl();
    });
  }
  //ON PLAY WITH INDEX OF A SONG
  play(int index) async {
    await BackgroundAudio.play(index);
    this.setState(()=> currentSong = BackgroundAudio.song );
  }
  //SET PLAYLIST BEFORE PLAYING 
  setPlayList()async{
    await BackgroundAudio.setPlaylist(songs[0]);
    BackgroundAudio.onNext((){
      setState(()=> currentSong =  BackgroundAudio.song );
    });
     BackgroundAudio.onPrev(() {
        setState(()=> currentSong = BackgroundAudio.song );
    });
  }

  //SET CONTROLLS
  setControl(){
    BackgroundAudio.onTogglePlayback((bool playing) {
      setState(() => status = playing ? 'play' : 'pause');
    });

    BackgroundAudio.onDuration((int _duration) {
      setState(()=> this.duration = _duration );
    });

    BackgroundAudio.onPosition((int _position) {
      setState(()=> position = _position );
    });

    BackgroundAudio.onSelect(() {
      print('notification selected');
    });

    BackgroundAudio.onStop(() {
      setState(() => status = 'stopped');
      print("Quit App");
      
    });
    setState((){
        currentSong = BackgroundAudio.song;
    });
  }

  //GET STRING VALUE OF LISTENERS
   get durationText =>
      Duration(seconds: this.duration) != null ?  
      Duration(seconds: this.duration).toString().split('.').first : '';

  //UI CONTROL FUNCTIONS
  onNext(){
    BackgroundAudio.next();
  }
  onPrev(){
    BackgroundAudio.prev();
  }
  onToggle(){
    BackgroundAudio.toggle();
  }
  onSeekTo(val){
    BackgroundAudio.seekTo(val.toInt());
  }

//Download Sermons

onDownload(songUrl)async{
  // final taskId = await FlutterDownloader.enqueue(
  //   url: songUrl,
  //   savedDir: this.path,
  //   showNotification: true, // show download progress in status bar (for Android)
  //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
  // );
  // print(taskId);
}

@override
  void initState() {
    super.initState();
    this.initAudio();
    // FlutterDownloader.registerCallback((id, status, progress) {
    // // code to update your UI
    //   print(progress);
    // });
}

    
//EVENT DETAILS
  eventDetail(item){
      Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => 
          EventDetails(
            title: item['title'],
            place: item['place'],
            date: item['date'],
            endTime: item['endTime'],
            startTime: item['startTime'],
            imageUrl: item['imageUrl'],
            contents: '',
          )
        )
      );    
  }

//SERMON DETAILS
  sermonDetail(item){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>
        SermonDetail(
          sermons: item,
        )
    ));
  }

//NAVIGATE TO LOGIN
  onLogin(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=> Login()
    ));
  }

//NAVIGATE TO LOGIN
  onAnnoucements(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=> Annoucement()
    ));
  }


  @override
  Widget build(BuildContext context) {

    double fullWidth = MediaQuery.of(context).size.width;
    double fullHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(FeatherIcons.filePlus),
                  onPressed: this._openFile,
                  iconSize: 18.0,
                ),
                IconButton(
                  icon:Icon(FeatherIcons.messageSquare),
                  onPressed: onAnnoucements,
                  iconSize: 18.0,
                ),
                IconButton(
                  icon:Icon(FeatherIcons.user),
                  onPressed: onLogin,
                  iconSize: 18.0,
                ),
              ],
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(FeatherIcons.home),),
                  Tab(icon: Icon(FeatherIcons.book),),
                  Tab(icon: Icon(FeatherIcons.calendar),),
                  Tab(icon: Icon(FeatherIcons.globe),),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Home(data: events,
                    eventDetail: this.eventDetail,
                    sermonTap: this.sermonDetail,
                    playList: this.playList,
                    play : this.play
                ),
                Sermons(
                  onDetail:this.sermonDetail,
                  play: this.play,
                  toggle: this.onToggle,
                  status: this.status,
                  playList: this.playList,
                  currentSong: this.currentSong,
                ),
                Events(eventDetail:this.eventDetail),
                Others()
              ]
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 600),
          child: MediaItem(
              fullMedia: this.fullMedia, 
              onDisplay: this.onDisplay,
              title: currentSong["title"],
              speaker: currentSong["author"],
              playStatus: this.status,
              toggle: this.onToggle,
            ),
          bottom: !this.fullMedia ? 0.0 : -200.0,
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 400),
          top: this.fullMedia ? 0.0 : fullHeight,
          child: new FullMedia(
            download: this.onDownload,
            source: currentSong["source"],
            fullWidth: fullWidth, 
            fullHeight: fullHeight,
            onClose: this.onClose,
            title: currentSong["title"],
            speaker: currentSong["author"],
            albumArt: currentSong["albumArt"],
            onNext: this.onNext,
            onPrev: this.onPrev,
            onToggle: this.onToggle,
            status: this.status,
            duration: this.duration.toDouble(),
            position: this.position.toDouble(),
            durationText:this.durationText,
            seekTo: this.onSeekTo,
            fullMedia : this.fullMedia
          ),
        ),
      ],
    );
  }

  @override
    void dispose() {
      super.dispose();
      
    }

}

