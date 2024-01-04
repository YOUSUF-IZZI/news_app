import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news_page/presentation_layer/widgets/custom_search_bar.dart';
import '../components/news_list_view_builder.dart';
import '../widgets/custom_rich_text.dart';
import '../widgets/custom_sliver_app_bar.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),
            SliverToBoxAdapter(child: SizedBox(height: 10.h,)),
            const SliverToBoxAdapter(child: CustomSearchBar()),
            SliverToBoxAdapter(child: SizedBox(height: 15.h,)),
            const SliverToBoxAdapter(child: CustomRichText()),
            SliverToBoxAdapter(child: SizedBox(height: 10.h,)),
            const NewsListViewBuilder(),
          ],
        ),
      ),
    );
  }
}



