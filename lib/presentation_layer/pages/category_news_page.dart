import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation_layer/components/news_list_view_builder.dart';

class CategoryNewsPage extends StatelessWidget {
  const CategoryNewsPage({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 10.h,)),
              NewsListViewBuilder(category: category),
            ],
          ),
        )
    );
  }
}
