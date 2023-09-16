import 'package:dio/dio.dart';
import 'package:news_app/domain_layer/models/article_model.dart';

class NewsService
{

  final Dio dio = Dio();
  
  Future<List<ArticleModel>> getTopHeadlines(String category) async{
    try
    {
      Response response = await dio.get('https://newsapi.org/v2/top-headlines?apiKey=e8f17d334fee43a6a68d6c8a6260f6ff&country=us&category=$category');

      Map<String,dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];

      for(var article in articles){
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    }
    catch(e)
    {
      return [];
    }
  }
}