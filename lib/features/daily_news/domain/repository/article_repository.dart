import '../../../../core/resources/data_state.dart';
import '../entities/article.dart';
import '../entities/articles.dart';

abstract class ArticleRepository {
  Future<DataState<ArticlesEntity>> getNewsArticles();
  Future<void> saveArticle(ArticleEntity article);
  Future<void> deleteArticle(ArticleEntity article);
  Future<List<ArticleEntity>> getSavedArticles();
}