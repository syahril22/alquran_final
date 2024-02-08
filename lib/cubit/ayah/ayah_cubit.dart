import 'package:equatable/equatable.dart';
import 'package:flutter_ahlul_quran_app/data/model/surah_detail.dart';
import 'package:flutter_ahlul_quran_app/data/service_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ayah_state.dart';

class AyahCubit extends Cubit<AyahState> {
  final ApiService apiService;

  AyahCubit(this.apiService) : super(AyahInitial());

  void getDetailSurah(int noSurah) async {
    emit(AyahLoading());

    final result = await apiService.getSurahDetail(noSurah);

    result.fold(
      (left) => emit(AyahError(message: left)),
      (right) => emit(AyahLoaded(detail: right)),
    );
  }
}
