import '../../domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

  factory ArticleModel.fromJson(Map<String,dynamic> map) {
    return ArticleModel(
      author: map['articles']['author'] ?? '',
      title: map['articles']['title'] ?? '',
      description: map['articles']['description'] ?? '',
      url: map['articles']['url'] ?? '',
      urlToImage: map['articles']['urlToImage'] ?? '',
      publishedAt: map['articles']['publishedAt'] ?? '',
      content: map['articles']['content'] ?? '',
    );
  }
}