// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class WomRow extends DataClass implements Insertable<WomRow> {
  final String id;
  final String sourceName;
  final String secret;
  final String geohash;
  final String aim;
  final String sourceId;
  final int transactionId;
  final int timestamp;
  final int live;
  final double latitude;
  final double longitude;
  const WomRow(
      {required this.id,
      required this.sourceName,
      required this.secret,
      required this.geohash,
      required this.aim,
      required this.sourceId,
      required this.transactionId,
      required this.timestamp,
      required this.live,
      required this.latitude,
      required this.longitude});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['Id'] = Variable<String>(id);
    map['SourceName'] = Variable<String>(sourceName);
    map['Secret'] = Variable<String>(secret);
    map['geohash'] = Variable<String>(geohash);
    map['Aim'] = Variable<String>(aim);
    map['SourceId'] = Variable<String>(sourceId);
    map['TransactionId'] = Variable<int>(transactionId);
    map['Timestamp'] = Variable<int>(timestamp);
    map['live'] = Variable<int>(live);
    map['Latitude'] = Variable<double>(latitude);
    map['Longitude'] = Variable<double>(longitude);
    return map;
  }

  WomCompanion toCompanion(bool nullToAbsent) {
    return WomCompanion(
      id: Value(id),
      sourceName: Value(sourceName),
      secret: Value(secret),
      geohash: Value(geohash),
      aim: Value(aim),
      sourceId: Value(sourceId),
      transactionId: Value(transactionId),
      timestamp: Value(timestamp),
      live: Value(live),
      latitude: Value(latitude),
      longitude: Value(longitude),
    );
  }

  factory WomRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WomRow(
      id: serializer.fromJson<String>(json['id']),
      sourceName: serializer.fromJson<String>(json['sourceName']),
      secret: serializer.fromJson<String>(json['secret']),
      geohash: serializer.fromJson<String>(json['geohash']),
      aim: serializer.fromJson<String>(json['aim']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      live: serializer.fromJson<int>(json['live']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sourceName': serializer.toJson<String>(sourceName),
      'secret': serializer.toJson<String>(secret),
      'geohash': serializer.toJson<String>(geohash),
      'aim': serializer.toJson<String>(aim),
      'sourceId': serializer.toJson<String>(sourceId),
      'transactionId': serializer.toJson<int>(transactionId),
      'timestamp': serializer.toJson<int>(timestamp),
      'live': serializer.toJson<int>(live),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
    };
  }

  WomRow copyWith(
          {String? id,
          String? sourceName,
          String? secret,
          String? geohash,
          String? aim,
          String? sourceId,
          int? transactionId,
          int? timestamp,
          int? live,
          double? latitude,
          double? longitude}) =>
      WomRow(
        id: id ?? this.id,
        sourceName: sourceName ?? this.sourceName,
        secret: secret ?? this.secret,
        geohash: geohash ?? this.geohash,
        aim: aim ?? this.aim,
        sourceId: sourceId ?? this.sourceId,
        transactionId: transactionId ?? this.transactionId,
        timestamp: timestamp ?? this.timestamp,
        live: live ?? this.live,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );
  @override
  String toString() {
    return (StringBuffer('WomRow(')
          ..write('id: $id, ')
          ..write('sourceName: $sourceName, ')
          ..write('secret: $secret, ')
          ..write('geohash: $geohash, ')
          ..write('aim: $aim, ')
          ..write('sourceId: $sourceId, ')
          ..write('transactionId: $transactionId, ')
          ..write('timestamp: $timestamp, ')
          ..write('live: $live, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sourceName, secret, geohash, aim,
      sourceId, transactionId, timestamp, live, latitude, longitude);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WomRow &&
          other.id == this.id &&
          other.sourceName == this.sourceName &&
          other.secret == this.secret &&
          other.geohash == this.geohash &&
          other.aim == this.aim &&
          other.sourceId == this.sourceId &&
          other.transactionId == this.transactionId &&
          other.timestamp == this.timestamp &&
          other.live == this.live &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude);
}

class WomCompanion extends UpdateCompanion<WomRow> {
  final Value<String> id;
  final Value<String> sourceName;
  final Value<String> secret;
  final Value<String> geohash;
  final Value<String> aim;
  final Value<String> sourceId;
  final Value<int> transactionId;
  final Value<int> timestamp;
  final Value<int> live;
  final Value<double> latitude;
  final Value<double> longitude;
  const WomCompanion({
    this.id = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.secret = const Value.absent(),
    this.geohash = const Value.absent(),
    this.aim = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.live = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
  });
  WomCompanion.insert({
    required String id,
    required String sourceName,
    required String secret,
    required String geohash,
    required String aim,
    required String sourceId,
    required int transactionId,
    required int timestamp,
    required int live,
    required double latitude,
    required double longitude,
  })  : id = Value(id),
        sourceName = Value(sourceName),
        secret = Value(secret),
        geohash = Value(geohash),
        aim = Value(aim),
        sourceId = Value(sourceId),
        transactionId = Value(transactionId),
        timestamp = Value(timestamp),
        live = Value(live),
        latitude = Value(latitude),
        longitude = Value(longitude);
  static Insertable<WomRow> custom({
    Expression<String>? id,
    Expression<String>? sourceName,
    Expression<String>? secret,
    Expression<String>? geohash,
    Expression<String>? aim,
    Expression<String>? sourceId,
    Expression<int>? transactionId,
    Expression<int>? timestamp,
    Expression<int>? live,
    Expression<double>? latitude,
    Expression<double>? longitude,
  }) {
    return RawValuesInsertable({
      if (id != null) 'Id': id,
      if (sourceName != null) 'SourceName': sourceName,
      if (secret != null) 'Secret': secret,
      if (geohash != null) 'geohash': geohash,
      if (aim != null) 'Aim': aim,
      if (sourceId != null) 'SourceId': sourceId,
      if (transactionId != null) 'TransactionId': transactionId,
      if (timestamp != null) 'Timestamp': timestamp,
      if (live != null) 'live': live,
      if (latitude != null) 'Latitude': latitude,
      if (longitude != null) 'Longitude': longitude,
    });
  }

  WomCompanion copyWith(
      {Value<String>? id,
      Value<String>? sourceName,
      Value<String>? secret,
      Value<String>? geohash,
      Value<String>? aim,
      Value<String>? sourceId,
      Value<int>? transactionId,
      Value<int>? timestamp,
      Value<int>? live,
      Value<double>? latitude,
      Value<double>? longitude}) {
    return WomCompanion(
      id: id ?? this.id,
      sourceName: sourceName ?? this.sourceName,
      secret: secret ?? this.secret,
      geohash: geohash ?? this.geohash,
      aim: aim ?? this.aim,
      sourceId: sourceId ?? this.sourceId,
      transactionId: transactionId ?? this.transactionId,
      timestamp: timestamp ?? this.timestamp,
      live: live ?? this.live,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['Id'] = Variable<String>(id.value);
    }
    if (sourceName.present) {
      map['SourceName'] = Variable<String>(sourceName.value);
    }
    if (secret.present) {
      map['Secret'] = Variable<String>(secret.value);
    }
    if (geohash.present) {
      map['geohash'] = Variable<String>(geohash.value);
    }
    if (aim.present) {
      map['Aim'] = Variable<String>(aim.value);
    }
    if (sourceId.present) {
      map['SourceId'] = Variable<String>(sourceId.value);
    }
    if (transactionId.present) {
      map['TransactionId'] = Variable<int>(transactionId.value);
    }
    if (timestamp.present) {
      map['Timestamp'] = Variable<int>(timestamp.value);
    }
    if (live.present) {
      map['live'] = Variable<int>(live.value);
    }
    if (latitude.present) {
      map['Latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['Longitude'] = Variable<double>(longitude.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WomCompanion(')
          ..write('id: $id, ')
          ..write('sourceName: $sourceName, ')
          ..write('secret: $secret, ')
          ..write('geohash: $geohash, ')
          ..write('aim: $aim, ')
          ..write('sourceId: $sourceId, ')
          ..write('transactionId: $transactionId, ')
          ..write('timestamp: $timestamp, ')
          ..write('live: $live, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }
}

class $WomTable extends Wom with TableInfo<$WomTable, WomRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WomTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'Id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _sourceNameMeta =
      const VerificationMeta('sourceName');
  @override
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
      'SourceName', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _secretMeta = const VerificationMeta('secret');
  @override
  late final GeneratedColumn<String> secret = GeneratedColumn<String>(
      'Secret', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _geohashMeta =
      const VerificationMeta('geohash');
  @override
  late final GeneratedColumn<String> geohash = GeneratedColumn<String>(
      'geohash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _aimMeta = const VerificationMeta('aim');
  @override
  late final GeneratedColumn<String> aim = GeneratedColumn<String>(
      'Aim', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
      'SourceId', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
      'TransactionId', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
      'Timestamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _liveMeta = const VerificationMeta('live');
  @override
  late final GeneratedColumn<int> live = GeneratedColumn<int>(
      'live', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'Latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'Longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sourceName,
        secret,
        geohash,
        aim,
        sourceId,
        transactionId,
        timestamp,
        live,
        latitude,
        longitude
      ];
  @override
  String get aliasedName => _alias ?? 'wom';
  @override
  String get actualTableName => 'wom';
  @override
  VerificationContext validateIntegrity(Insertable<WomRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('Id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['Id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('SourceName')) {
      context.handle(
          _sourceNameMeta,
          sourceName.isAcceptableOrUnknown(
              data['SourceName']!, _sourceNameMeta));
    } else if (isInserting) {
      context.missing(_sourceNameMeta);
    }
    if (data.containsKey('Secret')) {
      context.handle(_secretMeta,
          secret.isAcceptableOrUnknown(data['Secret']!, _secretMeta));
    } else if (isInserting) {
      context.missing(_secretMeta);
    }
    if (data.containsKey('geohash')) {
      context.handle(_geohashMeta,
          geohash.isAcceptableOrUnknown(data['geohash']!, _geohashMeta));
    } else if (isInserting) {
      context.missing(_geohashMeta);
    }
    if (data.containsKey('Aim')) {
      context.handle(
          _aimMeta, aim.isAcceptableOrUnknown(data['Aim']!, _aimMeta));
    } else if (isInserting) {
      context.missing(_aimMeta);
    }
    if (data.containsKey('SourceId')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['SourceId']!, _sourceIdMeta));
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('TransactionId')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['TransactionId']!, _transactionIdMeta));
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('Timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['Timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('live')) {
      context.handle(
          _liveMeta, live.isAcceptableOrUnknown(data['live']!, _liveMeta));
    } else if (isInserting) {
      context.missing(_liveMeta);
    }
    if (data.containsKey('Latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['Latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('Longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['Longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WomRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WomRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Id'])!,
      sourceName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}SourceName'])!,
      secret: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Secret'])!,
      geohash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}geohash'])!,
      aim: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Aim'])!,
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}SourceId'])!,
      transactionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}TransactionId'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}Timestamp'])!,
      live: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}live'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}Latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}Longitude'])!,
    );
  }

  @override
  $WomTable createAlias(String alias) {
    return $WomTable(attachedDatabase, alias);
  }
}

class AimRow extends DataClass implements Insertable<AimRow> {
  final int id;
  final String code;
  final Map<String, dynamic> titles;
  const AimRow({required this.id, required this.code, required this.titles});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    {
      final converter = $AimsTable.$convertertitles;
      map['titles'] = Variable<String>(converter.toSql(titles));
    }
    return map;
  }

  AimsCompanion toCompanion(bool nullToAbsent) {
    return AimsCompanion(
      id: Value(id),
      code: Value(code),
      titles: Value(titles),
    );
  }

  factory AimRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AimRow(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      titles: serializer.fromJson<Map<String, dynamic>>(json['titles']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'titles': serializer.toJson<Map<String, dynamic>>(titles),
    };
  }

  AimRow copyWith({int? id, String? code, Map<String, dynamic>? titles}) =>
      AimRow(
        id: id ?? this.id,
        code: code ?? this.code,
        titles: titles ?? this.titles,
      );
  @override
  String toString() {
    return (StringBuffer('AimRow(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('titles: $titles')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, titles);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AimRow &&
          other.id == this.id &&
          other.code == this.code &&
          other.titles == this.titles);
}

class AimsCompanion extends UpdateCompanion<AimRow> {
  final Value<int> id;
  final Value<String> code;
  final Value<Map<String, dynamic>> titles;
  const AimsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.titles = const Value.absent(),
  });
  AimsCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required Map<String, dynamic> titles,
  })  : code = Value(code),
        titles = Value(titles);
  static Insertable<AimRow> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? titles,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (titles != null) 'titles': titles,
    });
  }

  AimsCompanion copyWith(
      {Value<int>? id,
      Value<String>? code,
      Value<Map<String, dynamic>>? titles}) {
    return AimsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      titles: titles ?? this.titles,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (titles.present) {
      final converter = $AimsTable.$convertertitles;
      map['titles'] = Variable<String>(converter.toSql(titles.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AimsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('titles: $titles')
          ..write(')'))
        .toString();
  }
}

class $AimsTable extends Aims with TableInfo<$AimsTable, AimRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AimsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titlesMeta = const VerificationMeta('titles');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      titles = GeneratedColumn<String>('titles', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>($AimsTable.$convertertitles);
  @override
  List<GeneratedColumn> get $columns => [id, code, titles];
  @override
  String get aliasedName => _alias ?? 'aims';
  @override
  String get actualTableName => 'aims';
  @override
  VerificationContext validateIntegrity(Insertable<AimRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    context.handle(_titlesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AimRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AimRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      titles: $AimsTable.$convertertitles.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}titles'])!),
    );
  }

  @override
  $AimsTable createAlias(String alias) {
    return $AimsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $convertertitles =
      const AimTitlesConverter();
}

class MyTransaction extends DataClass implements Insertable<MyTransaction> {
  final int id;
  final String source;
  final String aim;
  final int timestamp;
  final int type;
  final int size;
  final String? ackUrl;
  final String? pin;
  final String? link;
  const MyTransaction(
      {required this.id,
      required this.source,
      required this.aim,
      required this.timestamp,
      required this.type,
      required this.size,
      this.ackUrl,
      this.pin,
      this.link});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['Id'] = Variable<int>(id);
    map['source'] = Variable<String>(source);
    map['Aim'] = Variable<String>(aim);
    map['Timestamp'] = Variable<int>(timestamp);
    map['type'] = Variable<int>(type);
    map['size'] = Variable<int>(size);
    if (!nullToAbsent || ackUrl != null) {
      map['ackUrl'] = Variable<String>(ackUrl);
    }
    if (!nullToAbsent || pin != null) {
      map['pin'] = Variable<String>(pin);
    }
    if (!nullToAbsent || link != null) {
      map['link'] = Variable<String>(link);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      source: Value(source),
      aim: Value(aim),
      timestamp: Value(timestamp),
      type: Value(type),
      size: Value(size),
      ackUrl:
          ackUrl == null && nullToAbsent ? const Value.absent() : Value(ackUrl),
      pin: pin == null && nullToAbsent ? const Value.absent() : Value(pin),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
    );
  }

  factory MyTransaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyTransaction(
      id: serializer.fromJson<int>(json['id']),
      source: serializer.fromJson<String>(json['source']),
      aim: serializer.fromJson<String>(json['aim']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      type: serializer.fromJson<int>(json['type']),
      size: serializer.fromJson<int>(json['size']),
      ackUrl: serializer.fromJson<String?>(json['ackUrl']),
      pin: serializer.fromJson<String?>(json['pin']),
      link: serializer.fromJson<String?>(json['link']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'source': serializer.toJson<String>(source),
      'aim': serializer.toJson<String>(aim),
      'timestamp': serializer.toJson<int>(timestamp),
      'type': serializer.toJson<int>(type),
      'size': serializer.toJson<int>(size),
      'ackUrl': serializer.toJson<String?>(ackUrl),
      'pin': serializer.toJson<String?>(pin),
      'link': serializer.toJson<String?>(link),
    };
  }

  MyTransaction copyWith(
          {int? id,
          String? source,
          String? aim,
          int? timestamp,
          int? type,
          int? size,
          Value<String?> ackUrl = const Value.absent(),
          Value<String?> pin = const Value.absent(),
          Value<String?> link = const Value.absent()}) =>
      MyTransaction(
        id: id ?? this.id,
        source: source ?? this.source,
        aim: aim ?? this.aim,
        timestamp: timestamp ?? this.timestamp,
        type: type ?? this.type,
        size: size ?? this.size,
        ackUrl: ackUrl.present ? ackUrl.value : this.ackUrl,
        pin: pin.present ? pin.value : this.pin,
        link: link.present ? link.value : this.link,
      );
  @override
  String toString() {
    return (StringBuffer('MyTransaction(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('aim: $aim, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type, ')
          ..write('size: $size, ')
          ..write('ackUrl: $ackUrl, ')
          ..write('pin: $pin, ')
          ..write('link: $link')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, source, aim, timestamp, type, size, ackUrl, pin, link);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyTransaction &&
          other.id == this.id &&
          other.source == this.source &&
          other.aim == this.aim &&
          other.timestamp == this.timestamp &&
          other.type == this.type &&
          other.size == this.size &&
          other.ackUrl == this.ackUrl &&
          other.pin == this.pin &&
          other.link == this.link);
}

class TransactionsCompanion extends UpdateCompanion<MyTransaction> {
  final Value<int> id;
  final Value<String> source;
  final Value<String> aim;
  final Value<int> timestamp;
  final Value<int> type;
  final Value<int> size;
  final Value<String?> ackUrl;
  final Value<String?> pin;
  final Value<String?> link;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.source = const Value.absent(),
    this.aim = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.type = const Value.absent(),
    this.size = const Value.absent(),
    this.ackUrl = const Value.absent(),
    this.pin = const Value.absent(),
    this.link = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required String source,
    required String aim,
    required int timestamp,
    required int type,
    required int size,
    this.ackUrl = const Value.absent(),
    this.pin = const Value.absent(),
    this.link = const Value.absent(),
  })  : source = Value(source),
        aim = Value(aim),
        timestamp = Value(timestamp),
        type = Value(type),
        size = Value(size);
  static Insertable<MyTransaction> custom({
    Expression<int>? id,
    Expression<String>? source,
    Expression<String>? aim,
    Expression<int>? timestamp,
    Expression<int>? type,
    Expression<int>? size,
    Expression<String>? ackUrl,
    Expression<String>? pin,
    Expression<String>? link,
  }) {
    return RawValuesInsertable({
      if (id != null) 'Id': id,
      if (source != null) 'source': source,
      if (aim != null) 'Aim': aim,
      if (timestamp != null) 'Timestamp': timestamp,
      if (type != null) 'type': type,
      if (size != null) 'size': size,
      if (ackUrl != null) 'ackUrl': ackUrl,
      if (pin != null) 'pin': pin,
      if (link != null) 'link': link,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? source,
      Value<String>? aim,
      Value<int>? timestamp,
      Value<int>? type,
      Value<int>? size,
      Value<String?>? ackUrl,
      Value<String?>? pin,
      Value<String?>? link}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      source: source ?? this.source,
      aim: aim ?? this.aim,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      size: size ?? this.size,
      ackUrl: ackUrl ?? this.ackUrl,
      pin: pin ?? this.pin,
      link: link ?? this.link,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['Id'] = Variable<int>(id.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (aim.present) {
      map['Aim'] = Variable<String>(aim.value);
    }
    if (timestamp.present) {
      map['Timestamp'] = Variable<int>(timestamp.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (ackUrl.present) {
      map['ackUrl'] = Variable<String>(ackUrl.value);
    }
    if (pin.present) {
      map['pin'] = Variable<String>(pin.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('aim: $aim, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type, ')
          ..write('size: $size, ')
          ..write('ackUrl: $ackUrl, ')
          ..write('pin: $pin, ')
          ..write('link: $link')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, MyTransaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'Id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _aimMeta = const VerificationMeta('aim');
  @override
  late final GeneratedColumn<String> aim = GeneratedColumn<String>(
      'Aim', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
      'Timestamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
      'size', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ackUrlMeta = const VerificationMeta('ackUrl');
  @override
  late final GeneratedColumn<String> ackUrl = GeneratedColumn<String>(
      'ackUrl', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pinMeta = const VerificationMeta('pin');
  @override
  late final GeneratedColumn<String> pin = GeneratedColumn<String>(
      'pin', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, source, aim, timestamp, type, size, ackUrl, pin, link];
  @override
  String get aliasedName => _alias ?? 'transactions';
  @override
  String get actualTableName => 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<MyTransaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('Id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['Id']!, _idMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('Aim')) {
      context.handle(
          _aimMeta, aim.isAcceptableOrUnknown(data['Aim']!, _aimMeta));
    } else if (isInserting) {
      context.missing(_aimMeta);
    }
    if (data.containsKey('Timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['Timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('ackUrl')) {
      context.handle(_ackUrlMeta,
          ackUrl.isAcceptableOrUnknown(data['ackUrl']!, _ackUrlMeta));
    }
    if (data.containsKey('pin')) {
      context.handle(
          _pinMeta, pin.isAcceptableOrUnknown(data['pin']!, _pinMeta));
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyTransaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyTransaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}Id'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      aim: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Aim'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}Timestamp'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size'])!,
      ackUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ackUrl']),
      pin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pin']),
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link']),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $WomTable wom = $WomTable(this);
  late final $AimsTable aims = $AimsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final WomsDao womsDao = WomsDao(this as MyDatabase);
  late final AimsDao aimsDao = AimsDao(this as MyDatabase);
  late final TransactionsDao transactionsDao =
      TransactionsDao(this as MyDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [wom, aims, transactions];
}
