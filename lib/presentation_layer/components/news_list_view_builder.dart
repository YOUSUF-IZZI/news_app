import 'package:flutter/material.dart';
import 'package:news_app/application_layer/services/news_service.dart';
import 'package:news_app/domain_layer/models/article_model.dart';
import 'package:news_app/presentation_layer/widgets/news_list_view.dart';


class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // var because we may receive null or different data
  dynamic futureData;
  @override
  void initState() {
    super.initState();
    futureData = NewsService().getTopHeadlines(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      /*
      * don't fetch data from API inside build method if it's payed because it will be call
      * try to call fetch data method outside and pass the fetched data to a var variable
      * then pass this variable to the future feature.
      */
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(
              articles: snapshot.data!,
            );
          }  else if (snapshot.hasError) {
            return const SliverToBoxAdapter(child: Text('no data found'));
          }  else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                  strokeWidth: 6.0,
                ),
              ),
            );
          }
        },
    );
  }
}
