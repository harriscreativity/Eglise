import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class MediaItem extends StatelessWidget {
  const MediaItem({
    Key key,
    this.fullMedia,
    this.onDisplay,
    this.playStatus,
    this.title,
    this.speaker,
    this.toggle
  }) : super(key: key);

  final bool fullMedia;
  final Function onDisplay;
  final Function toggle;
  final String title;
  final String speaker;
  final String playStatus;

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.blue,
      child: Container(
        height: fullHeight * .11,
        width: fullWidth,
        child: ListTile(
          onTap: this.onDisplay,
            leading: IconButton(
              onPressed: this.onDisplay,
              icon: Icon(
                   FeatherIcons.chevronUp),
              color: Colors.white,
            ),
            title: Text(this.title),
            subtitle: Text(this.speaker),
            trailing: IconButton(
              icon:
                  Icon(this.playStatus ==  'play' ? FeatherIcons.pause : FeatherIcons.play),
              onPressed: this.toggle,
              color: Colors.white,
            ),
          ),
      ),
    );
  }
}
