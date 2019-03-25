import 'package:eglise/widgets/CountDownWidget.dart';
import 'package:flutter/material.dart';

class UpComingEvent extends StatelessWidget {
  const UpComingEvent({
    Key key,
    @required this.fullHeight,
    @required this.fullWidth,
    @required this.events,
  }) : super(key: key);

  final double fullHeight;
  final double fullWidth;
  final events;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          height: fullHeight * .3,
          width: fullWidth,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: DecorationImage(
                      image: AssetImage(events[0]["imageUrl"]),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.7),
                    borderRadius: BorderRadius.circular(4.0)),
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: fullHeight * .15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "UPCOMING EVENT",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            events[0]["title"],
                            style: TextStyle(
                                color: Colors.white70, fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: fullWidth * .8,
                      child: Center(
                          child: Divider(
                        color: Colors.white,
                        height: 0.0,
                      ))),
                  Container(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 15.0, top: 21.0),
                    height: fullHeight * .15,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CountDownWidget(
                          label: "Days",
                          value: 20,
                        ),
                        CountDownWidget(
                          label: "Hours",
                          value: 10,
                        ),
                        CountDownWidget(
                          label: "Minutes",
                          value: 45,
                        ),
                        CountDownWidget(
                          label: "Seconds",
                          value: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
