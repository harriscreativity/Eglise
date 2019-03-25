import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key key,
    @required this.fullWidth,
    @required this.fullHeight,
    @required this.title,
    this.startTime,
    this.endTime,
    this.fees,
    @required this.place,
    @required this.date,
    @required this.onPress,
    @required this.imageUrl,
  }) : super(key: key);

  final double fullWidth;
  final double fullHeight;
  final String title;
  final String startTime;
  final String endTime;
  final String date;
  final Function onPress;
  final String imageUrl;
  final String fees;
  final String place;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: this.onPress,
        child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Hero(
                  tag: this.date,
                  child: Image.asset(this.imageUrl,
                  fit: BoxFit.cover,
                  width: fullWidth * .9,
                  height: fullHeight * .27,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                this.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0,),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Text(this.date,
                style: TextStyle(fontWeight: FontWeight.w300,),
              ),
            ),
            Text("${this.startTime} | ${this.endTime}",
              style: TextStyle(fontSize: 11.0,
              fontWeight: FontWeight.w100,
              ),
            ),
            Text(this.place,
              style: TextStyle(fontSize: 11.0,
              fontWeight: FontWeight.w100,
              ),
            ),
            Text(this.fees,
              style: TextStyle(fontSize: 11.0,
              fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}