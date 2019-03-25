import 'package:eglise/widgets/annoucement.dart';
import 'package:eglise/widgets/eventContainer.dart';
import 'package:eglise/widgets/pagetitle.dart';
import 'package:eglise/widgets/sermoncard.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final List data;
  final Function eventDetail;
  final Function sermonTap;
  final Function play;
  final List playList;

  Home({ @required this.data,this.eventDetail, this.sermonTap, this.playList, this.play });


  

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: ListView(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        children: <Widget>[
          SermonCard(
            fullHeight: fullHeight,
            fullWidth: fullWidth,
            title: playList[0]["title"] ?? '',
            peacher: playList[0]['author']?? '',
            data:playList[0]??[],
            onPlay: (){ this.play(0); },
            onDetail: (){ this.sermonTap(playList[0]); },
          ),
          //ANNOUCEMENT
          PageTitle(
            text: 'Annoucement',
            onPress: () {},
            topPadding: 15.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Annoucement(
                    fullWidth: fullWidth,
                    fullHeight: fullHeight,
                    title: "Youth Meeting",
                    date: "15 January 2019",
                    startTime: "15H00",
                    endTime: "17H00",
                    onPress: () {},
                    image: "assets/images/youth.png"),
                new Annoucement(
                    fullWidth: fullWidth,
                    fullHeight: fullHeight,
                    title: "Mothers Meeting",
                    date: "25 January 2019",
                    startTime: "17H00",
                    endTime: "18H00",
                    onPress: () {},
                    image: "assets/images/banner_add_news.jpg"),
              ],
            ),
          ),
          //UPCOMING EVENTS
          PageTitle(
            text: 'Upcoming Events',
            topPadding: 20.0,
            onPress: () {},
          ),
         EventContainer(
           fullHeight: fullHeight,
           fullWidth: fullWidth,
           onPress: this.eventDetail,
           data: this.data,
         )
        ],
      ),
    );
  }
}

