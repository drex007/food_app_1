import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  late GetStorage _storage;

  Future<StorageService> init() async {
    _storage = GetStorage();
    // await _storage.writeIfNull(taskKey, []);
    return this;
  }

  T read<T>(String key) {
    return _storage.read(key);
  }

  void write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  void clear() async {
    await _storage.erase();
  }

  /// convert data to a JSON string and store
  Future encode(String key, dynamic data) async{
   return await _storage.write(key, jsonEncode(data));
  }

  /// retrieve and convert data to a JSON obj
  T decode<T>(String key) {
    return jsonDecode(_storage.read(key));
  }
}
