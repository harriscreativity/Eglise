import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({
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
    @required this.image,
  }) : super(key: key);

  final double fullWidth;
  final double fullHeight;
  final String title;
  final String startTime;
  final String endTime;
  final String date;
  final Function onPress;
  final String image;
  final String fees;
  final String place;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: this.onPress,
        child: Card(        
        child: Container(
          width: fullWidth * .42,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Hero(
                    tag: this.date,
                    child: Image.asset(this.image,
                    width: fullWidth * .41,
                    height: fullHeight * .22,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(this.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0,),
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Text(this.date,
                  style: TextStyle(fontSize: 12.0,
                  fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              Text("${this.startTime} | ${this.endTime}",
                style: TextStyle(fontSize: 11.0,
                fontWeight: FontWeight.w100,
                ),
              ),
              SizedBox(height: 10.0,)
            ],
          ),
        ),
      ),
    );
  }
}