import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/helper/articlemodel.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/helper/science_news.dart';
import 'package:news_app/model/catergoty_model.dart';
import 'package:news_app/screen/article_view.dart';

import '../helper/blog_title.dart';
import '../helper/sports_news.dart';

class Science extends StatefulWidget {
  const Science({Key? key}) : super(key: key);


  @override
  State<Science> createState() => _ScienceState();
}

class _ScienceState extends State<Science> {


  List<ArticleModel> articles = <ArticleModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();

  }


  bool _loading=true;

  getNews() async {                                                      // todo we have to call it to get the data
    ScienceNews newsClass =ScienceNews();
    await newsClass.getScienceNews();
    articles=newsClass.news;
    setState(() {
      _loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {

    double h=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: const Color.fromRGBO(1,1,20,0.9),leading: Icon(CupertinoIcons.news,color: Colors.lightGreenAccent,)
        ,title: const Text("NEWS Wave"),centerTitle:true,titleTextStyle:GoogleFonts.inter(
          textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.grey
          ),
        ),

      ),

      body:
      _loading ? Container(
        child: const Center(child: CircularProgressIndicator()),
      ):
      SingleChildScrollView(


        child: Column(
          children: <Widget>[

            //Blogs
            Container(
              padding: EdgeInsets.only(top:15 ),
              height: h,
              child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context ,index){
                    return BlogTitle(imageUrl: articles[index].urlToImage, title: articles[index].title, desc: articles[index].description, url: articles[index].url,);
                  }),
            ),



          ],
        ),
      ),




    );
  }
}