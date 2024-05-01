import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/article.dart';
import '../../../../domain/usecases/delete_article.dart';
import '../../../../domain/usecases/get_saved_article.dart';
import '../../../../domain/usecases/save_article.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticleEvent, LocalArticlesState> {
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final DeleteArticleUseCase _deleteArticleUseCase;

  LocalArticlesBloc(this._getSavedArticlesUseCase, this._saveArticleUseCase, this._deleteArticleUseCase) : super(LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<SaveArticle>(onSaveArticle);
    on<DeleteArticle>(onDeleteArticle);
  }

  void onGetSavedArticles(GetSavedArticles event, Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(SaveArticle event, Emitter<LocalArticlesState> emit) async {
    await _saveArticleUseCase(params: event.article);
    final articles = await  _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onDeleteArticle(DeleteArticle event, Emitter<LocalArticlesState> emit) async {
    await _deleteArticleUseCase(params: event.article);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }
}
