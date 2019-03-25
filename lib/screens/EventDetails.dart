import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  _EventDetailsState createState() => _EventDetailsState();

  final String imageUrl;
  final String title;
  final String date;
  final String place;
  final String startTime;
  final String endTime;
  final String fees; 
  final String contents;

  EventDetails({
    @required this.imageUrl,
    @required this.title,
    this.date,
    this.endTime,
    this.startTime,
    this.fees,
    this.place,
    this.contents,
  });
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Hero(
                tag: this.widget.date,
                child: Image.asset(widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(this.widget.title),
              subtitle: Text(this.widget.date),
              leading: Icon(FeatherIcons.calendar),
            ),
            Divider(height: 1.0,),
            ListTile(
              title: Text("${this.widget.startTime} | ${this.widget.endTime}"),
              subtitle: Text(this.widget.place),
              leading: Icon(FeatherIcons.clock),
            ),
            Text(this.widget.contents),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton.icon(
                    icon: Icon(FeatherIcons.activity),
                    label: Text("Going"),
                    onPressed: (){},
                  ),
                  FlatButton.icon(
                    icon: Icon(FeatherIcons.crosshair),
                    label: Text("Not Going"),
                    onPressed: (){},
                  ),
                  FlatButton.icon(
                    icon: Icon(FeatherIcons.chevronRight),
                    label: Text("Maybe"),
                    onPressed: (){},
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}