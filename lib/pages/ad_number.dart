
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
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: AdWidget(ad: banner!));
}


class AdManager {
  RewardedAd? _rewardedAd;
  bool _isRewardedAdLoaded = false;

  // 광고 로드 함수
  void loadRewardedAd() {
    RewardedAd.load(
      // adUnitId: 'ca-app-pub-3525010127354180/2249535682', // 실제 광고 단위 ID 사용
      adUnitId: 'ca-app-pub-3940256099942544/5224354917', // 테스트용 광고 단위 ID
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          _rewardedAd = ad;
          _isRewardedAdLoaded = true; // 광고 로드 상태 업데이트
          print("리워드 광고가 로드되었습니다.");
        },
        onAdFailedToLoad: (LoadAdError error) {
          print("리워드 광고 로드 실패: $error");
          _isRewardedAdLoaded = false; // 로드 실패 시 상태 업데이트
        },
      ),
    );
  }

  // 광고 표시 함수
  void showRewardedAd(BuildContext context) {
    if (_isRewardedAdLoaded && _rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          print("광고 시청 완료! 후원 포인트 1개 지급.");

          // '감사합니다' 다이얼로그 표시
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white, // 배경 색상
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // 모서리 둥글게
                ),
                title: Text(
                  '감사합니다!',
                  style: TextStyle(
                    fontSize: 24, // 제목 크기
                    fontWeight: FontWeight.bold, // 제목 두껍게
                    color: Colors.green, // 제목 색상
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min, // 내용에 맞게 크기 조절
                  children: [
                    Icon(
                      Icons.card_giftcard, // 아이콘 추가
                      size: 60,
                      color: Colors.green,
                    ),
                    SizedBox(height: 10), // 아이콘과 텍스트 간격
                    Text(
                      '이번 주 로또 1등은 바로 당신입니다!',
                      style: TextStyle(
                        fontSize: 18, // 내용 텍스트 크기
                        color: Colors.black, // 내용 텍스트 색상
                      ),
                      textAlign: TextAlign.center, // 텍스트 가운데 정렬
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('확인', style: TextStyle(color: Colors.green)), // 버튼 색상
                    onPressed: () {
                      Navigator.of(context).pop(); // 다이얼로그 닫기
                    },
                  ),
                ],
              );
            },
          );




        },
      );

      // 광고를 한 번 표시한 후 다시 로드
      _rewardedAd = null;
      _isRewardedAdLoaded = false;
      loadRewardedAd();
    } else {
      print("광고가 아직 로드되지 않았습니다.");
      loadRewardedAd(); // 로드되지 않았을 때 로드 시도
    }
  }
}







