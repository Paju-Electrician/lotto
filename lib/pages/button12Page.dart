import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lotto/pages/lottoNumber.dart';
import 'package:lotto/pages/notification.dart';
import 'package:lotto/pages/sharedpreferences.dart';
import 'package:lotto/widget/mainWidgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'ad_number.dart';

class button12Page extends StatefulWidget {
  const button12Page({Key? key}) : super(key: key);

  @override
  State<button12Page> createState() => _button12PageState();
}

class _button12PageState extends State<button12Page> {



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
  final ItemScrollController _scrollController = ItemScrollController();
  var saveNumber1 = 0;
  var saveNumber2 = 0;
  var saveNumber3 = 0;
  var saveNumber4 = 0;
  var saveNumber5 = 0;
  var saveNumber6 = 0;

  getBall(b) {
    if (b == 0) {
      return TextBall(b: b);
    }
    if (b < 11) {
      return yellowBall(b: b);
    } else if (b < 21) {
      return blueBall(b: b);
    } else if (b < 31) {
      return redBall(b: b);
    } else if (b < 41) {
      return greyBall(b: b);
    } else {
      return greenBall(b: b);
    }
  }

  // var iconBool = false;
  button12IconSwitch() async {
    var bellBool = await getBell();

    print(bellBool);
    if (bellBool == true) {
      saveBell(false);
      await notifications.cancel(3);
      // setState(() {
      //   iconBool=false;
      // });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 320.w,
          content: Text(
            '토요일 저녁9시 당첨확인 알람이 꺼짐',
            style: TextStyle(fontSize: 18.sp),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
          backgroundColor: Colors.grey,
          duration: const Duration(milliseconds: 1000),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )));
    } else if (button12ResultNum.isNotEmpty) {
      print(button12ResultNum);
      saveBell(true);
      showNotification3(context);
      // setState(() {
      //   iconBool=true;
      // });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 320.w,
          content: Text(
            '토요일 저녁9시 당첨확인 알람이 켜짐',
            style: TextStyle(fontSize: 18.sp),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
          backgroundColor: Colors.grey,
          duration: const Duration(milliseconds: 1000),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 320.w,
          content: const Text(
            '저장된 번호가 없어요..',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
          backgroundColor: Colors.grey,
          duration: const Duration(milliseconds: 1000),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )));
    }
  }

  var bellBool;

  button12IconBoolSwitch() {
    setState(() {});
    return FutureBuilder<dynamic>(
        future: getBell(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bool? bellBool = snapshot.data; // null-aware 연산자 사용
          if (bellBool == true || button12ResultNum.isNotEmpty) {
            return const Icon(Icons.notifications_active);
          } else {
            return const Icon(Icons.notifications_off);
          }
        } else if (snapshot.hasError) {
          return CircularProgressIndicator();
        } else {
          return CircularProgressIndicator();
        }
      },

        );
  }

  List<String> button12ResultNum = [];

  List<List<int>> matchNumList = [];

  button12MatchNum() {
    var drwtNo1 = lottoTotalNumber[0][1] ?? 46;
    var drwtNo2 = lottoTotalNumber[0][2] ?? 46;
    var drwtNo3 = lottoTotalNumber[0][3] ?? 46;
    var drwtNo4 = lottoTotalNumber[0][4] ?? 46;
    var drwtNo5 = lottoTotalNumber[0][5] ?? 46;
    var drwtNo6 = lottoTotalNumber[0][6] ?? 46;

    var bnusNo = lottoTotalNumber[0][7] ?? 46;
    var lottoDataNumber = [
      drwtNo1,
      drwtNo2,
      drwtNo3,
      drwtNo4,
      drwtNo5,
      drwtNo6
    ];

    int match = 0;
    // matchNum = [];
    //

    for (var myNum in button12ResultNum) {
      var lottoList = myNum.split(',');

      lottoList[0] = lottoList[0].replaceAll('[', '');
      lottoList[5] = lottoList[5].replaceAll(']', '');

      var intLottoList = [
        int.parse(lottoList[0]),
        int.parse(lottoList[1]),
        int.parse(lottoList[2]),
        int.parse(lottoList[3]),
        int.parse(lottoList[4]),
        int.parse(lottoList[5])
      ];
      intLottoList.sort();
      print(intLottoList);

      List<int> matchList = [];

      for (var num in intLottoList) {
        match = 0;

        for (int lotto in lottoDataNumber) {
          if (lotto == num) {
            match++;
            matchList.add(num);
          }
        }

        // matchList.add(match);
      }

      matchNumList.add(matchList);
    }
    // myClickNumber.remove(matchNum);

    print(matchNumList);

    //
    // if (match == 6) {
    //   return Column(
    //     children: [
    //       Text('축하합니다!!!', style: TextStyle(fontSize: 20.sp)),
    //       Text('1등, 당첨번호6개 일치', style: TextStyle(fontSize: 20.sp)),
    //       Text('당첨번호 ${matchNum}', style: TextStyle(fontSize: 20.sp)),
    //     ],
    //   );
    // } else if (match == 5 && myClickNumber.contains(bnusNo)) {
    //   matchNum = myClickNumber;
    //
    //   return Column(
    //     children: [
    //       Text('축하합니다!!', style: TextStyle(fontSize: 20.sp)),
    //       Text('2등, 당첨번호5개 일치', style: TextStyle(fontSize: 20.sp)),
    //       Text('당첨번호 ${matchNum}', style: TextStyle(fontSize: 20.sp)),
    //     ],
    //   );
    // } else if (match == 5) {
    //   return Column(
    //     children: [
    //       Text('축하합니다!!', style: TextStyle(fontSize: 20.sp)),
    //       Text(
    //         '3등, 당첨번호 5개 일치',
    //         style: TextStyle(fontSize: 20.sp),
    //       ),
    //       Text(
    //         '당첨번호 ${matchNum}',
    //         style: TextStyle(fontSize: 20.sp),
    //       ),
    //     ],
    //   );
    // } else if (match == 4) {
    //   return Column(
    //     children: [
    //       Text('축하합니다!!', style: TextStyle(fontSize: 20.sp)),
    //       Text('4등, 당첨번호 4개 일치', style: TextStyle(fontSize: 20.sp)),
    //       Text('당첨번호 ${matchNum}, 50,000원', style: TextStyle(fontSize: 20.sp)),
    //     ],
    //   );
    // } else if (match == 3) {
    //   return Column(
    //     children: [
    //       Text('축하합니다!!', style: TextStyle(fontSize: 20.sp)),
    //       Text('5등, 당첨번호 3개 일치', style: TextStyle(fontSize: 20.sp)),
    //       Text('당첨번호 ${matchNum}, 5,000원', style: TextStyle(fontSize: 20.sp)),
    //     ],
    //   );
    // } else {
    //   if (matchNum.length == 0) {
    //     return Column(
    //       children: [
    //         Text('아쉽네요.. $match개의 당첨번호', style: TextStyle(fontSize: 20.sp)),
    //         Text('당첨번호가 없어요ㅠㅠ', style: TextStyle(fontSize: 20.sp)),
    //       ],
    //     );
    //   } else {
    //     return Column(
    //       children: [
    //         Text('아쉽네요.. $match개의 당첨번호', style: TextStyle(fontSize: 20.sp)),
    //         Text('당첨번호 ${matchNum}가 있습니다!', style: TextStyle(fontSize: 20.sp)),
    //       ],
    //     );
    //   }
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: const Color(0xfff8f8f8),
          // backgroundColor:Colors.grey,
          elevation: 0,
          // title: Text('로또당첨자가 만든 로또앱'),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                    alignment: Alignment.centerRight,
                    // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: IconButton(
                      iconSize: 25,
                      onPressed: () {
                        button12IconSwitch();

                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //     width: 320.w,
                        //     content: Text(
                        //       '준비중입니다.',
                        //       style: TextStyle(fontSize: 20),
                        //       textAlign: TextAlign.center,
                        //     ),
                        //     padding:
                        //     EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                        //     backgroundColor: Colors.grey,
                        //     duration: Duration(milliseconds: 1000),
                        //     behavior: SnackBarBehavior.floating,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(20),
                        //     )));
                        setState(() {});
                      },
                      icon: button12IconBoolSwitch(),
                      padding: const EdgeInsets.all(0),
                      color: const Color(0xffffcc00),
                      constraints: const BoxConstraints(),
                    )),

                Text('내가 저장한 번호',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Pretendard',
                        fontSize: 30.sp)),
                TextButton(
                    style: TextButton.styleFrom(
                      // padding: EdgeInsets.zero,
                      // backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      minimumSize: Size(20.0.w, 35.0.h),
                    ),
                    onPressed: () {
                      notifications.cancel(3);
                      testclear();
                      setState(() {});
                    },
                    child: const Text(
                      '전체삭제',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w900),
                    )),

                // IconButton(onPressed: null, icon: Icon(null))
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.h),
            child: Text('로또알람을 켜두시면, 토요일 저녁 9시에 당첨결과를 알려드립니다.',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Pretendard',
                    fontSize: 14.sp)),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const IconButton(onPressed: null, icon: Icon(null)),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(10.h, 0, 10.h, 3.h),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    minimumSize: Size(20.0.w, 35.0.h),
                    // maximumSize: Size(400.0.w, 35.0.h)
                  ),
                  child: Text(
                    '당첨결과확인',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.w),
                  ),
                  onPressed: () {
                    if (button12ResultNum.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          width: 320.w,
                          content: const Text(
                            '저장된 번호가 없어요..',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                          backgroundColor: Colors.grey,
                          duration: const Duration(milliseconds: 1000),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )));
                    } else {
                      button12MatchNum();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              insetPadding:
                                  const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              contentPadding: EdgeInsets.fromLTRB(
                                  10.0.w, 10.0.h, 10.0.w, 0),
                              // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              //Dialog Main Title
                              title: Column(
                                children: <Widget>[
                                  Text(
                                    "${lottoTotalNumber[0][0]}회 당첨결과확인",
                                    style: TextStyle(
                                        fontSize: 30.sp, fontFamily: 'Pretendard'),
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            5.w, 0, 5.w, 10.h),
                                        padding: EdgeInsets.fromLTRB(
                                            5.w, 5.h, 5.w, 5.h),
                                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                        decoration: const BoxDecoration(
                                          color: Color(0xffe5e5e5),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            getBall(lottoTotalNumber[0][1]),
                                            getBall(lottoTotalNumber[0][2]),
                                            getBall(lottoTotalNumber[0][3]),
                                            getBall(lottoTotalNumber[0][4]),
                                            getBall(lottoTotalNumber[0][5]),
                                            getBall(lottoTotalNumber[0][6]),
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                                  const Icon(Icons.arrow_downward)
                                ],
                              ),
                              //
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                        width: 300.w,
                                        height: 500.h,
                                        child: button12ResultNumBall(
                                            resultNum: matchNumList))
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                Center(
                                  child: TextButton(
                                    child: Text(
                                      "확인",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 25.sp),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            );
                          });
                    }
                  },
                ),
                IconButton(
                    onPressed: () {
                      if (button12ResultNum.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            width: 320.w,
                            content: const Text(
                              '복사할 번호가 없어요..',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            padding:
                                EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                            backgroundColor: Colors.grey,
                            duration: const Duration(milliseconds: 1000),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )));
                      } else {
                        Clipboard.setData(
                            ClipboardData(text: button12ResultNum.toString()));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            width: 320.w,
                            content: const Text(
                              '번호가 복사되었습니다',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            padding:
                                EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                            backgroundColor: Colors.grey,
                            duration: const Duration(milliseconds: 1000),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )));
                      }
                    },
                    icon: const Icon(Icons.content_copy)),
              ],
            ),
          ),
          // ,style: TextStyle(color: Color(0xff767676),fontSize: 20,fontWeight: FontWeight.bold),)),

          Expanded(
            // child: ListView.builder(itemCount:context.watch<Store1>().lottoData['drwNo'], itemBuilder: (c,i){
            child: FutureBuilder<dynamic>(
                future: getLottoNumberList(),
    builder: (context, snapshot) {
    if (snapshot.hasData && snapshot.data != null) { // null 확인 추가
    List<String> tempLottoList = snapshot.data!; // null-aware 연산자 사용
    button12ResultNum = tempLottoList; //
                  // print(tempLottoList[0]);
                  // print(tempLottoList[0].split(','));

                  return ScrollablePositionedList.builder(
                      // itemCount: context.watch<Store1>().totalLottoData.length,
                      itemCount:
                          tempLottoList == null ? 0 : tempLottoList.length,
                      itemScrollController: _scrollController,
                      itemBuilder: (c, i) {
                        var lottoList = tempLottoList[i].toString().split(',');

                        lottoList[0] = lottoList[0].replaceAll('[', '');
                        lottoList[5] = lottoList[5].replaceAll(']', '');

                        var intLottoList = [
                          int.parse(lottoList[0]),
                          int.parse(lottoList[1]),
                          int.parse(lottoList[2]),
                          int.parse(lottoList[3]),
                          int.parse(lottoList[4]),
                          int.parse(lottoList[5])
                        ];
                        intLottoList.sort();

                        //
                        //
                        // print(lottoList);
                        // print(_selectedValueinit-context.read<firstLotto>().firstLottoNumNaver[11]);
                        //
                        // if(((i+_selectedValueinit-context.read<firstLotto>().firstLottoNumNaver[11])%_selectedValue==0)&&(i>context.read<firstLotto>().firstLottoNumNaver[11]-_selectedValueinit)) {

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 10.h),
                                padding:
                                    EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                                // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                decoration: const BoxDecoration(
                                  color: Color(0xffe5e5e5),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    getBall(intLottoList[0]),
                                    getBall(intLottoList[1]),
                                    getBall(intLottoList[2]),
                                    getBall(intLottoList[3]),
                                    getBall(intLottoList[4]),
                                    getBall(intLottoList[5]),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    // padding: EdgeInsets.zero,
                                    // backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                    ),
                                    minimumSize: Size(20.0.w, 35.0.h),
                                  ),
                                  onPressed: () {
                                    deleteLottoNumberList(i);
                                    setState(() {});
                                  },
                                  child: const Text(
                                    '삭제',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w900),
                                  )),
                            ),
                          ],
                        );
                      });}
    else if (snapshot.hasError) {
      return CircularProgressIndicator();
    } else {
      return CircularProgressIndicator();
    }



                }),
          ),
        ],
      ),
      bottomNavigationBar: returnAd(),
    );
  }
}

class button12ResultNumBall extends StatefulWidget {
  button12ResultNumBall({Key? key, required this.resultNum}) : super(key: key);
  var resultNum;

  @override
  _button12ResultNumBallState createState() => _button12ResultNumBallState();
}

class _button12ResultNumBallState extends State<button12ResultNumBall> {
  getBall(b, i) {
    if (widget.resultNum[i].contains(b)) {
      if (b < 11) {
        return yellowBall(b: b);
      } else if (b < 21) {
        return blueBall(b: b);
      } else if (b < 31) {
        return redBall(b: b);
      } else if (b < 41) {
        return greyBall(b: b);
      } else {
        return greenBall(b: b);
      }
    } else {
      return blackBall(b: b);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getLottoNumberList(),
        builder: (context, snapi) {
    if (snapi.hasData && snapi.data != null) {
      List tempLottoList = snapi.data;
      // print(tempLottoList);
      // print(tempLottoList[0].split(','));
      ItemScrollController scrollController = ItemScrollController();

      return ScrollablePositionedList.builder(
        // itemCount: context.watch<Store1>().totalLottoData.length,
          itemCount: tempLottoList == null ? 0 : tempLottoList.length,
          itemScrollController: scrollController,
          itemBuilder: (c, i) {
            var lottoList = tempLottoList[i].toString().split(',');

            lottoList[0] = lottoList[0].replaceAll('[', '');
            lottoList[5] = lottoList[5].replaceAll(']', '');

            var intLottoList = [
              int.parse(lottoList[0]),
              int.parse(lottoList[1]),
              int.parse(lottoList[2]),
              int.parse(lottoList[3]),
              int.parse(lottoList[4]),
              int.parse(lottoList[5])
            ];
            intLottoList.sort();

            //
            //
            // print(lottoList);
            // print(_selectedValueinit-context.read<firstLotto>().firstLottoNumNaver[11]);
            //
            // if(((i+_selectedValueinit-context.read<firstLotto>().firstLottoNumNaver[11])%_selectedValue==0)&&(i>context.read<firstLotto>().firstLottoNumNaver[11]-_selectedValueinit)) {

            return Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 10.h),
                    padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                    // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    decoration: const BoxDecoration(
                      color: Color(0xffe5e5e5),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getBall(intLottoList[0], i),
                        getBall(intLottoList[1], i),
                        getBall(intLottoList[2], i),
                        getBall(intLottoList[3], i),
                        getBall(intLottoList[4], i),
                        getBall(intLottoList[5], i),
                      ],
                    ),
                  ),
                ),
              ],
            );
          });}
    else if (snapi.hasError) {
      return CircularProgressIndicator();
    } else {
      return CircularProgressIndicator();
    }
        }

        );
  }





}
