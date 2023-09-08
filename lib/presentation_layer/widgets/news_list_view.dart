import 'package:flutter/material.dart';
import 'news_card.dart';


class NewsListView extends StatelessWidget {
  const NewsListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 5,
            (context, index) {
          return const NewsCard();
        },
      ),
    );
  }
}
