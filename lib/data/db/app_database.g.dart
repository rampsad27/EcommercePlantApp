// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $NewsTableTable extends NewsTable
    with TableInfo<$NewsTableTable, NewsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("Hello World"));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("Hello World"));
  static const VerificationMeta _descritpionMeta =
      const VerificationMeta('descritpion');
  @override
  late final GeneratedColumn<String> descritpion = GeneratedColumn<String>(
      'descritpion', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("Hello World"));
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("Hello World"));
  static const VerificationMeta _urlToImageMeta =
      const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
      'url_to_image', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("Hello World"));
  static const VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<String> publishedAt = GeneratedColumn<String>(
      'published_at', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("Hello World"));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("Hello World"));
  static const VerificationMeta _sourcesMeta =
      const VerificationMeta('sources');
  @override
  late final GeneratedColumn<String> sources = GeneratedColumn<String>(
      'sources', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("Source"));
  static const VerificationMeta _sourceModelMeta =
      const VerificationMeta('sourceModel');
  @override
  late final GeneratedColumnWithTypeConverter<SourceModel?, String>
      sourceModel = GeneratedColumn<String>('source_model', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<SourceModel?>($NewsTableTable.$convertersourceModeln);
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        author,
        title,
        descritpion,
        url,
        urlToImage,
        publishedAt,
        content,
        sources,
        sourceModel
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_table';
  @override
  VerificationContext validateIntegrity(Insertable<NewsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('descritpion')) {
      context.handle(
          _descritpionMeta,
          descritpion.isAcceptableOrUnknown(
              data['descritpion']!, _descritpionMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('sources')) {
      context.handle(_sourcesMeta,
          sources.isAcceptableOrUnknown(data['sources']!, _sourcesMeta));
    }
    context.handle(_sourceModelMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {urlToImage, uuid};
  @override
  NewsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsTableData(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      descritpion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descritpion']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      urlToImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_to_image']),
      publishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}published_at']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
      sources: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sources']),
      sourceModel: $NewsTableTable.$convertersourceModeln.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}source_model'])),
    );
  }

  @override
  $NewsTableTable createAlias(String alias) {
    return $NewsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<SourceModel, String> $convertersourceModel =
      SourceConverter();
  static TypeConverter<SourceModel?, String?> $convertersourceModeln =
      NullAwareTypeConverter.wrap($convertersourceModel);
}

class NewsTableData extends DataClass implements Insertable<NewsTableData> {
  final String uuid;
  final String? author;
  final String? title;
  final String? descritpion;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final String? sources;
  final SourceModel? sourceModel;
  const NewsTableData(
      {required this.uuid,
      this.author,
      this.title,
      this.descritpion,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.sources,
      this.sourceModel});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || descritpion != null) {
      map['descritpion'] = Variable<String>(descritpion);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || urlToImage != null) {
      map['url_to_image'] = Variable<String>(urlToImage);
    }
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<String>(publishedAt);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || sources != null) {
      map['sources'] = Variable<String>(sources);
    }
    if (!nullToAbsent || sourceModel != null) {
      map['source_model'] = Variable<String>(
          $NewsTableTable.$convertersourceModeln.toSql(sourceModel));
    }
    return map;
  }

  NewsTableCompanion toCompanion(bool nullToAbsent) {
    return NewsTableCompanion(
      uuid: Value(uuid),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      descritpion: descritpion == null && nullToAbsent
          ? const Value.absent()
          : Value(descritpion),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      urlToImage: urlToImage == null && nullToAbsent
          ? const Value.absent()
          : Value(urlToImage),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      sources: sources == null && nullToAbsent
          ? const Value.absent()
          : Value(sources),
      sourceModel: sourceModel == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceModel),
    );
  }

  factory NewsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      author: serializer.fromJson<String?>(json['author']),
      title: serializer.fromJson<String?>(json['title']),
      descritpion: serializer.fromJson<String?>(json['descritpion']),
      url: serializer.fromJson<String?>(json['url']),
      urlToImage: serializer.fromJson<String?>(json['urlToImage']),
      publishedAt: serializer.fromJson<String?>(json['publishedAt']),
      content: serializer.fromJson<String?>(json['content']),
      sources: serializer.fromJson<String?>(json['sources']),
      sourceModel: serializer.fromJson<SourceModel?>(json['sourceModel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'author': serializer.toJson<String?>(author),
      'title': serializer.toJson<String?>(title),
      'descritpion': serializer.toJson<String?>(descritpion),
      'url': serializer.toJson<String?>(url),
      'urlToImage': serializer.toJson<String?>(urlToImage),
      'publishedAt': serializer.toJson<String?>(publishedAt),
      'content': serializer.toJson<String?>(content),
      'sources': serializer.toJson<String?>(sources),
      'sourceModel': serializer.toJson<SourceModel?>(sourceModel),
    };
  }

  NewsTableData copyWith(
          {String? uuid,
          Value<String?> author = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<String?> descritpion = const Value.absent(),
          Value<String?> url = const Value.absent(),
          Value<String?> urlToImage = const Value.absent(),
          Value<String?> publishedAt = const Value.absent(),
          Value<String?> content = const Value.absent(),
          Value<String?> sources = const Value.absent(),
          Value<SourceModel?> sourceModel = const Value.absent()}) =>
      NewsTableData(
        uuid: uuid ?? this.uuid,
        author: author.present ? author.value : this.author,
        title: title.present ? title.value : this.title,
        descritpion: descritpion.present ? descritpion.value : this.descritpion,
        url: url.present ? url.value : this.url,
        urlToImage: urlToImage.present ? urlToImage.value : this.urlToImage,
        publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
        content: content.present ? content.value : this.content,
        sources: sources.present ? sources.value : this.sources,
        sourceModel: sourceModel.present ? sourceModel.value : this.sourceModel,
      );
  @override
  String toString() {
    return (StringBuffer('NewsTableData(')
          ..write('uuid: $uuid, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('descritpion: $descritpion, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content, ')
          ..write('sources: $sources, ')
          ..write('sourceModel: $sourceModel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, author, title, descritpion, url,
      urlToImage, publishedAt, content, sources, sourceModel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsTableData &&
          other.uuid == this.uuid &&
          other.author == this.author &&
          other.title == this.title &&
          other.descritpion == this.descritpion &&
          other.url == this.url &&
          other.urlToImage == this.urlToImage &&
          other.publishedAt == this.publishedAt &&
          other.content == this.content &&
          other.sources == this.sources &&
          other.sourceModel == this.sourceModel);
}

class NewsTableCompanion extends UpdateCompanion<NewsTableData> {
  final Value<String> uuid;
  final Value<String?> author;
  final Value<String?> title;
  final Value<String?> descritpion;
  final Value<String?> url;
  final Value<String?> urlToImage;
  final Value<String?> publishedAt;
  final Value<String?> content;
  final Value<String?> sources;
  final Value<SourceModel?> sourceModel;
  final Value<int> rowid;
  const NewsTableCompanion({
    this.uuid = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.descritpion = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.content = const Value.absent(),
    this.sources = const Value.absent(),
    this.sourceModel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NewsTableCompanion.insert({
    required String uuid,
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.descritpion = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.content = const Value.absent(),
    this.sources = const Value.absent(),
    this.sourceModel = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid);
  static Insertable<NewsTableData> custom({
    Expression<String>? uuid,
    Expression<String>? author,
    Expression<String>? title,
    Expression<String>? descritpion,
    Expression<String>? url,
    Expression<String>? urlToImage,
    Expression<String>? publishedAt,
    Expression<String>? content,
    Expression<String>? sources,
    Expression<String>? sourceModel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (descritpion != null) 'descritpion': descritpion,
      if (url != null) 'url': url,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (publishedAt != null) 'published_at': publishedAt,
      if (content != null) 'content': content,
      if (sources != null) 'sources': sources,
      if (sourceModel != null) 'source_model': sourceModel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NewsTableCompanion copyWith(
      {Value<String>? uuid,
      Value<String?>? author,
      Value<String?>? title,
      Value<String?>? descritpion,
      Value<String?>? url,
      Value<String?>? urlToImage,
      Value<String?>? publishedAt,
      Value<String?>? content,
      Value<String?>? sources,
      Value<SourceModel?>? sourceModel,
      Value<int>? rowid}) {
    return NewsTableCompanion(
      uuid: uuid ?? this.uuid,
      author: author ?? this.author,
      title: title ?? this.title,
      descritpion: descritpion ?? this.descritpion,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      sources: sources ?? this.sources,
      sourceModel: sourceModel ?? this.sourceModel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (descritpion.present) {
      map['descritpion'] = Variable<String>(descritpion.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<String>(publishedAt.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (sources.present) {
      map['sources'] = Variable<String>(sources.value);
    }
    if (sourceModel.present) {
      map['source_model'] = Variable<String>(
          $NewsTableTable.$convertersourceModeln.toSql(sourceModel.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('descritpion: $descritpion, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content, ')
          ..write('sources: $sources, ')
          ..write('sourceModel: $sourceModel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $NewsTableTable newsTable = $NewsTableTable(this);
  late final NewsDao newsDao = NewsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [newsTable];
}

typedef $$NewsTableTableInsertCompanionBuilder = NewsTableCompanion Function({
  required String uuid,
  Value<String?> author,
  Value<String?> title,
  Value<String?> descritpion,
  Value<String?> url,
  Value<String?> urlToImage,
  Value<String?> publishedAt,
  Value<String?> content,
  Value<String?> sources,
  Value<SourceModel?> sourceModel,
  Value<int> rowid,
});
typedef $$NewsTableTableUpdateCompanionBuilder = NewsTableCompanion Function({
  Value<String> uuid,
  Value<String?> author,
  Value<String?> title,
  Value<String?> descritpion,
  Value<String?> url,
  Value<String?> urlToImage,
  Value<String?> publishedAt,
  Value<String?> content,
  Value<String?> sources,
  Value<SourceModel?> sourceModel,
  Value<int> rowid,
});

class $$NewsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NewsTableTable,
    NewsTableData,
    $$NewsTableTableFilterComposer,
    $$NewsTableTableOrderingComposer,
    $$NewsTableTableProcessedTableManager,
    $$NewsTableTableInsertCompanionBuilder,
    $$NewsTableTableUpdateCompanionBuilder> {
  $$NewsTableTableTableManager(_$AppDatabase db, $NewsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NewsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$NewsTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$NewsTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> uuid = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> descritpion = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> urlToImage = const Value.absent(),
            Value<String?> publishedAt = const Value.absent(),
            Value<String?> content = const Value.absent(),
            Value<String?> sources = const Value.absent(),
            Value<SourceModel?> sourceModel = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NewsTableCompanion(
            uuid: uuid,
            author: author,
            title: title,
            descritpion: descritpion,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content,
            sources: sources,
            sourceModel: sourceModel,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String uuid,
            Value<String?> author = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> descritpion = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> urlToImage = const Value.absent(),
            Value<String?> publishedAt = const Value.absent(),
            Value<String?> content = const Value.absent(),
            Value<String?> sources = const Value.absent(),
            Value<SourceModel?> sourceModel = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NewsTableCompanion.insert(
            uuid: uuid,
            author: author,
            title: title,
            descritpion: descritpion,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content,
            sources: sources,
            sourceModel: sourceModel,
            rowid: rowid,
          ),
        ));
}

class $$NewsTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $NewsTableTable,
    NewsTableData,
    $$NewsTableTableFilterComposer,
    $$NewsTableTableOrderingComposer,
    $$NewsTableTableProcessedTableManager,
    $$NewsTableTableInsertCompanionBuilder,
    $$NewsTableTableUpdateCompanionBuilder> {
  $$NewsTableTableProcessedTableManager(super.$state);
}

class $$NewsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $NewsTableTable> {
  $$NewsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descritpion => $state.composableBuilder(
      column: $state.table.descritpion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get urlToImage => $state.composableBuilder(
      column: $state.table.urlToImage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get publishedAt => $state.composableBuilder(
      column: $state.table.publishedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sources => $state.composableBuilder(
      column: $state.table.sources,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<SourceModel?, SourceModel, String>
      get sourceModel => $state.composableBuilder(
          column: $state.table.sourceModel,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));
}

class $$NewsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $NewsTableTable> {
  $$NewsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uuid => $state.composableBuilder(
      column: $state.table.uuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descritpion => $state.composableBuilder(
      column: $state.table.descritpion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get urlToImage => $state.composableBuilder(
      column: $state.table.urlToImage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get publishedAt => $state.composableBuilder(
      column: $state.table.publishedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sources => $state.composableBuilder(
      column: $state.table.sources,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sourceModel => $state.composableBuilder(
      column: $state.table.sourceModel,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$NewsTableTableTableManager get newsTable =>
      $$NewsTableTableTableManager(_db, _db.newsTable);
}
