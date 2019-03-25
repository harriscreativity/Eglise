import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class SermonCard extends StatelessWidget {
  const SermonCard({
    Key key,
    @required this.fullHeight,
    @required this.fullWidth,
    @required this.title,
    @required this.peacher,
    @required this.onPlay,
    @required this.data,
    @required this.onDetail,
    
  }) : super(key: key);

  final double fullHeight;
  final double fullWidth;
  final String title;
  final String peacher;
  final Function onPlay;
  final data;
  final Function onDetail;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: fullHeight * .25,
        width: fullWidth * .9,
        child: Row(
          children: <Widget>[
            InkWell(
                onTap: this.onDetail,
                child: Container(
                padding: EdgeInsets.all(10.0),
                child: Hero(
                    tag: this.data["albumArt"],
                    child: Image.asset(
                    this.data["albumArt"],
                    fit: BoxFit.cover,
                    width: fullWidth * .4,
                    height: fullHeight * .24,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(this.peacher,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Avenir',
                      fontSize: 15.0,
                      color: Colors.grey.shade800
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                      child: Text(this.title,
                       style: TextStyle(fontWeight: FontWeight.w200, color : Colors.black54),
                       overflow: TextOverflow.ellipsis,
                       maxLines: 3,
                      ),
                    ),
                    RaisedButton.icon(
                      icon: Icon(FeatherIcons.play,size: 16.0,color: Colors.blue,),
                      label: Text('Play',style: TextStyle(color: Colors.blue),),
                      color: Colors.white,
                      splashColor: Colors.blue.shade100,
                      highlightColor: Colors.blue.shade200,
                      onPressed: this.onPlay,
                      shape: Border.all(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                    )
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