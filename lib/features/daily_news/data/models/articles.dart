import '../../domain/entities/articles.dart';
import 'article.dart';

class ArticlesModel extends ArticlesEntity {
  const ArticlesModel({
    List<ArticleModel>? articles,
  }) : super(articles: articles);

  factory ArticlesModel.fromJson(Map<String,dynamic> map) {
    return ArticlesModel(
      articles: (map['articles'] as List).map<ArticleModel>((e) => ArticleModel.fromJson(e)).toList(),
    );
  }
}