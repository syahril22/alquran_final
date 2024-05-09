import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_ahlul_quran_app/data/model/surah_detail.dart';
import 'package:flutter_ahlul_quran_app/data/model/surah_list.dart';
import 'package:http/http.dart' as http;

class ApiService {
  http.Client client = http.Client();
  ApiService();

  Future<Either<String, List<Surah>>> getSurahList() async {
    try {
      final response =
          await client.get(Uri.parse('https://equran.id/api/v2/surat'));
      return Right(
        SurahListResponse.fromJson(jsonDecode(response.body)).data,
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, SurahDetail>> getSurahDetail(int surahId) async {
    try {
      final response = await client
          .get(Uri.parse('https://equran.id/api/v2/surat/$surahId'));

      return Right(
        SurahDetailResponse.fromJson(jsonDecode(response.body)).data,
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
