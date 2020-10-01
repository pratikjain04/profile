import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Scaffold(body: new Profile()), debugShowCheckedModeBanner: false,));

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

//A List widget which can be used everywhere
class ListWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final String trailing;
  ListWidget({this.title, this.icon, this.trailing});

  @override
  Widget build(BuildContext context) {
    final uniWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: uniWidth / 43.1, right: uniWidth / 43.1),
      child: ListTile(
        //TODO: Add tap actions
        onTap: (){},
        leading: icon,
        title: Row(
          children: <Widget>[
            Text(title),
            Expanded(child: Container()),
            Text(
              trailing,
              style: TextStyle(
                  fontWeight: FontWeight.w100
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 6.0)),
            Icon(Icons.keyboard_arrow_right, color: Colors.black26)
          ],
        ),
      ),
    );
  }
}

final List<ListWidget> actions = [
  ListWidget(
    title: 'User name',
    icon: Icon(Icons.account_circle),
    trailing: 'Curb_Crusher',
  ),
  ListWidget(
    title: 'Phone Number',
    icon: Icon(Icons.phone),
    trailing: '+371 44-880-321',
  ),
  ListWidget(
    title: 'E-mail',
    icon: Icon(Icons.email),
    trailing: 'abcxyz@gmail.com',
  ),
];

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {

    double uniWidth = MediaQuery.of(context).size.width;
    double uniHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
              children: [
                Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: uniHeight / 2.25,
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
                              decoration: new BoxDecoration(
                                  color: Colors.black.withOpacity(0.15)),
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
                        Padding(padding: EdgeInsets.only(top: uniWidth / 12),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: uniWidth / 20),),
                            Icon(Icons.menu, color: Colors.white,),
                            Padding(padding: EdgeInsets.only(left: uniWidth / 3.1)),
                            Text('SETTINGS',
                              style: TextStyle(color: Colors.white, fontSize: 16.0),),
                          ],),
                        Padding(padding: EdgeInsets.only(
                            top: uniHeight / 30, left: uniWidth / 2.8),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 3.0),
                                borderRadius: BorderRadius.circular(100.0),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/Pratik.jpeg'
                                    ),
                                    fit: BoxFit.cover
                                )
                            ),
                            height: uniHeight / 5.5,
                            width: uniWidth / 3,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(
                            top: uniHeight / 25, left: uniWidth / 2.6),
                          child: Column(
                            children: <Widget>[
                              Text('Pratik Jain', style: TextStyle(
                                  color: Colors.white, fontSize: uniWidth / 18),),
                              Padding(padding: EdgeInsets.only(top: uniHeight / 150)),
                              Text('Jaipur, India', style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: uniWidth / 25),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: uniWidth / 43.1, right: uniWidth / 43.1),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) => actions[index],
                    itemCount: actions.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(color: Colors.grey);
                    },
                  ),
                ),
              ]
          ),
        ),
      ],
    );
  }
}
