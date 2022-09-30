import 'package:shared_preferences/shared_preferences.dart';

class SharedPrafranceManager {
  late SharedPreferences _storage;

  Future<void> setData(String key, dynamic value) async {
    _storage = await SharedPreferences.getInstance();
    _storage.setString(key,value);
  }

  Future<dynamic> getData(String key) async {
    _storage = await SharedPreferences.getInstance();
    return _storage.get(key);
  }

  Future<bool> deleteData(String key) async {
    _storage = await SharedPreferences.getInstance();
    return _storage.remove(key);
  }

  Future<bool> deleteAllDataStorage() async {
    _storage = await SharedPreferences.getInstance();
    return _storage.clear();
  }

  Future<bool> isContainsKey(String key) async {
    _storage = await SharedPreferences.getInstance();
    return _storage.containsKey(key);
  }
}
