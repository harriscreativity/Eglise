import 'package:flutter/material.dart';

class Annoucement extends StatelessWidget {
  const Annoucement({
    Key key,
    @required this.fullWidth,
    @required this.fullHeight,
    @required this.title,
    this.startTime,
    this.endTime,
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: this.onPress,
        child: Container(
        width: fullWidth * .41,
        height: fullHeight * .19,
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(this.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0,color: Colors.white),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Text(this.date,
                style: TextStyle(fontSize: 12.0,
                fontWeight: FontWeight.w100,
                color: Colors.white),
              ),
            ),
            Text("${this.startTime} | ${this.endTime}",
              style: TextStyle(fontSize: 11.0,
              fontWeight: FontWeight.w100,
              color: Colors.white),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          image: DecorationImage(
            image: AssetImage(this.image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.grey.shade700, BlendMode.multiply)
          )
        ),
      ),
    );
  }
}