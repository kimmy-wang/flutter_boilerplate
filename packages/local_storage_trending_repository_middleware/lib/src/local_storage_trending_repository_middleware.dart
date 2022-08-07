import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trending_repository_middleware/trending_repository_middleware.dart';

/// {@template local_storage_trending_repository_middleware}
/// A Flutter implementation of the [TrendingRepositoryMiddleware] that uses local storage.
/// {@endtemplate}
class LocalStorageTrendingRepositoryMiddleware extends TrendingRepositoryMiddleware {
  /// {@macro local_storage_trending_repository_middleware}
  LocalStorageTrendingRepositoryMiddleware({
    required SharedPreferences plugin,
  }) : _plugin = plugin;

  final SharedPreferences _plugin;

  /// The key used for storing the todos locally.
  ///
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  @visibleForTesting
  static const kTrendingCollectionKey = '__trending_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  @override
  Future<List<Trending>> getTrending() async {
    final trendingJson = _getValue(kTrendingCollectionKey);
    if (trendingJson != null) {
      final trendingList = List<Map<dynamic, dynamic>>.from(
        json.decode(trendingJson) as List,
      )
          .map((jsonMap) => Trending.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      return trendingList;
    }
    return [];
  }

  @override
  Future<void> saveTrending(List<Trending> trendingList) {
    return _setValue(kTrendingCollectionKey, json.encode(trendingList));
  }

}
