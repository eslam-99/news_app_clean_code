import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';
import '../../../domain/entities/articles.dart';
import '../../models/article.dart';
import '../../models/articles.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<ArticlesModel>> getNewsArticles({
    @Query('apiKey') String? apikey,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}