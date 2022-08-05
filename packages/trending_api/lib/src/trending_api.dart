import 'package:trending_api/trending_api.dart';

/// {@template trending_api}
/// The interface for an API that provides access to a list of trending.
/// {@endtemplate}
abstract class TrendingApi {
  /// {@macro trending_api}
  const TrendingApi();

  /// Provides a [Future] of all todos.
  Future<List<Trending>?> getTrending();

}

/// Error thrown when a [Trending] with a given id is not found.
class TrendingNotFoundException implements Exception {}
