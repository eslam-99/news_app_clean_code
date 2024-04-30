import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/article.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class DeleteArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  DeleteArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.deleteArticle(params!);
  }
  
}