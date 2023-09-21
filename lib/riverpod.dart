import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/domain_layer/models/article_model.dart';


// The list that hold coming articles from api
final newsListProvider = StateProvider<List<ArticleModel>>((ref) {
  return [];
});


// Specify selected category
final categoryProvider = StateProvider<String>((ref) {
  return 'General';
});