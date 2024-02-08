part of 'ayah_cubit.dart';

sealed class AyahState extends Equatable {
  const AyahState();

  @override
  List<Object> get props => [];
}

final class AyahInitial extends AyahState {}

final class AyahLoading extends AyahState {}

final class AyahLoaded extends AyahState {
  final SurahDetail detail;

  const AyahLoaded({required this.detail});

  @override
  List<Object> get props => [detail];
}

final class AyahError extends AyahState {
  final String message;

  const AyahError({required this.message});

  @override
  List<Object> get props => [message];
}
