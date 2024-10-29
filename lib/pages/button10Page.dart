import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lotto/pages/DirectInput.dart';
import 'package:lotto/pages/lottoNumber.dart';
import 'package:lotto/pages/notification.dart';
import 'package:lotto/pages/sharedpreferences.dart';
import 'package:lotto/widget/mainWidgets.dart';

import 'ad_number.dart';

class button10Page extends StatefulWidget {
  const button10Page({Key? key}) : super(key: key);

  @override
  State<button10Page> createState() => _button10PageState();
}

class _button10PageState extends State<button10Page> {




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
  var number1 = 0;
  var number2 = 0;
  var number3 = 0;
  var number4 = 0;
  var number5 = 0;
  var number6 = 0;

  var removeBool = false;
  var removeSaveBool = false;
  var removeButtonColor = Colors.blue;
  var removeSaveButtonColor = Colors.blue;

  // var fixButtonColor = Colors.blue;
  // var fixSaveButtonColor = Colors.blue;
  var buttonBoxColorList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  makeSelectNumber(i) {
    if (removeBool == false ||
        (removeSaveBool == true && buttonBoxColorList[i - 1] != true)) {
      setState(() {
        if (number1 == 0) {
          number1 = i;
          return;
        } else if (number1 != 0 && number1 != i && number2 == 0) {
          number2 = i;
          return;
        } else if (number1 != 0 &&
            number1 != i &&
            number2 != 0 &&
            number2 != i &&
            number3 == 0) {
          number3 = i;
          return;
        } else if (number1 != 0 &&
            number1 != i &&
            number2 != 0 &&
            number2 != i &&
            number3 != 0 &&
            number3 != i &&
            number4 == 0) {
          number4 = i;
          return;
        } else if (number1 != 0 &&
            number1 != i &&
            number2 != 0 &&
            number2 != i &&
            number3 != 0 &&
            number3 != i &&
            number4 != 0 &&
            number4 != i &&
            number5 == 0) {
          number5 = i;
          return;
        } else if (number1 != 0 &&
            number1 != i &&
            number2 != 0 &&
            number2 != i &&
            number3 != 0 &&
            number3 != i &&
            number4 != 0 &&
            number4 != i &&
            number5 != 0 &&
            number5 != i &&
            number6 == 0) {
          number6 = i;
          return;
        }
      });
    } else {
      if (i != number1 &&
          i != number2 &&
          i != number3 &&
          i != number4 &&
          i != number5 &&
          i != number6) {
        if (buttonBoxColorList[i - 1] == false) {
          setState(() {
            buttonBoxColorList[i - 1] = true;
          });
        } else {
          setState(() {
            buttonBoxColorList[i - 1] = false;
            return;
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            width: 320.w,
            content: Text(
              '추가된 번호가 있어요',
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
      }
    }
  }

  clearAllNumber() {
    setState(() {
      number1 = 0;
      number2 = 0;
      number3 = 0;
      number4 = 0;
      number5 = 0;
      number6 = 0;
    });
  }

  removeButton() {
    if (removeBool == false) {
      setState(() {
        removeButtonColor = Colors.red;
      });
      removeBool = true;
    } else {
      setState(() {
        removeButtonColor = Colors.blue;
        for (int i = 0; i < 45; i++) {
          buttonBoxColorList[i] = false;
        }
        removeSaveButtonColor = Colors.blue;
      });
      removeSaveBool = false;
      removeBool = false;
    }
  }

  removeSaveButton() {
    if (removeBool == true && removeSaveBool == false) {
      if (buttonBoxColorList.where((element) => element == true).length > 39) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            width: 320.w,
            content: Text(
              '6개도 안남아요..',
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
      } else if (buttonBoxColorList
          .where((element) => element == true)
          .isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            width: 320.w,
            content: Text(
              '제외수 1개라도 선택해주세요.',
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
        setState(() {
          removeSaveButtonColor = Colors.red;
        });
        removeSaveBool = true;
      }
    } else {
      setState(() {
        removeSaveButtonColor = Colors.blue;
      });
      removeSaveBool = false;
    }
  }

  allMakeRandom() {
    var random = Random();

    // print(number1);
    // print(number2);
    // print(number3);
    // print(number4);
    // print(number5);
    // print(number6);

//제외수와 제외수저장버튼이 true면
    if (removeBool == true && removeSaveBool == true) {
      List removeList = [];
      int n = -1;
      while (true) {
        n = buttonBoxColorList.indexOf(true, n) + 1;
        removeList.add(n);
        print(removeList);
        if (buttonBoxColorList.indexOf(true, n) == -1) {
          break;
        }
      }

      if (number1 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (List<int>.generate(45, (i) => i + 1)
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 6);
            setState(() {
              number1 = tempList[0];

              number2 = tempList[1];
              number3 = tempList[2];
              number4 = tempList[3];
              number5 = tempList[4];
              number6 = tempList[5];
            });
          });
        }
        tempList.clear();
      } else if (number2 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (List<int>.generate(45, (i) => i + 1)
                  ..removeWhere((e) => removeList.contains(e))
                  ..removeWhere((item) => item == number1)
                  ..shuffle())
                .sublist(0, 5);
            setState(() {
              number2 = tempList[0];
              number3 = tempList[1];
              number4 = tempList[2];
              number5 = tempList[3];
              number6 = tempList[4];
            });
          });
        }
        tempList.clear();
      } else if (number3 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (List<int>.generate(45, (i) => i + 1)
                  ..removeWhere((e) => removeList.contains(e))
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..shuffle())
                .sublist(0, 4);
            setState(() {
              number3 = tempList[0];
              number4 = tempList[1];
              number5 = tempList[2];
              number6 = tempList[3];
            });
          });
        }
        tempList.clear();
      } else if (number4 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (List<int>.generate(45, (i) => i + 1)
                  ..removeWhere((e) => removeList.contains(e))
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..shuffle())
                .sublist(0, 3);
            setState(() {
              number4 = tempList[0];
              number5 = tempList[1];
              number6 = tempList[2];
            });
          });
        }
        tempList.clear();
      } else if (number5 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (List<int>.generate(45, (i) => i + 1)
                  ..removeWhere((e) => removeList.contains(e))
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..removeWhere((item) => item == number4)
                  ..shuffle())
                .sublist(0, 2);
            setState(() {
              number5 = tempList[0];
              number6 = tempList[1];
            });
          });
        }
        tempList.clear();
      } else if (number6 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (List<int>.generate(45, (i) => i + 1)
                  ..removeWhere((e) => removeList.contains(e))
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..removeWhere((item) => item == number4)
                  ..removeWhere((item) => item == number5)
                  ..shuffle())
                .sublist(0, 1);
            setState(() {
              number6 = tempList[0];
            });
          });
        }
        tempList.clear();
      }
    } else {
      if (number1 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList =
                (List<int>.generate(45, (i) => i + 1)..shuffle()).sublist(0, 6);
            setState(() {
              number1 = tempList[0];

              number2 = tempList[1];
              number3 = tempList[2];
              number4 = tempList[3];
              number5 = tempList[4];
              number6 = tempList[5];
            });
          });
        }
        tempList.clear();
      } else if (number2 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (List<int>.generate(45, (i) => i + 1)
                  ..removeWhere((item) => item == number1)
                  ..shuffle())
                .sublist(0, 5);
            setState(() {
              number2 = tempList[0];
              number3 = tempList[1];
              number4 = tempList[2];
              number5 = tempList[3];
              number6 = tempList[4];
            });
          });
        }
        tempList.clear();
      } else if (number3 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (List<int>.generate(45, (i) => i + 1)
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..shuffle())
                .sublist(0, 4);
            setState(() {
              number3 = tempList[0];
              number4 = tempList[1];
              number5 = tempList[2];
              number6 = tempList[3];
            });
          });
        }
        tempList.clear();
      } else if (number4 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (List<int>.generate(45, (i) => i + 1)
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..shuffle())
                .sublist(0, 3);

            setState(() {
              number4 = tempList[0];
              number5 = tempList[1];
              number6 = tempList[2];
            });
          });
        }
        tempList.clear();
      } else if (number5 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (List<int>.generate(45, (i) => i + 1)
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..removeWhere((item) => item == number4)
                  ..shuffle())
                .sublist(0, 2);

            setState(() {
              number5 = tempList[0];
              number6 = tempList[1];
            });
          });
        }
        tempList.clear();
      } else if (number6 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (List<int>.generate(45, (i) => i + 1)
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..removeWhere((item) => item == number4)
                  ..removeWhere((item) => item == number5)
                  ..shuffle())
                .sublist(0, 1);

            setState(() {
              number6 = tempList[0];
            });
          });
        }
        tempList.clear();
      }
    }
  }

  allMake5WeekRandom() {
    var random = Random();
    Set tempSet = {};
    for (int i = 1; i < 6; i++) {
      for (int j = 0; j < 4; j++) {
        tempSet.add(lottoTotalNumber[j][i]);
      }
    }
    // print(number1);
    // print(number2);
    // print(number3);
    // print(number4);
    // print(number5);
    // print(number6);

//제외수와 제외수저장버튼이 true면
    if (removeBool == true && removeSaveBool == true) {
      List removeList = [];
      int n = -1;
      while (true) {
        n = buttonBoxColorList.indexOf(true, n) + 1;
        removeList.add(n);
        print(removeList);
        if (buttonBoxColorList.indexOf(true, n) == -1) {
          break;
        }
      }

      if (number1 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;

            tempList = (tempSet.toList()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 6);
            setState(() {
              number1 = tempList[0];

              number2 = tempList[1];
              number3 = tempList[2];
              number4 = tempList[3];
              number5 = tempList[4];
              number6 = tempList[5];
            });
          });
        }

        tempList.clear();
      } else if (number2 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 5);
            setState(() {
              number2 = tempList[0];
              number3 = tempList[1];
              number4 = tempList[2];
              number5 = tempList[3];
              number6 = tempList[4];
            });
          });
        }
        tempList.clear();
      } else if (number3 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 4);
            setState(() {
              number3 = tempList[0];
              number4 = tempList[1];
              number5 = tempList[2];
              number6 = tempList[3];
            });
          });
        }
        tempList.clear();
      } else if (number4 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 3);
            setState(() {
              number4 = tempList[0];
              number5 = tempList[1];
              number6 = tempList[2];
            });
          });
        }
        tempList.clear();
      } else if (number5 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 2);
            setState(() {
              number5 = tempList[0];
              number6 = tempList[1];
            });
          });
        }
        tempList.clear();
      } else if (number6 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 1);
            setState(() {
              number6 = tempList[0];
            });
          });
        }
        tempList.clear();
      }
    } else {
      if (number1 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()..shuffle()).sublist(0, 6);

            setState(() {
              number1 = tempList[0];

              number2 = tempList[1];
              number3 = tempList[2];
              number4 = tempList[3];
              number5 = tempList[4];
              number6 = tempList[5];
            });
          });
        }
        tempList.clear();
      } else if (number2 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((item) => item == number1)
                  ..shuffle())
                .sublist(0, 5);
            setState(() {
              number2 = tempList[0];
              number3 = tempList[1];
              number4 = tempList[2];
              number5 = tempList[3];
              number6 = tempList[4];
            });
          });
        }
        tempList.clear();
      } else if (number3 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..shuffle())
                .sublist(0, 4);
            setState(() {
              number3 = tempList[0];
              number4 = tempList[1];
              number5 = tempList[2];
              number6 = tempList[3];
            });
          });
        }
        tempList.clear();
      } else if (number4 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..shuffle())
                .sublist(0, 3);

            setState(() {
              number4 = tempList[0];
              number5 = tempList[1];
              number6 = tempList[2];
            });
          });
        }
        tempList.clear();
      } else if (number5 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..removeWhere((item) => item == number4)
                  ..shuffle())
                .sublist(0, 2);

            setState(() {
              number5 = tempList[0];
              number6 = tempList[1];
            });
          });
        }
        tempList.clear();
      } else if (number6 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..removeWhere((item) => item == number4)
                  ..removeWhere((item) => item == number5)
                  ..shuffle())
                .sublist(0, 1);

            setState(() {
              number6 = tempList[0];
            });
          });
        }
        tempList.clear();
      }
    }
//buttonBoxColorList에서 true인 것들의 index를 가져와서

    // templIST에서 그 index를 모두 제거하고..

    // 똑같이 위함수실행

    // list_a = [1, 1, 1, 2, 3, 4, 1, 5, 6, 1, 1]
    //
    // n = -1
    // while True:
    // if list_a[n+1:].count(1) == 0:
    // break
    // n += list_a[n+1:].index(1) + 1
    // print(n, end=' ')
    //
  }

  allMake10WeekRandom() {
    var random = Random();
    Set tempSet = {};
    for (int i = 1; i < 6; i++) {
      for (int j = 0; j < 9; j++) {
        tempSet.add(lottoTotalNumber[j][i]);
      }
    }
    // print(number1);
    // print(number2);
    // print(number3);
    // print(number4);
    // print(number5);
    // print(number6);

//제외수와 제외수저장버튼이 true면
    if (removeBool == true && removeSaveBool == true) {
      List removeList = [];
      int n = -1;
      while (true) {
        n = buttonBoxColorList.indexOf(true, n) + 1;
        removeList.add(n);
        print(removeList);
        if (buttonBoxColorList.indexOf(true, n) == -1) {
          break;
        }
      }

      if (number1 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;

            tempList = (tempSet.toList()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 6);
            setState(() {
              number1 = tempList[0];

              number2 = tempList[1];
              number3 = tempList[2];
              number4 = tempList[3];
              number5 = tempList[4];
              number6 = tempList[5];
            });
          });
        }

        tempList.clear();
      } else if (number2 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 5);
            setState(() {
              number2 = tempList[0];
              number3 = tempList[1];
              number4 = tempList[2];
              number5 = tempList[3];
              number6 = tempList[4];
            });
          });
        }
        tempList.clear();
      } else if (number3 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 4);
            setState(() {
              number3 = tempList[0];
              number4 = tempList[1];
              number5 = tempList[2];
              number6 = tempList[3];
            });
          });
        }
        tempList.clear();
      } else if (number4 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 3);
            setState(() {
              number4 = tempList[0];
              number5 = tempList[1];
              number6 = tempList[2];
            });
          });
        }
        tempList.clear();
      } else if (number5 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 2);
            setState(() {
              number5 = tempList[0];
              number6 = tempList[1];
            });
          });
        }
        tempList.clear();
      } else if (number6 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 1);
            setState(() {
              number6 = tempList[0];
            });
          });
        }
        tempList.clear();
      }
    } else {
      if (number1 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()..shuffle()).sublist(0, 6);

            setState(() {
              number1 = tempList[0];

              number2 = tempList[1];
              number3 = tempList[2];
              number4 = tempList[3];
              number5 = tempList[4];
              number6 = tempList[5];
            });
          });
        }
        tempList.clear();
      } else if (number2 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((item) => item == number1)
                  ..shuffle())
                .sublist(0, 5);
            setState(() {
              number2 = tempList[0];
              number3 = tempList[1];
              number4 = tempList[2];
              number5 = tempList[3];
              number6 = tempList[4];
            });
          });
        }
        tempList.clear();
      } else if (number3 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..shuffle())
                .sublist(0, 4);
            setState(() {
              number3 = tempList[0];
              number4 = tempList[1];
              number5 = tempList[2];
              number6 = tempList[3];
            });
          });
        }
        tempList.clear();
      } else if (number4 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..shuffle())
                .sublist(0, 3);

            setState(() {
              number4 = tempList[0];
              number5 = tempList[1];
              number6 = tempList[2];
            });
          });
        }
        tempList.clear();
      } else if (number5 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..removeWhere((item) => item == number4)
                  ..shuffle())
                .sublist(0, 2);

            setState(() {
              number5 = tempList[0];
              number6 = tempList[1];
            });
          });
        }
        tempList.clear();
      } else if (number6 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (tempSet.toList()
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..removeWhere((item) => item == number4)
                  ..removeWhere((item) => item == number5)
                  ..shuffle())
                .sublist(0, 1);

            setState(() {
              number6 = tempList[0];
            });
          });
        }
        tempList.clear();
      }
    }
//buttonBoxColorList에서 true인 것들의 index를 가져와서

    // templIST에서 그 index를 모두 제거하고..

    // 똑같이 위함수실행

    // list_a = [1, 1, 1, 2, 3, 4, 1, 5, 6, 1, 1]
    //
    // n = -1
    // while True:
    // if list_a[n+1:].count(1) == 0:
    // break
    // n += list_a[n+1:].index(1) + 1
    // print(n, end=' ')
    //
  }

  var button10AllMatchList = []; //5위 이상한 회차
  // var allMatchNumver = [];
  var button10AllMatchAllNumber = [];
  var button10AllMatchNumver = [];
  var button10AllMatchRank = [];

  button10SeeAllMatchNum() {
    button10AllMatchNumver.clear();
    button10AllMatchList.clear();
    button10AllMatchRank.clear();
    button10AllMatchAllNumber.clear();
    var myClickNumber = [
      number1,
      number2,
      number3,
      number4,
      number5,
      number6
    ]; //L

    List<Map> lottoAllDataInfo = List<Map>.empty(growable: true);

    List<List> lottoAllDataNumberList = List<List>.empty(growable: true);
    for (int i = 0; i < lottoTotalNumber.length; i++) {
      lottoAllDataInfo.add({
        'drwNo': lottoTotalNumber[i][0],
        'drwtNo1': lottoTotalNumber[i][1],
        'drwtNo2': lottoTotalNumber[i][2],
        'drwtNo3': lottoTotalNumber[i][3],
        'drwtNo4': lottoTotalNumber[i][4],
        'drwtNo5': lottoTotalNumber[i][5],
        'drwtNo6': lottoTotalNumber[i][6],
        'bnusNo': lottoTotalNumber[i][7]
      });

      lottoAllDataNumberList.add([
        lottoAllDataInfo[i]['drwtNo1'],
        lottoAllDataInfo[i]['drwtNo2'],
        lottoAllDataInfo[i]['drwtNo3'],
        lottoAllDataInfo[i]['drwtNo4'],
        lottoAllDataInfo[i]['drwtNo5'],
        lottoAllDataInfo[i]['drwtNo6']
      ]);

      int match = 0;
      var tempMyNum = [];

      for (var lotto in lottoAllDataNumberList[i]) {
        for (var myNum in myClickNumber) {
          if (lotto == myNum) {
            match++;
            tempMyNum.add(myNum);
          }
        }
      }

      lottoAllDataNumberList[i].add(lottoAllDataInfo[i]['bnusNo']);
      if (match == 6) {
        button10AllMatchRank.add('1등');
        button10AllMatchNumver.add(tempMyNum);
        button10AllMatchList.add(lottoAllDataInfo[i]['drwNo']);
        button10AllMatchAllNumber.add(lottoAllDataNumberList[i]);
      } else if (match == 5 &&
          myClickNumber.contains(lottoAllDataInfo[i]['bnusNo'])) {
        tempMyNum.add(lottoAllDataInfo[i]['bnusNo']);
        button10AllMatchNumver.add(tempMyNum);
        button10AllMatchList.add(lottoAllDataInfo[i]['drwNo']);
        button10AllMatchRank.add('2등');
        button10AllMatchAllNumber.add(lottoAllDataNumberList[i]);
      } else if (match == 5) {
        button10AllMatchNumver.add(tempMyNum);
        button10AllMatchList.add(lottoAllDataInfo[i]['drwNo']);
        button10AllMatchRank.add('3등');
        button10AllMatchAllNumber.add(lottoAllDataNumberList[i]);
      } else if (match == 4) {
        button10AllMatchNumver.add(tempMyNum);
        button10AllMatchList.add(lottoAllDataInfo[i]['drwNo']);
        button10AllMatchRank.add('4등');
        button10AllMatchAllNumber.add(lottoAllDataNumberList[i]);
      } else if (match == 3) {
        button10AllMatchNumver.add(tempMyNum);
        button10AllMatchList.add(lottoAllDataInfo[i]['drwNo']);
        button10AllMatchRank.add('5등');
        button10AllMatchAllNumber.add(lottoAllDataNumberList[i]);
      }

      tempMyNum = [];
      match = 0;
    }

    // print('모든매치된회차는${allMatchList}');
    // print('모든매치된번호는${allMatchNumver}');
    // print('모든매치된랭킹는${allMatchRank}');
    // print('모든매치된랭킹는${allMatchAllNumber}');
  }

  searchAllPastSuccess() {
    {
      if (number1 == 0 ||
          number2 == 0 ||
          number3 == 0 ||
          number4 == 0 ||
          number5 == 0 ||
          number6 == 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            width: 320,
            content: Text(
              '로또번호 6개를 모두 선택해주세요',
              style: TextStyle(fontSize: 20.sp),
              textAlign: TextAlign.center,
            ),
            padding: const EdgeInsets.all(10),
            backgroundColor: Colors.grey,
            duration: const Duration(milliseconds: 1000),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )));
      } else {
        button10SeeAllMatchNum();
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                insetPadding: const EdgeInsets.fromLTRB(0, 0.0, 0, 0),
                contentPadding: EdgeInsets.fromLTRB(10.0.w, 10.0.h, 10.0.w, 0),
                // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                //Dialog Main Title
                title: Column(
                  children: <Widget>[
                    Text(
                      "과거당첨결과 확인",
                      style: TextStyle(fontSize: 32.sp, fontFamily: 'Pretendard'),
                    ),
                  ],
                ),
                //
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        //
                        // seeAllMatchNum(),

                        child: resultAllNumBall(
                            allMatchList: button10AllMatchList,
                            allMatchRank: button10AllMatchRank,
                            allMatchNumver: button10AllMatchNumver,
                            allMatchAllNumber: button10AllMatchAllNumber),
                      ),
                    )
                  ],
                ),
                actions: <Widget>[
                  Center(
                    child: TextButton(
                      child: Text(
                        "확인",
                        style: TextStyle(color:Colors.blue,fontSize: 25.sp),
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
    }
  }

  sortNumber() {
    var NumberList = [number1, number2, number3, number4, number5, number6];
    NumberList.sort();
    setState(() {
      number1 = NumberList[0];
      number2 = NumberList[1];
      number3 = NumberList[2];
      number4 = NumberList[3];
      number5 = NumberList[4];
      number6 = NumberList[5];
    });
  }

  var LottomanList = [0, 0, 0, 0, 0, 0];
  var tempLottoManList = [];
  var aa = 0;
  var a = 0;
  var b = 0;
  var c = 0;
  var d = 0;
  var e = 0;
  var f = 0;
  var random = Random();

  makeLottomanNumber() {
    tempLottoManList.clear();
    var tempEarlyNumList = [...lottoTotalNumber[0]];
    var tempEarlyNumList1 = [...lottoTotalNumber[1]];
    print(tempEarlyNumList);
    var toRemove = [];
    for (var e1 in tempEarlyNumList) {
      for (var e2 in tempEarlyNumList1) {
        if (e1 == e2) {
          toRemove.add(e1);
        }
      }
    }

    //
    //
    // if(tempEarlyNumList.length==9) {
    //   aa = (tempEarlyNumList[5]);
    //
    // }else if(tempEarlyNumList.length==8){
    //   aa = (tempEarlyNumList[5]);
    //
    // }else if(tempEarlyNumList.length==7){
    //   aa = (tempEarlyNumList[5]);
    //
    // }

    //전회차에서 1개를 가져오는데, 중복된건 뺀다
    aa = (tempEarlyNumList
          ..removeAt(0)
          ..removeWhere((e) => toRemove.contains(e))
          ..shuffle())
        .sublist(0, 1)[0];

    print('aa는$aa');
    while (tempLottoManList.length != 6) {
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
                    tempLottoManList = [a, b, c, d, e, f];
                    LottomanList = [a, b, c, d, e, f];
                  });

                  print(tempLottoManList);
                }
              }
            }
          }
        }
      }
    }
    return LottomanList;
  }

  lottoMan() {
//제외수와 제외수저장버튼이 true면
    if (removeBool == true && removeSaveBool == true) {
      List removeList = [];
      int n = -1;
      while (true) {
        n = buttonBoxColorList.indexOf(true, n) + 1;
        removeList.add(n);
        print(removeList);
        if (buttonBoxColorList.indexOf(true, n) == -1) {
          break;
        }
      }

      if (number1 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;

            tempList = (makeLottomanNumber()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 6);
            setState(() {
              number1 = tempList[0];

              number2 = tempList[1];
              number3 = tempList[2];
              number4 = tempList[3];
              number5 = tempList[4];
              number6 = tempList[5];
            });
          });
        }

        tempList.clear();
      } else if (number2 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (makeLottomanNumber()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 5);
            setState(() {
              number2 = tempList[0];
              number3 = tempList[1];
              number4 = tempList[2];
              number5 = tempList[3];
              number6 = tempList[4];
            });
          });
        }
        tempList.clear();
      } else if (number3 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (makeLottomanNumber()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 4);
            setState(() {
              number3 = tempList[0];
              number4 = tempList[1];
              number5 = tempList[2];
              number6 = tempList[3];
            });
          });
        }
        tempList.clear();
      } else if (number4 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (makeLottomanNumber()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 3);
            setState(() {
              number4 = tempList[0];
              number5 = tempList[1];
              number6 = tempList[2];
            });
          });
        }
        tempList.clear();
      } else if (number5 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (makeLottomanNumber()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 2);
            setState(() {
              number5 = tempList[0];
              number6 = tempList[1];
            });
          });
        }
        tempList.clear();
      } else if (number6 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (makeLottomanNumber()
                  ..removeWhere((e) => removeList.contains(e))
                  ..shuffle())
                .sublist(0, 1);
            setState(() {
              number6 = tempList[0];
            });
          });
        }
        tempList.clear();
      }
    } else {
      if (number1 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (makeLottomanNumber()..shuffle()).sublist(0, 6);

            setState(() {
              number1 = tempList[0];

              number2 = tempList[1];
              number3 = tempList[2];
              number4 = tempList[3];
              number5 = tempList[4];
              number6 = tempList[5];
            });
          });
        }
        tempList.clear();
      } else if (number2 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (makeLottomanNumber()
                  ..removeWhere((item) => item == number1)
                  ..shuffle())
                .sublist(0, 5);
            setState(() {
              number2 = tempList[0];
              number3 = tempList[1];
              number4 = tempList[2];
              number5 = tempList[3];
              number6 = tempList[4];
            });
          });
        }
        tempList.clear();
      } else if (number3 == 0) {
        List tempList = [];
        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (makeLottomanNumber()
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..shuffle())
                .sublist(0, 4);
            setState(() {
              number3 = tempList[0];
              number4 = tempList[1];
              number5 = tempList[2];
              number6 = tempList[3];
            });
          });
        }
        tempList.clear();
      } else if (number4 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (makeLottomanNumber()
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..shuffle())
                .sublist(0, 3);

            setState(() {
              number4 = tempList[0];
              number5 = tempList[1];
              number6 = tempList[2];
            });
          });
        }
        tempList.clear();
      } else if (number5 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (makeLottomanNumber()
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..removeWhere((item) => item == number4)
                  ..shuffle())
                .sublist(0, 2);

            setState(() {
              number5 = tempList[0];
              number6 = tempList[1];
            });
          });
        }
        tempList.clear();
      } else if (number6 == 0) {
        List tempList = [];

        for (int i = 1; i < 2000; i = i + 100) {
          Timer(Duration(milliseconds: i), () {
            if (!mounted) return;
            tempList = (makeLottomanNumber()
                  ..removeWhere((item) => item == number1)
                  ..removeWhere((item) => item == number2)
                  ..removeWhere((item) => item == number3)
                  ..removeWhere((item) => item == number4)
                  ..removeWhere((item) => item == number5)
                  ..shuffle())
                .sublist(0, 1);

            setState(() {
              number6 = tempList[0];
            });
          });
        }
        tempList.clear();
      }
    }
  }

  List<String> button10l = [];

  saveButton10l() {
    if (number1 != 0 &&
        number2 != 0 &&
        number3 != 0 &&
        number4 != 0 &&
        number5 != 0 &&
        number6 != 0) {
      setState(() {
        button10l = [
          number1.toString(),
          number2.toString(),
          number3.toString(),
          number4.toString(),
          number5.toString(),
          number6.toString()
        ];
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 320.w,
          content: Text(
            '내저장번호목록에 저장되었습니다.',
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
      saveLottoNumberList(button10l);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 320.w,
          content: Text(
            '번호를 모두 추가해주세요.',
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
    }
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
        padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
        child: Column(children: [
          button10Numbers(
            number1: number1,
            number2: number2,
            number3: number3,
            number4: number4,
            number5: number5,
            number6: number6,
          ),
          button10ButtonList(
              saveButton10l: saveButton10l,
              lottoMan: lottoMan,
              sortNumber: sortNumber,
              searchAllPastSuccess: searchAllPastSuccess,
              allMake10WeekRandom: allMake10WeekRandom,
              allMake5WeekRandom: allMake5WeekRandom,
              allMakeRandom: allMakeRandom,
              clearAllNumber: clearAllNumber,
              removeButtonColor: removeButtonColor,
              removeButton: removeButton,
              removeSaveButton: removeSaveButton,
              removeSaveButtonColor: removeSaveButtonColor),
          Expanded(
              child: button10ButtonBox(
            makeSelectNumber: makeSelectNumber,
            removeBool: removeBool,
            buttonBoxColorList: buttonBoxColorList,
          ))
        ]),
      ),
      bottomNavigationBar:  SafeArea(
        child: returnAd(), // 광고 배너만 SafeArea로 감싸서 네비게이션 바 위에 표시
      ),
    );
  }
}

class button10Numbers extends StatefulWidget {
  button10Numbers(
      {Key? key,
      this.number1,
      this.number2,
      this.number3,
      this.number4,
      this.number5,
      this.number6})
      : super(key: key);
  var number1;
  var number2;
  var number3;
  var number4;
  var number5;
  var number6;

  @override
  State<button10Numbers> createState() => _button10NumbersState();
}

class _button10NumbersState extends State<button10Numbers> {
  getBall(b) {
    if (b == 0) {
      return TextBall(b: b);
    }
    if (b == 46) {
      return xNumBall(b: b);
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
    return Column(children: [
      Container(
        margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
        width: double.infinity,
        // height: 220.h,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffe5e5e5), width: 10.w),
            color: const Color(0xfff8f8f8),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ,style: TextStyle(color: Color(0xff767676),fontSize: 20,fontWeight: FontWeight.bold),)),

            Container(
              margin: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
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
                  getBall(widget.number1),
                  getBall(widget.number2),
                  getBall(widget.number3),
                  getBall(widget.number4),
                  getBall(widget.number5),
                  getBall(widget.number6),
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

class button10ButtonList extends StatefulWidget {
  button10ButtonList(
      {Key? key,
      this.saveButton10l,
      this.lottoMan,
      this.sortNumber,
      this.searchAllPastSuccess,
      this.allMake10WeekRandom,
      this.clearAllNumber,
      this.removeButtonColor,
      this.removeButton,
      this.removeSaveButton,
      this.removeSaveButtonColor,
      this.allMakeRandom,
      this.allMake5WeekRandom})
      : super(key: key);
  var clearAllNumber;
  var removeButtonColor;
  var removeButton;
  var removeSaveButton;
  var removeSaveButtonColor;
  var allMakeRandom;
  var allMake5WeekRandom;
  var allMake10WeekRandom;
  var searchAllPastSuccess;
  var sortNumber;
  var lottoMan;
  var saveButton10l;

  @override
  State<button10ButtonList> createState() => _button10ButtonListState();
}

class _button10ButtonListState extends State<button10ButtonList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          widget.removeButton();
                        },
                        style: ElevatedButton.styleFrom(
                            // minimumSize: Size.zero, // Set this
                            // padding: EdgeInsets.zero, // and this
                            // minimumSize: Size(20.0.w, 35.0.h),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                            backgroundColor: widget.removeButtonColor),
                        child: AutoSizeText(
                          '제외수켜기/끄기',
                          maxLines: 1,
                          softWrap: true,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                          // fontWeight: FontWeight.w900,
                        )),
                  ],
                ),
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child:
                          ElevatedButton(
                            onPressed: () {
                              widget.removeSaveButton();
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(20.0.w, 35.0.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                ),
                                backgroundColor: widget.removeSaveButtonColor),
                            child: AutoSizeText('제외수고정',
                                maxLines: 1,
                                softWrap: true,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold)
                                // fontWeight: FontWeight.w900,
                                ),
                          ),
                    ),


                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                        child: ElevatedButton(
                              onPressed: () {
                                widget.saveButton10l();
                                showNotification3(context);
                              },
                              child: AutoSizeText('번호저장',
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.bold)
                                  // fontWeight: FontWeight.w900,
                                  ),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(8)),
                                ),
                                minimumSize: Size(20.0.w, 35.0.h),
                              ),
                              // style: ElevatedButton.styleFrom(primary:widget.removeSaveButtonColor),
                            ),
                      ),

                    ),
                  ],
                ),
              ),
            ],
          ),

          //
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //
          //     children: [
          //       ElevatedButton(onPressed: (){}, child: Text('고정수')),
          //      ElevatedButton(onPressed: (){}, child: Text('저장')),
          //
          //      ],
          //    ),
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        widget.allMakeRandom();
                      },
                      child: Text(
                        '순수완전랜덤',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        minimumSize: Size(20.0.w, 35.0.h),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        widget.lottoMan();
                      },
                      child: AutoSizeText(
                        '로또당첨자공식랜덤',
                        maxLines: 1,
                        softWrap: true,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        minimumSize: Size(20.0.w, 35.0.h),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          widget.allMake5WeekRandom();
                        },
                        child: AutoSizeText(
                          '최근5주번호랜덤',
                          maxLines: 1,
                          softWrap: true,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          minimumSize: Size(20.0.w, 35.0.h),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        widget.allMake10WeekRandom();
                      },
                      child: AutoSizeText(
                        '최근10주번호랜덤',
                        maxLines: 1,
                        softWrap: true,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        minimumSize: Size(20.0.w, 35.0.h),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          widget.searchAllPastSuccess();
                        },
                        child: Text(
                          '과거당첨확인',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          minimumSize: Size(20.0.w, 35.0.h),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              widget.sortNumber();
                            },
                            child: AutoSizeText(
                              '숫자정렬',
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              softWrap: true,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
                              minimumSize: Size(20.0.w, 35.0.h),
                            ))),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                          child: ElevatedButton(
                              onPressed: () {
                                widget.clearAllNumber();
                              },
                              child: Text(
                                '초기화',
                                softWrap: false,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                ),
                                minimumSize: Size(20.0.w, 35.0.h),
                              ))),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class button10ButtonBox extends StatefulWidget {
  button10ButtonBox(
      {Key? key,
      this.makeSelectNumber,
      this.removeBool,
      this.buttonBoxColorList})
      : super(key: key);
  var makeSelectNumber;
  var removeBool;
  var buttonBoxColorList;

  @override
  State<button10ButtonBox> createState() => _button10ButtonBoxState();
}

class _button10ButtonBoxState extends State<button10ButtonBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0.h),
        // height: 330,
        padding: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h),
        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        decoration: const BoxDecoration(
          color: Color(0xffe5e5e5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      widget.makeSelectNumber(1);
                    },
                    child: widget.buttonBoxColorList[0] == false
                        ? yellowBall(b: 1)
                        : xNumBall()),
                GestureDetector(
                    onTap: () {
                      widget.makeSelectNumber(2);
                    },
                    child: widget.buttonBoxColorList[1] == false
                        ? yellowBall(b: 2)
                        : xNumBall()),
                GestureDetector(
                    onTap: () {
                      widget.makeSelectNumber(3);
                    },
                    child: widget.buttonBoxColorList[2] == false
                        ? yellowBall(b: 3)
                        : xNumBall()),
                GestureDetector(
                    onTap: () {
                      widget.makeSelectNumber(4);
                    },
                    child: widget.buttonBoxColorList[3] == false
                        ? yellowBall(b: 4)
                        : xNumBall()),
                GestureDetector(
                    onTap: () {
                      widget.makeSelectNumber(5);
                    },
                    child: widget.buttonBoxColorList[4] == false
                        ? yellowBall(b: 5)
                        : xNumBall()),
                GestureDetector(
                    onTap: () {
                      widget.makeSelectNumber(6);
                    },
                    child: widget.buttonBoxColorList[5] == false
                        ? yellowBall(b: 6)
                        : xNumBall()),
                GestureDetector(
                    onTap: () {
                      widget.makeSelectNumber(7);
                    },
                    child: widget.buttonBoxColorList[6] == false
                        ? yellowBall(b: 7)
                        : xNumBall()),
              ],
            ),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(8);
                      },
                      child: widget.buttonBoxColorList[7] == false
                          ? yellowBall(b: 8)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(9);
                      },
                      child: widget.buttonBoxColorList[8] == false
                          ? yellowBall(b: 9)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(10);
                      },
                      child: widget.buttonBoxColorList[9] == false
                          ? yellowBall(b: 10)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(11);
                      },
                      child: widget.buttonBoxColorList[10] == false
                          ? blueBall(b: 11)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(12);
                      },
                      child: widget.buttonBoxColorList[11] == false
                          ? blueBall(b: 12)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(13);
                      },
                      child: widget.buttonBoxColorList[12] == false
                          ? blueBall(b: 13)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(14);
                      },
                      child: widget.buttonBoxColorList[13] == false
                          ? blueBall(b: 14)
                          : xNumBall()),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(15);
                      },
                      child: widget.buttonBoxColorList[14] == false
                          ? blueBall(b: 15)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(16);
                      },
                      child: widget.buttonBoxColorList[15] == false
                          ? blueBall(b: 16)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(17);
                      },
                      child: widget.buttonBoxColorList[16] == false
                          ? blueBall(b: 17)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(18);
                      },
                      child: widget.buttonBoxColorList[17] == false
                          ? blueBall(b: 18)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(19);
                      },
                      child: widget.buttonBoxColorList[18] == false
                          ? blueBall(b: 19)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(20);
                      },
                      child: widget.buttonBoxColorList[19] == false
                          ? blueBall(b: 20)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(21);
                      },
                      child: widget.buttonBoxColorList[20] == false
                          ? redBall(b: 21)
                          : xNumBall()),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(22);
                      },
                      child: widget.buttonBoxColorList[21] == false
                          ? redBall(b: 22)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(23);
                      },
                      child: widget.buttonBoxColorList[22] == false
                          ? redBall(b: 23)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(24);
                      },
                      child: widget.buttonBoxColorList[23] == false
                          ? redBall(b: 24)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(25);
                      },
                      child: widget.buttonBoxColorList[24] == false
                          ? redBall(b: 25)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(26);
                      },
                      child: widget.buttonBoxColorList[25] == false
                          ? redBall(b: 26)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(27);
                      },
                      child: widget.buttonBoxColorList[26] == false
                          ? redBall(b: 27)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(28);
                      },
                      child: widget.buttonBoxColorList[27] == false
                          ? redBall(b: 28)
                          : xNumBall()),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(29);
                      },
                      child: widget.buttonBoxColorList[28] == false
                          ? redBall(b: 29)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(30);
                      },
                      child: widget.buttonBoxColorList[29] == false
                          ? redBall(b: 30)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(31);
                      },
                      child: widget.buttonBoxColorList[30] == false
                          ? greyBall(b: 31)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(32);
                      },
                      child: widget.buttonBoxColorList[31] == false
                          ? greyBall(b: 32)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(33);
                      },
                      child: widget.buttonBoxColorList[32] == false
                          ? greyBall(b: 33)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(34);
                      },
                      child: widget.buttonBoxColorList[33] == false
                          ? greyBall(b: 34)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(35);
                      },
                      child: widget.buttonBoxColorList[34] == false
                          ? greyBall(b: 35)
                          : xNumBall()),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(36);
                      },
                      child: widget.buttonBoxColorList[35] == false
                          ? greyBall(b: 36)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(37);
                      },
                      child: widget.buttonBoxColorList[36] == false
                          ? greyBall(b: 37)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(38);
                      },
                      child: widget.buttonBoxColorList[37] == false
                          ? greyBall(b: 38)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(39);
                      },
                      child: widget.buttonBoxColorList[38] == false
                          ? greyBall(b: 39)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(40);
                      },
                      child: widget.buttonBoxColorList[39] == false
                          ? greyBall(b: 40)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(41);
                      },
                      child: widget.buttonBoxColorList[40] == false
                          ? greenBall(b: 41)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(42);
                      },
                      child: widget.buttonBoxColorList[41] == false
                          ? greenBall(b: 42)
                          : xNumBall()),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(43);
                      },
                      child: widget.buttonBoxColorList[42] == false
                          ? greenBall(b: 43)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(44);
                      },
                      child: widget.buttonBoxColorList[43] == false
                          ? greenBall(b: 44)
                          : xNumBall()),
                  GestureDetector(
                      onTap: () {
                        widget.makeSelectNumber(45);
                      },
                      child: widget.buttonBoxColorList[44] == false
                          ? greenBall(b: 45)
                          : xNumBall()),
                  const xColorBall(),
                  const xColorBall(),
                  const xColorBall(),
                  const xColorBall(),
                ]),
          )
        ]));
  }
}
