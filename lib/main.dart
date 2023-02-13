import 'package:flutter/material.dart';
import 'package:news_app/screen/home_page.dart';
import 'package:news_app/screen/splash.dart';
import 'package:news_app/send.dart';


void main(){
  runApp(const MaterialApp(debugShowCheckedModeBanner: false,
    home: Send(),)
  );
}