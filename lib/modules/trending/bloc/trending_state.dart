part of 'trending_bloc.dart';

enum TrendingStatus { initial, loading, success, failure }

enum TrendingOperation { none, refresh, load }

class TrendingState extends Equatable {
  const TrendingState({
    this.status = TrendingStatus.initial,
    this.operation = TrendingOperation.none,
    this.trendingList = const [],
  });

  final TrendingStatus status;
  final TrendingOperation operation;
  final List<Trending>? trendingList;

  TrendingState copyWith({
    TrendingStatus? status,
    TrendingOperation? operation,
    List<Trending>? trendingList,
  }) {
    return TrendingState(
      status: status ?? this.status,
      operation: operation ?? this.operation,
      trendingList: trendingList ?? this.trendingList,
    );
  }

  @override
  List<Object?> get props => [
        status,
        operation,
        trendingList,
      ];
}
