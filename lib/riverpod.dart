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


// to check what endpoint should call. so if it by search or by category
final isEveryThingMethodProvider = StateProvider<bool>((ref) {
  return false;
});


// Specify selected category
final searchValueProvider = StateProvider<String>((ref) {
  return '';
});