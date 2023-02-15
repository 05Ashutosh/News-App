import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/screen/splash.dart';

import 'helper/dashboard.dart';

class Send extends StatefulWidget {
  const Send({Key? key}) : super(key: key);

  @override
  State<Send> createState() => _SendState();
}

class _SendState extends State<Send> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(milliseconds: 0), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));

    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w =MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: h,
            width: w,

            decoration: BoxDecoration(
              color: Colors.red
            ),
          )
        ],
      ),
    );
  }
}
