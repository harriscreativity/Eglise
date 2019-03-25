import 'package:eglise/screens/Register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  onRegister(){
    Navigator.push(context, CupertinoPageRoute(
      builder: (context)=> Register(),
    ));
  }


  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: Container(
          width: double.infinity,
          height: fullHeight,
          child: Stack(
            //fit: StackFit.expand,
            children: <Widget>[
              Container(
                height: fullHeight,
                width: double.infinity,
                child: Image.asset("assets/images/sky.jpg",
                  fit: BoxFit.cover,
                  height: fullHeight,
                ),
              ),
              Container(color: Colors.blue.withOpacity(0.75),),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: fullHeight * .25,
                      child: Align(
                        child: Text("Church Name",
                          style: TextStyle(
                            fontFamily: 'AbriFatface',
                            fontSize: 40.0,
                            color: Colors.white
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                        ),
                    ),
                    Container(
                      height: fullHeight * .58,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SignInButton(
                            Buttons.Facebook,
                            onPressed: (){
                              print("Allo");
                            },
                          ),
                          SignInButton(
                            Buttons.Google,
                            onPressed: (){
                              print("Register");
                            },
                          ),
                          SignInButton(
                            Buttons.Email,
                            onPressed: (){},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: fullHeight * .1,
                      width: double.infinity,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: FlatButton(
                          onPressed: onRegister,
                          child: Text("Sign Up Here",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              AnimatedAlign(
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: BackButton(color: Colors.white,),
                ),
                alignment: Alignment.topLeft,
              ),
              
            ],
          ),
        ),
      ),
    );  
  }
}