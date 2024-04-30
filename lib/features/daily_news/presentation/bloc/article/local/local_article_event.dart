part of 'local_article_bloc.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticles extends LocalArticleEvent {}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle(ArticleEntity article) : super(article: article);
}

class DeleteArticle extends LocalArticleEvent {
  const DeleteArticle(ArticleEntity article) : super(article: article);
}
