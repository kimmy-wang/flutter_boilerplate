part of 'home_cubit.dart';

enum HomeTab { trending, search }

class HomeState extends Equatable {
  const HomeState({
    this.tabIndex = 0,
    this.themeColor = 0xFF13B9FF,
  });

  final int tabIndex;
  final int themeColor;

  HomeState copyWith({
    int? tabIndex,
    int? themeColor,
  }) {
    return HomeState(
      tabIndex: tabIndex ?? this.tabIndex,
      themeColor: themeColor ?? this.themeColor,
    );
  }

  @override
  List<Object> get props => [tabIndex];
}
