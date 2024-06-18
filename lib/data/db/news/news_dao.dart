import 'package:drift/drift.dart';
import 'package:plant_app/data/db/app_database.dart';
import 'package:plant_app/data/db/news/news_table.dart';
import 'package:plant_app/data/models/news_model.dart';

part 'news_dao.g.dart';

// the _NewsDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [NewsTable])
class NewsDao extends DatabaseAccessor<AppDatabase> with _$NewsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  NewsDao(AppDatabase db) : super(db);

  Future<List<ArticlesModel>?> getNews() async {
    final res = await select(newsTable).get();

    return res
        .map((element) => ArticlesModel(
              uuid: element.uuid,
              source: element.sourceModel,
              author: element.author,
              title: element.title,
              description: element.descritpion,
              url: element.url,
              urlToImage: element.urlToImage,
              publishedAt: element.publishedAt,
              content: element.content,
            ))
        .toList();
  }

  Future<ArticlesModel> getNewsById(String uuid) async {
    final res = await (select(newsTable)..where((tbl) => tbl.uuid.equals(uuid)))
        .getSingleOrNull();

    return ArticlesModel(
      uuid: res?.uuid,
      source: res?.sourceModel,
      author: res?.author,
      title: res?.title,
      description: res?.descritpion,
      url: res?.url,
      urlToImage: res?.urlToImage,
      publishedAt: res?.publishedAt,
      content: res?.content,
    );
  }

  Future<int> deleteNews() async {
    return await delete(newsTable).go();
  }

  Future<int> deleteNewsById(String uuid) async {
    return await (delete(newsTable)..where((tbl) => tbl.uuid.equals(uuid)))
        .go();
  }

//  Companion
  Future<void> saveNews(ArticlesModel articlesModel) async {
    await into(newsTable).insertOnConflictUpdate(NewsTableCompanion(
      uuid: Value(articlesModel.uuid ?? ""),
      descritpion: Value(articlesModel.description ?? ""),
      sources: Value(articlesModel.source?.name),
      sourceModel: Value(articlesModel.source),
      content: Value(articlesModel.content),
      author: Value(articlesModel.author ?? ""),
      title: Value(articlesModel.title ?? ""),
      url: Value(articlesModel.url ?? ""),
      urlToImage: Value(articlesModel.urlToImage ?? ""),
      publishedAt: Value(articlesModel.publishedAt ?? ""),
    ));
  }
}
