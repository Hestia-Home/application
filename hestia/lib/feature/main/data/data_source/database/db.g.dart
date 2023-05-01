// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $RoomsTable extends Rooms with TableInfo<$RoomsTable, Room> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _roomNameMeta =
      const VerificationMeta('roomName');
  @override
  late final GeneratedColumn<String> roomName = GeneratedColumn<String>(
      'room_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [roomName];
  @override
  String get aliasedName => _alias ?? 'rooms';
  @override
  String get actualTableName => 'rooms';
  @override
  VerificationContext validateIntegrity(Insertable<Room> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('room_name')) {
      context.handle(_roomNameMeta,
          roomName.isAcceptableOrUnknown(data['room_name']!, _roomNameMeta));
    } else if (isInserting) {
      context.missing(_roomNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {roomName};
  @override
  Room map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Room(
      roomName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_name'])!,
    );
  }

  @override
  $RoomsTable createAlias(String alias) {
    return $RoomsTable(attachedDatabase, alias);
  }
}

class Room extends DataClass implements Insertable<Room> {
  final String roomName;
  const Room({required this.roomName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['room_name'] = Variable<String>(roomName);
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      roomName: Value(roomName),
    );
  }

  factory Room.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Room(
      roomName: serializer.fromJson<String>(json['roomName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'roomName': serializer.toJson<String>(roomName),
    };
  }

  Room copyWith({String? roomName}) => Room(
        roomName: roomName ?? this.roomName,
      );
  @override
  String toString() {
    return (StringBuffer('Room(')
          ..write('roomName: $roomName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => roomName.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room && other.roomName == this.roomName);
}

class RoomsCompanion extends UpdateCompanion<Room> {
  final Value<String> roomName;
  final Value<int> rowid;
  const RoomsCompanion({
    this.roomName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoomsCompanion.insert({
    required String roomName,
    this.rowid = const Value.absent(),
  }) : roomName = Value(roomName);
  static Insertable<Room> custom({
    Expression<String>? roomName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (roomName != null) 'room_name': roomName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomsCompanion copyWith({Value<String>? roomName, Value<int>? rowid}) {
    return RoomsCompanion(
      roomName: roomName ?? this.roomName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (roomName.present) {
      map['room_name'] = Variable<String>(roomName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('roomName: $roomName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SmartDevicesTable extends SmartDevices
    with TableInfo<$SmartDevicesTable, Devices> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SmartDevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _deviceTypeMeta =
      const VerificationMeta('deviceType');
  @override
  late final GeneratedColumn<int> deviceType = GeneratedColumn<int>(
      'device_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roomNameMeta =
      const VerificationMeta('roomName');
  @override
  late final GeneratedColumn<String> roomName = GeneratedColumn<String>(
      'room_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES rooms (room_name)'));
  @override
  List<GeneratedColumn> get $columns => [id, deviceType, data, roomName];
  @override
  String get aliasedName => _alias ?? 'smart_devices';
  @override
  String get actualTableName => 'smart_devices';
  @override
  VerificationContext validateIntegrity(Insertable<Devices> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('device_type')) {
      context.handle(
          _deviceTypeMeta,
          deviceType.isAcceptableOrUnknown(
              data['device_type']!, _deviceTypeMeta));
    } else if (isInserting) {
      context.missing(_deviceTypeMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('room_name')) {
      context.handle(_roomNameMeta,
          roomName.isAcceptableOrUnknown(data['room_name']!, _roomNameMeta));
    } else if (isInserting) {
      context.missing(_roomNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Devices map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Devices(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      deviceType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}device_type'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      roomName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_name'])!,
    );
  }

  @override
  $SmartDevicesTable createAlias(String alias) {
    return $SmartDevicesTable(attachedDatabase, alias);
  }
}

class Devices extends DataClass implements Insertable<Devices> {
  final int id;
  final int deviceType;
  final String data;
  final String roomName;
  const Devices(
      {required this.id,
      required this.deviceType,
      required this.data,
      required this.roomName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['device_type'] = Variable<int>(deviceType);
    map['data'] = Variable<String>(data);
    map['room_name'] = Variable<String>(roomName);
    return map;
  }

  SmartDevicesCompanion toCompanion(bool nullToAbsent) {
    return SmartDevicesCompanion(
      id: Value(id),
      deviceType: Value(deviceType),
      data: Value(data),
      roomName: Value(roomName),
    );
  }

  factory Devices.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Devices(
      id: serializer.fromJson<int>(json['id']),
      deviceType: serializer.fromJson<int>(json['deviceType']),
      data: serializer.fromJson<String>(json['data']),
      roomName: serializer.fromJson<String>(json['roomName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deviceType': serializer.toJson<int>(deviceType),
      'data': serializer.toJson<String>(data),
      'roomName': serializer.toJson<String>(roomName),
    };
  }

  Devices copyWith(
          {int? id, int? deviceType, String? data, String? roomName}) =>
      Devices(
        id: id ?? this.id,
        deviceType: deviceType ?? this.deviceType,
        data: data ?? this.data,
        roomName: roomName ?? this.roomName,
      );
  @override
  String toString() {
    return (StringBuffer('Devices(')
          ..write('id: $id, ')
          ..write('deviceType: $deviceType, ')
          ..write('data: $data, ')
          ..write('roomName: $roomName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, deviceType, data, roomName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Devices &&
          other.id == this.id &&
          other.deviceType == this.deviceType &&
          other.data == this.data &&
          other.roomName == this.roomName);
}

class SmartDevicesCompanion extends UpdateCompanion<Devices> {
  final Value<int> id;
  final Value<int> deviceType;
  final Value<String> data;
  final Value<String> roomName;
  const SmartDevicesCompanion({
    this.id = const Value.absent(),
    this.deviceType = const Value.absent(),
    this.data = const Value.absent(),
    this.roomName = const Value.absent(),
  });
  SmartDevicesCompanion.insert({
    this.id = const Value.absent(),
    required int deviceType,
    required String data,
    required String roomName,
  })  : deviceType = Value(deviceType),
        data = Value(data),
        roomName = Value(roomName);
  static Insertable<Devices> custom({
    Expression<int>? id,
    Expression<int>? deviceType,
    Expression<String>? data,
    Expression<String>? roomName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceType != null) 'device_type': deviceType,
      if (data != null) 'data': data,
      if (roomName != null) 'room_name': roomName,
    });
  }

  SmartDevicesCompanion copyWith(
      {Value<int>? id,
      Value<int>? deviceType,
      Value<String>? data,
      Value<String>? roomName}) {
    return SmartDevicesCompanion(
      id: id ?? this.id,
      deviceType: deviceType ?? this.deviceType,
      data: data ?? this.data,
      roomName: roomName ?? this.roomName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deviceType.present) {
      map['device_type'] = Variable<int>(deviceType.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (roomName.present) {
      map['room_name'] = Variable<String>(roomName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SmartDevicesCompanion(')
          ..write('id: $id, ')
          ..write('deviceType: $deviceType, ')
          ..write('data: $data, ')
          ..write('roomName: $roomName')
          ..write(')'))
        .toString();
  }
}

abstract class _$HestiaDB extends GeneratedDatabase {
  _$HestiaDB(QueryExecutor e) : super(e);
  late final $RoomsTable rooms = $RoomsTable(this);
  late final $SmartDevicesTable smartDevices = $SmartDevicesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [rooms, smartDevices];
}
