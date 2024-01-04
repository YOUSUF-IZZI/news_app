class ArticleModel
{
  /*
  * 1. it's very important to use null safety because if one variable come as null the whole data will not receive
  * 2. we used final because the data will never change in future
  */
  final String? imagePath;
  final String? title;
  final String? subTitle;

  ArticleModel({
    required this.imagePath, required this.title, required this.subTitle
  });

  factory ArticleModel.fromJson(json){
    return ArticleModel(
        imagePath: json['urlToImage'],
        title: json['title'],
        subTitle: json['description']
    );
  }

}