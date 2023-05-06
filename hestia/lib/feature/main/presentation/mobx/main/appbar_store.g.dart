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

  late final _$imageAtom = Atom(name: '_AppBarStore.image', context: context);

  @override
  ImageProvider<Object> get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(ImageProvider<Object> value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$_AppBarStoreActionController =
      ActionController(name: '_AppBarStore', context: context);

  @override
  void getUserAvatar() {
    final _$actionInfo = _$_AppBarStoreActionController.startAction(
        name: '_AppBarStore.getUserAvatar');
    try {
      return super.getUserAvatar();
    } finally {
      _$_AppBarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getUser() {
    final _$actionInfo = _$_AppBarStoreActionController.startAction(
        name: '_AppBarStore.getUser');
    try {
      return super.getUser();
    } finally {
      _$_AppBarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
image: ${image}
    ''';
  }
}
