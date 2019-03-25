import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {

  final text;
  final Function onPress;
  final double topPadding;

  PageTitle({
    @required this.text,
    this.onPress,
    @required this.topPadding
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPress,
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: this.topPadding, left: 10.0, bottom: 20.0,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                this.text.toString().toUpperCase(),
                style: TextStyle(fontSize: 16.0,
                 fontWeight: FontWeight.bold,
                 color: Colors.grey.shade800
                 ),
            
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0,bottom: 3.0),
                child: Icon(
                  FeatherIcons.chevronRight,
                  color: Colors.grey.shade800,
                  size: 17.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
