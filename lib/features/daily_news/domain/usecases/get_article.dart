import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/article.dart';
import '../entities/article.dart';
import '../entities/articles.dart';
import '../repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<ArticlesEntity>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<ArticlesEntity>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
  
}