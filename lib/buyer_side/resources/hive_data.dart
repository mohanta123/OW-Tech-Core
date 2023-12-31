import 'package:hive_flutter/adapters.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import '../models/user.dart';

class HiveData {
  const HiveData();

  Future<int> saveUser(User user) async {
    try {
      final Box<User> box = await Hive.openBox<User>('users_box');
      return box.add(user);
    } catch (e) {
      print(e);
      return -1;
    }
  }

  Future<int> getKey(String dni) async {
    List<User?> usuarios = await users;
    User? a = usuarios.firstWhereOrNull(
      (element) => element!.dni == dni,
    );
    return usuarios.indexOf(a);
  }

  Future<int> getNewKey() async {
    List<User?> usuarios = await users;
    return usuarios.length;
  }

  Future<bool> putAt(int key, User user) async {
    try {
      final Box<User> box = await Hive.openBox<User>('users_box');
      box.putAt(key, user);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<User>> get users async {
    final Box<User> box = await Hive.openBox<User>('users_box');
    print(box.values.toList());
    return box.values.toList();
  }
}
