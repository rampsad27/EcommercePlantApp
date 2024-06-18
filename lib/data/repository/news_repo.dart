import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:plant_app/configs/di/di.dart';
import 'package:plant_app/data/db/app_database.dart';
import 'package:plant_app/data/models/news_model.dart';
import 'package:plant_app/ui/data/plantdata.dart';

class NewsRepository {
  Dio dio = getIt.get<Dio>();

  var appDatabase = getIt.get<AppDatabase>();

  Future<List<ArticlesModel>?> getNews() async {
    try {
      var newsFromLocal = await _getNewsFromLocalDb();
      if (newsFromLocal != null && newsFromLocal.isNotEmpty) {
        return newsFromLocal;
      }
      var res = await dio.get("?q=bitcoin&pageSize=5");

      var data = NewsModel.fromJson(res.data);
      for (var element in data.articles ?? <ArticlesModel>[]) {
        var newElement = element.copyWith(
          uuid: uuid.v4(),
        );
        await appDatabase.newsDao.saveNews(newElement);
      }
      return _getNewsFromLocalDb();
    } catch (e) {
      log("Exception in NewsRepository: $e");
      return null;
    }
  }

  Future<List<ArticlesModel>?> _getNewsFromLocalDb() async {
    return await appDatabase.newsDao.getNews();
  }

  Future<void> deleteNewsById(String uuid) async {
    await appDatabase.newsDao.deleteNewsById(uuid);
  }
}
