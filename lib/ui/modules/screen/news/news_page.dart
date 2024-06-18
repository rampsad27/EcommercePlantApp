import 'package:flutter/material.dart';
import 'package:plant_app/configs/di/di.dart';
import 'package:plant_app/data/models/news_model.dart';
import 'package:plant_app/data/repository/news_repo.dart';
import 'package:plant_app/ui/modules/screen/news/news_detail_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  bool isLoading = false;
  List<ArticlesModel>? articles;
  @override
  void initState() {
    _fetchNews();
    super.initState();
  }

  Future<void> _fetchNews() async {
    setState(() {
      isLoading = true;
    });
    final newsRepository = getIt.get<NewsRepository>();
    final res = await newsRepository.getNews();
    setState(() {
      isLoading = false;
      articles = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News Page",
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: articles?.length,
                  itemBuilder: (c, i) {
                    return ListTile(
                      onTap: () {
                        if (articles == null) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailPage(
                              news: articles![i],
                            ),
                          ),
                        );
                      },
                      title: Text(articles?[i].author ?? ""),
                      subtitle: Text(articles?[i].uuid ?? ""),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await getIt
                              .get<NewsRepository>()
                              .deleteNewsById(articles?[i].uuid ?? "");

                          await _fetchNews();
                        },
                      ),
                    );
                  })),
    );
  }
}
