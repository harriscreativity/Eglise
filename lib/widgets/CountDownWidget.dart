import 'package:flutter/material.dart';

class CountDownWidget extends StatelessWidget {
  const CountDownWidget({
    Key key,
    @required this.label,
    @required this.value
  }) : super(key: key);

  final String label;
  final value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(this.value.toString(), 
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.white
            )),
          Text(this.label,
           style: TextStyle(
             color: Colors.white70,
           )
          )
        ],
      ),
    );
  }
}