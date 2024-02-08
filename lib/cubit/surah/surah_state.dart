part of 'surah_cubit.dart';

sealed class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

final class SurahInitial extends SurahState {}

final class SurahLoading extends SurahInitial {}

final class SurahLoaded extends SurahState {
  final List<Surah> listSurah;
  const SurahLoaded({required this.listSurah});

  @override
  List<Object> get props => [listSurah];
}

final class SurahError extends SurahState {
  final String message;
  const SurahError({required this.message});

  @override
  List<Object> get props => [message];
}
