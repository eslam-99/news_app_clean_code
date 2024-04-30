import '../../../../core/resources/data_state.dart';
import '../../domain/entities/article.dart';
import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleEntity>>> getNewArticles() {
    // TODO: implement getNewArticles
    throw UnimplementedError();
  }

}