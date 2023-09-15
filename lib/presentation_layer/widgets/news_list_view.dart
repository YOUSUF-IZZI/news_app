import 'package:flutter/material.dart';
import 'package:news_app/domain_layer/models/article_model.dart';
import 'news_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});
  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return NewsCard(article: articles[index],);
        },
      ),
    );
  }
}
