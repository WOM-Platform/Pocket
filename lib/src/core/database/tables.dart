import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';

JsonTypeConverter2<Map<String, String>, Uint8List, Object?>
mapTranslationConverter = TypeConverter.jsonb(
  fromJson: (json) => Map<String, String>.from(json as Map<String, dynamic>),
  toJson: (pref) => pref,
);

JsonTypeConverter2<ImageData, Uint8List, Object?> imageUrlBinaryConverter =
    TypeConverter.jsonb(
      fromJson: (json) => ImageData.fromJson(json as Map<String, Object?>),
      toJson: (pref) => pref.toJson(),
    );

JsonTypeConverter2<BadgeSimpleFilter, Uint8List, Object?>
simpleFilterBinaryConverter = TypeConverter.jsonb(
  fromJson: (json) => BadgeSimpleFilter.fromJson(json as Map<String, Object?>),
  toJson: (pref) => pref.toJson(),
);

@DataClassName('WomRow')
class Wom extends Table {
  TextColumn get id => text().named('Id').unique()();

  TextColumn get sourceName => text().named('SourceName')();

  TextColumn get secret => text().named('Secret')();

  TextColumn get geohash => text().named('geohash')();

  TextColumn get aim => text().named('Aim')();

  TextColumn get sourceId => text().named('SourceId')();

  IntColumn get transactionId => integer().named('TransactionId')();

  IntColumn get addedOn => integer().named('addedOn')();

  IntColumn get spentOn => integer().named('spentOn').nullable()();

  IntColumn get spent => integer()();

  RealColumn get latitude => real().named('Latitude')();

  RealColumn get longitude => real().named('Longitude')();

  TextColumn get donationId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AimRow')
class Aims extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().named('code')();

  TextColumn get titles =>
      text().named('titles').map(const AimTitlesConverter())();
}

@DataClassName('MyTransaction')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement().named('Id')();

  TextColumn get source => text().named('source')();

  // TextColumn get country => text().named('country')();

  TextColumn get aim => text().named('Aim')();

  IntColumn get timestamp => integer().named('Timestamp')();

  IntColumn get type => integer().named('type')();

  IntColumn get size => integer().named('size')();

  TextColumn get ackUrl => text().named('ackUrl').nullable()();

  TextColumn get pin => text().named('pin').nullable()();

  IntColumn get deadline => integer().nullable()();

  TextColumn get link => text().named('link').nullable()();
}

@DataClassName('BadgeEntry')
class Badges extends Table {
  @override
  String get tableName => 'badges';

  TextColumn get id => text()();

  TextColumn get informationUri => text().nullable()();

  TextColumn get challengeId => text().nullable()();

  BlobColumn get name => blob().map(mapTranslationConverter)();

  BlobColumn get description =>
      blob().map(mapTranslationConverter).nullable()();

  BlobColumn get image => blob().map(imageUrlBinaryConverter).nullable()();

  BlobColumn get filter => blob().map(simpleFilterBinaryConverter).nullable()();

  DateTimeColumn get achievedAt => dateTime().nullable()();

  DateTimeColumn get archivedAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime().nullable()();

  DateTimeColumn get lastUpdate => dateTime().nullable()();

  BoolColumn get seen => boolean().withDefault(const Constant(false))();

  BoolColumn get achieved => boolean().withDefault(const Constant(false))();

  BoolColumn get archived => boolean().withDefault(const Constant(false))();

  BoolColumn get isPublic => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ChallengeEntry')
class Challenges extends Table {
  @override
  String get tableName => 'challenges';

  TextColumn get id => text()();

  BlobColumn get name => blob().map(mapTranslationConverter)();

  BlobColumn get description =>
      blob().map(mapTranslationConverter).nullable()();

  BoolColumn get isPublic => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('TotemRow')
class Totems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get sessionId => text().named('sessionId')();

  TextColumn get totemId => text().named('totemId')();

  TextColumn get eventId => text().named('eventId')();

  TextColumn get providerId => text().named('providerId')();

  TextColumn get providerName => text().named('providerName').nullable()();

  TextColumn get womLink => text().named('womLink').nullable()();

  TextColumn get eventName => text().named('eventName').nullable()();

  TextColumn get sessionName => text().named('sessionName').nullable()();

  TextColumn get womPin => text().named('womPin').nullable()();

  TextColumn get totemName => text().named('totemName').nullable()();

  TextColumn get email => text().named('email').nullable()();

  TextColumn get phoneNumber => text().named('phoneNumber').nullable()();

  TextColumn get image => text().named('image').nullable()();

  TextColumn get url => text().named('url').nullable()();

  TextColumn get notes => text().named('notes').nullable()();

  RealColumn get latitude => real().named('latitude').nullable()();

  RealColumn get longitude => real().named('longitude').nullable()();

  DateTimeColumn get timestamp => dateTime().named('timestamp')();
}

// stores preferences as strings
class AimTitlesConverter extends TypeConverter<Map<String, dynamic>, String> {
  const AimTitlesConverter();

  @override
  Map<String, dynamic> fromSql(String fromDb) {
    return json.decode(fromDb) as Map<String, dynamic>;
  }

  @override
  String toSql(Map<String, dynamic> value) {
    return json.encode(value);
  }
}
