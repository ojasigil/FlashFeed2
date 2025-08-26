import 'package:flutter/material.dart';
import '../models/article.dart';
import '../widgets/article_card.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;

  const ArticleList({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ArticleCard(article: article);
      },
    );
  }
}
