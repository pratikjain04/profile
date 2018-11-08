import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Scaffold(body: new Profile()), debugShowCheckedModeBanner: false,));

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    double uniWidth = MediaQuery.of(context).size.width;
    double uniHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: uniHeight/2.25,
                //todo: Insert code for fetching image from database in final code
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new ExactAssetImage('assets/Pratik.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: new Container(
                    decoration: new BoxDecoration(color: Colors.black.withOpacity(0.15)),
                    //making the background a bit dark for the texts to be fairly visible in case of white bright images
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: uniWidth/12),),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: uniWidth/20),),
                  Icon(Icons.menu, color: Colors.white,),
                  Padding(padding: EdgeInsets.only(left: uniWidth/3)),
                  Text('Settings', style: TextStyle(color: Colors.white, fontSize: 16.0),),
               ],),
              Padding(padding: EdgeInsets.only(top: uniHeight/30, left: uniWidth/2.7),
                  child: ClipOval(
                    child: Container(
                      height: uniHeight/5.5,
                      width: uniWidth/3,
                      child: Image(image: AssetImage('assets/Pratik.jpeg'), fit: BoxFit.cover,),
                    ),
                  ),
              ),
              Padding(padding: EdgeInsets.only(top: uniHeight/25, left: uniWidth/2.5),
              child: Column(
                children: <Widget>[
                  Text('Pratik Jain', style: TextStyle(color: Colors.white, fontSize: uniWidth/18),),
                  Padding(padding: EdgeInsets.only(top: uniHeight/150)),
                  Text('Jaipur, India', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: uniWidth/25),),
                ],
              ),

              ),
            ],
          ),
        ],
      ),
    );
  }
}
