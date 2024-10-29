
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lotto/pages/notification.dart';
import 'package:lotto/pages/sharedpreferences.dart';
import 'package:lotto/provider/allpages_Provider.dart';
import 'package:lotto/provider/naverSearch_Provider.dart';
import 'package:lotto/widget/mainWidgets.dart';
import 'package:provider/provider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'dart:math';

import 'package:lotto/pages/lottoNumber.dart';

import 'ad_number.dart';

class button9Page extends StatefulWidget {
  const button9Page({Key? key}) : super(key: key);

  @override
  State<button9Page> createState() => _button9PageState();
}

class _button9PageState extends State<button9Page> {



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


  var number5 = [0, 0, 0, 0, 0, 0];
  var number1 = [0, 0, 0, 0, 0, 0];
  var number2 = [0, 0, 0, 0, 0, 0];
  var number3 = [0, 0, 0, 0, 0, 0];
  var number4 = [0, 0, 0, 0, 0, 0];

  var predictNumber1 = [];
  var realPredictNumber1 = [0, 0, 0, 0, 0, 0];
  var predictNumber2 = [];
  var realPredictNumber2 = [0, 0, 0, 0, 0, 0];
  var predictNumber3 = [];
  var realPredictNumber3 = [0, 0, 0, 0, 0, 0];
  var predictNumber4 = [];
  var realPredictNumber4 = [0, 0, 0, 0, 0, 0];
  var predictNumber5 = [];
  var realPredictNumber5 = [0, 0, 0, 0, 0, 0];
  int aa = 0;
  int a =0;
  int b = 0;
  int c = 0;
  int d = 0;
  int e = 0;
  int f = 0;
  int g = 0;
  var random = Random();

  makePredict1Number() {


    predictNumber1.clear();

    var tempEarlyNumList = [...lottoTotalNumber[0]];
    var tempEarlyNumList1 = [...lottoTotalNumber[1]];
    print(tempEarlyNumList);

    var toRemove = [];
    for (var e1 in tempEarlyNumList) {

      for (var e2 in tempEarlyNumList1) {

        if(e1== e2) {

          toRemove.add(e1);
        }
      }
    }
    tempEarlyNumList.removeWhere( (e) => toRemove.contains(e));
    print(tempEarlyNumList);
    if(tempEarlyNumList.length==9) {
      aa = (tempEarlyNumList[1]);

    }else if(tempEarlyNumList.length==8){
    aa = (tempEarlyNumList[1]);

    }else if(tempEarlyNumList.length==7){
      aa = (tempEarlyNumList[1]);

    }else{
      aa = (tempEarlyNumList[1]);
    }


    // print(tempEarlyNumList.length);
    print('aa는$aa');
    while (predictNumber1.length != 6) {
      b = random.nextInt(45) + 1;
      c = random.nextInt(45) + 1;
      d = random.nextInt(45) + 1;
      e = random.nextInt(45) + 1;
      f = random.nextInt(45) + 1;
      print('b는$b');
      print('c는$c');
      print('d는$d');
      print('e는$e');
      print('f는$f');

      if (aa!= b &&
          aa != c &&
          aa != d &&
          aa != e &&
          aa != f &&
          b != c &&
          b != d &&
          b != e &&
          b != f &&
          c != d &&
          c != e &&
          c != f &&
          d != e &&
          d != f &&
          e != f) {
        var tempList = [aa, b, c, d, e, f];
        tempList.sort();
        a = tempList[0];
        b = tempList[1];
        c = tempList[2];
        d = tempList[3];
        e = tempList[4];
        f = tempList[5];
        print('abcde=$a,$b,$c,$d,$e,$f');
        if (a + b + c + d + e + f >= 181 && a + b + c + d + e + f <= 200) {
          print('실행됨1');
          if ((a + b + c >= 12 && a + b + c <= 67) &&
              (d + e + f >= 72 && d + e + f <= 125)) {
            print('실행됨2');
            if ((a ~/ 10 + b ~/ 10 + c ~/ 10 + d ~/ 10 + e ~/ 10 + f ~/ 10) >=
                    6 &&
                (a ~/ 10 + b ~/ 10 + c ~/ 10 + d ~/ 10 + e ~/ 10 + f ~/ 10) <=
                    17) {
              print('실행됨3');
              if (a % 10 + b % 10 + c % 10 + d % 10 + e % 10 + f % 10 >= 14 &&
                  a % 10 + b % 10 + c % 10 + d % 10 + e % 10 + f % 10 <= 38) {
                print('실행됨4');
                var odd = 0;
                var hall = 0;

                if (a % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (b % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (c % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (d % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (e % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (f % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }

                if ((odd == 3 && hall == 3) ||
                    (odd == 4 && hall == 2) ||
                    (odd == 2 && hall == 4)) {
                  setState(() {
                    predictNumber1 = [a, b, c, d, e, f];
                    realPredictNumber1 = [a, b, c, d, e, f];
                  });

                  print(predictNumber1);
                  print('aaaaaaaaaaaaaaaa');
                }
              }
            }
          }
        }
      }
        }

    return realPredictNumber1;
  }
  makePredict2Number() {
    predictNumber2.clear();
    var tempEarlyNumList = [...lottoTotalNumber[0]];
    var tempEarlyNumList1 = [...lottoTotalNumber[1]];
    print(tempEarlyNumList);
    var toRemove = [];
    for (var e1 in tempEarlyNumList) {

      for (var e2 in tempEarlyNumList1) {

        if(e1== e2) {

          toRemove.add(e1);
        }
      }
    }
    tempEarlyNumList.removeWhere( (e) => toRemove.contains(e));
    print(tempEarlyNumList);
    if(tempEarlyNumList.length==9) {
      aa = (tempEarlyNumList[2]);

    }else if(tempEarlyNumList.length==8){
      aa = (tempEarlyNumList[2]);

    }else if(tempEarlyNumList.length==7){
      aa = (tempEarlyNumList[2]);

    }else{
      aa = (tempEarlyNumList[2]);
    }
    print('aa는$aa');
    while (predictNumber2.length != 6) {
      b = random.nextInt(45) + 1;
      c = random.nextInt(45) + 1;
      d = random.nextInt(45) + 1;
      e = random.nextInt(45) + 1;
      f = random.nextInt(45) + 1;
      print('b는$b');
      print('c는$c');
      print('d는$d');
      print('e는$e');
      print('f는$f');

      if (aa != b &&
          aa != c &&
          aa != d &&
          aa != e &&
          aa != f &&
          b != c &&
          b != d &&
          b != e &&
          b != f &&
          c != d &&
          c != e &&
          c != f &&
          d != e &&
          d != f &&
          e != f) {
        var tempList = [aa, b, c, d, e, f];
        tempList.sort();
        a = tempList[0];
        b = tempList[1];
        c = tempList[2];
        d = tempList[3];
        e = tempList[4];
        f = tempList[5];
        print('abcde=$a,$b,$c,$d,$e,$f');
        if (a + b + c + d + e + f >= 181 && a + b + c + d + e + f <= 200) {
          print('실행됨1');
          if ((a + b + c >= 12 && a + b + c <= 67) &&
              (d + e + f >= 72 && d + e + f <= 125)) {
            print('실행됨2');
            if ((a ~/ 10 + b ~/ 10 + c ~/ 10 + d ~/ 10 + e ~/ 10 + f ~/ 10) >=
                6 &&
                (a ~/ 10 + b ~/ 10 + c ~/ 10 + d ~/ 10 + e ~/ 10 + f ~/ 10) <=
                    17) {
              print('실행됨3');
              if (a % 10 + b % 10 + c % 10 + d % 10 + e % 10 + f % 10 >= 14 &&
                  a % 10 + b % 10 + c % 10 + d % 10 + e % 10 + f % 10 <= 38) {
                print('실행됨4');
                var odd = 0;
                var hall = 0;

                if (a % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (b % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (c % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (d % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (e % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (f % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }

                if ((odd == 3 && hall == 3) ||
                    (odd == 4 && hall == 2) ||
                    (odd == 2 && hall == 4)) {
                  setState(() {
                    predictNumber2 = [a, b, c, d, e, f];
                    realPredictNumber2 = [a, b, c, d, e, f];
                  });

                  print(predictNumber2);
                }
              }
            }
          }
        }
      }
        }
    return realPredictNumber2;
  }
  makePredict3Number() {
    predictNumber3.clear();

    var tempEarlyNumList = [...lottoTotalNumber[0]];
    var tempEarlyNumList1 = [...lottoTotalNumber[1]];
    print(tempEarlyNumList);
    var toRemove = [];
    for (var e1 in tempEarlyNumList) {

      for (var e2 in tempEarlyNumList1) {

        if(e1== e2) {

          toRemove.add(e1);
        }
      }
    }
    tempEarlyNumList.removeWhere( (e) => toRemove.contains(e));
    print(tempEarlyNumList);
    if(tempEarlyNumList.length==9) {
      aa = (tempEarlyNumList[3]);

    }else if(tempEarlyNumList.length==8){
      aa = (tempEarlyNumList[3]);

    }else if(tempEarlyNumList.length==7){
      aa = (tempEarlyNumList[3]);

    }else{
      aa = (tempEarlyNumList[3]);
    }
    print('aa는$aa');
    while (predictNumber3.length != 6) {
      b = random.nextInt(45) + 1;
      c = random.nextInt(45) + 1;
      d = random.nextInt(45) + 1;
      e = random.nextInt(45) + 1;
      f = random.nextInt(45) + 1;
      print('b는$b');
      print('c는$c');
      print('d는$d');
      print('e는$e');
      print('f는$f');

      if (aa != b &&
          aa != c &&
          aa != d &&
          aa != e &&
          aa != f &&
          b != c &&
          b != d &&
          b != e &&
          b != f &&
          c != d &&
          c != e &&
          c != f &&
          d != e &&
          d != f &&
          e != f) {
        var tempList = [aa, b, c, d, e, f];
        tempList.sort();
        a = tempList[0];
        b = tempList[1];
        c = tempList[2];
        d = tempList[3];
        e = tempList[4];
        f = tempList[5];
        print('abcde=$a,$b,$c,$d,$e,$f');
        if (a + b + c + d + e + f >= 181 && a + b + c + d + e + f <= 200) {
          print('실행됨1');
          if ((a + b + c >= 12 && a + b + c <= 67) &&
              (d + e + f >= 72 && d + e + f <= 125)) {
            print('실행됨2');
            if ((a ~/ 10 + b ~/ 10 + c ~/ 10 + d ~/ 10 + e ~/ 10 + f ~/ 10) >=
                6 &&
                (a ~/ 10 + b ~/ 10 + c ~/ 10 + d ~/ 10 + e ~/ 10 + f ~/ 10) <=
                    17) {
              print('실행됨3');
              if (a % 10 + b % 10 + c % 10 + d % 10 + e % 10 + f % 10 >= 14 &&
                  a % 10 + b % 10 + c % 10 + d % 10 + e % 10 + f % 10 <= 38) {
                print('실행됨4');
                var odd = 0;
                var hall = 0;

                if (a % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (b % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (c % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (d % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (e % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (f % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }

                if ((odd == 3 && hall == 3) ||
                    (odd == 4 && hall == 2) ||
                    (odd == 2 && hall == 4)) {
                  setState(() {
                    predictNumber3 = [a, b, c, d, e, f];
                    realPredictNumber3 = [a, b, c, d, e, f];
                  });

                  print(predictNumber3);
                }
              }
            }
          }
        }
      }
        }
    return realPredictNumber3;
  }
  makePredict4Number() {
    predictNumber4.clear();
    var tempEarlyNumList = [...lottoTotalNumber[0]];
    var tempEarlyNumList1 = [...lottoTotalNumber[1]];
    print(tempEarlyNumList);
    var toRemove = [];
    for (var e1 in tempEarlyNumList) {

      for (var e2 in tempEarlyNumList1) {

        if(e1== e2) {

          toRemove.add(e1);
        }
      }
    }
    tempEarlyNumList.removeWhere( (e) => toRemove.contains(e));

    print(tempEarlyNumList);
    if(tempEarlyNumList.length==9) {
      aa = (tempEarlyNumList[4]);

    }else if(tempEarlyNumList.length==8){
      aa = (tempEarlyNumList[4]);

    }else if(tempEarlyNumList.length==7){
      aa = (tempEarlyNumList[4]);

    }else{
      aa = (tempEarlyNumList[4]);
    }
    print('aa는$aa');
    while (predictNumber4.length != 6) {
      b = random.nextInt(45) + 1;
      c = random.nextInt(45) + 1;
      d = random.nextInt(45) + 1;
      e = random.nextInt(45) + 1;
      f = random.nextInt(45) + 1;
      print('b는$b');
      print('c는$c');
      print('d는$d');
      print('e는$e');
      print('f는$f');

      if (aa != b &&
          aa != c &&
          aa != d &&
          aa != e &&
          aa != f &&
          b != c &&
          b != d &&
          b != e &&
          b != f &&
          c != d &&
          c != e &&
          c != f &&
          d != e &&
          d != f &&
          e != f) {
        var tempList = [aa, b, c, d, e, f];
        tempList.sort();
        a = tempList[0];
        b = tempList[1];
        c = tempList[2];
        d = tempList[3];
        e = tempList[4];
        f = tempList[5];
        print('abcde=$a,$b,$c,$d,$e,$f');
        if (a + b + c + d + e + f >= 181 && a + b + c + d + e + f <= 200) {
          print('실행됨1');
          if ((a + b + c >= 12 && a + b + c <= 67) &&
              (d + e + f >= 72 && d + e + f <= 125)) {
            print('실행됨2');
            if ((a ~/ 10 + b ~/ 10 + c ~/ 10 + d ~/ 10 + e ~/ 10 + f ~/ 10) >=
                6 &&
                (a ~/ 10 + b ~/ 10 + c ~/ 10 + d ~/ 10 + e ~/ 10 + f ~/ 10) <=
                    17) {
              print('실행됨3');
              if (a % 10 + b % 10 + c % 10 + d % 10 + e % 10 + f % 10 >= 14 &&
                  a % 10 + b % 10 + c % 10 + d % 10 + e % 10 + f % 10 <= 38) {
                print('실행됨4');
                var odd = 0;
                var hall = 0;

                if (a % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (b % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (c % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (d % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (e % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (f % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }

                if ((odd == 3 && hall == 3) ||
                    (odd == 4 && hall == 2) ||
                    (odd == 2 && hall == 4)) {
                  setState(() {
                    predictNumber4 = [a, b, c, d, e, f];
                    realPredictNumber4 = [a, b, c, d, e, f];
                  });

                  print(predictNumber4);
                }
              }
            }
          }
        }
      }
        }
    return realPredictNumber4;
  }
  makePredict5Number() {
    print('11111111111111111111');
    predictNumber5.clear();
    var tempEarlyNumList = [...lottoTotalNumber[0]];
    var tempEarlyNumList1 = [...lottoTotalNumber[1]];
    print(tempEarlyNumList);
    var toRemove = [];
    for (var e1 in tempEarlyNumList) {
      print('22222222222222222222222222');
      for (var e2 in tempEarlyNumList1) {
        print('333333333333333333333');
      if(e1== e2) {
        print('4444444444444444444444');
        toRemove.add(e1);
      }
    }
    }
    tempEarlyNumList.removeWhere( (e) => toRemove.contains(e));





    //
    //
    //
    // for(int tempnum1 in tempEarlyNumList) {
    //   print('2');
    //   for (int tempnum2 in tempEarlyNumList1){
    //     print('3');
    //     if(tempnum1==tempnum2){
    //       print('4');
    //       tempEarlyNumList.remove(tempnum1);
    //       return;
    //     }
    //   }
    // }
    print('5');
    print(tempEarlyNumList);
    if(tempEarlyNumList.length==9) {
      aa = (tempEarlyNumList[5]);

    }else if(tempEarlyNumList.length==8){
      aa = (tempEarlyNumList[5]);

    }else if(tempEarlyNumList.length==7){
      aa = (tempEarlyNumList[5]);

    }else{
      aa = (tempEarlyNumList[5] ?? tempEarlyNumList[4]);
    }
    print('aa는$aa');
    while (predictNumber5.length != 6) {
      b = random.nextInt(45) + 1;
      c = random.nextInt(45) + 1;
      d = random.nextInt(45) + 1;
      e = random.nextInt(45) + 1;
      f = random.nextInt(45) + 1;
      print('b는$b');
      print('c는$c');
      print('d는$d');
      print('e는$e');
      print('f는$f');

      if (aa != b &&
          aa != c &&
          aa != d &&
          aa != e &&
          aa != f &&
          b != c &&
          b != d &&
          b != e &&
          b != f &&
          c != d &&
          c != e &&
          c != f &&
          d != e &&
          d != f &&
          e != f) {
        var tempList = [aa, b, c, d, e, f];
        tempList.sort();
        a = tempList[0];
        b = tempList[1];
        c = tempList[2];
        d = tempList[3];
        e = tempList[4];
        f = tempList[5];
        print('abcde=$a,$b,$c,$d,$e,$f');
        if (a + b + c + d + e + f >= 181 && a + b + c + d + e + f <= 200) {
          print('실행됨1');
          if ((a + b + c >= 12 && a + b + c <= 67) &&
              (d + e + f >= 72 && d + e + f <= 125)) {
            print('실행됨2');
            if ((a ~/ 10 + b ~/ 10 + c ~/ 10 + d ~/ 10 + e ~/ 10 + f ~/ 10) >=
                6 &&
                (a ~/ 10 + b ~/ 10 + c ~/ 10 + d ~/ 10 + e ~/ 10 + f ~/ 10) <=
                    17) {
              print('실행됨3');
              if (a % 10 + b % 10 + c % 10 + d % 10 + e % 10 + f % 10 >= 14 &&
                  a % 10 + b % 10 + c % 10 + d % 10 + e % 10 + f % 10 <= 38) {
                print('실행됨4');
                var odd = 0;
                var hall = 0;

                if (a % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (b % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (c % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (d % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (e % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }
                if (f % 2 == 0) {
                  odd++;
                } else {
                  hall++;
                }

                if ((odd == 3 && hall == 3) ||
                    (odd == 4 && hall == 2) ||
                    (odd == 2 && hall == 4)) {
                  setState(() {
                    predictNumber5 = [a, b, c, d, e, f];
                    realPredictNumber5 = [a, b, c, d, e, f];
                  });

                  print(predictNumber5);
                }
              }
            }
          }
        }
      }
        }
    return realPredictNumber5;
  }

  onPressBuy() {
    //
    // for(int i=1; i<3000;i=i+100) {
    //
    //   Timer(Duration(milliseconds: i), () {
    //     if (!mounted) return;

    setState(() {
      number1 = makePredict1Number() ?? number1;
      number2 = makePredict2Number() ?? number2;
      number3 = makePredict3Number() ?? number3;
      number4 = makePredict4Number() ?? number4;
      number5 = makePredict5Number() ?? number5;
    });

    //   });
    // }
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
      body: Container(
        padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0.h),
        child: Column(children: [
         newRandomNumBall(number1:number1,number2:number2,number3: number3,number4: number4,number5: number5, onPressBuy: onPressBuy),
          Expanded(
              child: randomNumBallList(
                  number1: number1,
                  number2: number2,
                  number3: number3,
                  number4: number4,
                  number5: number5),),
        ]),
      ),
      bottomNavigationBar:  SafeArea(
        child: returnAd(), // 광고 배너만 SafeArea로 감싸서 네비게이션 바 위에 표시
      ),
    );
  }
}

class newRandomNumBall extends StatefulWidget {
  newRandomNumBall({Key? key, this.number5, this.number1,this.number2,this.number3,this.number4, this.onPressBuy}) : super(key: key);
  var number5;
  var onPressBuy;
  var number1;
  var number2;
  var number3;
  var number4;

  @override
  _newRandomNumBallState createState() => _newRandomNumBallState();
}

class _newRandomNumBallState extends State<newRandomNumBall> {
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

  //List.generate 전체를 괄호로 묶은 후에 sublit를 불러왔다
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        // height: 220.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 10.w),
            color: const Color(0xfff8f8f8),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        padding: EdgeInsets.fromLTRB(5.w, 10.w, 5.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  AutoSizeText(maxLines:1,softWrap: true,'로또당첨자에서 강력추천하는 번호',style: TextStyle(fontWeight: FontWeight.w100,fontSize: 25.sp,fontFamily: 'Pretendard'),),
                  AutoSizeText(maxLines:1,softWrap: true,'로또당첨자에서 만든 공식으로 추출하오니,',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16.sp),),
                  AutoSizeText(maxLines:1,softWrap: true,'약간의 시간이 걸리는점 양해부탁드립니다.',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16.sp),),
                  AutoSizeText(maxLines:1,softWrap: true,'당첨이 되시면 후기게시판 작성 부탁드립니다!!',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16.sp),)
                ],
              ),
            ),
            // Container(
            //     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            //     child: (context.watch<Mainpage_Store>().lottoData['drwNoDate'] == null
            //         ? (context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum.isEmpty
            //             ? CircularProgressIndicator()
            //             : Text(
            //                 '${DateFormat('yyyy.MM.dd').format(DateTime.parse(context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[10].replaceAll('.', '-')).add(Duration(days: 7)))}',
            //                 style: TextStyle(
            //                     color: Color(0xff767676),
            //                     fontSize: 20.sp,
            //                     fontWeight: FontWeight.bold),
            //               ))
            //         : Text(
            //             '${DateFormat('yyyy.MM.dd').format(DateTime.parse(context.watch<Mainpage_Store>().button5RoundInfo['drwNoDate']).add(Duration(days: 7)))}',
            //             style: TextStyle(
            //                 color: Color(0xff767676),
            //                 fontSize: 20.sp,
            //                 fontWeight: FontWeight.bold),
            //           ))),
            // ,style: TextStyle(color: Color(0xff767676),fontSize: 20,fontWeight: FontWeight.bold),)),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
              // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (context.watch<Mainpage_Store>().button5RoundInfo['drwNo'] == null
                      ? (context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum.isEmpty
                          ? const CircularProgressIndicator()
                          : AutoSizeText(
                              '${context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] + 1}회 예상번호',
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Pretendard',
                                color: const Color(0xffd43301),
                              )))
                      : AutoSizeText(
                          '${context.watch<Mainpage_Store>().button5RoundInfo['drwNo'] + 1}회 예상번호',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w900,
                            color: const Color(0xffd43301),
                          )))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10.h, 0, 5.h),
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
                  getBall(widget.number5[0]),
                  getBall(widget.number5[1]),
                  getBall(widget.number5[2]),
                  getBall(widget.number5[3]),
                  getBall(widget.number5[4]),
                  getBall(widget.number5[5]),
                ],
              ),
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      widget.onPressBuy();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        minimumSize: Size(20.0.w, 35.0.h),
                        padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 3.h)),
                    child: AutoSizeText('당첨번호구매하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showNotification3(context);
                      if (widget.number1[0] !=0) {
                        print('실행됨1');
                        var stringNumber1 = [widget.number1[0].toString(),widget.number1[1].toString(),widget.number1[2].toString(),widget.number1[3].toString(),widget.number1[4].toString(),widget.number1[5].toString()];
                        var stringNumber2 = [widget.number2[0].toString(),widget.number2[1].toString(),widget.number2[2].toString(),widget.number2[3].toString(),widget.number2[4].toString(),widget.number2[5].toString()];
                        var stringNumber3 = [widget.number3[0].toString(),widget.number3[1].toString(),widget.number3[2].toString(),widget.number3[3].toString(),widget.number3[4].toString(),widget.number3[5].toString()];
                        var stringNumber4 = [widget.number4[0].toString(),widget.number4[1].toString(),widget.number4[2].toString(),widget.number4[3].toString(),widget.number4[4].toString(),widget.number4[5].toString()];
                        var stringNumber5 = [widget.number5[0].toString(),widget.number5[1].toString(),widget.number5[2].toString(),widget.number5[3].toString(),widget.number5[4].toString(),widget.number5[5].toString()];


                        saveLottoNumberList(stringNumber1).whenComplete((){ saveLottoNumberList(stringNumber2);}).whenComplete((){ saveLottoNumberList(stringNumber3);}).whenComplete((){ saveLottoNumberList(stringNumber4);}).whenComplete((){ saveLottoNumberList(stringNumber5);});

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                width: 320.w,
                                content: Text(
                                  '당첨번호 5개가 저장되었습니다.',
                                  style: TextStyle(fontSize: 18.sp),
                                  textAlign: TextAlign.center,
                                ),
                                padding: EdgeInsets.fromLTRB(
                                    10.w, 10.h, 10.w, 10.h),
                                backgroundColor: Colors.grey,
                                duration: const Duration(milliseconds: 1000),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20),
                                )));
                      } else {
                        print('실행됨');
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                width: 320.w,
                                content: Text(
                                  '당첨번호를 구매해주세요.',
                                  style: TextStyle(fontSize: 18.sp),
                                  textAlign: TextAlign.center,
                                ),
                                padding: EdgeInsets.fromLTRB(
                                    10.w, 10.h, 10.w, 10.h),
                                backgroundColor: Colors.grey,
                                duration: const Duration(milliseconds: 1000),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20),
                                )));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        minimumSize: Size(20.0.w, 35.0.h),
                        padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 3.h)),
                    child: AutoSizeText('번호저장',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Pretendard',
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }
}

class randomNumBallList extends StatefulWidget {
  randomNumBallList(
      {Key? key,
      this.number1,
      this.number2,
      this.number3,
      this.number4,
      this.number5})
      : super(key: key);
  var number1;
  var number2;
  var number3;
  var number4;
  var number5;

  @override
  _randomNumBallListState createState() => _randomNumBallListState();
}

class _randomNumBallListState extends State<randomNumBallList> {
  var abcde = ['A', 'B', 'C', 'D', 'E'];

  getToday() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));
    DateTime now = tz.TZDateTime.now(tz.local);
    // print('now는${now}');
    return now;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
      width: double.infinity,
      // height: 505.h,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 10.w),
          color: const Color(0xfff8f8f8),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r))),
      padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   padding: EdgeInsets.fromLTRB(10.w, 10.h, 0, 0),
          //   child: Column(
          //     // mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Lotto 6/45',
          //         style:
          //             TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900),
          //       ),
          //       Text(
          //           '발행일: ${DateFormat('yyyy/MM/dd H시 m분 s초').format(getToday())}'),
          //       context.watch<Mainpage_Store>().button5RoundInfo['drwNoDate'] == null
          //           ? (context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[10] ==
          //                   null
          //               ? CircularProgressIndicator()
          //               : Text(
          //                   '추첨일: ${DateFormat('yyyy/MM/dd').format(DateTime.parse(context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[10].replaceAll('.', '-')).add(Duration(days: 7)))}'))
          //           : Text(
          //               '추첨일: ${DateFormat('yyyy/MM/dd').format(DateTime.parse(context.watch<Mainpage_Store>().button5RoundInfo['drwNoDate']).add(Duration(days: 7)))}'),
          //       context.watch<Mainpage_Store>().button5RoundInfo['drwNoDate'] == null
          //           ? (context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[10] ==
          //                   null
          //               ? CircularProgressIndicator()
          //               : Text(
          //                   '추첨일: ${DateFormat('yyyy/MM/dd').format(DateTime.parse(context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[10].replaceAll('.', '-')).add(Duration(days: 372)))}'))
          //           : Text(
          //               '지급기한: ${DateFormat('yyyy/MM/dd').format(DateTime.parse(context.watch<Mainpage_Store>().button5RoundInfo['drwNoDate']).add(Duration(days: 372)))}'),
          //     ],
          //   ),
          // ),
          // Expanded(
          //   child: Column(
          //     children: [
                Expanded(child: eachRandomBall(abcde: abcde[0], number: widget.number1)),
                
          
          Expanded(child: eachRandomBall(abcde: abcde[1], number: widget.number2)),
                
          Expanded(child: eachRandomBall(abcde: abcde[2], number: widget.number3)),
                
          Expanded(child: eachRandomBall(abcde: abcde[3], number: widget.number4)),
                
          Expanded(child: eachRandomBall(abcde: abcde[4], number: widget.number5))
          //     ],
          //   ),
          // ),

        ],
      ),
    );
  }
}

class eachRandomBall extends StatefulWidget {
  eachRandomBall({Key? key, this.abcde, this.number}) : super(key: key);
  var abcde;
  var number;

  @override
  _eachRandomBallState createState() => _eachRandomBallState();
}

class _eachRandomBallState extends State<eachRandomBall> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(5.w, 5.h, 0, 0),
          child: Row(
            children: [
              Text(
                '${widget.abcde}  자동',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
        
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
            decoration: BoxDecoration(
              color: const Color(0xffe5e5e5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getBall(widget.number[0]),
                getBall(widget.number[1]),
                getBall(widget.number[2]),
                getBall(widget.number[3]),
                getBall(widget.number[4]),
                getBall(widget.number[5]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
