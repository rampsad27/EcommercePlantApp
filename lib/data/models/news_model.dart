// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "totalResults") int? totalResults,
    @JsonKey(name: "articles") List<ArticlesModel>? articles,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}

@freezed
class ArticlesModel with _$ArticlesModel {
  const factory ArticlesModel({
    @JsonKey(name: "uid") String? uuid,
    @JsonKey(name: "source") SourceModel? source,
    @JsonKey(name: "author") String? author,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "urlToImage") String? urlToImage,
    @JsonKey(name: "publishedAt") String? publishedAt,
    @JsonKey(name: "content") String? content,
  }) = _ArticlesModel;

  factory ArticlesModel.fromJson(Map<String, dynamic> json) =>
      _$ArticlesModelFromJson(json);
}

@freezed
class SourceModel with _$SourceModel {
  const factory SourceModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
  }) = _SourceModel;

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);
}
