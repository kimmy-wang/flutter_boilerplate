part of 'trending_bloc.dart';

enum TrendingStatus { initial, loading, success, failure }

class TrendingState extends Equatable {
  const TrendingState({
    this.status = TrendingStatus.initial,
    this.trendings = const [],
  });

  final TrendingStatus status;
  final List<Trending>? trendings;

  TrendingState copyWith({
    TrendingStatus Function()? status,
    List<Trending>? Function()? trendings,
  }) {
    return TrendingState(
      status: status != null ? status() : this.status,
      trendings: trendings != null ? trendings() : this.trendings,
    );
  }

  @override
  List<Object?> get props => [
        status,
        trendings,
      ];
}
