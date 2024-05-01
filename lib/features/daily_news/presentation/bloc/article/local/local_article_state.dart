part of 'local_article_bloc.dart';

abstract class LocalArticlesState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalArticlesState({this.articles});

  @override
  List<Object> get props => [articles!];
}

final class LocalArticlesLoading extends LocalArticlesState {}

final class LocalArticlesDone extends LocalArticlesState {
  const LocalArticlesDone(List<ArticleEntity> articles) : super(articles: articles);
}
