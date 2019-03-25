import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    return Scaffold(
       body: CustomScrollView(
         slivers:<Widget>[
           SliverAppBar(
             expandedHeight: fullHeight * .35,
             pinned: true,
             flexibleSpace: FlexibleSpaceBar(
               background: Stack(
                 fit: StackFit.expand,
                 children: <Widget>[
                   Image.asset("assets/images/03-01.jpg",
                    fit: BoxFit.cover,
                   ),
                   Container(color: Colors.blue.withOpacity(.5))
                 ],
               ),
             ),
           ),
          SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: Icon(FeatherIcons.userPlus),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(0.0),
                    hintStyle: TextStyle(
                      height: 1.6
                    )
                  ),
                ),
                SizedBox(height: 10.0,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    prefixIcon: Icon(FeatherIcons.mail),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(0.0),
                    hintStyle: TextStyle(
                      height: 1.6
                    )
                  ),
                ),
                SizedBox(height: 10.0,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(FeatherIcons.lock),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(0.0),
                    hintStyle: TextStyle(
                      height: 1.6
                    )
                  ),
                ),
                SizedBox(height: 10.0,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(FeatherIcons.lock),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(0.0),
                    hintStyle: TextStyle(
                      height: 1.6
                    )
                  ),
                ),
                SizedBox(height: 40.0,),
                MaterialButton(
                  onPressed: (){},
                  color: Colors.blue,
                  child: Container(
                    height: 55.0,
                    child: Center(child: Text("SIGN UP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w100
                      ),
                    )),
                  ),
                )
              ]),
            ),
          )
         ],
       ),
    );
  }
}