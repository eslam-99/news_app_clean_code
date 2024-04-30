import '../../../../core/resources/data_state.dart';
import '../entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
  Future<void> saveArticle(ArticleEntity article);
  Future<void> deleteArticle(ArticleEntity article);
  Future<List<ArticleEntity>> getSavedArticles();
}