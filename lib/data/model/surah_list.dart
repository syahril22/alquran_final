// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SurahListResponse surahListResponseFromJson(String str) => SurahListResponse.fromJson(json.decode(str));

String surahListResponseToJson(SurahListResponse data) => json.encode(data.toJson());

class SurahListResponse {
    int code;
    String message;
    List<Surah> data;

    SurahListResponse({
        required this.code,
        required this.message,
        required this.data,
    });

    factory SurahListResponse.fromJson(Map<String, dynamic> json) => SurahListResponse(
        code: json["code"],
        message: json["message"],
        data: List<Surah>.from(json["data"].map((x) => Surah.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Surah {
    int nomor;
    String nama;
    String namaLatin;
    int jumlahAyat;
    TempatTurun tempatTurun;
    String arti;
    String deskripsi;
    Map<String, String> audioFull;

    Surah({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
        required this.tempatTurun,
        required this.arti,
        required this.deskripsi,
        required this.audioFull,
    });

    factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: tempatTurunValues.map[json["tempatTurun"]]!,
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurunValues.reverse[tempatTurun],
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull": Map.from(audioFull).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

enum TempatTurun {
    MADINAH,
    MEKAH
}

final tempatTurunValues = EnumValues({
    "Madinah": TempatTurun.MADINAH,
    "Mekah": TempatTurun.MEKAH
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
