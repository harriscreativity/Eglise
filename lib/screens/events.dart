import 'package:eglise/data/data.dart';
import 'package:eglise/widgets/UpcomingEvent.dart';
import 'package:eglise/widgets/eventcard.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {

  final Function eventDetail;

  Events({ this.eventDetail });

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Container(
        child: ListView(
      padding: EdgeInsets.all(15.0),
      children: <Widget>[
        UpComingEvent(
          fullHeight: fullHeight, 
          fullWidth: fullWidth,
          events: events,
        ),
        Container(
          child: Column(
            children: events.map((event)=>
              EventCard(
                fullHeight: fullHeight,
                fullWidth: fullWidth,
                title: event['title'],
                fees: event['fees'],
                place: event['place'],
                date: event['date'],
                startTime: event['startTime'],
                endTime: event['endTime'],
                imageUrl: event['imageUrl'],
                onPress: (){ this.eventDetail(event); 
                },
              )
            ).toList(),
          ),
        ),
        SizedBox(height: 70.0,)
      ],
    ));
  }
}


