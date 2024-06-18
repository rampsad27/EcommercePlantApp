// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:plant_app/data/models/news_model.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({
    Key? key,
    required this.news,
  }) : super(key: key);

  final ArticlesModel news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title ?? ""),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NewsDetailContent(
            news: news,
          ),
        ),
      ),
    );
  }
}

class NewsDetailContent extends StatelessWidget {
  const NewsDetailContent({
    Key? key,
    required this.news,
  }) : super(key: key);

  final ArticlesModel news;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          news.author ?? 'Author',
          style: textTheme.headlineMedium,
        ),
        const SizedBox(height: 8.0),
        Text(
          news.publishedAt ?? 'Published At',
          style: textTheme.bodySmall,
        ),
        const Divider(),
        Text(
          news.title ?? 'Title',
          style: textTheme.bodyLarge,
        ),
        const Divider(),
        Text(
          news.content ?? 'Content',
          style: textTheme.bodyMedium,
        ),
        const Divider(),
        Text(
          news.description ?? '',
          style: textTheme.bodyMedium,
        ),
        const Divider(),
        Text(
          news.url ?? 'URL',
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.blue[700],
            fontStyle: FontStyle.italic,
          ),
        ),
        const Divider(),
        Image.network(
          news.urlToImage ?? '',
        ),
        const Divider(),
        Text(
          'Source: ${news.source?.name}',
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
