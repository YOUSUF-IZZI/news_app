import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news_page/domain_layer/models/article_model.dart';


class DetailedNewsPage extends StatelessWidget {
  const DetailedNewsPage({super.key, required this.article});
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
              ),
              floating: true,
              expandedHeight: 300.h,
              flexibleSpace: FlexibleSpaceBar(
                background: article.imagePath != null ?
                Image.network(article.imagePath!, fit: BoxFit.fill,) :
                Image.asset('assets/images/no_photo.png'),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
                child: Text(
                    '${article.title}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyMedium?.color
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
                child: Text(
                  '${article.subTitle}',
                  maxLines: 100,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Theme.of(context).textTheme.bodyMedium?.color
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
