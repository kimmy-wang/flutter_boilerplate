import 'package:trending_api/trending_api.dart';
import 'package:trending_repository_middleware/trending_repository_middleware.dart';

/// {@template trending_repository}
/// A repository that handles trending related requests.
/// {@endtemplate}
class TrendingRepository {
  /// {@macro trending_repository}
  const TrendingRepository({
    required TrendingApi trendingApi,
    TrendingRepositoryMiddleware? trendingRepositoryMiddleware,
  })  : _trendingApi = trendingApi,
        _trendingRepositoryMiddleware = trendingRepositoryMiddleware;

  final TrendingApi _trendingApi;
  final TrendingRepositoryMiddleware? _trendingRepositoryMiddleware;

  /// Provides a [Future] of all trending.
  Future<List<Trending>?> getTrending({ bool pullDown = false }) async {
    List<Trending>? trendingList = [];
    if (_trendingRepositoryMiddleware != null && !pullDown) {
      print('cache valid');
      trendingList = await _trendingRepositoryMiddleware!.getTrending();
    }
    if (trendingList == null || trendingList.isEmpty) {
      print('network valid');
      trendingList = await _trendingApi.getTrending();
    }
    if (_trendingRepositoryMiddleware != null && trendingList != null && trendingList.isNotEmpty) {
      await _trendingRepositoryMiddleware!.saveTrending(trendingList);
    }
    return trendingList;
  }
}
