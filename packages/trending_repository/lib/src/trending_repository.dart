import 'package:trending_api/trending_api.dart';

/// {@template trending_repository}
/// A repository that handles trending related requests.
/// {@endtemplate}
class TrendingRepository {
  /// {@macro trending_repository}
  const TrendingRepository({
    required TrendingApi trendingApi,
  }) : _trendingApi = trendingApi;

  final TrendingApi _trendingApi;

  /// Provides a [Future] of all trending.
  Future<List<Trending>?> getTrending() => _trendingApi.getTrending();

}
