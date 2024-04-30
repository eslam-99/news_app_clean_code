import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/article/remote/remote_article_bloc.dart';
import '../../widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  BlocBuilder<RemoteArticlesBloc, RemoteArticlesState> _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
      builder: (_, state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RemoteArticleError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticleDone) {
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (_, index) {
              return ArticleWidget(
                article: state.articles![index],
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  AppBar _buildAppBar() => AppBar(
    title: const Text(
      'Daily News',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
