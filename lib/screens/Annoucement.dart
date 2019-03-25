import 'package:flutter/material.dart';

class Annoucement extends StatefulWidget {
  _AnnoucementState createState() => _AnnoucementState();
}

class _AnnoucementState extends State<Annoucement> {
  @override
  Widget build(BuildContext context) {
    
    double fullHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: fullHeight * .4,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Container(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: fullHeight * .28),
                      child: Text("Annoucement",
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ),
                  color: Colors.blue.withOpacity(.7),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/sunnies.png"),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ListTile(
                  subtitle: Text("Fasting carries on with new methods"),
                  title: Text("All Church Fasting"),
                  leading: Icon(
                    Icons.fastfood
                  ),
                ),
                Divider(height: 0.0,),
                ListTile(
                  subtitle: Text("Especial annoucement for all women to go see Mm Ngoie after church this Sunday",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  title: Text("All Women see Mm Ngoie"),
                  leading: Icon(
                    Icons.pregnant_woman
                  ),
                ),
                Divider(height: 0.0,)
              ]),
            ),
          )
        ],
      )
    );
  }
}