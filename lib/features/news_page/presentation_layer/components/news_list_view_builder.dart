import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/news_page/presentation_layer/riverpod.dart';
import 'package:news_app/utils/colors.dart';
import '../../application_layer/services/news_service.dart';
import '../../domain_layer/models/article_model.dart';
import '../widgets/news_list_view.dart';


class NewsListViewBuilder extends ConsumerWidget {
  const NewsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<ArticleModel>>(
        future: ref.watch(isEveryThingMethodProvider) != true ? NewsService().getTopHeadlines(ref.watch(categoryProvider)) : NewsService().getEverything(ref.watch(searchValueProvider)),
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
                  color: AppColors.appColor,
                  strokeWidth: 6.0,
                ),
              ),
            );
          }
        },
    );
  }
}
