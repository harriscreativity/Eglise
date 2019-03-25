import 'package:eglise/data/data.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class SermonDetail extends StatefulWidget {
  _SermonDetailState createState() => _SermonDetailState();

  final sermons;

  SermonDetail({this.sermons});

}

class _SermonDetailState extends State<SermonDetail> {
  @override
  Widget build(BuildContext context) {

    double fullHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.sermons["pubDate"]),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Hero(
                tag: this.widget.sermons["pubDate"],
                child: Image.asset(
                this.widget.sermons["albumArt"],
                fit: BoxFit.cover,
                height: fullHeight * .4,
              ),
            ),
          ),
          ListTile(
            title: Text(this.widget.sermons["title"]),
            subtitle: Text(this.widget.sermons["author"]),
            leading: Container(
              height: fullHeight * .1,
              width: 70.0,
              child: Image.asset(this.widget.sermons["albumArt"],fit: BoxFit.cover,),
            ),
          ),
          Divider(height:0.0),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Text(sermons[0]["contents"],
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey.shade700,
                    height: 1.2
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FeatherIcons.voicemail),
        onPressed: (){},
      ),
    );
  }
}