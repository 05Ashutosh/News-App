import 'package:flutter/material.dart';

import '../screen/article.dart';

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
