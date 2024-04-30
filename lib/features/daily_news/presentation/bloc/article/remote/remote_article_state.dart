part of 'remote_article_bloc.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticlesState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

final class RemoteArticleLoading extends RemoteArticlesState {}

final class RemoteArticleDone extends RemoteArticlesState {
  const RemoteArticleDone(List<ArticleEntity> articles) : super(articles: articles);
}

final class RemoteArticleError extends RemoteArticlesState {
  const RemoteArticleError(DioException error) : super(error: error);
}
