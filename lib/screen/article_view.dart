import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';



class Article_Page extends StatefulWidget {
  final String BlogUrl;
  Article_Page({
    required this.BlogUrl
  });

  @override
  State<Article_Page> createState() => _Article_PageState();
}
class _Article_PageState extends State<Article_Page> {
  late WebViewController _controller;

  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1,1,20,0.9),
        title: const Text("NEWS Wave"),
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        child:
        WebViewPlus(
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            controller.loadUrl(widget.BlogUrl);
          },
        )
      ),
    );
  }
}

