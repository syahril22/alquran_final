import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/commons/constants.dart';
import 'package:flutter_ahlul_quran_app/cubit/ayah/ayah_cubit.dart';
import 'package:flutter_ahlul_quran_app/data/model/surah_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AyahPage extends StatefulWidget {
  final Surah surah;

  const AyahPage({super.key, required this.surah});

  @override
  State<AyahPage> createState() => _AyahPageState();
}

class _AyahPageState extends State<AyahPage> {
  @override
  void initState() {
    context.read<AyahCubit>().getDetailSurah(widget.surah.nomor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "surah-${widget.surah.nomor}",
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Surah ${widget.surah.namaLatin} - ${widget.surah.nama}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.primary,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
        ),
        body: BlocBuilder<AyahCubit, AyahState>(builder: (context, state) {
          if (state is AyahLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state is AyahLoaded) {
            final isAlFatihah = state.detail.nomor == 1;

            return ListView.separated(
                separatorBuilder: (context, idx) {
                  return const Divider();
                },
                itemCount: isAlFatihah
                    ? state.detail.ayat.length
                    : state.detail.ayat.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0 && !isAlFatihah) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                            style: TextStyle(
                              fontFamily: "LPMQ Isep Misbah",
                              fontSize: 24,
                              letterSpacing: 0,
                            ),
                          )
                        ],
                      ),
                    );
                  }

                  final ayah =
                      state.detail.ayat[isAlFatihah ? index : index - 1];
                  return Card(
                    elevation: 0,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.sp,
                        horizontal: 20.sp,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Text(
                          "${isAlFatihah ? index + 1 : index}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        ayah.teksArab,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          letterSpacing: 0,
                          height: 2,
                          fontSize: 24,
                          fontFamily: "LPMQ Isep Misbah",
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(ayah.teksIndonesia),
                      ),
                      // subtitle: Text("${surah.arti}, ${surah.jumlahAyat} Ayat"),
                    ),
                  );
                });
          }

          if (state is AyahError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const SizedBox();
        }),
      ),
    );
  }
}
