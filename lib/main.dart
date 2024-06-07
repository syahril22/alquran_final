import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/cubit/ayah/ayah_cubit.dart';
import 'package:flutter_ahlul_quran_app/cubit/surah/surah_cubit.dart';
import 'package:flutter_ahlul_quran_app/data/service_api.dart';
import 'package:flutter_ahlul_quran_app/ui/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SurahCubit(apiService)),
        BlocProvider(create: (context) => AyahCubit(apiService)),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Ahlul Quran App',
              theme: ThemeData(
                primarySwatch: Colors.green,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              home: const HomePage(),
            );
          }),
    );
  }
}
