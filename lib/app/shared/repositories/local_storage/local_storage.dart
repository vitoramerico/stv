import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stv/app/shared/repositories/local_storage/local_storage_interface.dart';

class LocalStorage implements ILocalStorage {
  static const String USER_TOKEN = "USER_TOKEN";

  Completer<SharedPreferences> instance = Completer<SharedPreferences>();

  LocalStorage() {
    _initLocalStorage();
  }

  _initLocalStorage() async {
    var share = await SharedPreferences.getInstance();

    if (!instance.isCompleted) instance.complete(share);
  }

  Future<bool> put(String key, Map<String, dynamic> json) async {
    try {
      var share = await instance.future;

      share.setString(key, jsonEncode(json));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future get<S>(String key, {S Function(Map) construct}) async {
    try {
      var share = await instance.future;

      var value = share.getString(key);

      var json = jsonDecode(value);

      if (construct == null) 
        return json;
       else 
        return construct(json);
    } catch (e) {
      return null;
    }
  }
  
  @override
  Future delete(String key) async {
    var share = await instance.future;
    return share.remove(key);
  }
}
