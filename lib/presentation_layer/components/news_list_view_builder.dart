import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/application_layer/services/news_service.dart';
import 'package:news_app/domain_layer/models/article_model.dart';
import 'package:news_app/presentation_layer/widgets/news_list_view.dart';
import 'package:news_app/riverpod.dart';


class NewsListViewBuilder extends ConsumerWidget {
  const NewsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<ArticleModel>>(
        future: NewsService().getTopHeadlines(ref.watch(categoryProvider)),
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
