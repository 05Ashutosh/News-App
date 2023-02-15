import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/health.dart';
import 'package:news_app/screen/home_page.dart';
import 'package:news_app/screen/science.dart';
import 'package:news_app/screen/sport.dart';

import '../screen/technology.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int currentTab=0;
  final List<Widget> screen=const [
    HomePage(),
    Sport(),
    Science(),
    Technology(),
    Health()
  ];

  final PageStorageBucket bucket =PageStorageBucket();
  Widget currentScreen=HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(onPressed: (){
                      setState(() {
                        currentScreen=HomePage();
                        currentTab=0;
                      });
                    },
                    child:Column(
                      children: [
                        Icon(CupertinoIcons.home,
                        color: currentTab==0?Colors.purple.shade100:Colors.grey,),
                        Text("Headline",style: TextStyle(color: currentTab==0?Colors.purple:Colors.grey),)
                      ],
                    )
                    )
                  ],),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(onPressed: (){
                        setState(() {
                          currentScreen=Science();
                          currentTab=1;
                        });
                      },
                          child:Column(
                            children: [
                              Icon(Icons.science_outlined,
                                color: currentTab==1?Colors.blue.shade400:Colors.grey,),
                              Text("Science",style: TextStyle(color: currentTab==1?Colors.lightBlue:Colors.grey),)
                            ],
                          )
                      )
                    ],),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(onPressed: (){
                        setState(() {
                          currentScreen=Sport();
                          currentTab=2;
                        });
                      },
                          child:Column(
                            children: [
                              Icon(Icons.sports_baseball_outlined,
                                color: currentTab==2?Colors.green.shade100:Colors.grey,),
                              Text("Sports",style: TextStyle(color: currentTab==2?Colors.lightGreen:Colors.grey),)
                            ],
                          )
                      )
                    ],),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(onPressed: (){
                        setState(() {
                          currentScreen=Health();
                          currentTab=3;
                        });
                      },
                          child:Column(
                            children: [
                              Icon(Icons.health_and_safety_outlined,
                                color: currentTab==3?Colors.green:Colors.grey,),
                              Text("Health",style: TextStyle(color: currentTab==3?Colors.lightGreen:Colors.grey),)
                            ],
                          )
                      )
                    ],),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(onPressed: (){
                        setState(() {
                          currentScreen=Technology();
                          currentTab=4;
                        });
                      },
                          child:Column(
                            children: [
                              Icon(Icons.rocket,
                                color: currentTab==4?Colors.yellow:Colors.grey,),
                              Text("Technology",style: TextStyle(color: currentTab==4?Colors.yellow.shade400:Colors.grey),)
                            ],
                          )
                      )
                    ],),
                ),


              ],
            ),
          ),
        ),
      ),
    );

  }
}
