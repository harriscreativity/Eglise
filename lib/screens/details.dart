import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({
    Key key,
    @required this.fullWidth,
    @required this.fullHeight,
  }) : super(key: key);

  final double fullWidth;
  final double fullHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: fullWidth,
      height: fullHeight,
      child: SafeArea(
              child: CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverAppBar(
                  leading: Icon(FeatherIcons.chevronDown),
                  expandedHeight: fullHeight * .5,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Ali Connors'),
                    background: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/events1.jpg',
                          fit: BoxFit.cover,
                          height: fullHeight * .5,
                        ),
                        Container(
                          color: Colors.blue.withOpacity(0.4),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(20.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        const Text('I\'m dedicating every day to you'),
                        const Text('Domestic life was never quite my style'),
                        const Text('When you smile, you knock me out, I fall apart'),
                        const Text('And I thought I was so smart'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      )
    );
  }
}