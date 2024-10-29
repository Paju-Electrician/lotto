
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final String androidTestUnitId =    'ca-app-pub-3940256099942544/6300978111'; //6300978111은 테스트용 광고 아이디
// final String androidTestUnitId = 'ca-app-pub-3525010127354180/7867321461'; // 실제 광고 아이디

BannerAd? banner;

returnAd() {
  return banner == null
      ? null
  // : SizedBox(
  //     // height: 49.h,
  //     height: 49.h,
  //     child: AdWidget(ad: banner!),
  //   );

      : Container(
      height: banner!.size.height.toDouble(),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 13.h),
      child: AdWidget(ad: banner!));
}