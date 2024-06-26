import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/constants/constants.dart';
import 'core/network/dio_client.dart';
import 'features/daily_news/data/data_source/local/app_database.dart';
import 'features/daily_news/data/data_source/remote/news_api_service.dart';
import 'features/daily_news/data/repository/article_repository_impl.dart';
import 'features/daily_news/domain/repository/article_repository.dart';
import 'features/daily_news/domain/usecases/delete_article.dart';
import 'features/daily_news/domain/usecases/get_article.dart';
import 'features/daily_news/domain/usecases/get_saved_article.dart';
import 'features/daily_news/domain/usecases/save_article.dart';
import 'features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Local DB
  final database = await $FloorAppDatabase.databaseBuilder('app_db.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio Client
  sl.registerSingleton<Dio>(buildDioClint(newsApiBaseUrl));

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  // UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticlesUseCase>(GetSavedArticlesUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<DeleteArticleUseCase>(DeleteArticleUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
  sl.registerFactory<LocalArticlesBloc>(() => LocalArticlesBloc(sl(),sl(),sl()));

}