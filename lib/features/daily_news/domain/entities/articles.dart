import 'package:equatable/equatable.dart';

import 'article.dart';

abstract class ArticlesEntity extends Equatable {
  final List<ArticleEntity>? articles;

  const ArticlesEntity({
    this.articles,
  });

  @override
  List<Object?> get props {
    return [
      articles,
    ];
  }
}
