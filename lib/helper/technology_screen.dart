import 'package:http/http.dart' as http;
import 'dart:convert';

import 'articlemodel.dart';

class TechnologyScreen{
  List<ArticleModel> news =[];


  Future<void> getTechnologyNews() async{
    final url="https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=efbf04ddf072457e9892742636eb006c";
    final uri=Uri.parse(url);
    var response =await http.get(uri);

    var jsonData= jsonDecode(response.body);
    if(jsonData['status']== "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null &&
            element["description"] != null &&
            element["title"] != null &&
            element["url"] != null){
          ArticleModel articleModel = new  ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],

          );
          news.add(articleModel);
        }
      });
    }
  }

}
