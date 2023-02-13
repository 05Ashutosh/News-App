
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/helper/articlemodel.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/model/catergoty_model.dart';
import 'package:news_app/screen/article_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories =getCategories();
    getNews();

  }


  bool _loading=true;

  getNews() async {                                                      // todo we have to call it to get the data
    News newsClass =News();
    await newsClass.getNews();
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
            //categories
            // Container(
            //   height: 70,
            //   child: ListView.builder(itemCount: categories.length,
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index){
            //       return Category_Title(
            //         imageUrl: categories[index].imageUrl,
            //         categoryName: categories[index].categoryName,
            //       );
            //     },),
            // ),
            // SizedBox(height: 12),


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


class BlogTitle extends StatelessWidget {
  
  final String imageUrl, title ,desc,url;


  const BlogTitle({super.key, required this.imageUrl, required this.title, required this.desc,required this.url});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Article_Page(BlogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 11,left: 11,right: 11),
        padding: const EdgeInsets.only(top:5,left: 5,right: 5,bottom: 5),
        decoration: BoxDecoration(
          border:Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
                child: Image.network(imageUrl)),
            const SizedBox(height: 7,),
            Text(title,style: TextStyle(color: Colors.blueGrey,fontSize: 16,fontWeight: FontWeight.w800),),
            const SizedBox(height: 5,),
            Text(desc,style: TextStyle(color: Colors.grey,fontSize: 12),),

          ],
        ),
      ),
    );
  }
}

