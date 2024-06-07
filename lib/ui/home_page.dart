import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/commons/constants.dart';
import 'package:flutter_ahlul_quran_app/ui/rotating_ornament.dart';
import 'package:flutter_ahlul_quran_app/ui/surah_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        constraints: BoxConstraints(
          maxHeight: size.height,
          maxWidth: size.width,
        ),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/praying.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black,
              BlendMode.color,
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Al-Qur'an",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24.r),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24.r),
                      splashColor: Colors.black.withAlpha(100),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (con) => const SurahPage(),
                          ),
                        )
                      },
                      child: SizedBox(
                        width: (size.width - 24.sp - 24.sp),
                        height: 186.h,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 24.sp,
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 24.sp),
                                    child: SvgPicture.asset(
                                      'assets/book.svg',
                                      fit: BoxFit.fitHeight,
                                      color: AppColors.white,
                                      height: 52.h,
                                      width: 44.w,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 24.sp,
                                      right: 24.sp,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Baca Al-Qur'an",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.arrow_right_alt,
                                          size: 32,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                top: -4.sp,
                                right: -50.sp,
                                child: SizedBox(
                                  width: 160.w,
                                  height: 160.h,
                                  child: const RotatingOrnament(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.h,
              width: size.width,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withAlpha(0),
                      Colors.black,
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 12.sp,
                      child: SizedBox(
                        height: 100.h,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.sp),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.menu_book,
                                    color: AppColors.white,
                                    size: 20.sp,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    'Motivasi',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Sebaik - baik manusia diantara kamu adalah yang mempelajari Al-Quran dan mengajarkannya (HR Bukhori)',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
