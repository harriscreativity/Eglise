import 'package:eglise/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Others extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //double fullHeight = MediaQuery.of(context).size.height;
    //double fullWidth = MediaQuery.of(context).size.width;

    return Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 70.0),
        child: new StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) => 
          Card(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.asset(blog[index]["image"],
                    fit: BoxFit.cover,
                  )
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                    child: Text(blog[index]["title"]),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: Text(blog[index]["contents"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 3 : 4),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    ));
  }
}
