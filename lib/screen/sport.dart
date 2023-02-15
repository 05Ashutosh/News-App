// import 'package:flutter/material.dart';
// import 'package:news_app/helper/sports_news.dart';
//
// import '../helper/articlemodel.dart';
// import '../helper/blog_title.dart';
//
// class Sports extends StatefulWidget {
//   const Sports({Key? key}) : super(key: key);
//
//   @override
//   State<Sports> createState() => _SportsState();
// }
//
// class _SportsState extends State<Sports> {
//
//   List<ArticleModel> articles = <ArticleModel>[];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getNews();
//
//   }
//
//
//   bool _loading=true;
//
//   getNews() async {                                                      // todo we have to call it to get the data
//     SportsNews newsClass =SportsNews();
//     await newsClass.getSportsNews();
//     articles=newsClass.news;
//     setState(() {
//       _loading=false;
//     });
//
//
//     @override
//     Widget build(BuildContext context) {
//       double h=MediaQuery.of(context).size.width;
//       return Scaffold(
//           body:Container(
//             padding: EdgeInsets.only(top:15 ),
//             height: h,
//             child: ListView.builder(
//                 itemCount: articles.length,
//                 shrinkWrap: true,
//                 physics: const ClampingScrollPhysics(),
//                 itemBuilder: (context ,index){
//                   return BlogTitle(imageUrl: articles[index].urlToImage, title: articles[index].title, desc: articles[index].description, url: articles[index].url,);
//                 }),
//           )
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/helper/articlemodel.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/model/catergoty_model.dart';
import 'package:news_app/screen/article_view.dart';

import '../helper/blog_title.dart';
import '../helper/sports_news.dart';

class Sport extends StatefulWidget {
  const Sport({Key? key}) : super(key: key);


  @override
  State<Sport> createState() => _SportState();
}

class _SportState extends State<Sport> {


  List<ArticleModel> articles = <ArticleModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();

  }


  bool _loading=true;

  getNews() async {                                                      // todo we have to call it to get the data
    SportsNews newsClass =SportsNews();
    await newsClass.getSportsNews();
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



class Category_Title extends StatelessWidget {




  final imageUrl ,categoryName;
  Category_Title({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {



    return  Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(6)
              ,
              child: CachedNetworkImage(imageUrl:  imageUrl,width: 120,height: 70,fit: BoxFit.cover,filterQuality: FilterQuality.high,)
          ),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: 120,

              child: Text(
                categoryName,style: const TextStyle(
                  color: Colors.white,fontSize: 15,
                  fontWeight: FontWeight.w500
              ),
              ),
            ),
          )

        ],
      ),


    );
  }
}



