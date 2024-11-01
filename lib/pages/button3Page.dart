
import 'dart:async';

import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:lotto/provider/allpages_Provider.dart';
import 'package:lotto/widget/base_map.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:provider/provider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'ad_number.dart';

class button3Page extends StatefulWidget {
  const button3Page({Key? key}) : super(key: key);

  @override
  _button3PageState createState() => _button3PageState();
}

class _button3PageState extends State<button3Page> {



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    banner = BannerAd(
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (Ad ad) => print('Ad loaded.'),
          // Called when an ad request failed.
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            // Dispose the ad here to free resources.
            ad.dispose();
            print('Ad failed to load: $error');
          },
          // Called when an ad opens an overlay that covers the screen.
          onAdOpened: (Ad ad) => print('Ad opened.'),
          // Called when an ad removes an overlay that covers the screen.
          onAdClosed: (Ad ad) => print('Ad closed.'),
          // Called when an impression occurs on the ad.
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ),
        size: AdSize.banner,
        adUnitId: androidTestUnitId,
        request: const AdRequest())
      ..load();
  }
  @override
  void dispose() {
    // TODO: implement dispose

    print('dispose실행됨');

    banner!.dispose();

    super.dispose();
  }
  getToday() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));
    DateTime now = tz.TZDateTime.now(tz.local); // print('now는${now}');
    DateTime dateTime1 = DateTime(now.year, now.month, now.day);
    DateTime dateTime2 = DateTime(
        (DateTime.parse(
                context.watch<Mainpage_Store>().placeLottoData['drwNoDate'] ?? '2022-10-24'))
            .year,
        (DateTime.parse(
                context.watch<Mainpage_Store>().placeLottoData['drwNoDate'] ?? '2022-10-24'))
            .month,
        (DateTime.parse(
                context.watch<Mainpage_Store>().placeLottoData['drwNoDate'] ?? '2022-10-24'))
            .day);
    Duration duration = dateTime2.difference(dateTime1);
    return duration.inDays;
  }

  seta(i) async {
    NaverMapController controller = await context.read<Mainpage_Store>().abc.future;

    var cameraUpdate = CameraUpdate.toCameraPosition(CameraPosition(
      target: LatLng(context.read<Mainpage_Store>().MarkerWhere[i][1],
          context.read<Mainpage_Store>().MarkerWhere[i][0]),
      zoom: 12.0,
    ));

    controller.moveCamera(cameraUpdate);
  }
secseta(i) async {
  NaverMapController controller = await context.read<Mainpage_Store>().abc.future;

  var cameraUpdate = CameraUpdate.toCameraPosition(CameraPosition(
    target: LatLng(context.read<Mainpage_Store>().secMarkerWhere[i][1],
        context.read<Mainpage_Store>().secMarkerWhere[i][0]),
    zoom: 12.0,
  ));

  controller.moveCamera(cameraUpdate);
}

  setBasicPosition() async {
    NaverMapController controller = await context.read<Mainpage_Store>().abc.future;
    var cameraUpdate = CameraUpdate.toCameraPosition(const CameraPosition(
      target: LatLng(35.8, 127.6),
      zoom: 5,
    ));
    controller.moveCamera(cameraUpdate);
  }


bool firstselected = true;
bool secselected = false;







  LottoPlaceList(){

  return  firstselected==true&&secselected==false?
  Expanded(
    child: Container(
      child: ListView.separated(
        itemCount:
        context.watch<Mainpage_Store>().firstLottoPlaceSet.length-1,
        itemBuilder: (c, i) {
          return GestureDetector(
              onTap: () {
                seta(i);


              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: AutoSizeText('${i + 1}',
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    Expanded(
                      flex: 13,
                      child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              '${context.watch<Mainpage_Store>().firstLottoPlaceSet[i][0].trim()}',
                              style:  TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: 'Pretendard'),
                            ),
                            AutoSizeText(
                              // softWrap: false,
                              // minFontSize: 20.sp,
                              '${context.watch<Mainpage_Store>().firstLottoPlaceSet[i][1].trim()}',
                              style:  TextStyle(fontSize: 15.sp),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 50,
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(5.sp,0,0,0),
                        child: Row(children: [
                          AutoSizeText(
                            '${context.watch<Mainpage_Store>().firstWay[i].trim()} ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: context
                                    .watch<Mainpage_Store>()
                                    .firstWay[i]
                                    .trim() ==
                                    '반자동'
                                    ? 14
                                    : 20,
                                fontFamily: 'Pretendard'),
                          ),
                          Image.asset(
                            'assets/mark.png',
                            width: 30.w,
                            height: 30.h,
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              ));
        },
        separatorBuilder: (c, i) {
          return const Divider(thickness: 1);
        },
      ),
    ),
  ):Expanded(
    child: Container(
      child: context.watch<Mainpage_Store>().isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          :ListView.separated(
        itemCount:
        context.watch<Mainpage_Store>().allSecondRankPlaces.length-1,
        itemBuilder: (c, i) {
          return GestureDetector(
              onTap: () {
                secseta(i);


              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: AutoSizeText('${i + 1}',
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    Expanded(
                      flex: 13,
                      child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              '${context.watch<Mainpage_Store>().allSecondRankPlaces[i][0].trim()}',
                              style:  TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: 'Pretendard'),
                            ),
                            AutoSizeText(
                              // softWrap: false,
                              // minFontSize: 20.sp,
                              '${context.watch<Mainpage_Store>().allSecondRankPlaces[i][1].trim()}',
                              style:  TextStyle(fontSize: 15.sp),
                            ),
                          ]),
                    ),
                    // SizedBox(
                    //   height: 50,
                    //   child: Padding(
                    //     padding:  EdgeInsets.fromLTRB(5.sp,0,0,0),
                    //     child: Row(children: [
                    //       AutoSizeText(
                    //         '${context.watch<Mainpage_Store>().firstWay[i].trim()} ',
                    //         textAlign: TextAlign.start,
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.w500,
                    //             fontSize: context
                    //                 .watch<Mainpage_Store>()
                    //                 .firstWay[i]
                    //                 .trim() ==
                    //                 '반자동'
                    //                 ? 14
                    //                 : 20,
                    //             fontFamily: 'Pretendard'),
                    //       ),
                    //       Image.asset(
                    //         'assets/mark.png',
                    //         width: 30.w,
                    //         height: 30.h,
                    //       )
                    //     ]),
                    //   ),
                    // )
                  ],
                ),
              ));
        },
        separatorBuilder: (c, i) {
          return const Divider(thickness: 1);
        },
      ),
    ),
  );
  }



bool _isProcessing = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: const Color(0xfff8f8f8),

            // backgroundColor:Colors.grey,
            elevation: 0,
          ),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffe5e5e5), width: 10),
                  color: const Color(0xfff8f8f8),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(
                children: [
                  // AutoSizeText('${getToday()}', ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: (context
                                        .watch<Mainpage_Store>()
                                        .placeLottoData['drwNoDate'] ==
                                    null
                                ? AutoSizeText(
                                    DateFormat('yyyy.MM.dd').format(DateTime.parse(context.watch<Mainpage_Store>().lottoData['drwNoDate'])),
                                    style:  TextStyle(
                                      color: Color(0xff767676),
                                      fontSize: 20.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : AutoSizeText(
                                    DateFormat('yyyy.MM.dd').format(DateTime.parse(context.watch<Mainpage_Store>().placeLottoData['drwNoDate'])),
                                    style:  TextStyle(
                                      color: Color(0xff767676),
                                      fontSize: 20.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))),
                        Container(
                          padding:  EdgeInsets.fromLTRB(0, 0, 0, 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             AnimatedButton(

                                child: AutoSizeText(
                                  textAlign: TextAlign.center,
                                  '←',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30.sp),
                                ),
                                color: Colors.red,
                               onPressed: ()  async {
                                 setBasicPosition();


                                 // 실행할 코드

                                 if (firstselected == true && secselected == false) {
                                   context.read<Mainpage_Store>().placeLottoRoundMinus();
                                   context.read<Mainpage_Store>().placeMinus();
                                 } else {
                                   if (_isProcessing) return; // 실행 중이면 return
                                   _isProcessing = true;
                                   context.read<Mainpage_Store>().placeLottoRoundMinus();
                                   context.read<Mainpage_Store>().secplaceMinus();

                                   await Future.delayed(Duration(milliseconds: 2000)); // 원하는 딜레이 시간 설정
                                   _isProcessing = false;


                                 }


                                 // 일정 시간 후 플래그 해제


                               },
                                width: 50.0.sp,
                                height: 50.0.sp,
                               enabled: true,
                             ),
                              // ElevatedButton(
                              //     onPressed: () {
                              //       context.read<Mainpage_Store>().placeMinus();
                              //       setBasicPosition();
                              //     },
                              //     style: TextButton.styleFrom(
                              //       padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0),
                              //       minimumSize: Size(50.0.w, 45.0.h),
                              //       backgroundColor: Colors.red,
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: const BorderRadius.all(Radius.circular(8)),
                              //       ),
                              //
                              //     ),
                              //     child:  AutoSizeAutoSizeText(
                              //       textAlign: TextAlign.center,
                              //       '←',
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //           fontFamily: 'Pretendard',
                              //           fontWeight: FontWeight.w900,
                              //           fontSize: 35.sp),
                              //     )),
                              (context
                                          .watch<Mainpage_Store>()
                                          .placeLottoData['drwNo'] ==
                                      null
                                  ? AutoSizeText(
                                      '${context.watch<Mainpage_Store>().lottoRound}회',
                                      style:  TextStyle(
                                        fontSize: 35.sp,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Pretendard',
                                        color: Color(0xffd43301),
                                      ))
                                  : AutoSizeText(
                                      '${context.watch<Mainpage_Store>().placeLottoData['drwNo']}회',
                                      style:  TextStyle(
                                        fontSize: 35.sp,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Pretendard',
                                        color: Color(0xffd43301),
                                      ))),

                              AnimatedButton(
                                child: AutoSizeText(
                                  textAlign: TextAlign.center,
                                  '→',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30.sp),
                                ),
                                color: Colors.blue,
                                onPressed:


                                (getToday() == null ||
                                    (getToday()! <= 0 &&
                                        getToday()! > -7))
                                    ? (){}
                                    : () async {
                                  setBasicPosition();





                               if(firstselected==true&&secselected==false){
                                 context.read<Mainpage_Store>().placeLottoRoundPlus();
                                  context.read<Mainpage_Store>().placePlus();}
                               else{
                                 if (_isProcessing) return; // 애니메이션이 실행 중이면 실행 방지
                                 _isProcessing = true;
                                 context.read<Mainpage_Store>().placeLottoRoundPlus();
    context.read<Mainpage_Store>().secplacePlus();

                                 await Future.delayed(Duration(milliseconds: 2000)); // 원하는 딜레이 시간 설정

                                 _isProcessing = false;
                               }





                                },
                                width: 50.0.sp,
                                height: 50.0.sp,
                                enabled: true,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: Stack(children: [
                // BaseMapPage(controller:_controller),
                 BaseMapPage(firstselected:firstselected,secselected:secselected),
                Positioned(
                    top: 200,
                    left: 10,
                    child: ElevatedButton(
                      onPressed: () {

                        setState(() {
                          firstselected=true;
                          secselected=false;
                        });
                        context.read<Mainpage_Store>().placeMinus();
                        setBasicPosition();
                      },
                      child: const AutoSizeText("1등",
                          style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
                              fontFamily:'Pretendard',fontSize: 20)),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        minimumSize: Size(20.0.w, 35.0.h),
                      ),
                    )),

                Positioned(
                    top: 250,
                    left: 10,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          firstselected=false;
                          secselected=true;
                        });
                        context.read<Mainpage_Store>().secplaceMinus();

                        setBasicPosition();
                      },
                      child: const AutoSizeText("2등",
                          style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
                              fontFamily:'Pretendard',fontSize: 20)),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        minimumSize: Size(20.0.w, 35.0.h),
                      ),
                    )),

                Positioned(
                    top: 250,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: () {
                        setBasicPosition();
                      },
                      child: const AutoSizeText("전체보기",
                          style: TextStyle(
                            color: Colors.white,fontWeight: FontWeight.bold,
                              fontFamily:'Pretendard',fontSize: 20)),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        minimumSize: Size(20.0.w, 35.0.h),
                      ),
                    ))
              ]),
            ),

        LottoPlaceList()

          ],
        ),
      bottomNavigationBar:  SafeArea(
        child: returnAd(), // 광고 배너만 SafeArea로 감싸서 네비게이션 바 위에 표시
      ),
    );
  }
}
