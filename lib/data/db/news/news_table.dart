import 'package:drift/drift.dart';
import 'package:plant_app/data/db/converters/source_converter.dart';


class NewsTable extends Table {
  TextColumn get uuid => text()();

  TextColumn get author =>
      text().nullable().withDefault(const Constant("Hello World"))();

  TextColumn get title =>
      text().nullable().withDefault(const Constant("Hello World"))();

  TextColumn get descritpion =>
      text().nullable().withDefault(const Constant("Hello World"))();
  TextColumn get url =>
      text().nullable().withDefault(const Constant("Hello World"))();
  TextColumn get urlToImage =>
      text().nullable().withDefault(const Constant("Hello World"))();
  TextColumn get publishedAt =>
      text().nullable().withDefault(const Constant("Hello World"))();
  TextColumn get content =>
      text().nullable().withDefault(const Constant("Hello World"))();

  TextColumn get sources =>
      text().nullable().withDefault(const Constant("Source"))();

  TextColumn get sourceModel => text().nullable().map(SourceConverter())();

  @override
  Set<Column>? get primaryKey => {
        urlToImage,
        uuid,
      };
}
