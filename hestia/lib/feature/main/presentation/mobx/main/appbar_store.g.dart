// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appbar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppBarStore on _AppBarStore, Store {
  late final _$userAtom = Atom(name: '_AppBarStore.user', context: context);

  @override
  UserEntity get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserEntity value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$_dateAtom = Atom(name: '_AppBarStore._date', context: context);

  DateTime get date {
    _$_dateAtom.reportRead();
    return super._date;
  }

  @override
  DateTime get _date => date;

  @override
  set _date(DateTime value) {
    _$_dateAtom.reportWrite(value, super._date, () {
      super._date = value;
    });
  }

  late final _$_dateStreamControllerAtom =
      Atom(name: '_AppBarStore._dateStreamController', context: context);

  StreamController<DateTime> get dateStreamController {
    _$_dateStreamControllerAtom.reportRead();
    return super._dateStreamController;
  }

  @override
  StreamController<DateTime> get _dateStreamController => dateStreamController;

  @override
  set _dateStreamController(StreamController<DateTime> value) {
    _$_dateStreamControllerAtom.reportWrite(value, super._dateStreamController,
        () {
      super._dateStreamController = value;
    });
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
