import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/helper/health_screen.dart';
import '../helper/articlemodel.dart';
import '../helper/blog_title.dart';

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);


  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {


  List<ArticleModel> articles = <ArticleModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();

  }


  bool _loading=true;

  getNews() async {                                                      // todo we have to call it to get the data
    HealthScreen newsClass =HealthScreen();
    await newsClass.getHealthNews();
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