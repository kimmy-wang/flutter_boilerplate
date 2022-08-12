part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    this.themeColor = 0xFF13B9FF,
    this.locale = const Locale('en'),
  });

  final int themeColor;
  final Locale locale;

  AppState copyWith({
    int? themeColor,
    Locale? locale,
  }) {
    return AppState(
      themeColor: themeColor ?? this.themeColor,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [themeColor, locale];
}
