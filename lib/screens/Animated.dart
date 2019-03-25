import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> with SingleTickerProviderStateMixin{


  bool fullScreen = false;

  open(){
    this.setState(()=> fullScreen =! fullScreen );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(FeatherIcons.play),
        onPressed: open,
      ),
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
            left: this.fullScreen ? 0.0 : 200.0,
            bottom: 0.0,
            duration: Duration(milliseconds: 400),
            child: Container(color: Colors.red,height: 100.0),
          )
        ],
      ),
    );
  }
}