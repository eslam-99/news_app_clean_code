import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/article.dart';
import '../../../../domain/usecases/delete_article.dart';
import '../../../../domain/usecases/get_saved_article.dart';
import '../../../../domain/usecases/save_article.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final DeleteArticleUseCase _deleteArticleUseCase;

  LocalArticleBloc(this._getSavedArticlesUseCase, this._saveArticleUseCase, this._deleteArticleUseCase) : super(LocalArticleLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<SaveArticle>(onSaveArticle);
    on<DeleteArticle>(onDeleteArticle);
  }

  void onGetSavedArticles(GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticleDone(articles));
  }

  void onSaveArticle(SaveArticle event, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: event.article);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticleDone(articles));
  }

  void onDeleteArticle(DeleteArticle event, Emitter<LocalArticleState> emit) async {
    await _deleteArticleUseCase(params: event.article);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticleDone(articles));
  }
}
