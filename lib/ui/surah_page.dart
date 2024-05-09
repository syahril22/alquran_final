import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/commons/constants.dart';
import 'package:flutter_ahlul_quran_app/cubit/surah/surah_cubit.dart';
import 'package:flutter_ahlul_quran_app/ui/ayah_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurahPage extends StatefulWidget {
  const SurahPage({super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  @override
  void initState() {
    context.read<SurahCubit>().getAllSurah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Al-Qur'an",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: BlocBuilder<SurahCubit, SurahState>(builder: (context, state) {
        if (state is SurahLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is SurahLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
              if (index >= state.listSurah.length) {
                return null;
              }
              final surah = state.listSurah[index];
              return Hero(
                tag: "surah-${surah.nomor}",
                child: Card(
                  elevation: 0,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AyahPage(surah: surah),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Text(
                          "${surah.nomor}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text("${surah.namaLatin} - ${surah.nama}"),
                      subtitle: Text("${surah.arti}, ${surah.jumlahAyat} Ayat"),
                    ),
                  ),
                ),
              );
            },
          );
        }

        if (state is SurahError) {
          return Center(
              child: Text(
            state.message,
            style: const TextStyle(color: Colors.red),
          ));
        }

        return const Center(child: Text("Error"));
      }),
    );
  }
}
