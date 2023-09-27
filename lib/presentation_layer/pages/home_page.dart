import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation_layer/components/news_list_view_builder.dart';
import 'package:news_app/presentation_layer/widgets/category_list_view.dart';
import 'package:news_app/presentation_layer/widgets/custom_rich_text.dart';
import 'package:news_app/presentation_layer/widgets/custom_search_bar.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Magazine', style: TextStyle(fontSize: 20.sp),),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: CategoryListView()),
              SliverToBoxAdapter(child: SizedBox(height: 10.h,)),
              const SliverToBoxAdapter(child: CustomSearchBar()),
              SliverToBoxAdapter(child: SizedBox(height: 15.h,)),
              const SliverToBoxAdapter(child: CustomRichText()),
              SliverToBoxAdapter(child: SizedBox(height: 10.h,)),
              const NewsListViewBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
