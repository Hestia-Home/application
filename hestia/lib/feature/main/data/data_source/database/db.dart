import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'db.g.dart';

class Rooms extends Table {
  TextColumn get roomName => text()();
  IntColumn get id => integer().autoIncrement()();
}

/// Devices column, consistent of data delivered by [WebSocket]
/// Has [One-to-Many] relation with [Rooms]
@DataClassName("Devices")
class SmartDevices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get deviceType => integer()();
  TextColumn get data => text()();
  IntColumn get roomId => integer().references(Rooms, #id)();
}

@DriftDatabase(tables: [Rooms, SmartDevices])
class HestiaDB extends _$HestiaDB {
  HestiaDB() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(onUpgrade: (m, from, to) async {
        await customStatement('PRAGMA foreign_keys = ON');
      }, beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      });

  Stream<List<Devices>> watchDevices() {
    return (select(smartDevices).watch());
  }

  Future<void> createOrUpdateDeviceInfo(Devices device) async {
    await into(smartDevices).insertOnConflictUpdate(device);
  }

  Stream<List<Room>> watchRooms() {
    return (select(rooms).watch());
  }

  Future<void> changeDeviceRoomAttachment(int roomId, int id) async {
    /// Getting instance of device from db and making a copy of it with new selected [roomName]
    final deviceToChange = await (select(smartDevices)
          ..where((device) => device.id.equals(id)))
        .getSingle();

    final newDevice = deviceToChange.copyWith(roomId: roomId);

    /// Updating table with new device info
    await update(smartDevices).replace(newDevice);
  }

  Future<void> updateRoomName(int id, String roomName) async {
    final roomToChange =
        await (select(rooms)..where((room) => room.id.equals(id))).getSingle();

    final roomWithNewName = roomToChange.copyWith(roomName: roomName);

    await update(rooms).replace(roomWithNewName);
  }

  Future<void> createOrUpdateRoomInfo(Room room) async {
    await into(rooms).insertOnConflictUpdate(room);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
