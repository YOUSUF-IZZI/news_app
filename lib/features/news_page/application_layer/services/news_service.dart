import 'package:dio/dio.dart';

import '../../domain_layer/models/article_model.dart';

class NewsService
{
  final Dio dio = Dio();
  // To bring news by it's category using TopHeadLines Endpoint
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

  // To bring news by search using Everything endpoint
  Future<List<ArticleModel>> getEverything(String word) async{
    try
    {
      Response response = await dio.get('https://newsapi.org/v2/everything?apiKey=e8f17d334fee43a6a68d6c8a6260f6ff&q=$word');
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