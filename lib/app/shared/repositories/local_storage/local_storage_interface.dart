abstract class ILocalStorage {
  Future get<S>(String key, {S Function(Map) construct});
  Future put(String key, Map<String, dynamic> value);
  Future delete(String key);
}