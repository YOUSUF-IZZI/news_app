import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news_page/presentation_layer/pages/detailed_news_page.dart';
import '../../domain_layer/models/article_model.dart';


class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 26.h),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedNewsPage(article: article,),));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: article.imagePath != null ? Image.network(article.imagePath!) : Image.asset('assets/images/no_photo.png')
            ),
            SizedBox(height: 5.h,),
            Text(
              article.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              article.subTitle ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
