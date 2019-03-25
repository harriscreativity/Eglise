import 'package:eglise/widgets/eventItem.dart';
import 'package:eglise/widgets/eventcard.dart';
import 'package:flutter/material.dart';

class EventContainer extends StatelessWidget {
  
  EventContainer({
    @required this.fullWidth,
    @required this.fullHeight,
    @required this.data,
    @required this.onPress,
  });

  final double fullWidth;
  final double fullHeight;
  final List data;
  final Function onPress;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          EventCard(
            fullHeight: this.fullHeight,
            fullWidth: this.fullWidth,
            title: this.data[0]['title'],
            fees: this.data[0]['fees'],
            place: this.data[0]['place'],
            date: this.data[0]['date'],
            startTime: this.data[0]['startTime'],
            endTime: this.data[0]['endTime'],
            imageUrl: this.data[0]['imageUrl'],
            onPress: (){ this.onPress(this.data[0]); },
          ),
          Container(
            margin: EdgeInsets.only(top: 25.0,bottom: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: this.data.getRange(0, 3).skip(1).map((item)=>
                EventItem(
                  fullHeight: fullHeight,
                  fullWidth: fullWidth,
                  title: item['title'],
                  fees: item['fees'],
                  place: item['place'],
                  date: item['date'],
                  startTime: item['startTime'],
                  endTime: item['endTime'],
                  image: item['imageUrl'],
                  onPress: (){ this.onPress(item); },
                )
              ).toList()
            ),
          )
        ],
      ),
    );
  }
}