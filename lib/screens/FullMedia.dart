import 'dart:ui';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class FullMedia extends StatelessWidget {
  const FullMedia({
    Key key,
    @required this.fullWidth,
    @required this.fullHeight,
    @required this.onClose,
    this.albumArt,
    this.duration,
    this.onNext,
    this.onPrev,
    this.onToggle,
    this.position,
    this.speaker,
    this.status,
    this.title,
    this.durationText,
    this.seekTo,
    this.fullMedia,
    this.download,
    this.source,
  }) : super(key: key);

  final double fullWidth;
  final double fullHeight;
  final Function onClose;
  final String title;
  final String speaker;
  final double position;
  final double duration;
  final String albumArt;
  final String status;
  final Function onToggle;
  final Function onNext;
  final Function onPrev;
  final String durationText;
  final Function seekTo;
  final bool fullMedia;
  final Function download;
  final String source;

  get positionText =>
      Duration(seconds: this.position.toInt()) != null ? 
      Duration(seconds: this.position.toInt()).toString().split('.').first : '';

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
          onWillPop: ()async{
            if(this.fullMedia){
              await this.onClose();
              return false;
            }else{
              return true;
            }
          },
          child: Container(
          color: Colors.blue,
          width: fullWidth,
          height: fullHeight,
          child: SafeArea(
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverAppBar(
                  leading: IconButton(
                    icon: Icon(FeatherIcons.chevronDown),
                    onPressed: this.onClose,
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(this.albumArt,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                        Container(color: Colors.black54,)
                      ],
                    ),
                  ),
                  expandedHeight: fullHeight * .53,
                ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        Material(
                            child: Container(
                              height: fullHeight * .43,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(this.title),
                                  subtitle: Text(this.speaker),
                                  trailing: IconButton(
                                    icon: Icon(FeatherIcons.download),
                                    onPressed: (){
                                      this.download(this.source);
                                    },
                                  ),
                                  leading: IconButton(
                                    icon: Icon(FeatherIcons.heart),
                                    onPressed: (){},
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left:28.0, right:28.0, bottom: 20.0, top:20.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(this.positionText.toString().substring(3,7)),
                                      Expanded(
                                        child: Slider(min: 0.0,
                                          max: this.duration != 0.0 ? this.duration : 100.0, 
                                          value: this.position, 
                                          onChanged: this.seekTo,
                                        ),
                                      ),
                                      Text(this.durationText.substring(3,6))
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: fullWidth * .2,right: fullWidth * .2,bottom: 5.0),
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(FeatherIcons.skipBack),
                                        onPressed: this.onPrev,
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          icon: Icon(this.status == "pause" ? FeatherIcons.playCircle 
                                          : FeatherIcons.pauseCircle),
                                          onPressed: this.onToggle,
                                          iconSize: 80.0,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(FeatherIcons.skipForward),
                                        onPressed: this.onNext,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              
                
              ],
            ),
          )),
    );
  }
}
