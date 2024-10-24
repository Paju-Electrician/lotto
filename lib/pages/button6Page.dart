import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lotto/pages/notification.dart';
import 'package:lotto/pages/sharedpreferences.dart';
import 'package:lotto/widget/mainWidgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'ad_number.dart';

class button6Page extends StatefulWidget {
  const button6Page({Key? key}) : super(key: key);

  @override
  State<button6Page> createState() => _button6PageState();
}

class _button6PageState extends State<button6Page> {


  BannerAd? banner;

  returnAd() {
    return banner == null
        ? Container()
    // : SizedBox(
    //     // height: 49.h,
    //     height: 49.h,
    //     child: AdWidget(ad: banner!),
    //   );

        : Container(
        height: 50.h,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 40.h),
        child: AdWidget(ad: banner!));
  }
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
    banner!.dispose();
    super.dispose();
  }

  final GlobalKey _textFieldKey = GlobalKey();

  List<bool> oneTextSwitch = [
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
  ];

  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _SearchText = '';
  List numButtonSwich = [
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

  var ball1Switch = false;
  var ball2Switch = false;
  var ball3Switch = false;
  var ball4Switch = false;
  var ball5Switch = false;
  var ball6Switch = false;

  var ball1num = 0;
  var ball2num = 0;
  var ball3num = 0;
  var ball4num = 0;
  var ball5num = 0;
  var ball6num = 0;
  var selectedBallNum = 0;

  allReset() {
    setState(() {
      for (int i = 0; i < 45; i++) {
        numButtonSwich[i] = false;
      }
      ball1Switch = false;
      ball2Switch = false;
      ball3Switch = false;
      ball4Switch = false;
      ball5Switch = false;
      ball6Switch = false;

      ball1num = 0;
      ball2num = 0;
      ball3num = 0;
      ball4num = 0;
      ball5num = 0;
      ball6num = 0;
      selectedBallNum = 0;
      _filter.clear();
    });
  }

  makeReset() {
    setState(() {
      if (selectedBallNum == 0) {
        ball1num = 0;
        ball2num = 0;
        ball3num = 0;
        ball4num = 0;
        ball5num = 0;
        ball6num = 0;
      } else if (selectedBallNum == 1) {
        ball2num = 0;
        ball3num = 0;
        ball4num = 0;
        ball5num = 0;
        ball6num = 0;
      } else if (selectedBallNum == 2) {
        ball3num = 0;
        ball4num = 0;
        ball5num = 0;
        ball6num = 0;
      } else if (selectedBallNum == 3) {
        ball4num = 0;
        ball5num = 0;
        ball6num = 0;
      } else if (selectedBallNum == 4) {
        ball5num = 0;
        ball6num = 0;
      } else if (selectedBallNum == 4) {
        ball6num = 0;
      }
    });
  }

  addBut() {
    _filter.clear();
    setState(() {
      if (ball1Switch == false && ball1num == 0) {
        ball1Switch = true;
        selectedBallNum = 0;
      } else if (ball2Switch == false && ball1num != 0) {
        ball2Switch = true;
        selectedBallNum = 1;
      } else if (ball3Switch == false && ball1num != 0 && ball2num != 0) {
        ball3Switch = true;
        selectedBallNum = 2;
      } else if (ball4Switch == false &&
          ball1num != 0 &&
          ball2num != 0 &&
          ball3num != 0) {
        ball4Switch = true;
        selectedBallNum = 3;
      } else if (ball5Switch == false &&
          ball1num != 0 &&
          ball2num != 0 &&
          ball3num != 0 &&
          ball4num != 0) {
        ball5Switch = true;
        selectedBallNum = 4;
      } else if (ball6Switch == false &&
          ball1num != 0 &&
          ball2num != 0 &&
          ball3num != 0 &&
          ball4num != 0 &&
          ball5num != 0) {
        ball6Switch = true;
        selectedBallNum = 5;
      }
    });
  }

  makeSameText2(String a, List<int> b) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("$a는 여러번호를 의미해요"),
                const Text("번호를 선택해주세요")
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[0] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[0] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[0] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[0]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[0] > 0 && b[0] < 11)
                            ? yellowBall(b: b[0])
                            : (b[0] > 10 && b[0] < 21)
                                ? blueBall(b: b[0])
                                : (b[0] > 20 && b[0] < 31)
                                    ? redBall(b: b[0])
                                    : (b[0] > 30 && b[0] < 41)
                                        ? greyBall(b: b[0])
                                        : greenBall(b: b[0])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[1] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[1] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[1] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[1]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[1] > 0 && b[1] < 11)
                            ? yellowBall(b: b[1])
                            : (b[1] > 10 && b[1] < 21)
                                ? blueBall(b: b[1])
                                : (b[1] > 20 && b[1] < 31)
                                    ? redBall(b: b[1])
                                    : (b[1] > 30 && b[1] < 41)
                                        ? greyBall(b: b[1])
                                        : greenBall(b: b[1]))],
                )
              ],
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: <Widget>[
              TextButton(
                child: const Text("아니오, 이어서 검색할래요"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  makeSameText3(String a, List<int> b) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("$a는 여러번호를 의미해요"),
                const Text("번호를 선택해주세요")
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[0] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[0] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[0] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[0]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[0] > 0 && b[0] < 11)
                            ? yellowBall(b: b[0])
                            : (b[0] > 10 && b[0] < 21)
                                ? blueBall(b: b[0])
                                : (b[0] > 20 && b[0] < 31)
                                    ? redBall(b: b[0])
                                    : (b[0] > 30 && b[0] < 41)
                                        ? greyBall(b: b[0])
                                        : greenBall(b: b[0])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[1] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[1] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[1] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[1]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[1] > 0 && b[1] < 11)
                            ? yellowBall(b: b[1])
                            : (b[1] > 10 && b[1] < 21)
                                ? blueBall(b: b[1])
                                : (b[1] > 20 && b[1] < 31)
                                    ? redBall(b: b[1])
                                    : (b[1] > 30 && b[1] < 41)
                                        ? greyBall(b: b[1])
                                        : greenBall(b: b[1])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[2] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[2] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[2] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[2]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[2] > 0 && b[2] < 11)
                            ? yellowBall(b: b[2])
                            : (b[2] > 10 && b[2] < 21)
                                ? blueBall(b: b[2])
                                : (b[2] > 20 && b[2] < 31)
                                    ? redBall(b: b[2])
                                    : (b[2] > 30 && b[2] < 41)
                                        ? greyBall(b: b[2])
                                        : greenBall(b: b[2]))],
                )
              ],
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: <Widget>[
              TextButton(
                child: const Text("아니오, 이어서 검색할래요"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  makeSameText4(String a, List<int> b) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("$a는 여러번호를 의미해요"),
                const Text("번호를 선택해주세요")
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[0] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[0] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[0] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[0]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[0] > 0 && b[0] < 11)
                            ? yellowBall(b: b[0])
                            : (b[0] > 10 && b[0] < 21)
                                ? blueBall(b: b[0])
                                : (b[0] > 20 && b[0] < 31)
                                    ? redBall(b: b[0])
                                    : (b[0] > 30 && b[0] < 41)
                                        ? greyBall(b: b[0])
                                        : greenBall(b: b[0])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[1] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[1] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[1] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[1]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[1] > 0 && b[1] < 11)
                            ? yellowBall(b: b[1])
                            : (b[1] > 10 && b[1] < 21)
                                ? blueBall(b: b[1])
                                : (b[1] > 20 && b[1] < 31)
                                    ? redBall(b: b[1])
                                    : (b[1] > 30 && b[1] < 41)
                                        ? greyBall(b: b[1])
                                        : greenBall(b: b[1])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[2] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[2] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[2] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[2]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[2] > 0 && b[2] < 11)
                            ? yellowBall(b: b[2])
                            : (b[2] > 10 && b[2] < 21)
                                ? blueBall(b: b[2])
                                : (b[2] > 20 && b[2] < 31)
                                    ? redBall(b: b[2])
                                    : (b[2] > 30 && b[2] < 41)
                                        ? greyBall(b: b[2])
                                        : greenBall(b: b[2])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[3] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[3] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[3] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[3]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[3] > 0 && b[3] < 11)
                            ? yellowBall(b: b[3])
                            : (b[3] > 10 && b[3] < 21)
                                ? blueBall(b: b[3])
                                : (b[3] > 20 && b[3] < 31)
                                    ? redBall(b: b[3])
                                    : (b[3] > 30 && b[3] < 41)
                                        ? greyBall(b: b[3])
                                        : greenBall(b: b[3])),
                  ],
                )
              ],
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: <Widget>[
              TextButton(
                child: const Text("아니오, 이어서 검색할래요"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  makeSameText5(String a, List<int> b) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("$a는 여러번호를 의미해요"),
                const Text("번호를 선택해주세요")
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[0] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[0] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[0] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[0]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[0] > 0 && b[0] < 11)
                            ? yellowBall(b: b[0])
                            : (b[0] > 10 && b[0] < 21)
                                ? blueBall(b: b[0])
                                : (b[0] > 20 && b[0] < 31)
                                    ? redBall(b: b[0])
                                    : (b[0] > 30 && b[0] < 41)
                                        ? greyBall(b: b[0])
                                        : greenBall(b: b[0])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[1] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[1] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[1] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[1]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[1] > 0 && b[1] < 11)
                            ? yellowBall(b: b[1])
                            : (b[1] > 10 && b[1] < 21)
                                ? blueBall(b: b[1])
                                : (b[1] > 20 && b[1] < 31)
                                    ? redBall(b: b[1])
                                    : (b[1] > 30 && b[1] < 41)
                                        ? greyBall(b: b[1])
                                        : greenBall(b: b[1])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[2] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[2] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[2] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[2]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[2] > 0 && b[2] < 11)
                            ? yellowBall(b: b[2])
                            : (b[2] > 10 && b[2] < 21)
                                ? blueBall(b: b[2])
                                : (b[2] > 20 && b[2] < 31)
                                    ? redBall(b: b[2])
                                    : (b[2] > 30 && b[2] < 41)
                                        ? greyBall(b: b[2])
                                        : greenBall(b: b[2])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[3] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[3] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[3] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[3]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[3] > 0 && b[3] < 11)
                            ? yellowBall(b: b[3])
                            : (b[3] > 10 && b[3] < 21)
                                ? blueBall(b: b[3])
                                : (b[3] > 20 && b[3] < 31)
                                    ? redBall(b: b[3])
                                    : (b[3] > 30 && b[3] < 41)
                                        ? greyBall(b: b[3])
                                        : greenBall(b: b[3])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[4] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[4] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[4] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[4]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[4] > 0 && b[4] < 11)
                            ? yellowBall(b: b[4])
                            : (b[4] > 10 && b[4] < 21)
                                ? blueBall(b: b[4])
                                : (b[4] > 20 && b[4] < 31)
                                    ? redBall(b: b[4])
                                    : (b[4] > 30 && b[4] < 41)
                                        ? greyBall(b: b[4])
                                        : greenBall(b: b[4])),
                  ],
                )
              ],
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: <Widget>[
              TextButton(
                child: const Text("아니오, 이어서 검색할래요"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  makeSameText6(String a, List<int> b) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("$a는 여러번호를 의미해요"),
                const Text("번호를 선택해주세요")
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[0] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[0] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[0] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[0]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[0] > 0 && b[0] < 11)
                            ? yellowBall(b: b[0])
                            : (b[0] > 10 && b[0] < 21)
                                ? blueBall(b: b[0])
                                : (b[0] > 20 && b[0] < 31)
                                    ? redBall(b: b[0])
                                    : (b[0] > 30 && b[0] < 41)
                                        ? greyBall(b: b[0])
                                        : greenBall(b: b[0])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[1] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[1] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[1] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[1]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[1] > 0 && b[1] < 11)
                            ? yellowBall(b: b[1])
                            : (b[1] > 10 && b[1] < 21)
                                ? blueBall(b: b[1])
                                : (b[1] > 20 && b[1] < 31)
                                    ? redBall(b: b[1])
                                    : (b[1] > 30 && b[1] < 41)
                                        ? greyBall(b: b[1])
                                        : greenBall(b: b[1])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[2] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[2] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[2] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[2]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[2] > 0 && b[2] < 11)
                            ? yellowBall(b: b[2])
                            : (b[2] > 10 && b[2] < 21)
                                ? blueBall(b: b[2])
                                : (b[2] > 20 && b[2] < 31)
                                    ? redBall(b: b[2])
                                    : (b[2] > 30 && b[2] < 41)
                                        ? greyBall(b: b[2])
                                        : greenBall(b: b[2])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[3] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[3] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[3] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[3]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[3] > 0 && b[3] < 11)
                            ? yellowBall(b: b[3])
                            : (b[3] > 10 && b[3] < 21)
                                ? blueBall(b: b[3])
                                : (b[3] > 20 && b[3] < 31)
                                    ? redBall(b: b[3])
                                    : (b[3] > 30 && b[3] < 41)
                                        ? greyBall(b: b[3])
                                        : greenBall(b: b[3])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[4] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[4] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[4] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[4]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[4] > 0 && b[4] < 11)
                            ? yellowBall(b: b[4])
                            : (b[4] > 10 && b[4] < 21)
                                ? blueBall(b: b[4])
                                : (b[4] > 20 && b[4] < 31)
                                    ? redBall(b: b[4])
                                    : (b[4] > 30 && b[4] < 41)
                                        ? greyBall(b: b[4])
                                        : greenBall(b: b[4])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[5] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[5] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[5] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[5]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[5] > 0 && b[5] < 11)
                            ? yellowBall(b: b[5])
                            : (b[5] > 10 && b[5] < 21)
                                ? blueBall(b: b[5])
                                : (b[5] > 20 && b[5] < 31)
                                    ? redBall(b: b[5])
                                    : (b[5] > 30 && b[5] < 41)
                                        ? greyBall(b: b[5])
                                        : greenBall(b: b[5])),
                  ],
                )
              ],
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: <Widget>[
              TextButton(
                child: const Text("아니오, 이어서 검색할래요"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  makeSameText7(String a, List<int> b) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("$a는 여러번호를 의미해요"),
                const Text("번호를 선택해주세요")
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[0] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[0] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[0] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[0]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[0] > 0 && b[0] < 11)
                            ? yellowBall(b: b[0])
                            : (b[0] > 10 && b[0] < 21)
                                ? blueBall(b: b[0])
                                : (b[0] > 20 && b[0] < 31)
                                    ? redBall(b: b[0])
                                    : (b[0] > 30 && b[0] < 41)
                                        ? greyBall(b: b[0])
                                        : greenBall(b: b[0])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[1] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[1] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[1] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[1]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[1] > 0 && b[1] < 11)
                            ? yellowBall(b: b[1])
                            : (b[1] > 10 && b[1] < 21)
                                ? blueBall(b: b[1])
                                : (b[1] > 20 && b[1] < 31)
                                    ? redBall(b: b[1])
                                    : (b[1] > 30 && b[1] < 41)
                                        ? greyBall(b: b[1])
                                        : greenBall(b: b[1])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[2] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[2] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[2] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[2]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[2] > 0 && b[2] < 11)
                            ? yellowBall(b: b[2])
                            : (b[2] > 10 && b[2] < 21)
                                ? blueBall(b: b[2])
                                : (b[2] > 20 && b[2] < 31)
                                    ? redBall(b: b[2])
                                    : (b[2] > 30 && b[2] < 41)
                                        ? greyBall(b: b[2])
                                        : greenBall(b: b[2])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[3] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[3] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[3] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[3]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[3] > 0 && b[3] < 11)
                            ? yellowBall(b: b[3])
                            : (b[3] > 10 && b[3] < 21)
                                ? blueBall(b: b[3])
                                : (b[3] > 20 && b[3] < 31)
                                    ? redBall(b: b[3])
                                    : (b[3] > 30 && b[3] < 41)
                                        ? greyBall(b: b[3])
                                        : greenBall(b: b[3])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[4] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[4] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[4] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[4]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[4] > 0 && b[4] < 11)
                            ? yellowBall(b: b[4])
                            : (b[4] > 10 && b[4] < 21)
                                ? blueBall(b: b[4])
                                : (b[4] > 20 && b[4] < 31)
                                    ? redBall(b: b[4])
                                    : (b[4] > 30 && b[4] < 41)
                                        ? greyBall(b: b[4])
                                        : greenBall(b: b[4])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[5] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[5] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[5] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[5]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[5] > 0 && b[5] < 11)
                            ? yellowBall(b: b[5])
                            : (b[5] > 10 && b[5] < 21)
                                ? blueBall(b: b[5])
                                : (b[5] > 20 && b[5] < 31)
                                    ? redBall(b: b[5])
                                    : (b[5] > 30 && b[5] < 41)
                                        ? greyBall(b: b[5])
                                        : greenBall(b: b[5])),
                    GestureDetector(
                        onTap: () {
                          if (numButtonSwich[b[6] - 1] == false) {
                            setState(() {
                              for (int i = 0; i < 45; i++) {
                                numButtonSwich[i] = false;
                              }
                              numButtonSwich[b[6] - 1] = true;
                            });
                          } else {
                            setState(() {
                              numButtonSwich[b[6] - 1] = false;
                            });
                          }
                          makeBall();
                          alreadyNum(b[6]);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: (b[6] > 0 && b[6] < 11)
                            ? yellowBall(b: b[6])
                            : (b[6] > 10 && b[6] < 21)
                                ? blueBall(b: b[6])
                                : (b[6] > 20 && b[6] < 31)
                                    ? redBall(b: b[6])
                                    : (b[6] > 30 && b[6] < 41)
                                        ? greyBall(b: b[6])
                                        : greenBall(b: b[6])),
                  ],
                )
              ],
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: <Widget>[
              TextButton(
                child: const Text("아니오, 이어서 검색할래요"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  makeBall() {
    if (_SearchText == '') {
      makeReset();
    }

    if (_SearchText == '가게') {
      makeSameText3('가게', [5, 33, 39]);
    }
    if (_SearchText == '가구') {
      makeSameText2('가구', [1, 4]);
    }
    if (_SearchText == '가랑비') {
      makeSameText3('가랑비', [1, 11, 18]);
    }
    if (_SearchText == '가락지') {
      makeSameText5('가락지', [9, 10, 20, 30, 40]);
    }
    if (_SearchText == '가래떡') {
      makeSameText6('가래떡', [1, 11, 12, 21, 31, 41]);
    }
    if (_SearchText == '가로세로퀴즈') {
      makeSameText2('가로세로퀴즈', [10, 18]);
    }
    if (_SearchText == '가르마') {
      makeSameText2('가르마', [3, 16]);
    }
    if (_SearchText == '가수') {
      makeSameText2('가수', [4, 6]);
    }
    if (_SearchText == '가슴') {
      makeSameText2('가슴', [3, 12]);
    }
    if (_SearchText == '가시') {
      makeSameText6('가시', [1, 4, 11, 21, 31, 41]);
    }
    if (_SearchText == '가위') {
      makeSameText4('가위', [1, 4, 10, 15]);
    }

    if (_SearchText == '가재') {
      makeSameText2('가재', [6, 12]);
    }
    if (_SearchText == '가지') {
      makeSameText2('가지', [5, 6]);
    }
    if (_SearchText == '각목') {
      makeSameText2('각목', [1, 14]);
    }
    if (_SearchText == '간호사') {
      makeSameText2('간호사', [1, 37]);
    }
    if (_SearchText == '갈대') {
      makeSameText2('갈대', [7, 8]);
    }
    if (_SearchText == '갈매기') {
      makeSameText2('갈매기', [3, 20]);
    }
    if (_SearchText == '감' && oneTextSwitch[0] == false) {
      setState(() {
        oneTextSwitch[0] = true;
      });
      _filter.clear();
      makeSameText5('감', [8, 10, 20, 30, 40]);
    }
    if (_SearchText == '감옥') {
      makeSameText2('감옥', [11, 25]);
    }
    if (_SearchText == '갓난아이') {
      makeSameText2('갓난아이', [14, 20]);
    }
    // if(_SearchText == '강'&&oneTextSwitch[1]==false) {
    //   setState(() {
    //     oneTextSwitch[1]=true;
    //   });
    //   _filter.clear();
    //   makeSameText4('강',[1,8,13,34]);
    // }
    if (_SearchText == '강간') {
      makeSameText2('강간', [16, 31]);
    }
    if (_SearchText == '강강술래') {
      makeSameText5('강강술래', [10, 20, 30, 36, 40]);
    }
    if (_SearchText == '강낭콩') {
      makeSameText2('강낭콩', [40, 42]);
    }
    if (_SearchText == '강도') {
      makeSameText2('강도', [4, 16]);
    }
    if (_SearchText == '강물다리') {
      makeSameText2('강물다리', [6, 38]);
    }
    if (_SearchText == '강아지') {
      makeSameText2('강아지', [3, 28]);
    }
    if (_SearchText == '개') {
      makeSameText3('개', [3, 8, 33]);
    }
    if (_SearchText == '개기월식') {
      makeSameText3('개기월식', [5, 23, 24]);
    }
    if (_SearchText == '개기일식') {
      makeSameText5('개기일식', [10, 20, 22, 30, 40]);
    }
    if (_SearchText == '개미') {
      makeSameText2('개미', [8, 12]);
    }
    if (_SearchText == '개울') {
      makeSameText3('개울', [3, 17, 19]);
    }
    if (_SearchText == '갯지렁이') {
      makeSameText2('갯지렁이', [1, 33]);
    }
    if (_SearchText == '거래처') {
      makeSameText2('거래처', [9, 35]);
    }
    if (_SearchText == '거미') {
      makeSameText2('거미', [8, 10]);
    }
    if (_SearchText == '거울') {
      makeSameText5('거울', [10, 16, 20, 30, 40]);
    }
    if (_SearchText == '거위') {
      makeSameText2('거위', [2, 15]);
    }
    if (_SearchText == '거인') {
      makeSameText2('거인', [9, 15]);
    }
    if (_SearchText == '거짓말') {
      makeSameText2('거짓말', [22, 28]);
    }
    if (_SearchText == '거품') {
      makeSameText5('거품', [10, 16, 20, 30, 40]);
    }
    if (_SearchText == '건달') {
      makeSameText2('건달', [8, 19]);
    }
    if (_SearchText == '건물키') {
      makeSameText2('건물키', [7, 22]);
    }
    if (_SearchText == '검사') {
      makeSameText2('검사', [12, 21]);
    }
    if (_SearchText == '검은콩') {
      makeSameText4('검은콩', [10, 20, 30, 40]);
    }
    if (_SearchText == '검정돼지') {
      makeSameText2('검정돼지', [8, 41]);
    }
    if (_SearchText == '검정색') {
      makeSameText7('검정색', [10, 20, 30, 32, 33, 37, 40]);
    }
    if (_SearchText == '검정색자동차') {
      makeSameText2('검정색자동차', [19, 34]);
    }
    if (_SearchText == '검정옷') {
      makeSameText2('검정옷', [40, 42]);
    }
    if (_SearchText == '겨울') {
      makeSameText2('겨울', [4, 17]);
    }
    if (_SearchText == '결혼식') {
      makeSameText2('결혼식', [38, 41]);
    }
    if (_SearchText == '계란') {
      makeSameText5('계란', [8, 10, 20, 30, 40]);
    }
    if (_SearchText == '고구마밭') {
      makeSameText2('고구마밭', [14, 24]);
    }
    if (_SearchText == '고급승용차') {
      makeSameText3('고급승용차', [1, 20, 45]);
    }
    if (_SearchText == '고목') {
      makeSameText2('고목', [11, 12]);
    }
    if (_SearchText == '고무대야') {
      makeSameText2('고무대야', [22, 37]);
    }
    if (_SearchText == '고소') {
      makeSameText2('고소', [4, 5]);
    }
    if (_SearchText == '고스톱') {
      makeSameText2('고스톱', [9, 37, 38]);
    }
    if (_SearchText == '고슴도치') {
      makeSameText2('고슴도치', [11, 24]);
    }
    if (_SearchText == '고추') {
      makeSameText2('고추', [1, 5]);
    }
    if (_SearchText == '곡괭이') {
      makeSameText2('곡괭이', [7, 30]);
    }
    if (_SearchText == '골키퍼') {
      makeSameText2('골키퍼', [10, 11]);
    }
    if (_SearchText == '골프공') {
      makeSameText4('골프공', [10, 20, 30, 40]);
    }
    if (_SearchText == '골프채') {
      makeSameText2('골프채', [1, 12]);
    }
    // if(_SearchText == '곰') {
    //   // FocusScope.of(context).requestFocus(FocusNode());
    //
    //   makeSameText5('곰',[1,3,8,16,24]);
    //
    //
    // }
    // if(_SearchText == '공'&&oneTextSwitch[3]==false) {
    //   setState(() {
    //     oneTextSwitch[3]=true;
    //   });
    //   _filter.clear();
    //   makeSameText5('공',[10,13,20,30,40]);
    // }
    if (_SearchText == '공깃돌') {
      makeSameText4('공깃돌', [10, 20, 30, 40]);
    }
    if (_SearchText == '공예') {
      makeSameText2('공예', [1, 27]);
    }
    if (_SearchText == '공짜') {
      makeSameText5('공짜', [10, 18, 20, 30, 40]);
    }
    if (_SearchText == '과녘') {
      makeSameText2('과녘', [8, 40]);
    }
    if (_SearchText == '과일') {
      makeSameText5('과일', [10, 17, 20, 30, 40]);
    }
    // if(_SearchText == '관'&&oneTextSwitch[4]==false) {
    //   setState(() {
    //     oneTextSwitch[4]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('관',[4,44]);
    // }
    if (_SearchText == '관광버스') {
      makeSameText2('관광버스', [4, 22]);
    }
    if (_SearchText == '관기') {
      makeSameText2('관기', [6, 16]);
    }
    if (_SearchText == '광대') {
      makeSameText2('광대', [18, 19]);
    }
    if (_SearchText == '괴물') {
      makeSameText2('괴물', [6, 16, 44]);
    }
    if (_SearchText == '교도소') {
      makeSameText2('교도소', [8, 11, 25]);
    }
    if (_SearchText == '교사') {
      makeSameText2('교사', [32, 33]);
    }
    if (_SearchText == '교실') {
      makeSameText2('교실', [7, 36]);
    }
    if (_SearchText == '교장선생님') {
      makeSameText2('교장선생님', [11, 17]);
    }
    if (_SearchText == '교차로') {
      makeSameText2('교차로', [9, 10]);
    }
    if (_SearchText == '교차로신문') {
      makeSameText2('교차로신문', [10, 32]);
    }
    if (_SearchText == '교통사고') {
      makeSameText2('교통사고', [22, 44]);
    }
    if (_SearchText == '교회') {
      makeSameText2('교회', [10, 36]);
    }
    if (_SearchText == '구경') {
      makeSameText2('구경', [11, 18]);
    }
    if (_SearchText == '구기자') {
      makeSameText2('구기자', [7, 24]);
    }
    if (_SearchText == '구더기') {
      makeSameText2('구더기', [1, 7]);
    }
    if (_SearchText == '구덩이') {
      makeSameText5('구덩이', [10, 20, 28, 30, 40]);
    }
    if (_SearchText == '구두') {
      makeSameText3('구두', [5, 7, 9]);
    }
    if (_SearchText == '구렁이') {
      makeSameText2('구렁이', [9, 28]);
    }
    if (_SearchText == '구루마') {
      makeSameText2('구루마', [16, 18]);
    }
    if (_SearchText == '구름') {
      makeSameText2('구름', [9, 14]);
    }
    if (_SearchText == '구멍') {
      makeSameText2('구멍', [9, 23]);
    }
    if (_SearchText == '구멍가게') {
      makeSameText2('구멍가게', [33, 38]);
    }
    if (_SearchText == '구명보트') {
      makeSameText2('구명보트', [6, 37]);
    }
    if (_SearchText == '구미호') {
      makeSameText2('구미호', [9, 44]);
    }
    if (_SearchText == '귀') {
      makeSameText3('귀', [3, 8, 20]);
    }
    if (_SearchText == '귀걸이') {
      makeSameText2('귀걸이', [6, 19]);
    }
    if (_SearchText == '귀신') {
      makeSameText3('귀신', [6, 26, 44]);
    }
    if (_SearchText == '귀지') {
      makeSameText2('귀지', [6, 7]);
    }
    if (_SearchText == '귤') {
      makeSameText3('귤', [5, 18, 20]);
    }
    if (_SearchText == '그네') {
      makeSameText3('그네', [5, 7, 11]);
    }
    if (_SearchText == '극장') {
      makeSameText2('극장', [17, 41]);
    }
    // if(_SearchText == '금'&&oneTextSwitch[5]==false) {
    //   setState(() {
    //     oneTextSwitch[5]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('금',[11,12]);
    // }
    if (_SearchText == '금메달') {
      makeSameText2('금메달', [1, 27]);
    }
    if (_SearchText == '금부처') {
      makeSameText2('금부처', [1, 3]);
    }
    if (_SearchText == '급경사') {
      makeSameText2('급경사', [9, 19]);
    }
    if (_SearchText == '기도') {
      makeSameText2('기도', [5, 11]);
    }
    if (_SearchText == '기린') {
      makeSameText2('기린', [6, 7]);
    }
    if (_SearchText == '기자') {
      makeSameText2('기자', [13, 31]);
    }
    if (_SearchText == '기차') {
      makeSameText2('기차', [1, 5]);
    }
    if (_SearchText == '기찻길') {
      makeSameText2('기찻길', [10, 11]);
    }
    if (_SearchText == '기프트콘') {
      makeSameText2('기프트콘', [14, 16]);
    }
    if (_SearchText == '김장') {
      makeSameText2('김장', [26, 27]);
    }
    if (_SearchText == '까투리') {
      makeSameText2('까투리', [10, 15]);
    }
    if (_SearchText == '깡패') {
      makeSameText2('깡패', [8, 19]);
    }
    if (_SearchText == '꿈') {
      makeSameText3('꿈', [2, 10, 19]);
    }
    if (_SearchText == '꿩') {
      makeSameText2('꿩', [10, 15]);
    }
    if (_SearchText == '끈끈이주걱') {
      makeSameText2('끈끈이주걱', [23, 26]);
    }
    if (_SearchText == '나무기둥') {
      makeSameText6('나무기둥', [1, 11, 21, 31, 33, 41]);
    }
    if (_SearchText == '나무젓가락') {
      makeSameText2('나무젓가락', [11, 30]);
    }
    if (_SearchText == '나병') {
      makeSameText2('나병', [9, 16]);
    }
    if (_SearchText == '낚시') {
      makeSameText3('낚시', [1, 6, 11]);
    }
    // if(_SearchText == '난'&&oneTextSwitch[6]==false) {
    //   setState(() {
    //     oneTextSwitch[6]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('난',[1,6]);
    // }
    if (_SearchText == '난로') {
      makeSameText2('난로', [6, 10]);
    }
    if (_SearchText == '날개') {
      makeSameText2('날개', [3, 7]);
    }
    if (_SearchText == '남자가슴') {
      makeSameText2('남자가슴', [8, 12, 27]);
    }
    if (_SearchText == '남학생') {
      makeSameText2('남학생', [17, 18]);
    }
    // if(_SearchText == '낫'&&oneTextSwitch[7]==false) {
    //   setState(() {
    //     oneTextSwitch[7]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('낫',[3,7]);
    // }
    if (_SearchText == '낭떠러지') {
      makeSameText2('낭떠러지', [9, 24]);
    }
    if (_SearchText == '내리막길') {
      makeSameText3('내리막길', [9, 19, 28]);
    }
    if (_SearchText == '네모난쟁반') {
      makeSameText5('네모난쟁반', [4, 14, 24, 34, 44]);
    }
    if (_SearchText == '네잎클로버') {
      makeSameText2('네잎클로버', [4, 7]);
    }
    if (_SearchText == '노란색') {
      makeSameText5('노란색', [3, 13, 23, 33, 43]);
    }
    if (_SearchText == '노름') {
      makeSameText2('노름', [6, 14]);
    }
    if (_SearchText == '노을') {
      makeSameText6('노을', [1, 11, 16, 21, 31, 41]);
    }
    if (_SearchText == '노트') {
      makeSameText2('노트', [5, 6]);
    }
    if (_SearchText == '녹색') {
      makeSameText5('녹색', [4, 14, 24, 34, 44]);
    }
    if (_SearchText == '녹용') {
      makeSameText2('녹용', [1, 27]);
    }
    if (_SearchText == '논') {
      makeSameText3('논', [3, 7, 18]);
    }
    if (_SearchText == '놀이공원') {
      makeSameText2('놀이공원', [31, 43]);
    }
    // if(_SearchText == '눈'&&oneTextSwitch[8]==false) {
    //   setState(() {
    //     oneTextSwitch[8]=true;
    //   });
    //   _filter.clear();
    //   makeSameText5('눈',[1,10,20,30,40]);
    // }
    if (_SearchText == '눈사람') {
      makeSameText2('눈사람', [8, 20]);
    }
    if (_SearchText == '다래') {
      makeSameText2('다래', [7, 24]);
    }
    if (_SearchText == '다방') {
      makeSameText2('다방', [11, 16]);
    }
    if (_SearchText == '다이아몬드') {
      makeSameText2('다이아몬드', [3, 28]);
    }
    if (_SearchText == '단독주택') {
      makeSameText2('단독주택', [4, 17]);
    }
    if (_SearchText == '단발머리') {
      makeSameText2('단발머리', [1, 28]);
    }
    if (_SearchText == '단비') {
      makeSameText6('단비', [2, 11, 12, 22, 32, 42]);
    }
    if (_SearchText == '단속') {
      makeSameText2('단속', [7, 34]);
    }
    if (_SearchText == '단오') {
      makeSameText2('단오', [15, 21]);
    }
    if (_SearchText == '단지') {
      makeSameText2('단지', [7, 13]);
    }
    if (_SearchText == '단추') {
      makeSameText5('단추', [7, 10, 20, 30, 40]);
    }
    if (_SearchText == '단호박') {
      makeSameText2('단호박', [24, 39]);
    }
    // if(_SearchText == '달'&&oneTextSwitch[9]==false) {
    //   setState(() {
    //     oneTextSwitch[9]=true;
    //   });
    //   _filter.clear();
    //   makeSameText5('달',[5,10,20,30,40]);
    // }
    if (_SearchText == '달걀') {
      makeSameText5('달걀', [8, 10, 20, 30, 40]);
    }
    if (_SearchText == '달팽이') {
      makeSameText3('달팽이', [6, 9, 33]);
    }
    if (_SearchText == '닭') {
      makeSameText6('닭', [6, 16, 26, 29, 36, 46]);
    }
    if (_SearchText == '닭고기') {
      makeSameText2('닭고기', [10, 21]);
    }
    if (_SearchText == '담배꽁초') {
      makeSameText6('담배꽁초', [1, 11, 17, 21, 31, 41]);
    }
    if (_SearchText == '담벼락') {
      makeSameText2('담벼락', [10, 24]);
    }
    if (_SearchText == '당구') {
      makeSameText5('당구', [10, 16, 20, 30, 40]);
    }
    if (_SearchText == '당근') {
      makeSameText2('당근', [17, 25]);
    }
    if (_SearchText == '대나무') {
      makeSameText3('대나무', [1, 11, 18]);
    }
    if (_SearchText == '대머리') {
      makeSameText4('대머리', [10, 20, 30, 40]);
    }
    if (_SearchText == '대벌레') {
      makeSameText2('대벌레', [8, 12]);
    }
    if (_SearchText == '대파') {
      makeSameText2('대파', [1, 8]);
    }
    if (_SearchText == '대학교수') {
      makeSameText2('대학교수', [42, 45]);
    }
    if (_SearchText == '댄서') {
      makeSameText2('댄서', [7, 42]);
    }
    if (_SearchText == '덤프트럭') {
      makeSameText2('덤프트럭', [7, 34]);
    }
    if (_SearchText == '덧니') {
      makeSameText2('덧니', [6, 26]);
    }
    if (_SearchText == '도끼') {
      makeSameText2('도끼', [6, 7]);
    }
    if (_SearchText == '도너츠') {
      makeSameText6('도너츠', [8, 9, 10, 20, 30, 40]);
    }
    if (_SearchText == '도둑') {
      makeSameText3('도둑', [7, 12, 22]);
    }
    if (_SearchText == '도망') {
      makeSameText2('도망', [24, 25]);
    }
    if (_SearchText == '도면') {
      makeSameText2('도면', [11, 16]);
    }
    if (_SearchText == '도박') {
      makeSameText2('도박', [6, 27]);
    }
    if (_SearchText == '도배') {
      makeSameText2('도배', [6, 11]);
    }
    if (_SearchText == '도사') {
      makeSameText2('도사', [1, 42]);
    }
    if (_SearchText == '도시') {
      makeSameText5('도시', [5, 15, 25, 35, 45]);
    }
    if (_SearchText == '도토리나무') {
      makeSameText2('도토리나무', [30, 36]);
    }
    if (_SearchText == '독') {
      makeSameText2('독', [4, 29]);
    }
    if (_SearchText == '독사') {
      makeSameText2('독사', [6, 44]);
    }
    // if(_SearchText == '돈'&&oneTextSwitch[10]==false) {
    //   setState(() {
    //     oneTextSwitch[10]=true;
    //   });
    //   _filter.clear();
    //   makeSameText6('돈',[4,9,10,20,30,40]);
    // }
    if (_SearchText == '돌') {
      makeSameText4('돌', [1, 5, 9, 18]);
    }
    if (_SearchText == '돌계단') {
      makeSameText2('돌계단', [8, 13]);
    }
    if (_SearchText == '돌잔치') {
      makeSameText2('돌잔치', [1, 12]);
    }
    if (_SearchText == '동굴') {
      makeSameText4('동굴', [10, 20, 30, 40]);
    }
    if (_SearchText == '동굴물') {
      makeSameText2('동굴물', [18, 37]);
    }
    if (_SearchText == '동성애') {
      makeSameText2('동성애', [8, 40]);
    }
    if (_SearchText == '동전') {
      makeSameText5('동전', [10, 18, 20, 30, 40]);
    }
    if (_SearchText == '돼지') {
      makeSameText3('돼지', [7, 8, 12]);
    }
    if (_SearchText == '돼지코') {
      makeSameText2('돼지코', [8, 11]);
    }
    if (_SearchText == '된장찌개') {
      makeSameText2('된장찌개', [8, 27]);
    }
    if (_SearchText == '두릅') {
      makeSameText2('두릅', [24, 28]);
    }
    if (_SearchText == '두부') {
      makeSameText2('두부', [4, 5]);
    }
    if (_SearchText == '등대') {
      makeSameText3('등대', [9, 18, 38]);
    }
    if (_SearchText == '땅') {
      makeSameText2('땅', [1, 16]);
    }
    if (_SearchText == '떡') {
      makeSameText4('떡', [6, 16, 26, 36]);
    }
    if (_SearchText == '뗏목') {
      makeSameText2('뗏목', [11, 22]);
    }
    if (_SearchText == '뜨개질') {
      makeSameText2('뜨개질', [1, 13]);
    }
    if (_SearchText == '라면') {
      makeSameText2('라면', [11, 16]);
    }
    if (_SearchText == '랜턴') {
      makeSameText2('랜턴', [10, 38]);
    }
    if (_SearchText == '램프') {
      makeSameText2('램프', [20, 38]);
    }
    if (_SearchText == '런닝') {
      makeSameText2('런닝', [17, 29]);
    }
    if (_SearchText == '로또') {
      makeSameText4('로또', [6, 7, 21, 45]);
    }
    if (_SearchText == '롯데') {
      makeSameText3('롯데', [8, 15, 45]);
    }
    if (_SearchText == '리본') {
      makeSameText2('리본', [6, 8]);
    }
    if (_SearchText == '리포터') {
      makeSameText2('리포터', [31, 34]);
    }
    if (_SearchText == '마사지') {
      makeSameText2('마사지', [16, 20]);
    }
    if (_SearchText == '마을') {
      makeSameText2('마을', [25, 37]);
    }
    if (_SearchText == '마이크') {
      makeSameText2('마이크', [26, 27]);
    }
    if (_SearchText == '막대기') {
      makeSameText6('막대기', [1, 11, 20, 21, 31, 41]);
    }
    // if(_SearchText == '말'&&oneTextSwitch[11]==false) {
    //   setState(() {
    //     oneTextSwitch[11]=true;
    //   });
    //   _filter.clear();
    //   makeSameText3('말',[7,10,24]);
    // }
    if (_SearchText == '망치') {
      makeSameText2('망치', [7, 25]);
    }
    if (_SearchText == '매') {
      makeSameText2('매', [8, 33]);
    }
    if (_SearchText == '매니큐어') {
      makeSameText2('매니큐어', [34, 35]);
    }
    if (_SearchText == '머리') {
      makeSameText2('머리', [12, 27]);
    }
    if (_SearchText == '머리염색') {
      makeSameText2('머리염색', [28, 41]);
    }
    if (_SearchText == '머리카락') {
      makeSameText2('머리카락', [1, 11, 26]);
    }
    if (_SearchText == '머리폭발') {
      makeSameText2('머리폭발', [9, 12]);
    }
    if (_SearchText == '머리피몰림') {
      makeSameText2('머리피몰림', [4, 12]);
    }
    if (_SearchText == '머리핀') {
      makeSameText2('머리핀', [1, 22]);
    }
    if (_SearchText == '머플러') {
      makeSameText2('머플러', [24, 25]);
    }
    if (_SearchText == '먼지') {
      makeSameText5('먼지', [10, 14, 20, 30, 40]);
    }
    if (_SearchText == '모임') {
      makeSameText2('모임', [25, 39]);
    }
    if (_SearchText == '모종') {
      makeSameText2('모종', [1, 25]);
    }
    // if(_SearchText == '목'&&oneTextSwitch[12]==false) {
    //   setState(() {
    //     oneTextSwitch[12]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('목',[8,23]);
    // }
    if (_SearchText == '목사') {
      makeSameText2('목사', [10, 21]);
    }
    if (_SearchText == '목화') {
      makeSameText2('목화', [14, 44]);
    }
    // if(_SearchText == '못'&&oneTextSwitch[13]==false) {
    //   setState(() {
    //     oneTextSwitch[13]=true;
    //   });
    //   _filter.clear();
    //   makeSameText6('못',[1,8,11,21,31,41]);
    // }
    if (_SearchText == '몽둥이') {
      makeSameText6('몽둥이', [1, 5, 11, 21, 31, 41]);
    }
    if (_SearchText == '묘지') {
      makeSameText2('묘지', [3, 14, 17]);
    }
    if (_SearchText == '무궁화') {
      makeSameText3('무궁화', [13, 14]);
    }
    if (_SearchText == '무기') {
      makeSameText2('무기', [1, 10]);
    }
    if (_SearchText == '무덤') {
      makeSameText2('무덤', [3, 17]);
    }
    if (_SearchText == '무릎') {
      makeSameText2('무릎', [18, 33]);
    }
    // if(_SearchText == '물'&&oneTextSwitch[14]==false) {
    //   setState(() {
    //     oneTextSwitch[14]=true;
    //   });
    //   _filter.clear();
    //   makeSameText4('물',[3,10,16,39]);
    // }
    if (_SearchText == '물벼락') {
      makeSameText2('물벼락', [3, 10]);
    }
    if (_SearchText == '미꾸라지') {
      makeSameText2('미꾸라지', [5, 24]);
    }
    if (_SearchText == '미로') {
      makeSameText2('미로', [8, 12]);
    }
    if (_SearchText == '미용실') {
      makeSameText2('미용실', [33, 42]);
    }
    if (_SearchText == '미치광이') {
      makeSameText2('미치광이', [34, 44]);
    }
    if (_SearchText == '바느질') {
      makeSameText2('바느질', [1, 9]);
    }
    if (_SearchText == '바늘') {
      makeSameText2('바늘', [1, 11]);
    }
    if (_SearchText == '바늘과실') {
      makeSameText2('바늘과실', [1, 11]);
    }
    if (_SearchText == '바다') {
      makeSameText2('바다', [1, 5]);
    }
    if (_SearchText == '바다게') {
      makeSameText2('바다게', [8, 9]);
    }
    if (_SearchText == '바바리코트') {
      makeSameText2('바바리코트', [14, 24]);
    }
    if (_SearchText == '박수') {
      makeSameText3('박수', [5, 8, 11]);
    }
    if (_SearchText == '박스') {
      makeSameText5('박스', [4, 14, 24, 34, 44]);
    }
    if (_SearchText == '반지') {
      makeSameText2('반지', [6, 30]);
    }
    if (_SearchText == '반짝임') {
      makeSameText2('반짝임', [24, 38]);
    }
    // if(_SearchText == '발'&&oneTextSwitch[15]==false) {
    //   setState(() {
    //     oneTextSwitch[15]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('발',[4,22]);
    // }
    if (_SearchText == '발가락') {
      makeSameText2('발가락', [10, 34]);
    }
    if (_SearchText == '발가벗음') {
      makeSameText2('발가벗음', [12, 29]);
    }
    if (_SearchText == '발등') {
      makeSameText2('발등', [16, 41]);
    }
    if (_SearchText == '발목') {
      makeSameText2('발목', [16, 31]);
    }
    if (_SearchText == '발자국') {
      makeSameText2('발자국', [8, 10]);
    }
    if (_SearchText == '발톱') {
      makeSameText2('발톱', [9, 32]);
    }
    // if(_SearchText == '밥'&&oneTextSwitch[16]==false) {
    //   setState(() {
    //     oneTextSwitch[16]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('밥',[3,23]);
    // }
    if (_SearchText == '밧줄') {
      makeSameText3('밧줄', [1, 7, 8]);
    }
    if (_SearchText == '방구') {
      makeSameText2('방구', [15, 19]);
    }
    if (_SearchText == '방문') {
      makeSameText2('방문', [24, 25]);
    }
    if (_SearchText == '방아깨비') {
      makeSameText2('방아깨비', [21, 31]);
    }
    if (_SearchText == '방충망') {
      makeSameText2('방충망', [7, 29]);
    }
    if (_SearchText == '방패연') {
      makeSameText2('방패연', [3, 32]);
    }
    if (_SearchText == '배꼽') {
      makeSameText6('배꼽', [7, 10, 20, 28, 30, 40]);
    }
    if (_SearchText == '배수구') {
      makeSameText2('배수구', [7, 36]);
    }
    if (_SearchText == '배우') {
      makeSameText2('배우', [15, 19]);
    }
    if (_SearchText == '배추') {
      makeSameText2('배추', [6, 39]);
    }
    if (_SearchText == '백골') {
      makeSameText3('백골', [4, 37, 44]);
    }
    if (_SearchText == '백구') {
      makeSameText3('백구', [3, 13, 37]);
    }
    if (_SearchText == '백묵') {
      makeSameText2('백묵', [9, 14]);
    }
    if (_SearchText == '백사') {
      makeSameText2('백사', [4, 6]);
    }
    if (_SearchText == '백수') {
      makeSameText3('백수', [6, 14, 20]);
    }
    if (_SearchText == '백열등') {
      makeSameText2('백열등', [33, 38]);
    }
    if (_SearchText == '백장미') {
      makeSameText2('백장미', [17, 30]);
    }
    if (_SearchText == '백조') {
      makeSameText2('백조', [2, 7]);
    }
    if (_SearchText == '백치') {
      makeSameText2('백치', [4, 5, 7]);
    }
    if (_SearchText == '백호') {
      makeSameText2('백호', [13, 36]);
    }
    if (_SearchText == '밴드') {
      makeSameText2('밴드', [7, 18]);
    }
    if (_SearchText == '뱀') {
      makeSameText2('뱀', [4, 10]);
    }
    if (_SearchText == '버선') {
      makeSameText2('버선', [5, 38]);
    }
    if (_SearchText == '번개') {
      makeSameText2('번개', [5, 6]);
    }
    if (_SearchText == '벌레') {
      makeSameText2('벌레', [8, 12]);
    }
    if (_SearchText == '법사') {
      makeSameText2('법사', [5, 37]);
    }
    if (_SearchText == '벙어리장갑') {
      makeSameText2('벙어리장갑', [17, 45]);
    }
    if (_SearchText == '벼') {
      makeSameText3('벼', [1, 3, 9]);
    }
    if (_SearchText == '벽') {
      makeSameText2('벽', [1, 4]);
    }
    if (_SearchText == '벽시계') {
      makeSameText2('벽시계', [10, 12]);
    }
    if (_SearchText == '변') {
      makeSameText2('변', [6, 16]);
    }
    if (_SearchText == '별빛') {
      makeSameText2('별빛', [9, 38]);
    }
    if (_SearchText == '병실침대') {
      makeSameText2('병실침대', [9, 14]);
    }
    if (_SearchText == '병아리') {
      makeSameText2('병아리', [6, 29]);
    }
    if (_SearchText == '병원') {
      makeSameText2('병원', [28, 30]);
    }
    if (_SearchText == '병풍') {
      makeSameText2('병풍', [3, 29]);
    }
    if (_SearchText == '보디빌더') {
      makeSameText2('보디빌더', [12, 22]);
    }
    if (_SearchText == '보라색') {
      makeSameText4('보라색', [7, 17, 27, 37]);
    }
    if (_SearchText == '보름달') {
      makeSameText5('보름달', [10, 20, 24, 30, 40]);
    }
    if (_SearchText == '보살') {
      makeSameText3('보살', [1, 3, 18]);
    }
    if (_SearchText == '보석') {
      makeSameText2('보석', [5, 44]);
    }
    if (_SearchText == '보자기') {
      makeSameText4('보자기', [10, 20, 30, 40]);
    }
    if (_SearchText == '복권') {
      makeSameText4('복권', [6, 7, 14, 45]);
    }
    if (_SearchText == '복도') {
      makeSameText2('복도', [1, 16]);
    }
    if (_SearchText == '본드') {
      makeSameText2('본드', [6, 12]);
    }
    if (_SearchText == '볼링공') {
      makeSameText5('볼링공', [10, 20, 30, 31, 40]);
    }
    if (_SearchText == '볼펜') {
      makeSameText6('볼펜', [1, 10, 11, 21, 31, 41]);
    }
    if (_SearchText == '봉고차') {
      makeSameText2('봉고차', [4, 18]);
    }
    if (_SearchText == '부자') {
      makeSameText2('부자', [5, 9]);
    }
    if (_SearchText == '부처님') {
      makeSameText3('부처님', [1, 3, 18]);
    }
    if (_SearchText == '부처상') {
      makeSameText3('부처상', [1, 3, 18]);
    }
    if (_SearchText == '부츠') {
      makeSameText2('부츠', [5, 8]);
    }
    // if(_SearchText == '북'&&oneTextSwitch[17]==false) {
    //   setState(() {
    //     oneTextSwitch[17]=true;
    //   });
    //   _filter.clear();
    //   makeSameText5('북',[10,16,20,30,40]);
    // }
    if (_SearchText == '북두칠성') {
      makeSameText2('북두칠성', [7, 24]);
    }
    // if(_SearchText == '불'&&oneTextSwitch[18]==false) {
    //   setState(() {
    //     oneTextSwitch[18]=true;
    //   });
    //   _filter.clear();
    //   makeSameText3('불',[2,4,33]);
    // }
    if (_SearchText == '불곰') {
      makeSameText2('불곰', [1, 16]);
    }
    if (_SearchText == '불구덩이') {
      makeSameText5('불구덩이', [4, 14, 24, 34, 44]);
    }
    if (_SearchText == '불바다') {
      makeSameText2('불바다', [4, 44]);
    }
    if (_SearchText == '불상') {
      makeSameText4('불상', [1, 3, 18, 32]);
    }
    if (_SearchText == '붉은색자켓') {
      makeSameText2('붉은색자켓', [1, 13]);
    }
    if (_SearchText == '붕어') {
      makeSameText2('붕어', [18, 25]);
    }
    if (_SearchText == '비') {
      makeSameText2('비', [2, 11]);
    }
    if (_SearchText == '비녀') {
      makeSameText2('비녀', [1, 5]);
    }
    if (_SearchText == '비늘') {
      makeSameText4('비늘', [6, 16, 26, 36]);
    }
    if (_SearchText == '비바람') {
      makeSameText3('비바람', [11, 18, 33]);
    }
    if (_SearchText == '비석') {
      makeSameText2('비석', [5, 12]);
    }
    // if(_SearchText == '빗'&&oneTextSwitch[19]==false) {
    //   setState(() {
    //     oneTextSwitch[19]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('빗',[3,18]);
    // }
    if (_SearchText == '빨랫줄') {
      makeSameText7('빨랫줄', [1, 11, 14, 15, 21, 31, 41]);
    }
    if (_SearchText == '사거리') {
      makeSameText2('사거리', [9, 10]);
    }
    if (_SearchText == '사다리') {
      makeSameText2('사다리', [8, 14]);
    }
    if (_SearchText == '사다리차') {
      makeSameText2('사다리차', [11, 37]);
    }
    if (_SearchText == '사람성기') {
      makeSameText2('사람성기', [6, 15]);
    }
    if (_SearchText == '사신') {
      makeSameText2('사신', [4, 44]);
    }
    if (_SearchText == '사이비종교') {
      makeSameText2('사이비종교', [33, 42]);
    }
    if (_SearchText == '사자') {
      makeSameText2('사자', [4, 5]);
    }
    if (_SearchText == '사장님') {
      makeSameText3('사장님', [17, 30, 31]);
    }
    if (_SearchText == '사탄') {
      makeSameText3('사탄', [4, 7, 36]);
    }
    if (_SearchText == '사탑') {
      makeSameText2('사탑', [1, 7]);
    }
    if (_SearchText == '사탕') {
      makeSameText5('사탕', [10, 17, 20, 30, 40]);
    }
    if (_SearchText == '산꼭대기') {
      makeSameText2('산꼭대기', [13, 27]);
    }
    if (_SearchText == '산불') {
      makeSameText6('산불', [3, 7, 13, 23, 33, 43]);
    }
    if (_SearchText == '산소') {
      makeSameText2('산소', [5, 17]);
    }
    if (_SearchText == '산신령') {
      makeSameText2('산신령', [22, 42]);
    }
    if (_SearchText == '산타클로스') {
      makeSameText2('산타클로스', [17, 25]);
    }
    if (_SearchText == '살구') {
      makeSameText5('살구', [6, 10, 20, 30, 40]);
    }
    if (_SearchText == '살모사') {
      makeSameText2('살모사', [18, 44]);
    }
    if (_SearchText == '살인') {
      makeSameText2('살인', [4, 17]);
    }
    if (_SearchText == '살찐사람') {
      makeSameText2('살찐사람', [18, 34]);
    }
    if (_SearchText == '살충제') {
      makeSameText2('살충제', [22, 25]);
    }
    if (_SearchText == '삼각형') {
      makeSameText2('삼각형', [3, 17]);
    }
    if (_SearchText == '삼거리') {
      makeSameText5('삼거리', [3, 13, 23, 33, 43]);
    }
    if (_SearchText == '삼성') {
      makeSameText2('삼성', [24, 39]);
    }
    if (_SearchText == '삼성자동차') {
      makeSameText2('삼성자동차', [3, 9]);
    }
    if (_SearchText == '삼촌') {
      makeSameText3('삼촌', [16, 31, 34]);
    }
    // if(_SearchText == '삽'&&oneTextSwitch[20]==false) {
    //
    //     oneTextSwitch[20]=true;
    //
    //   _filter.clear();
    //   makeSameText3('삽',[1,3,6]);
    // }
    if (_SearchText == '상가') {
      makeSameText2('상가', [15, 37]);
    }
    if (_SearchText == '상수리나무') {
      makeSameText2('상수리나무', [30, 36]);
    }
    if (_SearchText == '상여') {
      makeSameText3('상여', [4, 26, 44]);
    }
    if (_SearchText == '상점') {
      makeSameText2('상점', [5, 26]);
    }
    if (_SearchText == '생강') {
      makeSameText2('생강', [27, 44]);
    }
    if (_SearchText == '생선') {
      makeSameText2('생선', [17, 31]);
    }
    if (_SearchText == '생수') {
      makeSameText2('생수', [16, 33]);
    }
    if (_SearchText == '샹들리에') {
      makeSameText2('샹들리에', [33, 35]);
    }
    if (_SearchText == '서리태') {
      makeSameText5('서리태', [10, 14, 20, 30, 40]);
    }
    if (_SearchText == '서명') {
      makeSameText2('서명', [16, 25]);
    }
    if (_SearchText == '서울특별시') {
      makeSameText6('서울특별시', [2, 12, 16, 22, 32, 42]);
    }
    if (_SearchText == '석가모니') {
      makeSameText3('석가모니', [1, 3, 18]);
    }
    if (_SearchText == '선글라스') {
      makeSameText3('선글라스', [8, 11, 12]);
    }
    if (_SearchText == '선배') {
      makeSameText2('선배', [6, 20]);
    }
    if (_SearchText == '선수') {
      makeSameText2('선수', [5, 32]);
    }
    if (_SearchText == '선생님') {
      makeSameText2('선생님', [32, 33]);
    }
    if (_SearchText == '선전') {
      makeSameText2('선전', [7, 45]);
    }
    if (_SearchText == '설계도') {
      makeSameText2('설계도', [11, 32]);
    }
    if (_SearchText == '설사') {
      makeSameText2('설사', [6, 9]);
    }
    // if(_SearchText == '섬'&&oneTextSwitch[21]==false) {
    //   setState(() {
    //     oneTextSwitch[21]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('섬',[8,18]);
    // }
    if (_SearchText == '성관계') {
      makeSameText2('성관계', [6, 16]);
    }
    if (_SearchText == '성교육') {
      makeSameText2('성교육', [10, 30]);
    }
    if (_SearchText == '성기') {
      makeSameText2('성기', [6, 15]);
    }
    if (_SearchText == '성냥') {
      makeSameText2('성냥', [1, 27]);
    }
    if (_SearchText == '성모마리아') {
      makeSameText2('성모마리아', [1, 45]);
    }
    if (_SearchText == '성에') {
      makeSameText2('성에', [26, 36]);
    }
    if (_SearchText == '성탄절') {
      makeSameText3('성탄절', [12, 25, 26]);
    }
    if (_SearchText == '성폭행') {
      makeSameText3('성폭행', [12, 16, 17]);
    }
    if (_SearchText == '성화') {
      makeSameText2('성화', [1, 38]);
    }
    if (_SearchText == '섹스') {
      makeSameText4('섹스', [6, 16, 26, 36]);
    }
    if (_SearchText == '소나기') {
      makeSameText3('소나기', [1, 6, 11]);
    }
    if (_SearchText == '소나무') {
      makeSameText2('소나무', [7, 14]);
    }
    if (_SearchText == '소녀') {
      makeSameText2('소녀', [30, 40]);
    }
    if (_SearchText == '소방서') {
      makeSameText4('소방서', [9, 11, 17, 19]);
    }
    if (_SearchText == '소주') {
      makeSameText4('소주', [4, 5, 32, 44]);
    }
    if (_SearchText == '소쿠리') {
      makeSameText2('소쿠리', [6, 8]);
    }
    if (_SearchText == '소형트럭') {
      makeSameText2('소형트럭', [7, 26]);
    }
    if (_SearchText == '손') {
      makeSameText2('손', [3, 20]);
    }
    if (_SearchText == '손목') {
      makeSameText2('손목', [14, 29]);
    }
    if (_SearchText == '손뼉') {
      makeSameText2('손뼉', [8, 11]);
    }
    if (_SearchText == '손에뽀뽀') {
      makeSameText2('손에뽀뽀', [3, 5]);
    }
    if (_SearchText == '손오공') {
      makeSameText2('손오공', [5, 28]);
    }
    if (_SearchText == '손톱') {
      makeSameText2('손톱', [8, 30]);
    }
    if (_SearchText == '솜') {
      makeSameText5('솜', [8, 10, 20, 30, 40]);
    }
    if (_SearchText == '송판') {
      makeSameText2('송판', [11, 18]);
    }
    if (_SearchText == '쇠') {
      makeSameText4('쇠', [3, 5, 9, 10]);
    }
    if (_SearchText == '수리') {
      makeSameText3('수리', [5, 13, 21]);
    }
    if (_SearchText == '수박') {
      makeSameText5('수박', [5, 10, 20, 30, 40]);
    }
    if (_SearchText == '수술') {
      makeSameText2('수술', [6, 43]);
    }
    if (_SearchText == '수영장') {
      makeSameText3('수영장', [30, 40, 41]);
    }
    if (_SearchText == '수제비') {
      makeSameText2('수제비', [8, 11]);
    }
    if (_SearchText == '수통') {
      makeSameText2('수통', [17, 31]);
    }
    if (_SearchText == '수학선생님') {
      makeSameText2('수학선생님', [17, 27]);
    }
    if (_SearchText == '순대') {
      makeSameText2('순대', [1, 7]);
    }
    if (_SearchText == '숟가락') {
      makeSameText3('숟가락', [6, 9, 10]);
    }
    if (_SearchText == '술래잡기') {
      makeSameText2('술래잡기', [14, 30]);
    }
    if (_SearchText == '술집') {
      makeSameText2('술집', [7, 8]);
    }
    if (_SearchText == '숨바꼭질') {
      makeSameText2('숨바꼭질', [14, 30]);
    }
    // if(_SearchText == '숯'&&oneTextSwitch[22]==false) {
    //   setState(() {
    //     oneTextSwitch[22]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('숯',[4,18]);
    // }
    if (_SearchText == '스님') {
      makeSameText6('스님', [10, 12, 14, 20, 30, 40]);
    }
    if (_SearchText == '스승') {
      makeSameText2('스승', [29, 33]);
    }
    if (_SearchText == '스케이트보드') {
      makeSameText2('스케이트보드', [1, 22]);
    }
    if (_SearchText == '스포츠머리') {
      makeSameText2('스포츠머리', [30, 45]);
    }
    if (_SearchText == '스포트라이트') {
      makeSameText2('스포트라이트', [29, 38]);
    }
    if (_SearchText == '승리') {
      makeSameText2('승리', [5, 16]);
    }
    if (_SearchText == '시계') {
      makeSameText2('시계', [6, 12]);
    }
    if (_SearchText == '시골') {
      makeSameText2('시골', [6, 35]);
    }
    if (_SearchText == '시루떡') {
      makeSameText2('시루떡', [1, 11]);
    }
    if (_SearchText == '시소') {
      makeSameText2('시소', [4, 7]);
    }
    if (_SearchText == '시장') {
      makeSameText3('시장', [16, 24, 27]);
    }
    if (_SearchText == '시체') {
      makeSameText3('시체', [4, 6, 44]);
    }
    if (_SearchText == '식당밥') {
      makeSameText2('식당밥', [3, 20]);
    }
    if (_SearchText == '신발가게') {
      makeSameText2('신발가게', [7, 12]);
    }
    if (_SearchText == '신체검사') {
      makeSameText2('신체검사', [12, 26]);
    }
    // if(_SearchText == '실'&&oneTextSwitch[23]==false) {
    //   setState(() {
    //     oneTextSwitch[23]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('실',[1,11]);
    // }
    if (_SearchText == '싸움') {
      makeSameText2('싸움', [24, 25]);
    }
    if (_SearchText == '싸인') {
      makeSameText2('싸인', [16, 25]);
    }
    // if(_SearchText == '쌀'&&oneTextSwitch[24]==false) {
    //   setState(() {
    //     oneTextSwitch[24]=true;
    //   });
    //   _filter.clear();
    //   makeSameText6('쌀',[5,10,20,30,39,40]);
    // }
    if (_SearchText == '쌍둥이') {
      makeSameText4('쌍둥이', [11, 22, 40, 44]);
    }
    if (_SearchText == '아기') {
      makeSameText2('아기', [14, 20]);
    }
    if (_SearchText == '아는남자') {
      makeSameText2('아는남자', [27, 34]);
    }
    if (_SearchText == '아는언니') {
      makeSameText2('아는언니', [30, 36]);
    }
    if (_SearchText == '아버지') {
      makeSameText3('아버지', [15, 17, 27]);
    }
    if (_SearchText == '아주머니') {
      makeSameText2('아주머니', [30, 31]);
    }
    if (_SearchText == '아파트상가') {
      makeSameText3('아파트상가', [15, 20, 35]);
    }
    if (_SearchText == '악마') {
      makeSameText2('악마', [4, 6]);
    }
    if (_SearchText == '악수') {
      makeSameText2('악수', [3, 15]);
    }
    if (_SearchText == '안경') {
      makeSameText2('안경', [8, 27]);
    }
    if (_SearchText == '앞마당') {
      makeSameText2('앞마당', [25, 44]);
    }
    if (_SearchText == '애국가') {
      makeSameText2('애국가', [1, 18]);
    }
    if (_SearchText == '애벌레') {
      makeSameText2('애벌레', [8, 21]);
    }
    if (_SearchText == '야구공') {
      makeSameText4('야구공', [10, 28, 30, 40]);
    }
    if (_SearchText == '야구방망이') {
      makeSameText2('야구방망이', [1, 23]);
    }
    // if(_SearchText == '약'&&oneTextSwitch[25]==false) {
    //   setState(() {
    //     oneTextSwitch[25]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('약',[16,21]);
    // }
    if (_SearchText == '양배추') {
      makeSameText2('양배추', [20, 30]);
    }
    if (_SearchText == '양복') {
      makeSameText2('양복', [13, 27]);
    }
    if (_SearchText == '억새') {
      makeSameText2('억새', [16, 22]);
    }
    if (_SearchText == '언니') {
      makeSameText2('언니', [15, 20]);
    }
    if (_SearchText == '엄지손가락') {
      makeSameText2('엄지손가락', [42, 43]);
    }
    if (_SearchText == '엉덩이') {
      makeSameText2('엉덩이', [4, 27]);
    }
    if (_SearchText == '에스컬레이터') {
      makeSameText2('에스컬레이터', [38, 40]);
    }
    if (_SearchText == '에쿠스') {
      makeSameText2('에쿠스', [1, 18]);
    }
    if (_SearchText == '엠뷸런스') {
      makeSameText2('엠뷸런스', [36, 40]);
    }
    if (_SearchText == '여직원') {
      makeSameText2('여직원', [9, 31]);
    }
    if (_SearchText == '여치') {
      makeSameText2('여치', [16, 22]);
    }
    if (_SearchText == '역') {
      makeSameText2('역', [9, 23]);
    }
    if (_SearchText == '연극공연장') {
      makeSameText2('연극공연장', [13, 41]);
    }
    if (_SearchText == '연못') {
      makeSameText2('연못', [25, 26]);
    }
    if (_SearchText == '연장') {
      makeSameText2('연장', [2, 28]);
    }
    if (_SearchText == '연필') {
      makeSameText2('연필', [1, 20]);
    }
    if (_SearchText == '열린수갑') {
      makeSameText4('열린수갑', [15, 25, 34, 45]);
    }
    if (_SearchText == '열쇠') {
      makeSameText2('열쇠', [7, 18]);
    }
    if (_SearchText == '염불') {
      makeSameText2('염불', [29, 45]);
    }
    if (_SearchText == '염소') {
      makeSameText2('염소', [24, 25]);
    }
    if (_SearchText == '영혼') {
      makeSameText2('영혼', [12, 45]);
    }
    if (_SearchText == '영화') {
      makeSameText2('영화', [12, 16]);
    }
    if (_SearchText == '예수님') {
      makeSameText2('예수님', [1, 31]);
    }
    if (_SearchText == '예식장') {
      makeSameText2('예식장', [10, 31]);
    }
    if (_SearchText == '옛사랑') {
      makeSameText2('옛사랑', [20, 31]);
    }

    if (_SearchText == '오곡') {
      makeSameText2('오곡', [5, 15]);
    }
    if (_SearchText == '오빠') {
      makeSameText2('오빠', [12, 15]);
    }
    if (_SearchText == '오이') {
      makeSameText2('오이', [5, 24]);
    }
    if (_SearchText == '오줌') {
      makeSameText2('오줌', [24, 25]);
    }
    if (_SearchText == '오징어') {
      makeSameText2('오징어', [5, 38]);
    }
    if (_SearchText == '오피러스') {
      makeSameText2('오피러스', [1, 21]);
    }
    if (_SearchText == '올챙이') {
      makeSameText2('올챙이', [9, 41]);
    }
    if (_SearchText == '올케') {
      makeSameText2('올케', [18, 33]);
    }
    if (_SearchText == '옷장') {
      makeSameText3('옷장', [14, 24, 27]);
    }
    if (_SearchText == '옹기') {
      makeSameText2('옹기', [8, 25]);
    }
    if (_SearchText == '왈츠') {
      makeSameText2('왈츠', [7, 18]);
    }
    if (_SearchText == '왕') {
      makeSameText2('왕', [1, 3]);
    }
    if (_SearchText == '왕자') {
      makeSameText2('왕자', [3, 27]);
    }
    if (_SearchText == '요강') {
      makeSameText5('요강', [10, 20, 26, 30, 40]);
    }
    if (_SearchText == '욕설') {
      makeSameText2('욕설', [18, 28]);
    }
    if (_SearchText == '우물') {
      makeSameText6('우물', [10, 20, 25, 30, 35, 40]);
    }
    if (_SearchText == '우비') {
      makeSameText2('우비', [3, 15]);
    }
    if (_SearchText == '우산') {
      makeSameText2('우산', [3, 15]);
    }
    if (_SearchText == '우편물') {
      makeSameText3('우편물', [27, 36, 37]);
    }
    if (_SearchText == '운동복') {
      makeSameText2('운동복', [20, 30]);
    }
    if (_SearchText == '울음') {
      makeSameText3('울음', [16, 20, 36]);
    }
    if (_SearchText == '원숭이') {
      makeSameText2('원숭이', [9, 39]);
    }
    if (_SearchText == '원피스') {
      makeSameText2('원피스', [1, 20]);
    }
    if (_SearchText == '월드컵') {
      makeSameText2('월드컵', [20, 22]);
    }
    if (_SearchText == '월식') {
      makeSameText2('월식', [5, 23]);
    }
    if (_SearchText == '윗니') {
      makeSameText2('윗니', [16, 37]);
    }
    if (_SearchText == '유령') {
      makeSameText4('유령', [6, 26, 44, 45]);
    }
    if (_SearchText == '율무차') {
      makeSameText2('율무차', [33, 41]);
    }
    if (_SearchText == '의사') {
      makeSameText3('의사', [15, 21, 31]);
    }
    if (_SearchText == '이불') {
      makeSameText2('이불', [16, 32]);
    }
    if (_SearchText == '이빨') {
      makeSameText2('이빨', [2, 39]);
    }
    if (_SearchText == '이사') {
      makeSameText3('이사', [14, 24, 27]);
    }
    if (_SearchText == '일본') {
      makeSameText2('일본', [1, 17]);
    }
    // if(_SearchText == '입') {
    //   makeSameText5('입',[1,11,21,31,41]);
    // }
    if (_SearchText == '입술') {
      makeSameText2('입술', [17, 39]);
    }
    if (_SearchText == '자갈') {
      makeSameText5('자갈', [7, 10, 20, 30, 40]);
    }
    if (_SearchText == '자라') {
      makeSameText2('자라', [8, 17]);
    }
    if (_SearchText == '자취방') {
      makeSameText2('자취방', [19, 20]);
    }
    if (_SearchText == '작대기') {
      makeSameText2('작대기', [1, 20]);
    }
    if (_SearchText == '작두') {
      makeSameText2('작두', [7, 12]);
    }
    if (_SearchText == '잔디') {
      makeSameText2('잔디', [7, 12]);
    }
    if (_SearchText == '잠바') {
      makeSameText3('잠바', [14, 18, 24]);
    }
    if (_SearchText == '잠수') {
      makeSameText2('잠수', [14, 18]);
    }
    if (_SearchText == '잠자리') {
      makeSameText2('잠자리', [22, 32]);
    }
    if (_SearchText == '잡지') {
      makeSameText2('잡지', [5, 7]);
    }
    if (_SearchText == '잡채') {
      makeSameText2('잡채', [8, 11]);
    }
    if (_SearchText == '장대비') {
      makeSameText3('장대비', [1, 11, 20]);
    }
    if (_SearchText == '장례식') {
      makeSameText2('장례식', [22, 44]);
    }
    if (_SearchText == '장마') {
      makeSameText3('장마', [11, 15, 25]);
    }
    if (_SearchText == '장어') {
      makeSameText2('장어', [16, 26]);
    }
    if (_SearchText == '장작') {
      makeSameText2('장작', [18, 22]);
    }
    if (_SearchText == '쟁반') {
      makeSameText5('쟁반', [10, 18, 20, 30, 40]);
    }
    if (_SearchText == '저수지') {
      makeSameText2('저수지', [8, 26, 34]);
    }
    if (_SearchText == '저승사자') {
      makeSameText2('저승사자', [4, 44]);
    }
    if (_SearchText == '적갈색') {
      makeSameText2('적갈색', [13, 26]);
    }
    if (_SearchText == '전갈') {
      makeSameText2('전갈', [6, 8]);
    }
    if (_SearchText == '전구') {
      makeSameText2('전구', [5, 6]);
    }
    if (_SearchText == '전기') {
      makeSameText3('전기', [6, 9, 11]);
    }
    if (_SearchText == '전기선') {
      makeSameText2('전기선', [1, 9]);
    }
    if (_SearchText == '전병') {
      makeSameText2('전병', [18, 24]);
    }
    if (_SearchText == '전차') {
      makeSameText2('전차', [7, 19]);
    }
    if (_SearchText == '전철역') {
      makeSameText2('전철역', [9, 23]);
    }
    if (_SearchText == '전화통화') {
      makeSameText2('전화통화', [11, 39]);
    }
    if (_SearchText == '절') {
      makeSameText5('절', [1, 3, 12, 15, 40]);
    }
    if (_SearchText == '절구') {
      makeSameText2('절구', [7, 22]);
    }
    if (_SearchText == '절벽') {
      makeSameText2('절벽', [9, 24]);
    }
    if (_SearchText == '점심') {
      makeSameText2('점심', [6, 29]);
    }
    if (_SearchText == '점퍼') {
      makeSameText3('점퍼', [14, 18, 24]);
    }
    if (_SearchText == '접시') {
      makeSameText4('접시', [10, 20, 30, 40]);
    }
    if (_SearchText == '젓가락') {
      makeSameText2('젓가락', [10, 11]);
    }
    if (_SearchText == '젖가슴') {
      makeSameText2('젖가슴', [22, 26]);
    }
    if (_SearchText == '제기') {
      makeSameText2('제기', [6, 11]);
    }
    if (_SearchText == '조끼') {
      makeSameText2('조끼', [6, 19]);
    }
    if (_SearchText == '종교인') {
      makeSameText2('종교인', [10, 30]);
    }
    if (_SearchText == '주걱') {
      makeSameText2('주걱', [5, 9]);
    }
    if (_SearchText == '주전자물') {
      makeSameText2('주전자물', [11, 30]);
    }
    if (_SearchText == '주황색') {
      makeSameText2('주황색', [2, 6]);
    }
    if (_SearchText == '죽순') {
      makeSameText2('죽순', [1, 6]);
    }
    if (_SearchText == '죽은사람') {
      makeSameText2('죽은사람', [6, 44]);
    }
    if (_SearchText == '죽음') {
      makeSameText2('죽음', [4, 44]);
    }
    if (_SearchText == '줄넘기') {
      makeSameText2('줄넘기', [1, 22]);
    }
    if (_SearchText == '쥐') {
      makeSameText2('쥐', [4, 18]);
    }
    if (_SearchText == '지네') {
      makeSameText2('지네', [1, 16]);
    }
    if (_SearchText == '지렁이') {
      makeSameText6('지렁이', [1, 11, 21, 29, 31, 41]);
    }
    if (_SearchText == '진주') {
      makeSameText5('진주', [7, 10, 20, 30, 40]);
    }
    // if(_SearchText == '집'&&oneTextSwitch[26]==false) {
    //   setState(() {
    //     oneTextSwitch[26]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('집',[4,17]);
    // }
    if (_SearchText == '집게') {
      makeSameText2('집게', [7, 44]);
    }
    // if(_SearchText == '징'&&oneTextSwitch[27]==false) {
    //   setState(() {
    //     oneTextSwitch[27]=true;
    //   });
    //   _filter.clear();
    //   makeSameText5('징',[10,14,20,30,40]);
    // }
    // if(_SearchText == '짚'&&oneTextSwitch[28]==false) {
    //   setState(() {
    //     oneTextSwitch[28]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('짚',[1,45]);
    // }
    if (_SearchText == '찌름') {
      makeSameText2('찌름', [1, 20]);
    }
    if (_SearchText == '찬밥') {
      makeSameText2('찬밥', [7, 37]);
    }
    if (_SearchText == '찬송가') {
      makeSameText2('찬송가', [15, 19]);
    }
    if (_SearchText == '참치캔') {
      makeSameText2('참치캔', [8, 26]);
    }
    if (_SearchText == '찻집') {
      makeSameText3('찻집', [8, 11, 45]);
    }
    if (_SearchText == '책') {
      makeSameText2('책', [3, 5]);
    }
    if (_SearchText == '챔피언') {
      makeSameText2('챔피언', [1, 37]);
    }
    if (_SearchText == '철') {
      makeSameText2('철', [10, 13]);
    }
    if (_SearchText == '첫돌') {
      makeSameText2('첫돌', [1, 10]);
    }
    if (_SearchText == '첫사랑') {
      makeSameText3('첫사랑', [1, 20, 31]);
    }
    if (_SearchText == '청개구리') {
      makeSameText2('청개구리', [8, 22]);
    }
    if (_SearchText == '청소') {
      makeSameText2('청소', [16, 45]);
    }
    if (_SearchText == '체리') {
      makeSameText2('체리', [6, 7]);
    }
    if (_SearchText == '체스') {
      makeSameText2('체스', [6, 16]);
    }
    if (_SearchText == '체어맨') {
      makeSameText2('체어맨', [1, 33]);
    }
    if (_SearchText == '초') {
      makeSameText2('초', [1, 8]);
    }
    if (_SearchText == '초등학교동창') {
      makeSameText2('초등학교동창', [5, 36]);
    }
    if (_SearchText == '초상집') {
      makeSameText2('초상집', [20, 44]);
    }
    if (_SearchText == '초코파이') {
      makeSameText5('초코파이', [10, 20, 22, 30, 40]);
    }
    if (_SearchText == '최루탄') {
      makeSameText2('최루탄', [12, 45]);
    }
    if (_SearchText == '축구') {
      makeSameText3('축구', [6, 9, 41]);
    }
    if (_SearchText == '출산') {
      makeSameText2('출산', [8, 20]);
    }
    if (_SearchText == '춤') {
      makeSameText2('춤', [7, 10]);
    }
    if (_SearchText == '친구') {
      makeSameText2('친구', [6, 45]);
    }
    if (_SearchText == '칠면조') {
      makeSameText2('칠면조', [7, 26]);
    }
    if (_SearchText == '칡') {
      makeSameText2('칡', [6, 22]);
    }
    if (_SearchText == '칫솔') {
      makeSameText2('칫솔', [8, 9]);
    }
    if (_SearchText == '카페') {
      makeSameText3('카페', [8, 11, 45]);
    }
    // if(_SearchText == '칼'&&oneTextSwitch[29]==false) {
    //   setState(() {
    //     oneTextSwitch[29]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('칼',[1,5]);
    // }
    if (_SearchText == '칼국수') {
      makeSameText2('칼국수', [10, 11]);
    }
    // if(_SearchText == '코'&&oneTextSwitch[30]==false) {
    //   setState(() {
    //     oneTextSwitch[30]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('코',[7,20]);
    // }
    if (_SearchText == '콧구멍') {
      makeSameText6('콧구멍', [10, 20, 30, 31, 40, 45]);
    }
    // if(_SearchText == '콩'&&oneTextSwitch[31]==false) {
    //   setState(() {
    //     oneTextSwitch[31]=true;
    //   });
    //   _filter.clear();
    //   makeSameText6('콩',[8,10,14,20,30,40]);
    // }
    if (_SearchText == '콩나물') {
      makeSameText3('콩나물', [6, 9, 33]);
    }
    if (_SearchText == '크리스마스') {
      makeSameText3('크리스마스', [12, 25, 26]);
    }
    if (_SearchText == '크리스마스회식') {
      makeSameText2('크리스마스회식', [12, 25]);
    }
    if (_SearchText == '클로버') {
      makeSameText3('클로버', [4, 7, 10]);
    }
    if (_SearchText == '키보드') {
      makeSameText2('키보드', [8, 45]);
    }
    if (_SearchText == '킥보드') {
      makeSameText2('킥보드', [9, 10]);
    }
    if (_SearchText == '타이어') {
      makeSameText5('타이어', [10, 20, 28, 30, 40]);
    }
    if (_SearchText == '탁구') {
      makeSameText5('탁구', [7, 10, 20, 30, 40]);
    }
    if (_SearchText == '탁자') {
      makeSameText2('탁자', [8, 21]);
    }
    if (_SearchText == '태양') {
      makeSameText4('태양', [10, 20, 30, 40]);
    }
    if (_SearchText == '털') {
      makeSameText6('털', [1, 6, 11, 21, 31, 41]);
    }
    if (_SearchText == '텔레비전') {
      makeSameText2('텔레비전', [18, 19]);
    }
    if (_SearchText == '토끼굴') {
      makeSameText5('토끼굴', [10, 11, 20, 30, 40]);
    }
    if (_SearchText == '토끼풀') {
      makeSameText3('토끼풀', [4, 7, 10]);
    }
    if (_SearchText == '토지') {
      makeSameText2('토지', [1, 11]);
    }
    if (_SearchText == '투피스') {
      makeSameText2('투피스', [2, 10]);
    }
    if (_SearchText == '튜브') {
      makeSameText5('튜브', [10, 20, 30, 40, 45]);
    }
    if (_SearchText == '트럭') {
      makeSameText3('트럭', [7, 8, 34]);
    }
    if (_SearchText == '트렌치코트') {
      makeSameText2('트렌치코트', [14, 24]);
    }
    if (_SearchText == '파도') {
      makeSameText4('파도', [7, 17, 27, 37]);
    }
    if (_SearchText == '파리') {
      makeSameText2('파리', [7, 8]);
    }
    if (_SearchText == '파스') {
      makeSameText2('파스', [6, 11]);
    }
    if (_SearchText == '파스타') {
      makeSameText2('파스타', [10, 13]);
    }
    if (_SearchText == '팔뚝') {
      makeSameText2('팔뚝', [12, 38]);
    }
    if (_SearchText == '팝콘') {
      makeSameText2('팝콘', [8, 9]);
    }
    if (_SearchText == '팥죽') {
      makeSameText2('팥죽', [11, 15]);
    }
    if (_SearchText == '팬티') {
      makeSameText3('팬티', [10, 13, 16]);
    }
    if (_SearchText == '펜') {
      makeSameText6('펜', [1, 10, 11, 21, 31, 41]);
    }
    if (_SearchText == '포도') {
      makeSameText6('포도', [7, 8, 10, 20, 30, 40]);
    }
    if (_SearchText == '폭설') {
      makeSameText2('폭설', [9, 37]);
    }
    if (_SearchText == '폭풍') {
      makeSameText2('폭풍', [20, 33]);
    }
    if (_SearchText == '풍선') {
      makeSameText2('풍선', [9, 17]);
    }
    if (_SearchText == '피자') {
      makeSameText5('피자', [7, 10, 20, 30, 40]);
    }
    if (_SearchText == '피난') {
      makeSameText3('피난', [7, 24, 36]);
    }
    if (_SearchText == '핀셋') {
      makeSameText2('핀셋', [7, 9]);
    }
    if (_SearchText == '하늘') {
      makeSameText2('하늘', [1, 36]);
    }
    if (_SearchText == '하얀색장갑') {
      makeSameText2('하얀색장갑', [6, 17]);
    }
    if (_SearchText == '학교') {
      makeSameText2('학교', [7, 36]);
    }
    if (_SearchText == '한약') {
      makeSameText2('한약', [2, 3]);
    }
    if (_SearchText == '한자') {
      makeSameText2('한자', [36, 45]);
    }
    if (_SearchText == '합판') {
      makeSameText2('합판', [1, 38]);
    }
    if (_SearchText == '핫도그') {
      makeSameText2('핫도그', [9, 38]);
    }
    if (_SearchText == '항공모함') {
      makeSameText2('항공모함', [33, 44]);
    }
    if (_SearchText == '항아리') {
      makeSameText3('항아리', [3, 8, 13]);
    }
    // if(_SearchText == '해'&&oneTextSwitch[32]==false) {
    //   setState(() {
    //     oneTextSwitch[32]=true;
    //   });
    //   _filter.clear();
    //   makeSameText4('해',[10,20,30,40]);
    // }
    if (_SearchText == '해골') {
      makeSameText2('해골', [37, 44]);
    }
    if (_SearchText == '해변') {
      makeSameText3('해변', [1, 3, 8]);
    }
    if (_SearchText == '핵폭탄') {
      makeSameText2('핵폭탄', [44, 45]);
    }
    if (_SearchText == '핸들') {
      makeSameText5('핸들', [10, 20, 30, 39, 40]);
    }
    if (_SearchText == '향수') {
      makeSameText2('향수', [1, 44]);
    }
    if (_SearchText == '형') {
      makeSameText2('형', [12, 44]);
    }
    if (_SearchText == '호두') {
      makeSameText5('호두', [10, 20, 30, 35, 40]);
    }
    if (_SearchText == '호랑이') {
      makeSameText2('호랑이', [3, 13]);
    }
    if (_SearchText == '호미') {
      makeSameText2('호미', [7, 40]);
    }
    if (_SearchText == '호박') {
      makeSameText2('호박', [3, 35]);
    }
    if (_SearchText == '호수') {
      makeSameText2('호수', [34, 39]);
    }
    if (_SearchText == '홍당무') {
      makeSameText2('홍당무', [17, 25]);
    }
    if (_SearchText == '화장') {
      makeSameText2('화장', [2, 17]);
    }
    if (_SearchText == '화투') {
      makeSameText2('화투', [9, 37]);
    }
    if (_SearchText == '황금새') {
      makeSameText2('황금새', [17, 19]);
    }
    if (_SearchText == '황제') {
      makeSameText2('황제', [1, 3]);
    }
    if (_SearchText == '황토') {
      makeSameText2('황토', [3, 9]);
    }
    // if(_SearchText == '회'&&oneTextSwitch[33]==false) {
    //   setState(() {
    //     oneTextSwitch[33]=true;
    //   });
    //   _filter.clear();
    //   makeSameText2('회',[33,37]);
    // }
    if (_SearchText == '횡단보도') {
      makeSameText3('횡단보도', [8, 22, 43]);
    }
    if (_SearchText == '휠체어') {
      makeSameText2('휠체어', [6, 41]);
    }
    if (_SearchText == '흉터') {
      makeSameText2('흉터', [3, 16]);
    }
    if (_SearchText == '흐린구름') {
      makeSameText2('흐린구름', [14, 44]);
    }
    if (_SearchText == '흙탕물') {
      makeSameText2('흙탕물', [26, 41]);
    }
    if (_SearchText == '흰곰') {
      makeSameText2('흰곰', [1, 16]);
    }
    if (_SearchText == '흰장미') {
      makeSameText2('흰장미', [17, 30]);
    }

    if ((_SearchText == '검' ||
            _SearchText == '강' ||
            _SearchText == '검정우산' ||
            _SearchText == '고려대학교' ||
            _SearchText == '고향' ||
            _SearchText == '국' ||
            _SearchText == '금불상' ||
            _SearchText == '끈' ||
            _SearchText == '난' ||
            _SearchText == '노트북' ||
            _SearchText == '사람눈' ||
            _SearchText == '사람 눈' ||
            _SearchText == '대검' ||
            _SearchText == '대지' ||
            _SearchText == '대통령' ||
            _SearchText == '동물원' ||
            _SearchText == '동승' ||
            _SearchText == '못' ||
            _SearchText == '면회' ||
            _SearchText == '목욕탕' ||
            _SearchText == '바닷가' ||
            _SearchText == '바람둥이' ||
            _SearchText == '복숭아나무' ||
            _SearchText == '봉화' ||
            _SearchText == '붉은색' ||
            _SearchText == '붓' ||
            _SearchText == '삽' ||
            _SearchText == '생일케잌' ||
            _SearchText == '설날' ||
            _SearchText == '소' ||
            _SearchText == '소금쟁이' ||
            _SearchText == '송곳' ||
            _SearchText == '신' ||
            _SearchText == '실핀' ||
            _SearchText == '실험' ||
            _SearchText == '아우디' ||
            _SearchText == '야외풀장' ||
            _SearchText == '어깨동무' ||
            _SearchText == '옹달샘' ||
            _SearchText == '왕따' ||
            _SearchText == '용암' ||
            _SearchText == '유혹' ||
            _SearchText == '이등병' ||
            _SearchText == '일등병' ||
            _SearchText == '임플란트' ||
            _SearchText == '입' ||
            _SearchText == '사람입' ||
            _SearchText == '실' ||
            _SearchText == '자동차범퍼' ||
            _SearchText == '자동판매기' ||
            _SearchText == '작대' ||
            _SearchText == '작은꽃무늬' ||
            _SearchText == '잡초' ||
            _SearchText == '장검' ||
            _SearchText == '정육점' ||
            _SearchText == '준장' ||
            _SearchText == '줄' ||
            _SearchText == '짚' ||
            _SearchText == '창' ||
            _SearchText == '체어맨' ||
            _SearchText == '침' ||
            _SearchText == '케이블선' ||
            _SearchText == '티끌' ||
            _SearchText == '페라리' ||
            _SearchText == '포르쉐' ||
            _SearchText == '칼' ||
            _SearchText == '하나님' ||
            _SearchText == '한옥' ||
            _SearchText == '행사' ||
            _SearchText == '헬기' ||
            _SearchText == '헬리콥터' ||
            _SearchText == '형사' ||
            _SearchText == '혼인' ||
            _SearchText == '홍고추' ||
            _SearchText == '홍초' ||
            _SearchText == '화살' ||
            _SearchText == '화상' ||
            _SearchText == '황사' ||
            _SearchText == '훈방조치' ||
            _SearchText == '흑인') ||
        numButtonSwich[0] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 1 &&
          ball3num != 1 &&
          ball4num != 1 &&
          ball5num != 1 &&
          ball6num != 1) {
        setState(() {
          ball1num = 1;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 1 &&
          ball3num != 1 &&
          ball4num != 1 &&
          ball5num != 1 &&
          ball6num != 1) {
        setState(() {
          ball2num = 1;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 1 &&
          ball2num != 1 &&
          ball4num != 1 &&
          ball5num != 1 &&
          ball6num != 1) {
        setState(() {
          ball3num = 1;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 1 &&
          ball2num != 1 &&
          ball3num != 1 &&
          ball5num != 1 &&
          ball6num != 1) {
        setState(() {
          ball4num = 1;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 1 &&
          ball2num != 1 &&
          ball3num != 1 &&
          ball4num != 1 &&
          ball6num != 1) {
        setState(() {
          ball5num = 1;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 1 &&
          ball2num != 1 &&
          ball3num != 1 &&
          ball4num != 1 &&
          ball5num != 1) {
        setState(() {
          ball6num = 1;
        });
      }
    }
    if ((_SearchText == '고지서영수증' ||
            _SearchText == '고지서' ||
            _SearchText == '교감' ||
            _SearchText == '나무아미타불' ||
            _SearchText == '농협은행' ||
            _SearchText == '듀엣' ||
            _SearchText == '무임승차' ||
            _SearchText == '발뒤꿈치' ||
            _SearchText == '불' ||
            _SearchText == '서울시' ||
            _SearchText == '소장' ||
            _SearchText == '수학여행' ||
            _SearchText == '약혼' ||
            _SearchText == '염색약' ||
            _SearchText == '오리' ||
            _SearchText == '오리고기' ||
            _SearchText == '외사촌동생' ||
            _SearchText == '위협' ||
            _SearchText == '육회' ||
            _SearchText == '은하수' ||
            _SearchText == '잠만경' ||
            _SearchText == '장화' ||
            _SearchText == '전화벨' ||
            _SearchText == '청둥오리' ||
            _SearchText == '학원' ||
            _SearchText == '합창' ||
            _SearchText == '해동' ||
            _SearchText == '해일' ||
            _SearchText == '행주' ||
            _SearchText == '헌병' ||
            _SearchText == '혜성' ||
            _SearchText == '호통' ||
            _SearchText == '홍학' ||
            _SearchText == '화랑' ||
            _SearchText == '화약' ||
            _SearchText == '회충' ||
            _SearchText == '훈장' ||
            _SearchText == '흰옷') ||
        numButtonSwich[1] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 2 &&
          ball3num != 2 &&
          ball4num != 2 &&
          ball5num != 2 &&
          ball6num != 2) {
        setState(() {
          ball1num = 2;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 2 &&
          ball3num != 2 &&
          ball4num != 2 &&
          ball5num != 2 &&
          ball6num != 2) {
        setState(() {
          ball2num = 2;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 2 &&
          ball2num != 2 &&
          ball4num != 2 &&
          ball5num != 2 &&
          ball6num != 2) {
        setState(() {
          ball3num = 2;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 2 &&
          ball2num != 2 &&
          ball3num != 2 &&
          ball5num != 2 &&
          ball6num != 2) {
        setState(() {
          ball4num = 2;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 2 &&
          ball2num != 2 &&
          ball3num != 2 &&
          ball4num != 2 &&
          ball6num != 2) {
        setState(() {
          ball5num = 2;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 2 &&
          ball2num != 2 &&
          ball3num != 2 &&
          ball4num != 2 &&
          ball5num != 2) {
        setState(() {
          ball6num = 2;
        });
      }
    }
    if ((_SearchText == '갓' ||
            _SearchText == '곰' ||
            _SearchText == '검정우산' ||
            _SearchText == '경상남도' ||
            _SearchText == '공연' ||
            _SearchText == '기러기' ||
            _SearchText == '남자손' ||
            _SearchText == '노파' ||
            _SearchText == '농구화' ||
            _SearchText == '대한항공' ||
            _SearchText == '뒷통수' ||
            _SearchText == '디귿모양' ||
            _SearchText == '무화과' ||
            _SearchText == '물' ||
            _SearchText == '물레방아' ||
            _SearchText == '바람' ||
            _SearchText == '밥' ||
            _SearchText == '배' ||
            _SearchText == '보트' ||
            _SearchText == '복' ||
            _SearchText == '비행기' ||
            _SearchText == '빗' ||
            _SearchText == '산' ||
            _SearchText == '삼배' ||
            _SearchText == '상병' ||
            _SearchText == '새' ||
            _SearchText == '세발자전거' ||
            _SearchText == '손짓' ||
            _SearchText == '시험지' ||
            _SearchText == '심장' ||
            _SearchText == '아이스크림' ||
            _SearchText == '알루미늄호일' ||
            _SearchText == '애완견' ||
            _SearchText == '야산' ||
            _SearchText == '왕관' ||
            _SearchText == '유성매직' ||
            _SearchText == '주민등록증' ||
            _SearchText == '중장' ||
            _SearchText == '집들이선물' ||
            _SearchText == '천원' ||
            _SearchText == '총학생회장' ||
            _SearchText == '푸들' ||
            _SearchText == '하숙방' ||
            _SearchText == '한가위' ||
            _SearchText == '한국어' ||
            _SearchText == '할머니' ||
            _SearchText == '해안가' ||
            _SearchText == '햄버거' ||
            _SearchText == '허수아비' ||
            _SearchText == '헝겊' ||
            _SearchText == '활' ||
            _SearchText == '흑룡') ||
        numButtonSwich[2] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 3 &&
          ball3num != 3 &&
          ball4num != 3 &&
          ball5num != 3 &&
          ball6num != 3) {
        setState(() {
          ball1num = 3;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 3 &&
          ball3num != 3 &&
          ball4num != 3 &&
          ball5num != 3 &&
          ball6num != 3) {
        setState(() {
          ball2num = 3;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 3 &&
          ball2num != 3 &&
          ball4num != 3 &&
          ball5num != 3 &&
          ball6num != 3) {
        setState(() {
          ball3num = 3;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 3 &&
          ball2num != 3 &&
          ball3num != 3 &&
          ball5num != 3 &&
          ball6num != 3) {
        setState(() {
          ball4num = 3;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 3 &&
          ball2num != 3 &&
          ball3num != 3 &&
          ball4num != 3 &&
          ball6num != 3) {
        setState(() {
          ball5num = 3;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 3 &&
          ball2num != 3 &&
          ball3num != 3 &&
          ball4num != 3 &&
          ball5num != 3) {
        setState(() {
          ball6num = 3;
        });
      }
    }
    if ((_SearchText == '고등학교동창' ||
            _SearchText == '고리대금업자' ||
            _SearchText == '고사' ||
            _SearchText == '관' ||
            _SearchText == '굴' ||
            _SearchText == '나비' ||
            _SearchText == '나사' ||
            _SearchText == '네모' ||
            _SearchText == '누나' ||
            _SearchText == '대장' ||
            _SearchText == '뚱뚱한사람' ||
            _SearchText == '마을버스' ||
            _SearchText == '만원' ||
            _SearchText == '미혼모' ||
            _SearchText == '발' ||
            _SearchText == '뱀머리' ||
            _SearchText == '뱀뼈' ||
            _SearchText == '병장' ||
            _SearchText == '보건선생님' ||
            _SearchText == '봉선화' ||
            _SearchText == '불덩어리불' ||
            _SearchText == '불을끔' ||
            _SearchText == '비누' ||
            _SearchText == '비서' ||
            _SearchText == '사각형' ||
            _SearchText == '사체' ||
            _SearchText == '소스' ||
            _SearchText == '소스' ||
            _SearchText == '술' ||
            _SearchText == '숯' ||
            _SearchText == '스타렉스밴' ||
            _SearchText == '스타렉스' ||
            _SearchText == '승합차' ||
            _SearchText == '신호등' ||
            _SearchText == '양호선생님' ||
            _SearchText == '저승' ||
            _SearchText == '주사' ||
            _SearchText == '집' ||
            _SearchText == '집이무너짐' ||
            _SearchText == '초록' ||
            _SearchText == '초상화' ||
            _SearchText == '코피' ||
            _SearchText == '통통한사람' ||
            _SearchText == '프로스펙스' ||
            _SearchText == '피' ||
            _SearchText == '통통' ||
            _SearchText == '한국인' ||
            _SearchText == '한라봉' ||
            _SearchText == '해군사관학교' ||
            _SearchText == '허름한집' ||
            _SearchText == '회사원') ||
        numButtonSwich[3] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 4 &&
          ball3num != 4 &&
          ball4num != 4 &&
          ball5num != 4 &&
          ball6num != 4) {
        setState(() {
          ball1num = 4;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 4 &&
          ball3num != 4 &&
          ball4num != 4 &&
          ball5num != 4 &&
          ball6num != 4) {
        setState(() {
          ball2num = 4;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 4 &&
          ball2num != 4 &&
          ball4num != 4 &&
          ball5num != 4 &&
          ball6num != 4) {
        setState(() {
          ball3num = 4;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 4 &&
          ball2num != 4 &&
          ball3num != 4 &&
          ball5num != 4 &&
          ball6num != 4) {
        setState(() {
          ball4num = 4;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 4 &&
          ball2num != 4 &&
          ball3num != 4 &&
          ball4num != 4 &&
          ball6num != 4) {
        setState(() {
          ball5num = 4;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 4 &&
          ball2num != 4 &&
          ball3num != 4 &&
          ball4num != 4 &&
          ball5num != 4) {
        setState(() {
          ball6num = 4;
        });
      }
    }
    if ((_SearchText == '가루' ||
            _SearchText == '거즈' ||
            _SearchText == '거지' ||
            _SearchText == '고개' ||
            _SearchText == '고삐' ||
            _SearchText == '고향집' ||
            _SearchText == '고혈압' ||
            _SearchText == '과거' ||
            _SearchText == '과부' ||
            _SearchText == '교수' ||
            _SearchText == '국가' ||
            _SearchText == '국기' ||
            _SearchText == '굴곡' ||
            _SearchText == '깁스' ||
            _SearchText == '냉동만두' ||
            _SearchText == '노루' ||
            _SearchText == '노숙자' ||
            _SearchText == '뉴스' ||
            _SearchText == '달' ||
            _SearchText == '덩굴장미' ||
            _SearchText == '덫' ||
            _SearchText == '돌더미' ||
            _SearchText == '동호회' ||
            _SearchText == '드라마세트장' ||
            _SearchText == '등산화' ||
            _SearchText == '디스' ||
            _SearchText == '바지벗음' ||
            _SearchText == '바지보기' ||
            _SearchText == '박물관' ||
            _SearchText == '반사' ||
            _SearchText == '밤하늘' ||
            _SearchText == '밥먹는꿈' ||
            _SearchText == '방해꾼' ||
            _SearchText == '밭' ||
            _SearchText == '배구경기' ||
            _SearchText == '버섯' ||
            _SearchText == '별' ||
            _SearchText == '부추' ||
            _SearchText == '분노' ||
            _SearchText == '분수' ||
            _SearchText == '분홍색' ||
            _SearchText == '사과' ||
            _SearchText == '사업자등록증' ||
            _SearchText == '생선회' ||
            _SearchText == '솥' ||
            _SearchText == '수건' ||
            _SearchText == '수선' ||
            _SearchText == '습기' ||
            _SearchText == '식사' ||
            _SearchText == '신부' ||
            _SearchText == '쌀' ||
            _SearchText == '에스엠5' ||
            _SearchText == '여성가슴' ||
            _SearchText == '여성성기' ||
            _SearchText == '연주회' ||
            _SearchText == '오목' ||
            _SearchText == '원수' ||
            _SearchText == '유방' ||
            _SearchText == '젖' ||
            _SearchText == '조기' ||
            _SearchText == '조사' ||
            _SearchText == '좋은기분' ||
            _SearchText == '주소' ||
            _SearchText == '중학교' ||
            _SearchText == '지구' ||
            _SearchText == '지하상가' ||
            _SearchText == '채송화' ||
            _SearchText == '카누' ||
            _SearchText == '커브' ||
            _SearchText == '코너' ||
            _SearchText == '큰형수' ||
            _SearchText == '키스' ||
            _SearchText == '톱' ||
            _SearchText == '티슈' ||
            _SearchText == '파란색카드' ||
            _SearchText == '하모니카' ||
            _SearchText == '하이파이브' ||
            _SearchText == '한옥집' ||
            _SearchText == '할미새' ||
            _SearchText == '함박눈' ||
            _SearchText == '헬맷' ||
            _SearchText == '혀' ||
            _SearchText == '현기증' ||
            _SearchText == '현수막' ||
            _SearchText == '호두나무' ||
            _SearchText == '화장지' ||
            _SearchText == '회의실' ||
            _SearchText == '휘발유' ||
            _SearchText == '휴양지' ||
            _SearchText == '휴지' ||
            _SearchText == '흰머리') ||
        numButtonSwich[4] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 5 &&
          ball3num != 5 &&
          ball4num != 5 &&
          ball5num != 5 &&
          ball6num != 5) {
        setState(() {
          ball1num = 5;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 5 &&
          ball3num != 5 &&
          ball4num != 5 &&
          ball5num != 5 &&
          ball6num != 5) {
        setState(() {
          ball2num = 5;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 5 &&
          ball2num != 5 &&
          ball4num != 5 &&
          ball5num != 5 &&
          ball6num != 5) {
        setState(() {
          ball3num = 5;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 5 &&
          ball2num != 5 &&
          ball3num != 5 &&
          ball5num != 5 &&
          ball6num != 5) {
        setState(() {
          ball4num = 5;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 5 &&
          ball2num != 5 &&
          ball3num != 5 &&
          ball4num != 5 &&
          ball6num != 5) {
        setState(() {
          ball5num = 5;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 5 &&
          ball2num != 5 &&
          ball3num != 5 &&
          ball4num != 5 &&
          ball5num != 5) {
        setState(() {
          ball6num = 5;
        });
      }
    }
    if ((_SearchText == '가발' ||
            _SearchText == '가족' ||
            _SearchText == '간식' ||
            _SearchText == '갈기' ||
            _SearchText == '갈비' ||
            _SearchText == '개꼬리' ||
            _SearchText == '겨자' ||
            _SearchText == '고가구' ||
            _SearchText == '고래' ||
            _SearchText == '고발' ||
            _SearchText == '과속' ||
            _SearchText == '과자' ||
            _SearchText == '괴물' ||
            _SearchText == '교각' ||
            _SearchText == '교복' ||
            _SearchText == '국자' ||
            _SearchText == '군복' ||
            _SearchText == '굴비' ||
            _SearchText == '기계' ||
            _SearchText == '기술과목' ||
            _SearchText == '까치' ||
            _SearchText == '꼽추' ||
            _SearchText == '낙지' ||
            _SearchText == '난간' ||
            _SearchText == '남색' ||
            _SearchText == '납치' ||
            _SearchText == '내복' ||
            _SearchText == '넙치' ||
            _SearchText == '노란배추' ||
            _SearchText == '노래' ||
            _SearchText == '녹두' ||
            _SearchText == '녹차' ||
            _SearchText == '늘보' ||
            _SearchText == '단서' ||
            _SearchText == '대구' ||
            _SearchText == '대학생' ||
            _SearchText == '대학원' ||
            _SearchText == '독창' ||
            _SearchText == '동영상' ||
            _SearchText == '두건' ||
            _SearchText == '때' ||
            _SearchText == '로봇' ||
            _SearchText == '린스' ||
            _SearchText == '맨바닥' ||
            _SearchText == '민물가재' ||
            _SearchText == '바나나' ||
            _SearchText == '바둑' ||
            _SearchText == '박새' ||
            _SearchText == '박쥐' ||
            _SearchText == '반지하' ||
            _SearchText == '베개' ||
            _SearchText == '변기' ||
            _SearchText == '보험가입서류' ||
            _SearchText == '부적' ||
            _SearchText == '부채' ||
            _SearchText == '북극' ||
            _SearchText == '비계' ||
            _SearchText == '비구니' ||
            _SearchText == '비료' ||
            _SearchText == '뿌리' ||
            _SearchText == '사람다리' ||
            _SearchText == '사람음모' ||
            _SearchText == '사전' ||
            _SearchText == '사진' ||
            _SearchText == '사촌' ||
            _SearchText == '산초' ||
            _SearchText == '삿갓' ||
            _SearchText == '서류' ||
            _SearchText == '선녀' ||
            _SearchText == '세로' ||
            _SearchText == '세배' ||
            _SearchText == '소고기' ||
            _SearchText == '소설' ||
            _SearchText == '소포' ||
            _SearchText == '손자' ||
            _SearchText == '수첩' ||
            _SearchText == '수컷' ||
            _SearchText == '신호위반' ||
            _SearchText == '심폐소생술' ||
            _SearchText == '싸리' ||
            _SearchText == '영화관' ||
            _SearchText == '요양원' ||
            _SearchText == '육개장' ||
            _SearchText == '인라인스케이트' ||
            _SearchText == '자두' ||
            _SearchText == '자석' ||
            _SearchText == '제비' ||
            _SearchText == '제사' ||
            _SearchText == '조개' ||
            _SearchText == '조카' ||
            _SearchText == '죄수' ||
            _SearchText == '주스' ||
            _SearchText == '주식' ||
            _SearchText == '중사' ||
            _SearchText == '증명사진' ||
            _SearchText == '집사' ||
            _SearchText == '채소' ||
            _SearchText == '처녀' ||
            _SearchText == '천연기념물' ||
            _SearchText == '초밥' ||
            _SearchText == '축가' ||
            _SearchText == '치과' ||
            _SearchText == '치석' ||
            _SearchText == '치즈' ||
            _SearchText == '투구' ||
            _SearchText == '풀꽃' ||
            _SearchText == '하루살이' ||
            _SearchText == '하얀소복' ||
            _SearchText == '하얀장갑' ||
            _SearchText == '할로윈' ||
            _SearchText == '할아버지' ||
            _SearchText == '해당화' ||
            _SearchText == '해병대' ||
            _SearchText == '헤어젤' ||
            _SearchText == '헬스장' ||
            _SearchText == '혼혈아' ||
            _SearchText == '화장대' ||
            _SearchText == '화장실' ||
            _SearchText == '환풍기' ||
            _SearchText == '흐뭇함') ||
        numButtonSwich[5] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 6 &&
          ball3num != 6 &&
          ball4num != 6 &&
          ball5num != 6 &&
          ball6num != 6) {
        setState(() {
          ball1num = 6;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 6 &&
          ball3num != 6 &&
          ball4num != 6 &&
          ball5num != 6 &&
          ball6num != 6) {
        setState(() {
          ball2num = 6;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 6 &&
          ball2num != 6 &&
          ball4num != 6 &&
          ball5num != 6 &&
          ball6num != 6) {
        setState(() {
          ball3num = 6;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 6 &&
          ball2num != 6 &&
          ball3num != 6 &&
          ball5num != 6 &&
          ball6num != 6) {
        setState(() {
          ball4num = 6;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 6 &&
          ball2num != 6 &&
          ball3num != 6 &&
          ball4num != 6 &&
          ball6num != 6) {
        setState(() {
          ball5num = 6;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 6 &&
          ball2num != 6 &&
          ball3num != 6 &&
          ball4num != 6 &&
          ball5num != 6) {
        setState(() {
          ball6num = 6;
        });
      }
    }
    if ((_SearchText == '가계부' ||
            _SearchText == '가습기' ||
            _SearchText == '갈고리형쇠꼬챙이' ||
            _SearchText == '갈치' ||
            _SearchText == '갓길' ||
            _SearchText == '개고기' ||
            _SearchText == '건대역7호선' ||
            _SearchText == '계곡' ||
            _SearchText == '고깔' ||
            _SearchText == '고등학교' ||
            _SearchText == '고라니' ||
            _SearchText == '고무헤라' ||
            _SearchText == '고사리' ||
            _SearchText == '과제물' ||
            _SearchText == '관복' ||
            _SearchText == '국어선생님' ||
            _SearchText == '군대' ||
            _SearchText == '글씨' ||
            _SearchText == '기숙사' ||
            _SearchText == '깃발' ||
            _SearchText == '꽈리' ||
            _SearchText == '나그네' ||
            _SearchText == '낫' ||
            _SearchText == '낙타' ||
            _SearchText == '너구리' ||
            _SearchText == '네트' ||
            _SearchText == '녹색줄기' ||
            _SearchText == '누비라' ||
            _SearchText == '눈길' ||
            _SearchText == '눈꼽' ||
            _SearchText == '눈썹' ||
            _SearchText == '늑개' ||
            _SearchText == '늑골' ||
            _SearchText == '늑대' ||
            _SearchText == '대게' ||
            _SearchText == '대본' ||
            _SearchText == '대추' ||
            _SearchText == '더덕' ||
            _SearchText == '도포' ||
            _SearchText == '뒤주' ||
            _SearchText == '드론' ||
            _SearchText == '딸' ||
            _SearchText == '로션' ||
            _SearchText == '로프' ||
            _SearchText == '마일드세븐' ||
            _SearchText == '말' ||
            _SearchText == '무지개' ||
            _SearchText == '바가지' ||
            _SearchText == '박쥐' ||
            _SearchText == '박하사탕' ||
            _SearchText == '방송카메라' ||
            _SearchText == '배관' ||
            _SearchText == '백로' ||
            _SearchText == '버찌' ||
            _SearchText == '벌새' ||
            _SearchText == '벌초' ||
            _SearchText == '벤츠' ||
            _SearchText == '벤치' ||
            _SearchText == '벼룩' ||
            _SearchText == '벽지' ||
            _SearchText == '보라매' ||
            _SearchText == '분홍내복' ||
            _SearchText == '불교' ||
            _SearchText == '비닐하우스' ||
            _SearchText == '비키니' ||
            _SearchText == '비행접시' ||
            _SearchText == '사가정역7호선' ||
            _SearchText == '사찰' ||
            _SearchText == '산길' ||
            _SearchText == '상사' ||
            _SearchText == '새싹' ||
            _SearchText == '생리혈' ||
            _SearchText == '샤프' ||
            _SearchText == '석류' ||
            _SearchText == '설교' ||
            _SearchText == '소뿔' ||
            _SearchText == '소철' ||
            _SearchText == '손해배상' ||
            _SearchText == '쇼파' ||
            _SearchText == '수달' ||
            _SearchText == '수표' ||
            _SearchText == '숙제' ||
            _SearchText == '순록' ||
            _SearchText == '슈퍼마켓' ||
            _SearchText == '신발' ||
            _SearchText == '쑥갓' ||
            _SearchText == '양쪽팔' ||
            _SearchText == '역사학자' ||
            _SearchText == '열쇠' ||
            _SearchText == '우유를문아기' ||
            _SearchText == '유한락스' ||
            _SearchText == '작은슈퍼' ||
            _SearchText == '잡곡' ||
            _SearchText == '저금통장' ||
            _SearchText == '적군' ||
            _SearchText == '전복' ||
            _SearchText == '전주시' ||
            _SearchText == '젓소' ||
            _SearchText == '제주시' ||
            _SearchText == '좌석' ||
            _SearchText == '주사기' ||
            _SearchText == '지게' ||
            _SearchText == '지진' ||
            _SearchText == '지퍼' ||
            _SearchText == '참치회' ||
            _SearchText == '처제' ||
            _SearchText == '천식' ||
            _SearchText == '철사' ||
            _SearchText == '체조' ||
            _SearchText == '초록색줄기' ||
            _SearchText == '추락' ||
            _SearchText == '치타' ||
            _SearchText == '커피' ||
            _SearchText == '컵' ||
            _SearchText == '콩' ||
            _SearchText == '콘도' ||
            _SearchText == '쿠션' ||
            _SearchText == '타조' ||
            _SearchText == '터번' ||
            _SearchText == '토끼' ||
            _SearchText == '퇴비' ||
            _SearchText == '티코' ||
            _SearchText == '팥' ||
            _SearchText == '포로' ||
            _SearchText == '포크' ||
            _SearchText == '피리' ||
            _SearchText == '햄스터' ||
            _SearchText == '현금영수증' ||
            _SearchText == '화물선' ||
            _SearchText == '화물차') ||
        numButtonSwich[6] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 7 &&
          ball3num != 7 &&
          ball4num != 7 &&
          ball5num != 7 &&
          ball6num != 7) {
        setState(() {
          ball1num = 7;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 7 &&
          ball3num != 7 &&
          ball4num != 7 &&
          ball5num != 7 &&
          ball6num != 7) {
        setState(() {
          ball2num = 7;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 7 &&
          ball2num != 7 &&
          ball4num != 7 &&
          ball5num != 7 &&
          ball6num != 7) {
        setState(() {
          ball3num = 7;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 7 &&
          ball2num != 7 &&
          ball3num != 7 &&
          ball5num != 7 &&
          ball6num != 7) {
        setState(() {
          ball4num = 7;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 7 &&
          ball2num != 7 &&
          ball3num != 7 &&
          ball4num != 7 &&
          ball6num != 7) {
        setState(() {
          ball5num = 7;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 7 &&
          ball2num != 7 &&
          ball3num != 7 &&
          ball4num != 7 &&
          ball5num != 7) {
        setState(() {
          ball6num = 7;
        });
      }
    }
    if ((_SearchText == '가디건' ||
            _SearchText == '각질' ||
            _SearchText == '간판' ||
            _SearchText == '개구리' ||
            _SearchText == '개나리' ||
            _SearchText == '건조기' ||
            _SearchText == '걸레' ||
            _SearchText == '계단' ||
            _SearchText == '과꽃' ||
            _SearchText == '권투' ||
            _SearchText == '금돼지' ||
            _SearchText == '기저귀' ||
            _SearchText == '긴바지' ||
            _SearchText == '꽈배기' ||
            _SearchText == '나시' ||
            _SearchText == '냅킨' ||
            _SearchText == '노숙' ||
            _SearchText == '다이너마이트' ||
            _SearchText == '닫힌수갑' ||
            _SearchText == '대전광역시' ||
            _SearchText == '도자기' ||
            _SearchText == '독가스' ||
            _SearchText == '독촉' ||
            _SearchText == '돈까스' ||
            _SearchText == '돌하르방' ||
            _SearchText == '돼지발' ||
            _SearchText == '두꺼비' ||
            _SearchText == '디스크' ||
            _SearchText == '따귀' ||
            _SearchText == '라벨' ||
            _SearchText == '렌즈' ||
            _SearchText == '로켓' ||
            _SearchText == '망사스타킹' ||
            _SearchText == '모닝' ||
            _SearchText == '묶음' ||
            _SearchText == '문을닫음' ||
            _SearchText == '바니걸' ||
            _SearchText == '바지선' ||
            _SearchText == '박치기' ||
            _SearchText == '박카스' ||
            _SearchText == '반바지' ||
            _SearchText == '밤줍기' ||
            _SearchText == '밥솥' ||
            _SearchText == '배수로' ||
            _SearchText == '백혈병' ||
            _SearchText == '벌집' ||
            _SearchText == '병원응급차' ||
            _SearchText == '보리밥' ||
            _SearchText == '보리차' ||
            _SearchText == '보조개' ||
            _SearchText == '볼트' ||
            _SearchText == '부둣가' ||
            _SearchText == '분꽃' ||
            _SearchText == '불고기' ||
            _SearchText == '불륜' ||
            _SearchText == '붓꽃' ||
            _SearchText == '뷔페' ||
            _SearchText == '비행기표' ||
            _SearchText == '뻐꾸기' ||
            _SearchText == '사진사' ||
            _SearchText == '산수국' ||
            _SearchText == '셀카' ||
            _SearchText == '소변기' ||
            _SearchText == '수갑' ||
            _SearchText == '수돗가' ||
            _SearchText == '수사관' ||
            _SearchText == '수학시험' ||
            _SearchText == '술잔' ||
            _SearchText == '숫돌' ||
            _SearchText == '숲속' ||
            _SearchText == '섬' ||
            _SearchText == '신기루' ||
            _SearchText == '쌀밥' ||
            _SearchText == '여자가슴' ||
            _SearchText == '역기' ||
            _SearchText == '영업사원' ||
            _SearchText == '오뚜기' ||
            _SearchText == '일등상사' ||
            _SearchText == '잠수함' ||
            _SearchText == '전축' ||
            _SearchText == '제단' ||
            _SearchText == '조수석' ||
            _SearchText == '조폭' ||
            _SearchText == '주점' ||
            _SearchText == '쥐포' ||
            _SearchText == '지구본' ||
            _SearchText == '직장후배' ||
            _SearchText == '천재' ||
            _SearchText == '철근' ||
            _SearchText == '초등학교' ||
            _SearchText == '촛대' ||
            _SearchText == '촛불' ||
            _SearchText == '출근' ||
            _SearchText == '취직' ||
            _SearchText == '카지노' ||
            _SearchText == '커튼' ||
            _SearchText == '코브라' ||
            _SearchText == '콜라' ||
            _SearchText == '콧대' ||
            _SearchText == '쿠폰' ||
            _SearchText == '택시' ||
            _SearchText == '터널' ||
            _SearchText == '토기' ||
            _SearchText == '토란' ||
            _SearchText == '파티' ||
            _SearchText == '팔월군번' ||
            _SearchText == '하얀색손수건' ||
            _SearchText == '호적등본' ||
            _SearchText == '회사동료' ||
            _SearchText == '후라이팬' ||
            _SearchText == '흰쌀밥') ||
        numButtonSwich[7] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 8 &&
          ball3num != 8 &&
          ball4num != 8 &&
          ball5num != 8 &&
          ball6num != 8) {
        setState(() {
          ball1num = 8;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 8 &&
          ball3num != 8 &&
          ball4num != 8 &&
          ball5num != 8 &&
          ball6num != 8) {
        setState(() {
          ball2num = 8;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 8 &&
          ball2num != 8 &&
          ball4num != 8 &&
          ball5num != 8 &&
          ball6num != 8) {
        setState(() {
          ball3num = 8;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 8 &&
          ball2num != 8 &&
          ball3num != 8 &&
          ball5num != 8 &&
          ball6num != 8) {
        setState(() {
          ball4num = 8;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 8 &&
          ball2num != 8 &&
          ball3num != 8 &&
          ball4num != 8 &&
          ball6num != 8) {
        setState(() {
          ball5num = 8;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 8 &&
          ball2num != 8 &&
          ball3num != 8 &&
          ball4num != 8 &&
          ball5num != 8) {
        setState(() {
          ball6num = 8;
        });
      }
    }
    if ((_SearchText == '개량한복' ||
            _SearchText == '개살구' ||
            _SearchText == '게' ||
            _SearchText == '결제' ||
            _SearchText == '계산기' ||
            _SearchText == '고속버스' ||
            _SearchText == '공주드레스' ||
            _SearchText == '구두솔' ||
            _SearchText == '군부대' ||
            _SearchText == '굴삭기' ||
            _SearchText == '기술자' ||
            _SearchText == '깃털' ||
            _SearchText == '깍두기' ||
            _SearchText == '껍질' ||
            _SearchText == '꿀벌' ||
            _SearchText == '나룻배' ||
            _SearchText == '낚시추' ||
            _SearchText == '누룽지' ||
            _SearchText == '다슬기' ||
            _SearchText == '달래' ||
            _SearchText == '달빛' ||
            _SearchText == '대궐' ||
            _SearchText == '대출' ||
            _SearchText == '대패' ||
            _SearchText == '도끼빗' ||
            _SearchText == '도라지' ||
            _SearchText == '도라지뿌리' ||
            _SearchText == '도서관' ||
            _SearchText == '도시락' ||
            _SearchText == '도시락통' ||
            _SearchText == '독수리' ||
            _SearchText == '돋보기' ||
            _SearchText == '두더지' ||
            _SearchText == '딱새' ||
            _SearchText == '딸기' ||
            _SearchText == '딸기나무' ||
            _SearchText == '떡국' ||
            _SearchText == '만화책' ||
            _SearchText == '망원경' ||
            _SearchText == '메달' ||
            _SearchText == '미행' ||
            _SearchText == '바비큐' ||
            _SearchText == '발차기' ||
            _SearchText == '밥풀' ||
            _SearchText == '배기가스' ||
            _SearchText == '백화점' ||
            _SearchText == '버스표' ||
            _SearchText == '번데기' ||
            _SearchText == '벌' ||
            _SearchText == '벚꽃' ||
            _SearchText == '벨트' ||
            _SearchText == '벽돌' ||
            _SearchText == '병원침대' ||
            _SearchText == '복분자' ||
            _SearchText == '봉돌' ||
            _SearchText == '분필' ||
            _SearchText == '불꽃' ||
            _SearchText == '불사신' ||
            _SearchText == '비둘기' ||
            _SearchText == '비밀번호' ||
            _SearchText == '비스켓' ||
            _SearchText == '빈자리' ||
            _SearchText == '빗자루' ||
            _SearchText == '빨래' ||
            _SearchText == '사골국' ||
            _SearchText == '사람이빠짐' ||
            _SearchText == '살코기' ||
            _SearchText == '삼성르노' ||
            _SearchText == '샌달' ||
            _SearchText == '샛별' ||
            _SearchText == '소주잔' ||
            _SearchText == '손가락' ||
            _SearchText == '손바닥' ||
            _SearchText == '손사래' ||
            _SearchText == '솔밭' ||
            _SearchText == '솔숲' ||
            _SearchText == '쇠구슬' ||
            _SearchText == '수저' ||
            _SearchText == '스카프' ||
            _SearchText == '스크린' ||
            _SearchText == '스티커' ||
            _SearchText == '스피커' ||
            _SearchText == '시라소니' ||
            _SearchText == '쓰레기' ||
            _SearchText == '여종업원' ||
            _SearchText == '연설' ||
            _SearchText == '음성메세지' ||
            _SearchText == '자전거' ||
            _SearchText == '장수하늘소' ||
            _SearchText == '재판' ||
            _SearchText == '전철' ||
            _SearchText == '전표' ||
            _SearchText == '조리' ||
            _SearchText == '졸업앨범' ||
            _SearchText == '좁쌀' ||
            _SearchText == '죄수복' ||
            _SearchText == '주차선' ||
            _SearchText == '지리산' ||
            _SearchText == '지폐' ||
            _SearchText == '지하철역' ||
            _SearchText == '진찰' ||
            _SearchText == '진흙탕' ||
            _SearchText == '짚신' ||
            _SearchText == '철골' ||
            _SearchText == '초가집' ||
            _SearchText == '축구경기' ||
            _SearchText == '친할머니' ||
            _SearchText == '코끼리' ||
            _SearchText == '타자기' ||
            _SearchText == '타잔' ||
            _SearchText == '테니스' ||
            _SearchText == '티켓' ||
            _SearchText == '팬더' ||
            _SearchText == '편지' ||
            _SearchText == '폭발' ||
            _SearchText == '폭죽' ||
            _SearchText == '피바다' ||
            _SearchText == '피클' ||
            _SearchText == '학원교실' ||
            _SearchText == '한복치마' ||
            _SearchText == '할미꽃' ||
            _SearchText == '항문' ||
            _SearchText == '현관' ||
            _SearchText == '혼잣말' ||
            _SearchText == '홍삼') ||
        numButtonSwich[8] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 9 &&
          ball3num != 9 &&
          ball4num != 9 &&
          ball5num != 9 &&
          ball6num != 9) {
        setState(() {
          ball1num = 9;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 9 &&
          ball3num != 9 &&
          ball4num != 9 &&
          ball5num != 9 &&
          ball6num != 9) {
        setState(() {
          ball2num = 9;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 9 &&
          ball2num != 9 &&
          ball4num != 9 &&
          ball5num != 9 &&
          ball6num != 9) {
        setState(() {
          ball3num = 9;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 9 &&
          ball2num != 9 &&
          ball3num != 9 &&
          ball5num != 9 &&
          ball6num != 9) {
        setState(() {
          ball4num = 9;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 9 &&
          ball2num != 9 &&
          ball3num != 9 &&
          ball4num != 9 &&
          ball6num != 9) {
        setState(() {
          ball5num = 9;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 9 &&
          ball2num != 9 &&
          ball3num != 9 &&
          ball4num != 9 &&
          ball5num != 9) {
        setState(() {
          ball6num = 9;
        });
      }
    }
    if ((_SearchText == '가로수' ||
            _SearchText == '가마' ||
            _SearchText == '갈비뼈' ||
            _SearchText == '갯벌' ||
            _SearchText == '건전지' ||
            _SearchText == '건포도' ||
            _SearchText == '결혼식장' ||
            _SearchText == '경주' ||
            _SearchText == '고가다리' ||
            _SearchText == '고릴라' ||
            _SearchText == '고모' ||
            _SearchText == '고자질' ||
            _SearchText == '공' ||
            _SearchText == '굴렁쇠' ||
            _SearchText == '급식실' ||
            _SearchText == '기차표' ||
            _SearchText == '길바닥' ||
            _SearchText == '껌' ||
            _SearchText == '꽃밭' ||
            _SearchText == '꾀꼬리' ||
            _SearchText == '나무' ||
            _SearchText == '눈' ||
            _SearchText == '노린재' ||
            _SearchText == '달력' ||
            _SearchText == '달리기' ||
            _SearchText == '대리석' ||
            _SearchText == '댄스' ||
            _SearchText == '더하기기호' ||
            _SearchText == '도토리' ||
            _SearchText == '독서실' ||
            _SearchText == '돈' ||
            _SearchText == '동네아줌마' ||
            _SearchText == '들판' ||
            _SearchText == '랍스터' ||
            _SearchText == '망' ||
            _SearchText == '모기' ||
            _SearchText == '모시' ||
            _SearchText == '미사' ||
            _SearchText == '미소' ||
            _SearchText == '밀' ||
            _SearchText == '바닷가뻘밭' ||
            _SearchText == '발전기' ||
            _SearchText == '배구선수' ||
            _SearchText == '백두산' ||
            _SearchText == '백만원권수표' ||
            _SearchText == '벌목' ||
            _SearchText == '베란다' ||
            _SearchText == '볏짚' ||
            _SearchText == '보닛' ||
            _SearchText == '보따리' ||
            _SearchText == '보리' ||
            _SearchText == '보리가루' ||
            _SearchText == '본넷' ||
            _SearchText == '부싯돌' ||
            _SearchText == '부잣집' ||
            _SearchText == '북' ||
            _SearchText == '불도저' ||
            _SearchText == '브라질' ||
            _SearchText == '사수자리' ||
            _SearchText == '사진첩' ||
            _SearchText == '산기슭' ||
            _SearchText == '산사태' ||
            _SearchText == '산토끼' ||
            _SearchText == '새끼쥐' ||
            _SearchText == '석고보드' ||
            _SearchText == '세탁기' ||
            _SearchText == '세탁소' ||
            _SearchText == '수건' ||
            _SearchText == '수박서리' ||
            _SearchText == '수조' ||
            _SearchText == '수족관' ||
            _SearchText == '순대국' ||
            _SearchText == '스킨쉽' ||
            _SearchText == '스펀지' ||
            _SearchText == '시골길' ||
            _SearchText == '시골집' ||
            _SearchText == '시식' ||
            _SearchText == '시줏돈' ||
            _SearchText == '십만원' ||
            _SearchText == '십자가' ||
            _SearchText == '쑥떡' ||
            _SearchText == '아식스' ||
            _SearchText == '아줌마' ||
            _SearchText == '어항' ||
            _SearchText == '자동차본네트' ||
            _SearchText == '자투리' ||
            _SearchText == '자판기' ||
            _SearchText == '잠' ||
            _SearchText == '잡곡밥' ||
            _SearchText == '전원주택' ||
            _SearchText == '전투기' ||
            _SearchText == '점을뺌' ||
            _SearchText == '족두리' ||
            _SearchText == '족제비' ||
            _SearchText == '주전자' ||
            _SearchText == '지하주차장' ||
            _SearchText == '짐' ||
            _SearchText == '징' ||
            _SearchText == '채찍' ||
            _SearchText == '철모' ||
            _SearchText == '체육대회' ||
            _SearchText == '칠판' ||
            _SearchText == '코란도' ||
            _SearchText == '코뿔소' ||
            _SearchText == '퀵보드' ||
            _SearchText == '태극기' ||
            _SearchText == '텃밭' ||
            _SearchText == '테라스' ||
            _SearchText == '텐트' ||
            _SearchText == '토스트' ||
            _SearchText == '투기꾼' ||
            _SearchText == '판소리' ||
            _SearchText == '펜션' ||
            _SearchText == '폐백' ||
            _SearchText == '포도주' ||
            _SearchText == '폭탄' ||
            _SearchText == '해' ||
            _SearchText == '해운대' ||
            _SearchText == '헤드라이터' ||
            _SearchText == '홍어' ||
            _SearchText == '흰테이블') ||
        numButtonSwich[9] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 10 &&
          ball3num != 10 &&
          ball4num != 10 &&
          ball5num != 10 &&
          ball6num != 10) {
        setState(() {
          ball1num = 10;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 10 &&
          ball3num != 10 &&
          ball4num != 10 &&
          ball5num != 10 &&
          ball6num != 10) {
        setState(() {
          ball2num = 10;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 10 &&
          ball2num != 10 &&
          ball4num != 10 &&
          ball5num != 10 &&
          ball6num != 10) {
        setState(() {
          ball3num = 10;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 10 &&
          ball2num != 10 &&
          ball3num != 10 &&
          ball5num != 10 &&
          ball6num != 10) {
        setState(() {
          ball4num = 10;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 10 &&
          ball2num != 10 &&
          ball3num != 10 &&
          ball4num != 10 &&
          ball6num != 10) {
        setState(() {
          ball5num = 10;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 10 &&
          ball2num != 10 &&
          ball3num != 10 &&
          ball4num != 10 &&
          ball5num != 10) {
        setState(() {
          ball6num = 10;
        });
      }
    }
    if ((_SearchText == '가격표' ||
            _SearchText == '가스벨브' ||
            _SearchText == '개구리밥' ||
            _SearchText == '고속도로' ||
            _SearchText == '고춧가루' ||
            _SearchText == '공항' ||
            _SearchText == '금' ||
            _SearchText == '꽃바구니' ||
            _SearchText == '꽃수레' ||
            _SearchText == '낚싯대' ||
            _SearchText == '낚싯줄' ||
            _SearchText == '날도래' ||
            _SearchText == '날파리' ||
            _SearchText == '널판지' ||
            _SearchText == '돈다발' ||
            _SearchText == '돌고래' ||
            _SearchText == '돌다리' ||
            _SearchText == '때수건' ||
            _SearchText == '립글로즈' ||
            _SearchText == '립스틱' ||
            _SearchText == '반딧불' ||
            _SearchText == '반말' ||
            _SearchText == '발레복' ||
            _SearchText == '방울토마토' ||
            _SearchText == '배추밭' ||
            _SearchText == '버티컬' ||
            _SearchText == '변기커버' ||
            _SearchText == '부탄가스' ||
            _SearchText == '불가사리' ||
            _SearchText == '사다리차' ||
            _SearchText == '사자탈' ||
            _SearchText == '사절단' ||
            _SearchText == '샌드백' ||
            _SearchText == '샐러드' ||
            _SearchText == '서울대' ||
            _SearchText == '서울대학' ||
            _SearchText == '석기시대' ||
            _SearchText == '선로' ||
            _SearchText == '쇠창살' ||
            _SearchText == '수류탄' ||
            _SearchText == '순금덩어리' ||
            _SearchText == '스키' ||
            _SearchText == '스탠드' ||
            _SearchText == '슬리퍼' ||
            _SearchText == '신발끈' ||
            _SearchText == '전기파리채' ||
            _SearchText == '전단지' ||
            _SearchText == '전봇대' ||
            _SearchText == '절단기' ||
            _SearchText == '제비꽃' ||
            _SearchText == '조각칼' ||
            _SearchText == '족집게' ||
            _SearchText == '찰떡' ||
            _SearchText == '철도' ||
            _SearchText == '철쭉' ||
            _SearchText == '쳇바퀴' ||
            _SearchText == '축구선수' ||
            _SearchText == '카세트' ||
            _SearchText == '커피숍' ||
            _SearchText == '탈곡기' ||
            _SearchText == '테두리' ||
            _SearchText == '통화' ||
            _SearchText == '투구꽃' ||
            _SearchText == '튤립팥' ||
            _SearchText == '트로피' ||
            _SearchText == '파라솔' ||
            _SearchText == '파리채' ||
            _SearchText == '파출소' ||
            _SearchText == '파티복' ||
            _SearchText == '폭포' ||
            _SearchText == '하얀색타올' ||
            _SearchText == '화장품' ||
            _SearchText == '황금') ||
        numButtonSwich[10] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 11 &&
          ball3num != 11 &&
          ball4num != 11 &&
          ball5num != 11 &&
          ball6num != 11) {
        setState(() {
          ball1num = 11;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 11 &&
          ball3num != 11 &&
          ball4num != 11 &&
          ball5num != 11 &&
          ball6num != 11) {
        setState(() {
          ball2num = 11;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 11 &&
          ball2num != 11 &&
          ball4num != 11 &&
          ball5num != 11 &&
          ball6num != 11) {
        setState(() {
          ball3num = 11;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 11 &&
          ball2num != 11 &&
          ball3num != 11 &&
          ball5num != 11 &&
          ball6num != 11) {
        setState(() {
          ball4num = 11;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 11 &&
          ball2num != 11 &&
          ball3num != 11 &&
          ball4num != 11 &&
          ball6num != 11) {
        setState(() {
          ball5num = 11;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 11 &&
          ball2num != 11 &&
          ball3num != 11 &&
          ball4num != 11 &&
          ball5num != 11) {
        setState(() {
          ball6num = 11;
        });
      }
    }
    if ((_SearchText == '가스레인지' ||
            _SearchText == '감기' ||
            _SearchText == '감주' ||
            _SearchText == '개밥그릇' ||
            _SearchText == '갤로퍼' ||
            _SearchText == '경사길' ||
            _SearchText == '고무인형' ||
            _SearchText == '고민' ||
            _SearchText == '곰보' ||
            _SearchText == '과태료' ||
            _SearchText == '그룹섹스' ||
            _SearchText == '금고' ||
            _SearchText == '금니' ||
            _SearchText == '꽃다발' ||
            _SearchText == '대걸레' ||
            _SearchText == '댐' ||
            _SearchText == '도마' ||
            _SearchText == '돈벌레' ||
            _SearchText == '돈육' ||
            _SearchText == '돼지고기' ||
            _SearchText == '랙스톤' ||
            _SearchText == '마루' ||
            _SearchText == '마산' ||
            _SearchText == '마커' ||
            _SearchText == '마크' ||
            _SearchText == '머루' ||
            _SearchText == '머리깎기' ||
            _SearchText == '메기' ||
            _SearchText == '모자' ||
            _SearchText == '목수' ||
            _SearchText == '무쏘' ||
            _SearchText == '미국' ||
            _SearchText == '미군' ||
            _SearchText == '미납,' ||
            _SearchText == '미신' ||
            _SearchText == '바닷가재' ||
            _SearchText == '부검' ||
            _SearchText == '비탈길' ||
            _SearchText == '사슴' ||
            _SearchText == '산딸기' ||
            _SearchText == '세종대학교' ||
            _SearchText == '소금' ||
            _SearchText == '소문' ||
            _SearchText == '손빨래' ||
            _SearchText == '수도꼭지' ||
            _SearchText == '수도배관' ||
            _SearchText == '순찰대장' ||
            _SearchText == '스케치북' ||
            _SearchText == '스포츠카' ||
            _SearchText == '시계바늘' ||
            _SearchText == '시골친구' ||
            _SearchText == '시댁식구' ||
            _SearchText == '씨래기국' ||
            _SearchText == '씨씨티비' ||
            _SearchText == '여행' ||
            _SearchText == '연세대학교' ||
            _SearchText == '왼쪽팔뚝' ||
            _SearchText == '은행,' ||
            _SearchText == '인형' ||
            _SearchText == '자동차보조좌석' ||
            _SearchText == '잔디밭' ||
            _SearchText == '전기스토브' ||
            _SearchText == '젖꼭지' ||
            _SearchText == '조선시대' ||
            _SearchText == '집개미' ||
            _SearchText == '짝짓기' ||
            _SearchText == '처마' ||
            _SearchText == '철조끼' ||
            _SearchText == '청소차' ||
            _SearchText == '체조선수' ||
            _SearchText == '치마' ||
            _SearchText == '커터칼' ||
            _SearchText == '코딱지' ||
            _SearchText == '콘센트' ||
            _SearchText == '크린랩' ||
            _SearchText == '탁구선수' ||
            _SearchText == '태권도' ||
            _SearchText == '털조끼' ||
            _SearchText == '파렛트' ||
            _SearchText == '표고버섯') ||
        numButtonSwich[11] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 12 &&
          ball3num != 12 &&
          ball4num != 12 &&
          ball5num != 12 &&
          ball6num != 12) {
        setState(() {
          ball1num = 12;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 12 &&
          ball3num != 12 &&
          ball4num != 12 &&
          ball5num != 12 &&
          ball6num != 12) {
        setState(() {
          ball2num = 12;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 12 &&
          ball2num != 12 &&
          ball4num != 12 &&
          ball5num != 12 &&
          ball6num != 12) {
        setState(() {
          ball3num = 12;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 12 &&
          ball2num != 12 &&
          ball3num != 12 &&
          ball5num != 12 &&
          ball6num != 12) {
        setState(() {
          ball4num = 12;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 12 &&
          ball2num != 12 &&
          ball3num != 12 &&
          ball4num != 12 &&
          ball6num != 12) {
        setState(() {
          ball5num = 12;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 12 &&
          ball2num != 12 &&
          ball3num != 12 &&
          ball4num != 12 &&
          ball5num != 12) {
        setState(() {
          ball6num = 12;
        });
      }
    }
    if ((_SearchText == '검정색양복' ||
            _SearchText == '고속철도' ||
            _SearchText == '골프선수' ||
            _SearchText == '구두뒷굽' ||
            _SearchText == '권투선수' ||
            _SearchText == '나팔꽃' ||
            _SearchText == '모기향' ||
            _SearchText == '무술대회' ||
            _SearchText == '발레리나' ||
            _SearchText == '방' ||
            _SearchText == '방공호' ||
            _SearchText == '백숙' ||
            _SearchText == '벙커' ||
            _SearchText == '보도블럭' ||
            _SearchText == '보스턴백' ||
            _SearchText == '블루베리' ||
            _SearchText == '블루투스' ||
            _SearchText == '상' ||
            _SearchText == '석고대죄' ||
            _SearchText == '스파게티' ||
            _SearchText == '쌍용자동차' ||
            _SearchText == '쓰레받기' ||
            _SearchText == '양' ||
            _SearchText == '양은냄비' ||
            _SearchText == '옷' ||
            _SearchText == '자수' ||
            _SearchText == '줄다리기' ||
            _SearchText == '진달래' ||
            _SearchText == '철책선' ||
            _SearchText == '체크카드' ||
            _SearchText == '초콜릿' ||
            _SearchText == '카스텔라' ||
            _SearchText == '크레파스' ||
            _SearchText == '트랙터' ||
            _SearchText == '파스텔' ||
            _SearchText == '포켓볼' ||
            _SearchText == '포플러' ||
            _SearchText == '표지판' ||
            _SearchText == '풀피리' ||
            _SearchText == '향나무' ||
            _SearchText == '현대자동차' ||
            _SearchText == '황토실') ||
        numButtonSwich[12] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 13 &&
          ball3num != 13 &&
          ball4num != 13 &&
          ball5num != 13 &&
          ball6num != 13) {
        setState(() {
          ball1num = 13;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 13 &&
          ball3num != 13 &&
          ball4num != 13 &&
          ball5num != 13 &&
          ball6num != 13) {
        setState(() {
          ball2num = 13;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 13 &&
          ball2num != 13 &&
          ball4num != 13 &&
          ball5num != 13 &&
          ball6num != 13) {
        setState(() {
          ball3num = 13;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 13 &&
          ball2num != 13 &&
          ball3num != 13 &&
          ball5num != 13 &&
          ball6num != 13) {
        setState(() {
          ball4num = 13;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 13 &&
          ball2num != 13 &&
          ball3num != 13 &&
          ball4num != 13 &&
          ball6num != 13) {
        setState(() {
          ball5num = 13;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 13 &&
          ball2num != 13 &&
          ball3num != 13 &&
          ball4num != 13 &&
          ball5num != 13) {
        setState(() {
          ball6num = 13;
        });
      }
    }
    if ((_SearchText == '가면' ||
            _SearchText == '감자' ||
            _SearchText == '감초' ||
            _SearchText == '거름' ||
            _SearchText == '검도' ||
            _SearchText == '검도장' ||
            _SearchText == '검정색콩' ||
            _SearchText == '고구마' ||
            _SearchText == '고름' ||
            _SearchText == '고모부' ||
            _SearchText == '광어회' ||
            _SearchText == '교문' ||
            _SearchText == '권총' ||
            _SearchText == '그림' ||
            _SearchText == '그물' ||
            _SearchText == '기름' ||
            _SearchText == '기름공장' ||
            _SearchText == '김밥' ||
            _SearchText == '김치' ||
            _SearchText == '남극' ||
            _SearchText == '남자' ||
            _SearchText == '냄비' ||
            _SearchText == '논문' ||
            _SearchText == '닭볶음탕' ||
            _SearchText == '담비' ||
            _SearchText == '대마' ||
            _SearchText == '도라지하얀꽃' ||
            _SearchText == '돼지새끼' ||
            _SearchText == '등' ||
            _SearchText == '등판' ||
            _SearchText == '마늘' ||
            _SearchText == '마법' ||
            _SearchText == '마술' ||
            _SearchText == '마작' ||
            _SearchText == '막내' ||
            _SearchText == '만두' ||
            _SearchText == '메주' ||
            _SearchText == '명함' ||
            _SearchText == '모란' ||
            _SearchText == '모터' ||
            _SearchText == '목단' ||
            _SearchText == '무대' ||
            _SearchText == '묵주' ||
            _SearchText == '문산시' ||
            _SearchText == '문신' ||
            _SearchText == '미래' ||
            _SearchText == '미술' ||
            _SearchText == '밑반찬' ||
            _SearchText == '바퀴벌레' ||
            _SearchText == '반지케이스' ||
            _SearchText == '발포' ||
            _SearchText == '배추벌레' ||
            _SearchText == '백두대간' ||
            _SearchText == '보물' ||
            _SearchText == '보배' ||
            _SearchText == '보아' ||
            _SearchText == '보아뱀' ||
            _SearchText == '부대찌개' ||
            _SearchText == '분필가루' ||
            _SearchText == '비듬' ||
            _SearchText == '빵' ||
            _SearchText == '사내' ||
            _SearchText == '산삼' ||
            _SearchText == '서점' ||
            _SearchText == '손금' ||
            _SearchText == '손톱깎이' ||
            _SearchText == '수박껍질' ||
            _SearchText == '스탠그릇' ||
            _SearchText == '신문' ||
            _SearchText == '어부' ||
            _SearchText == '옻' ||
            _SearchText == '이' ||
            _SearchText == '저금' ||
            _SearchText == '전기밥솥' ||
            _SearchText == '조준' ||
            _SearchText == '좀비' ||
            _SearchText == '종' ||
            _SearchText == '종이학' ||
            _SearchText == '주먹' ||
            _SearchText == '주목' ||
            _SearchText == '즉석복권' ||
            _SearchText == '지문' ||
            _SearchText == '찌르레기' ||
            _SearchText == '찻숟가락' ||
            _SearchText == '처남' ||
            _SearchText == '천사' ||
            _SearchText == '총' ||
            _SearchText == '카탈로그' ||
            _SearchText == '콘크리트' ||
            _SearchText == '티스푼' ||
            _SearchText == '푸드코트' ||
            _SearchText == '프린터' ||
            _SearchText == '필리핀' ||
            _SearchText == '하이에나' ||
            _SearchText == '홈에버' ||
            _SearchText == '홍어회') ||
        numButtonSwich[13] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 14 &&
          ball3num != 14 &&
          ball4num != 14 &&
          ball5num != 14 &&
          ball6num != 14) {
        setState(() {
          ball1num = 14;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 14 &&
          ball3num != 14 &&
          ball4num != 14 &&
          ball5num != 14 &&
          ball6num != 14) {
        setState(() {
          ball2num = 14;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 14 &&
          ball2num != 14 &&
          ball4num != 14 &&
          ball5num != 14 &&
          ball6num != 14) {
        setState(() {
          ball3num = 14;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 14 &&
          ball2num != 14 &&
          ball3num != 14 &&
          ball5num != 14 &&
          ball6num != 14) {
        setState(() {
          ball4num = 14;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 14 &&
          ball2num != 14 &&
          ball3num != 14 &&
          ball4num != 14 &&
          ball6num != 14) {
        setState(() {
          ball5num = 14;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 14 &&
          ball2num != 14 &&
          ball3num != 14 &&
          ball4num != 14 &&
          ball5num != 14) {
        setState(() {
          ball6num = 14;
        });
      }
    }
    if ((_SearchText == '가루세제' ||
            _SearchText == '가방' ||
            _SearchText == '강가' ||
            _SearchText == '강시' ||
            _SearchText == '개미핥기' ||
            _SearchText == '검정색양복' ||
            _SearchText == '게이' ||
            _SearchText == '고궁' ||
            _SearchText == '고깃배' ||
            _SearchText == '고무양동이' ||
            _SearchText == '공구' ||
            _SearchText == '공부' ||
            _SearchText == '기와' ||
            _SearchText == '나방' ||
            _SearchText == '노인' ||
            _SearchText == '농부' ||
            _SearchText == '농사' ||
            _SearchText == '누에' ||
            _SearchText == '드라큘라' ||
            _SearchText == '레코드판' ||
            _SearchText == '마감' ||
            _SearchText == '마누라' ||
            _SearchText == '매미' ||
            _SearchText == '목마' ||
            _SearchText == '바위' ||
            _SearchText == '보건실' ||
            _SearchText == '보조배터리' ||
            _SearchText == '봉사' ||
            _SearchText == '봉황새' ||
            _SearchText == '부인' ||
            _SearchText == '북어' ||
            _SearchText == '비옷' ||
            _SearchText == '빨래바구니' ||
            _SearchText == '사위' ||
            _SearchText == '새끼손가락' ||
            _SearchText == '새우' ||
            _SearchText == '성가' ||
            _SearchText == '소위' ||
            _SearchText == '수능' ||
            _SearchText == '수업' ||
            _SearchText == '수행원' ||
            _SearchText == '숙모할머니' ||
            _SearchText == '십오만원' ||
            _SearchText == '아내' ||
            _SearchText == '악기' ||
            _SearchText == '악보' ||
            _SearchText == '양버즘나무' ||
            _SearchText == '양호실' ||
            _SearchText == '어선' ||
            _SearchText == '엘피판' ||
            _SearchText == '여수시' ||
            _SearchText == '여자성기' ||
            _SearchText == '와이프' ||
            _SearchText == '운동화' ||
            _SearchText == '운동회' ||
            _SearchText == '이끼' ||
            _SearchText == '이리' ||
            _SearchText == '인사' ||
            _SearchText == '입구' ||
            _SearchText == '전자레인지' ||
            _SearchText == '주차딱지' ||
            _SearchText == '주차위반증' ||
            _SearchText == '집게벌레' ||
            _SearchText == '커피포트' ||
            _SearchText == '클라리넷' ||
            _SearchText == '텔런트' ||
            _SearchText == '파파야' ||
            _SearchText == '플라타너스' ||
            _SearchText == '한약방' ||
            _SearchText == '합의금' ||
            _SearchText == '형수' ||
            _SearchText == '휴대폰케이스') ||
        numButtonSwich[14] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 15 &&
          ball3num != 15 &&
          ball4num != 15 &&
          ball5num != 15 &&
          ball6num != 15) {
        setState(() {
          ball1num = 15;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 15 &&
          ball3num != 15 &&
          ball4num != 15 &&
          ball5num != 15 &&
          ball6num != 15) {
        setState(() {
          ball2num = 15;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 15 &&
          ball2num != 15 &&
          ball4num != 15 &&
          ball5num != 15 &&
          ball6num != 15) {
        setState(() {
          ball3num = 15;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 15 &&
          ball2num != 15 &&
          ball3num != 15 &&
          ball5num != 15 &&
          ball6num != 15) {
        setState(() {
          ball4num = 15;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 15 &&
          ball2num != 15 &&
          ball3num != 15 &&
          ball4num != 15 &&
          ball6num != 15) {
        setState(() {
          ball5num = 15;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 15 &&
          ball2num != 15 &&
          ball3num != 15 &&
          ball4num != 15 &&
          ball5num != 15) {
        setState(() {
          ball6num = 15;
        });
      }
    }
    if ((_SearchText == '가양쪽' ||
            _SearchText == '감독' ||
            _SearchText == '갑옷' ||
            _SearchText == '거머리' ||
            _SearchText == '건물' ||
            _SearchText == '경비' ||
            _SearchText == '고무신' ||
            _SearchText == '곤봉' ||
            _SearchText == '골목' ||
            _SearchText == '곶감' ||
            _SearchText == '광고' ||
            _SearchText == '괴물' ||
            _SearchText == '군인' ||
            _SearchText == '금색' ||
            _SearchText == '기녀' ||
            _SearchText == '기생' ||
            _SearchText == '깨물기' ||
            _SearchText == '냄새' ||
            _SearchText == '녹색식물' ||
            _SearchText == '눈물' ||
            _SearchText == '다시마' ||
            _SearchText == '단감' ||
            _SearchText == '담배' ||
            _SearchText == '대금' ||
            _SearchText == '대변' ||
            _SearchText == '동서' ||
            _SearchText == '동창회' ||
            _SearchText == '드럼' ||
            _SearchText == '딱따구리' ||
            _SearchText == '똥' ||
            _SearchText == '럼주' ||
            _SearchText == '레몬' ||
            _SearchText == '마스크' ||
            _SearchText == '만화방' ||
            _SearchText == '맛집' ||
            _SearchText == '매듭' ||
            _SearchText == '매실' ||
            _SearchText == '매제' ||
            _SearchText == '맥주' ||
            _SearchText == '메론' ||
            _SearchText == '모내기' ||
            _SearchText == '목발' ||
            _SearchText == '목포시' ||
            _SearchText == '물개' ||
            _SearchText == '미나리' ||
            _SearchText == '믹서기' ||
            _SearchText == '밥상' ||
            _SearchText == '방석' ||
            _SearchText == '배나무' ||
            _SearchText == '배낭' ||
            _SearchText == '백곰' ||
            _SearchText == '백일홍' ||
            _SearchText == '복면' ||
            _SearchText == '봉분' ||
            _SearchText == '부엌' ||
            _SearchText == '분무기' ||
            _SearchText == '브래지어' ||
            _SearchText == '빙산' ||
            _SearchText == '사냥' ||
            _SearchText == '사마귀' ||
            _SearchText == '사우나' ||
            _SearchText == '사원' ||
            _SearchText == '상복' ||
            _SearchText == '상자' ||
            _SearchText == '상처' ||
            _SearchText == '상추' ||
            _SearchText == '샤워' ||
            _SearchText == '석궁' ||
            _SearchText == '석양' ||
            _SearchText == '선물' ||
            _SearchText == '성게' ||
            _SearchText == '세무서' ||
            _SearchText == '속옷' ||
            _SearchText == '수세미' ||
            _SearchText == '수육' ||
            _SearchText == '순두부' ||
            _SearchText == '시청' ||
            _SearchText == '씨름' ||
            _SearchText == '씨앗' ||
            _SearchText == '아녀자' ||
            _SearchText == '안개' ||
            _SearchText == '안주' ||
            _SearchText == '약' ||
            _SearchText == '약사' ||
            _SearchText == '어깨' ||
            _SearchText == '업음' ||
            _SearchText == '여신' ||
            _SearchText == '여자' ||
            _SearchText == '여주시' ||
            _SearchText == '역주행' ||
            _SearchText == '연고' ||
            _SearchText == '연기' ||
            _SearchText == '왁스' ||
            _SearchText == '완구' ||
            _SearchText == '외국' ||
            _SearchText == '요리' ||
            _SearchText == '원서' ||
            _SearchText == '유도' ||
            _SearchText == '의자' ||
            _SearchText == '이슬' ||
            _SearchText == '인두' ||
            _SearchText == '일기' ||
            _SearchText == '일본군입주' ||
            _SearchText == '자궁' ||
            _SearchText == '장구' ||
            _SearchText == '장사' ||
            _SearchText == '재산상속' ||
            _SearchText == '적금' ||
            _SearchText == '전신거울' ||
            _SearchText == '조깅' ||
            _SearchText == '족발' ||
            _SearchText == '주머니' ||
            _SearchText == '주방' ||
            _SearchText == '주인' ||
            _SearchText == '주점' ||
            _SearchText == '주택복권' ||
            _SearchText == '중학생' ||
            _SearchText == '지붕' ||
            _SearchText == '참빗' ||
            _SearchText == '참새' ||
            _SearchText == '참치' ||
            _SearchText == '창부' ||
            _SearchText == '천막' ||
            _SearchText == '천일홍' ||
            _SearchText == '철모' ||
            _SearchText == '키위' ||
            _SearchText == '파리바게트' ||
            _SearchText == '포대기' ||
            _SearchText == '푸드트럭' ||
            _SearchText == '퓨마' ||
            _SearchText == '학생증' ||
            _SearchText == '학원생' ||
            _SearchText == '휴대폰충전기') ||
        numButtonSwich[15] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 16 &&
          ball3num != 16 &&
          ball4num != 16 &&
          ball5num != 16 &&
          ball6num != 16) {
        setState(() {
          ball1num = 16;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 16 &&
          ball3num != 16 &&
          ball4num != 16 &&
          ball5num != 16 &&
          ball6num != 16) {
        setState(() {
          ball2num = 16;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 16 &&
          ball2num != 16 &&
          ball4num != 16 &&
          ball5num != 16 &&
          ball6num != 16) {
        setState(() {
          ball3num = 16;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 16 &&
          ball2num != 16 &&
          ball3num != 16 &&
          ball5num != 16 &&
          ball6num != 16) {
        setState(() {
          ball4num = 16;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 16 &&
          ball2num != 16 &&
          ball3num != 16 &&
          ball4num != 16 &&
          ball6num != 16) {
        setState(() {
          ball5num = 16;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 16 &&
          ball2num != 16 &&
          ball3num != 16 &&
          ball4num != 16 &&
          ball5num != 16) {
        setState(() {
          ball6num = 16;
        });
      }
    }
    if ((_SearchText == '가오리' ||
            _SearchText == '간장' ||
            _SearchText == '간장게장' ||
            _SearchText == '감금' ||
            _SearchText == '거래' ||
            _SearchText == '거북이' ||
            _SearchText == '건빵' ||
            _SearchText == '검문' ||
            _SearchText == '검정봉투' ||
            _SearchText == '곱창' ||
            _SearchText == '공터' ||
            _SearchText == '광주광역시' ||
            _SearchText == '광화문' ||
            _SearchText == '군청' ||
            _SearchText == '궁전' ||
            _SearchText == '권투글러브' ||
            _SearchText == '네이버' ||
            _SearchText == '농기구' ||
            _SearchText == '다이소' ||
            _SearchText == '단상' ||
            _SearchText == '대봉투' ||
            _SearchText == '대야' ||
            _SearchText == '대위' ||
            _SearchText == '도랑' ||
            _SearchText == '도장' ||
            _SearchText == '도청' ||
            _SearchText == '동네' ||
            _SearchText == '등산' ||
            _SearchText == '마담' ||
            _SearchText == '면허증' ||
            _SearchText == '목검' ||
            _SearchText == '묘목' ||
            _SearchText == '미술전시회' ||
            _SearchText == '밥알' ||
            _SearchText == '뱃사람' ||
            _SearchText == '법당' ||
            _SearchText == '벼랑끝' ||
            _SearchText == '분장' ||
            _SearchText == '붕대' ||
            _SearchText == '비디오' ||
            _SearchText == '비상구' ||
            _SearchText == '빈병' ||
            _SearchText == '사이다' ||
            _SearchText == '산장' ||
            _SearchText == '삼각요트' ||
            _SearchText == '상투' ||
            _SearchText == '생리' ||
            _SearchText == '선장' ||
            _SearchText == '성곽' ||
            _SearchText == '소령' ||
            _SearchText == '소풍' ||
            _SearchText == '손등' ||
            _SearchText == '수의사' ||
            _SearchText == '스위스' ||
            _SearchText == '스크린골프' ||
            _SearchText == '스포츠토토' ||
            _SearchText == '식당' ||
            _SearchText == '식빵' ||
            _SearchText == '신랑' ||
            _SearchText == '아가씨' ||
            _SearchText == '아들' ||
            _SearchText == '안타' ||
            _SearchText == '액자' ||
            _SearchText == '야채' ||
            _SearchText == '약국' ||
            _SearchText == '언덕' ||
            _SearchText == '여관' ||
            _SearchText == '여권' ||
            _SearchText == '역도' ||
            _SearchText == '연극' ||
            _SearchText == '염라대왕' ||
            _SearchText == '영화표' ||
            _SearchText == '예배' ||
            _SearchText == '오소리' ||
            _SearchText == '옥수수' ||
            _SearchText == '온실' ||
            _SearchText == '온천' ||
            _SearchText == '와사비' ||
            _SearchText == '외투' ||
            _SearchText == '욕조' ||
            _SearchText == '우거지' ||
            _SearchText == '우표' ||
            _SearchText == '우황청심원' ||
            _SearchText == '운전' ||
            _SearchText == '유럽' ||
            _SearchText == '유전' ||
            _SearchText == '유채' ||
            _SearchText == '유흥주은' ||
            _SearchText == '육교' ||
            _SearchText == '육지' ||
            _SearchText == '은색' ||
            _SearchText == '이비인후과' ||
            _SearchText == '인공호흡' ||
            _SearchText == '일식' ||
            _SearchText == '일제강점기' ||
            _SearchText == '잔잔한물' ||
            _SearchText == '장갑' ||
            _SearchText == '장학금' ||
            _SearchText == '재래식화장실' ||
            _SearchText == '쟁기' ||
            _SearchText == '저울' ||
            _SearchText == '전어' ||
            _SearchText == '전통혼례' ||
            _SearchText == '정리' ||
            _SearchText == '정자' ||
            _SearchText == '종교' ||
            _SearchText == '중국' ||
            _SearchText == '창녀' ||
            _SearchText == '천안시' ||
            _SearchText == '청자' ||
            _SearchText == '청주시' ||
            _SearchText == '충주시' ||
            _SearchText == '충치' ||
            _SearchText == '치약' ||
            _SearchText == '카니발' ||
            _SearchText == '컨닝' ||
            _SearchText == '컴퓨터싸인펜' ||
            _SearchText == '큰방' ||
            _SearchText == '테니스라켓' ||
            _SearchText == '푸세식화장실' ||
            _SearchText == '플랜카드' ||
            _SearchText == '하나은행' ||
            _SearchText == '하얀색봉투' ||
            _SearchText == '학원강사' ||
            _SearchText == '현미경' ||
            _SearchText == '혼인서약' ||
            _SearchText == '휴대폰안테나') ||
        numButtonSwich[16] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 17 &&
          ball3num != 17 &&
          ball4num != 17 &&
          ball5num != 17 &&
          ball6num != 17) {
        setState(() {
          ball1num = 17;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 17 &&
          ball3num != 17 &&
          ball4num != 17 &&
          ball5num != 17 &&
          ball6num != 17) {
        setState(() {
          ball2num = 17;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 17 &&
          ball2num != 17 &&
          ball4num != 17 &&
          ball5num != 17 &&
          ball6num != 17) {
        setState(() {
          ball3num = 17;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 17 &&
          ball2num != 17 &&
          ball3num != 17 &&
          ball5num != 17 &&
          ball6num != 17) {
        setState(() {
          ball4num = 17;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 17 &&
          ball2num != 17 &&
          ball3num != 17 &&
          ball4num != 17 &&
          ball6num != 17) {
        setState(() {
          ball5num = 17;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 17 &&
          ball2num != 17 &&
          ball3num != 17 &&
          ball4num != 17 &&
          ball5num != 17) {
        setState(() {
          ball6num = 17;
        });
      }
    }
    if ((_SearchText == '가시나무' ||
            _SearchText == '감로수' ||
            _SearchText == '감탄사' ||
            _SearchText == '건축설계도' ||
            _SearchText == '검정색망사옷' ||
            _SearchText == '검찰' ||
            _SearchText == '경전' ||
            _SearchText == '계정' ||
            _SearchText == '고기' ||
            _SearchText == '고등학생' ||
            _SearchText == '고환' ||
            _SearchText == '공책' ||
            _SearchText == '과메기' ||
            _SearchText == '국회의원' ||
            _SearchText == '권총' ||
            _SearchText == '귀마개' ||
            _SearchText == '금가루' ||
            _SearchText == '기상도' ||
            _SearchText == '긴머리' ||
            _SearchText == '까마귀' ||
            _SearchText == '내무반' ||
            _SearchText == '놀람' ||
            _SearchText == '눈밑' ||
            _SearchText == '늦잠' ||
            _SearchText == '다리미' ||
            _SearchText == '단청' ||
            _SearchText == '독일' ||
            _SearchText == '두루미' ||
            _SearchText == '뒷문' ||
            _SearchText == '뒷물' ||
            _SearchText == '등불' ||
            _SearchText == '딱밤' ||
            _SearchText == '라디오' ||
            _SearchText == '레종' ||
            _SearchText == '리어카' ||
            _SearchText == '마술사' ||
            _SearchText == '말벌' ||
            _SearchText == '맨발' ||
            _SearchText == '머리감기' ||
            _SearchText == '메꽃' ||
            _SearchText == '메두사' ||
            _SearchText == '면발' ||
            _SearchText == '면접' ||
            _SearchText == '멸치' ||
            _SearchText == '모니터' ||
            _SearchText == '목련' ||
            _SearchText == '목소리' ||
            _SearchText == '목젖' ||
            _SearchText == '목줄' ||
            _SearchText == '목탁' ||
            _SearchText == '무료' ||
            _SearchText == '문고리' ||
            _SearchText == '문지기' ||
            _SearchText == '문패' ||
            _SearchText == '물고기' ||
            _SearchText == '미니밴' ||
            _SearchText == '미술가' ||
            _SearchText == '바자문' ||
            _SearchText == '방송비제이' ||
            _SearchText == '배구공' ||
            _SearchText == '뱀술' ||
            _SearchText == '버거킹' ||
            _SearchText == '벚나무' ||
            _SearchText == '베이커리' ||
            _SearchText == '벼이삭' ||
            _SearchText == '불경' ||
            _SearchText == '불법체류자' ||
            _SearchText == '비빔밥' ||
            _SearchText == '빌딩' ||
            _SearchText == '빵집' ||
            _SearchText == '사무실' ||
            _SearchText == '사시나무' ||
            _SearchText == '산수유' ||
            _SearchText == '살롱' ||
            _SearchText == '생고기' ||
            _SearchText == '생전,' ||
            _SearchText == '생쥐' ||
            _SearchText == '생활관' ||
            _SearchText == '샤워기' ||
            _SearchText == '샴푸' ||
            _SearchText == '서울은행' ||
            _SearchText == '성조기' ||
            _SearchText == '소방복' ||
            _SearchText == '소방차' ||
            _SearchText == '속치마' ||
            _SearchText == '솔나무' ||
            _SearchText == '쇼핑' ||
            _SearchText == '수리공' ||
            _SearchText == '수증기' ||
            _SearchText == '술병' ||
            _SearchText == '스파이' ||
            _SearchText == '시금치' ||
            _SearchText == '실종' ||
            _SearchText == '썰매' ||
            _SearchText == '아동학대' ||
            _SearchText == '아저씨' ||
            _SearchText == '암에걸림' ||
            _SearchText == '앞산' ||
            _SearchText == '양념게장' ||
            _SearchText == '어플' ||
            _SearchText == '얼굴' ||
            _SearchText == '역류' ||
            _SearchText == '열쇠' ||
            _SearchText == '엽전' ||
            _SearchText == '오로라' ||
            _SearchText == '온돌' ||
            _SearchText == '옷가게' ||
            _SearchText == '왜적' ||
            _SearchText == '요리사' ||
            _SearchText == '욕실' ||
            _SearchText == '우주복' ||
            _SearchText == '우주선' ||
            _SearchText == '우체부' ||
            _SearchText == '월급' ||
            _SearchText == '이발사' ||
            _SearchText == '인형뽑기' ||
            _SearchText == '작약' ||
            _SearchText == '잠수부' ||
            _SearchText == '잣나무' ||
            _SearchText == '장대' ||
            _SearchText == '전나무' ||
            _SearchText == '전생' ||
            _SearchText == '정글지대' ||
            _SearchText == '정수기' ||
            _SearchText == '제과점' ||
            _SearchText == '종아리' ||
            _SearchText == '주사위' ||
            _SearchText == '주유소' ||
            _SearchText == '중화요리' ||
            _SearchText == '지우개' ||
            _SearchText == '직장' ||
            _SearchText == '참깨' ||
            _SearchText == '창밖' ||
            _SearchText == '창포' ||
            _SearchText == '책상' ||
            _SearchText == '천정' ||
            _SearchText == '철봉' ||
            _SearchText == '청년' ||
            _SearchText == '청소기' ||
            _SearchText == '침대' ||
            _SearchText == '커튼사이로얼굴' ||
            _SearchText == '케이크' ||
            _SearchText == '콘돔' ||
            _SearchText == '콧물' ||
            _SearchText == '쿠킹호일' ||
            _SearchText == '타올' ||
            _SearchText == '탱고' ||
            _SearchText == '통로' ||
            _SearchText == '투명한케이스' ||
            _SearchText == '튀김' ||
            _SearchText == '펑크' ||
            _SearchText == '표범' ||
            _SearchText == '풍난' ||
            _SearchText == '피나무' ||
            _SearchText == '피아노' ||
            _SearchText == '하이마트' ||
            _SearchText == '회장') ||
        numButtonSwich[17] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 18 &&
          ball3num != 18 &&
          ball4num != 18 &&
          ball5num != 18 &&
          ball6num != 18) {
        setState(() {
          ball1num = 18;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 18 &&
          ball3num != 18 &&
          ball4num != 18 &&
          ball5num != 18 &&
          ball6num != 18) {
        setState(() {
          ball2num = 18;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 18 &&
          ball2num != 18 &&
          ball4num != 18 &&
          ball5num != 18 &&
          ball6num != 18) {
        setState(() {
          ball3num = 18;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 18 &&
          ball2num != 18 &&
          ball3num != 18 &&
          ball5num != 18 &&
          ball6num != 18) {
        setState(() {
          ball4num = 18;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 18 &&
          ball2num != 18 &&
          ball3num != 18 &&
          ball4num != 18 &&
          ball6num != 18) {
        setState(() {
          ball5num = 18;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 18 &&
          ball2num != 18 &&
          ball3num != 18 &&
          ball4num != 18 &&
          ball5num != 18) {
        setState(() {
          ball6num = 18;
        });
      }
    }
    if ((_SearchText == '가로등' ||
            _SearchText == '가스통' ||
            _SearchText == '감나무' ||
            _SearchText == '강바닥' ||
            _SearchText == '개업' ||
            _SearchText == '갯바위' ||
            _SearchText == '거북이등껍질' ||
            _SearchText == '경기도' ||
            _SearchText == '경비복' ||
            _SearchText == '경비실' ||
            _SearchText == '고추장' ||
            _SearchText == '곡예사' ||
            _SearchText == '군용헬기' ||
            _SearchText == '기와집' ||
            _SearchText == '꽃병' ||
            _SearchText == '나무문' ||
            _SearchText == '낙엽' ||
            _SearchText == '냉각수' ||
            _SearchText == '노른자' ||
            _SearchText == '다세대주택' ||
            _SearchText == '다홍치마' ||
            _SearchText == '단풍' ||
            _SearchText == '대령' ||
            _SearchText == '대형' ||
            _SearchText == '도로표지판' ||
            _SearchText == '동물' ||
            _SearchText == '동태' ||
            _SearchText == '된장' ||
            _SearchText == '딤섬' ||
            _SearchText == '땅속' ||
            _SearchText == '뚜껑' ||
            _SearchText == '라이벌' ||
            _SearchText == '라이터' ||
            _SearchText == '럭비공' ||
            _SearchText == '링겔' ||
            _SearchText == '망' ||
            _SearchText == '매점' ||
            _SearchText == '무역회사' ||
            _SearchText == '바리깡' ||
            _SearchText == '바지' ||
            _SearchText == '밤나무' ||
            _SearchText == '방바닥' ||
            _SearchText == '법조인' ||
            _SearchText == '별장' ||
            _SearchText == '보일러' ||
            _SearchText == '부동산' ||
            _SearchText == '부랑배' ||
            _SearchText == '부모' ||
            _SearchText == '빨래건조대' ||
            _SearchText == '사모님' ||
            _SearchText == '사이렌' ||
            _SearchText == '삼나무' ||
            _SearchText == '새우젓' ||
            _SearchText == '생식기' ||
            _SearchText == '설탕' ||
            _SearchText == '소방관' ||
            _SearchText == '소주병' ||
            _SearchText == '송편' ||
            _SearchText == '스컹크' ||
            _SearchText == '시위대' ||
            _SearchText == '신한은행' ||
            _SearchText == '애꾸눈' ||
            _SearchText == '연꽃' ||
            _SearchText == '연탄' ||
            _SearchText == '열기구' ||
            _SearchText == '예금통장' ||
            _SearchText == '예비군' ||
            _SearchText == '오디션' ||
            _SearchText == '오리발' ||
            _SearchText == '오솔길' ||
            _SearchText == '외갓집' ||
            _SearchText == '외할머니' ||
            _SearchText == '왼쪽' ||
            _SearchText == '우리집' ||
            _SearchText == '우체국' ||
            _SearchText == '유자차' ||
            _SearchText == '음악디제이' ||
            _SearchText == '이력서' ||
            _SearchText == '일일구신고' ||
            _SearchText == '재규어' ||
            _SearchText == '전쟁' ||
            _SearchText == '정수리' ||
            _SearchText == '제삿상' ||
            _SearchText == '조각' ||
            _SearchText == '좌익수' ||
            _SearchText == '중고차' ||
            _SearchText == '질병' ||
            _SearchText == '청바지' ||
            _SearchText == '초등학생' ||
            _SearchText == '축구공' ||
            _SearchText == '컬링' ||
            _SearchText == '콩가루' ||
            _SearchText == '키위새' ||
            _SearchText == '탄광' ||
            _SearchText == '탄창' ||
            _SearchText == '탱크' ||
            _SearchText == '털옷' ||
            _SearchText == '트랜스젠더' ||
            _SearchText == '패딩' ||
            _SearchText == '피시방' ||
            _SearchText == '한국은행' ||
            _SearchText == '혓바닥' ||
            _SearchText == '형광펜' ||
            _SearchText == '황금빛') ||
        numButtonSwich[18] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 19 &&
          ball3num != 19 &&
          ball4num != 19 &&
          ball5num != 19 &&
          ball6num != 19) {
        setState(() {
          ball1num = 19;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 19 &&
          ball3num != 19 &&
          ball4num != 19 &&
          ball5num != 19 &&
          ball6num != 19) {
        setState(() {
          ball2num = 19;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 19 &&
          ball2num != 19 &&
          ball4num != 19 &&
          ball5num != 19 &&
          ball6num != 19) {
        setState(() {
          ball3num = 19;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 19 &&
          ball2num != 19 &&
          ball3num != 19 &&
          ball5num != 19 &&
          ball6num != 19) {
        setState(() {
          ball4num = 19;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 19 &&
          ball2num != 19 &&
          ball3num != 19 &&
          ball4num != 19 &&
          ball6num != 19) {
        setState(() {
          ball5num = 19;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 19 &&
          ball2num != 19 &&
          ball3num != 19 &&
          ball4num != 19 &&
          ball5num != 19) {
        setState(() {
          ball6num = 19;
        });
      }
    }
    if ((_SearchText == '가마솥' ||
            _SearchText == '가물치' ||
            _SearchText == '간' ||
            _SearchText == '감전사' ||
            _SearchText == '강탈' ||
            _SearchText == '개그' ||
            _SearchText == '개그맨' ||
            _SearchText == '개미굴' ||
            _SearchText == '거미줄' ||
            _SearchText == '견인차' ||
            _SearchText == '계약서' ||
            _SearchText == '고구마순' ||
            _SearchText == '고드름' ||
            _SearchText == '고무줄' ||
            _SearchText == '고인돌' ||
            _SearchText == '공작새' ||
            _SearchText == '군입대' ||
            _SearchText == '굴렁쇠' ||
            _SearchText == '귤나무' ||
            _SearchText == '금반지' ||
            _SearchText == '금시계' ||
            _SearchText == '기관총' ||
            _SearchText == '깻잎' ||
            _SearchText == '남편' ||
            _SearchText == '넥타이' ||
            _SearchText == '놀이기구' ||
            _SearchText == '놀이터' ||
            _SearchText == '누에고치' ||
            _SearchText == '눈금선' ||
            _SearchText == '다락방' ||
            _SearchText == '닭장' ||
            _SearchText == '답안지' ||
            _SearchText == '당구대' ||
            _SearchText == '대학원생' ||
            _SearchText == '대형여객선' ||
            _SearchText == '덤벨' ||
            _SearchText == '도박장' ||
            _SearchText == '드라이기' ||
            _SearchText == '드라이버' ||
            _SearchText == '드라이브' ||
            _SearchText == '드링크' ||
            _SearchText == '롤스로이스' ||
            _SearchText == '리모컨' ||
            _SearchText == '리무진' ||
            _SearchText == '마티즈' ||
            _SearchText == '말보로' ||
            _SearchText == '망' ||
            _SearchText == '머리끈' ||
            _SearchText == '메추리' ||
            _SearchText == '멜론' ||
            _SearchText == '면도기' ||
            _SearchText == '모텔' ||
            _SearchText == '목도리' ||
            _SearchText == '목제소' ||
            _SearchText == '미아' ||
            _SearchText == '밀가루' ||
            _SearchText == '바디워시' ||
            _SearchText == '배' ||
            _SearchText == '백미러' ||
            _SearchText == '백사장' ||
            _SearchText == '버드나무' ||
            _SearchText == '베레모' ||
            _SearchText == '병' ||
            _SearchText == '보물선' ||
            _SearchText == '보신탕' ||
            _SearchText == '복권방' ||
            _SearchText == '부엌가구' ||
            _SearchText == '부침개' ||
            _SearchText == '사과나무' ||
            _SearchText == '사랑' ||
            _SearchText == '사법고시' ||
            _SearchText == '사자춤' ||
            _SearchText == '산나물' ||
            _SearchText == '서랍장' ||
            _SearchText == '선풍기' ||
            _SearchText == '설거지' ||
            _SearchText == '세금' ||
            _SearchText == '소개팅' ||
            _SearchText == '소독약' ||
            _SearchText == '수산물' ||
            _SearchText == '수상스키' ||
            _SearchText == '스웨터' ||
            _SearchText == '스타킹' ||
            _SearchText == '스토킹' ||
            _SearchText == '스프링' ||
            _SearchText == '승용차' ||
            _SearchText == '신문지' ||
            _SearchText == '신분증' ||
            _SearchText == '심장사상충' ||
            _SearchText == '십자매' ||
            _SearchText == '싱크대' ||
            _SearchText == '썰물' ||
            _SearchText == '씀바귀' ||
            _SearchText == '아반테' ||
            _SearchText == '아보카도' ||
            _SearchText == '아파트' ||
            _SearchText == '안테나' ||
            _SearchText == '야구선수' ||
            _SearchText == '약수터' ||
            _SearchText == '예술가' ||
            _SearchText == '오골계' ||
            _SearchText == '오락실' ||
            _SearchText == '오렌지' ||
            _SearchText == '오픈카' ||
            _SearchText == '워크샵' ||
            _SearchText == '유적지' ||
            _SearchText == '유튜브' ||
            _SearchText == '이삭줍기' ||
            _SearchText == '이쑤시개' ||
            _SearchText == '인력거' ||
            _SearchText == '인터뷰' ||
            _SearchText == '일본도' ||
            _SearchText == '잎사귀' ||
            _SearchText == '자동차' ||
            _SearchText == '작업차' ||
            _SearchText == '잠수복' ||
            _SearchText == '장지갑' ||
            _SearchText == '좌측' ||
            _SearchText == '주먹밥' ||
            _SearchText == '주차장' ||
            _SearchText == '찐빵' ||
            _SearchText == '처방전' ||
            _SearchText == '철가방' ||
            _SearchText == '철모' ||
            _SearchText == '청소년' ||
            _SearchText == '청소솔' ||
            _SearchText == '추리닝' ||
            _SearchText == '축구장' ||
            _SearchText == '출입구' ||
            _SearchText == '충전기' ||
            _SearchText == '카메라' ||
            _SearchText == '캥거루' ||
            _SearchText == '코미디언' ||
            _SearchText == '코스모스' ||
            _SearchText == '코알라' ||
            _SearchText == '크레인' ||
            _SearchText == '타박상' ||
            _SearchText == '탈모' ||
            _SearchText == '테잎' ||
            _SearchText == '팔목' ||
            _SearchText == '패물' ||
            _SearchText == '펌프' ||
            _SearchText == '펭귄' ||
            _SearchText == '프랑스' ||
            _SearchText == '피라미' ||
            _SearchText == '피에로' ||
            _SearchText == '함박꽃나무' ||
            _SearchText == '헤어드라이기') ||
        numButtonSwich[19] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 20 &&
          ball3num != 20 &&
          ball4num != 20 &&
          ball5num != 20 &&
          ball6num != 20) {
        setState(() {
          ball1num = 20;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 20 &&
          ball3num != 20 &&
          ball4num != 20 &&
          ball5num != 20 &&
          ball6num != 20) {
        setState(() {
          ball2num = 20;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 20 &&
          ball2num != 20 &&
          ball4num != 20 &&
          ball5num != 20 &&
          ball6num != 20) {
        setState(() {
          ball3num = 20;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 20 &&
          ball2num != 20 &&
          ball3num != 20 &&
          ball5num != 20 &&
          ball6num != 20) {
        setState(() {
          ball4num = 20;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 20 &&
          ball2num != 20 &&
          ball3num != 20 &&
          ball4num != 20 &&
          ball6num != 20) {
        setState(() {
          ball5num = 20;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 20 &&
          ball2num != 20 &&
          ball3num != 20 &&
          ball4num != 20 &&
          ball5num != 20) {
        setState(() {
          ball6num = 20;
        });
      }
    }
    if ((_SearchText == '갈비탕' ||
            _SearchText == '경찰서' ||
            _SearchText == '계량기' ||
            _SearchText == '고향마을' ||
            _SearchText == '공수부대' ||
            _SearchText == '관광지' ||
            _SearchText == '구둘장' ||
            _SearchText == '구역질' ||
            _SearchText == '굴렁쇠' ||
            _SearchText == '기타' ||
            _SearchText == '남녀공학교실' ||
            _SearchText == '남한산성' ||
            _SearchText == '납골당' ||
            _SearchText == '대입시험' ||
            _SearchText == '등산객' ||
            _SearchText == '라일락' ||
            _SearchText == '로또방' ||
            _SearchText == '링거' ||
            _SearchText == '메모' ||
            _SearchText == '몽땅연필' ||
            _SearchText == '무너짐' ||
            _SearchText == '무우' ||
            _SearchText == '물뱀' ||
            _SearchText == '밀림' ||
            _SearchText == '밀물' ||
            _SearchText == '방파제' ||
            _SearchText == '보안카드' ||
            _SearchText == '보이스톡' ||
            _SearchText == '브레이크' ||
            _SearchText == '블라우스' ||
            _SearchText == '뻥튀기' ||
            _SearchText == '사촌언니' ||
            _SearchText == '사촌오빠' ||
            _SearchText == '사탕수수' ||
            _SearchText == '산부인과' ||
            _SearchText == '삼성라이온즈' ||
            _SearchText == '상견례' ||
            _SearchText == '생리대' ||
            _SearchText == '생선가시' ||
            _SearchText == '쇼케이스' ||
            _SearchText == '수산시장' ||
            _SearchText == '승용차짐칸' ||
            _SearchText == '신발장' ||
            _SearchText == '실내화주머니' ||
            _SearchText == '아나콘다' ||
            _SearchText == '아이스하키선수' ||
            _SearchText == '악세서리' ||
            _SearchText == '앞바퀴' ||
            _SearchText == '어댑터' ||
            _SearchText == '연락처' ||
            _SearchText == '옆구리' ||
            _SearchText == '운전기사' ||
            _SearchText == '유리구두' ||
            _SearchText == '이모' ||
            _SearchText == '이산가족' ||
            _SearchText == '인터넷' ||
            _SearchText == '자격증' ||
            _SearchText == '전기공사' ||
            _SearchText == '전조등' ||
            _SearchText == '중세기사' ||
            _SearchText == '참나무' ||
            _SearchText == '창녀촌' ||
            _SearchText == '창호지문' ||
            _SearchText == '체온계' ||
            _SearchText == '초능력' ||
            _SearchText == '치과의사' ||
            _SearchText == '코요테' ||
            _SearchText == '큰아버지' ||
            _SearchText == '탕비실' ||
            _SearchText == '테이블' ||
            _SearchText == '통닭' ||
            _SearchText == '트렁크' ||
            _SearchText == '풀' ||
            _SearchText == '필통' ||
            _SearchText == '황토물') ||
        numButtonSwich[20] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 21 &&
          ball3num != 21 &&
          ball4num != 21 &&
          ball5num != 21 &&
          ball6num != 21) {
        setState(() {
          ball1num = 21;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 21 &&
          ball3num != 21 &&
          ball4num != 21 &&
          ball5num != 21 &&
          ball6num != 21) {
        setState(() {
          ball2num = 21;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 21 &&
          ball2num != 21 &&
          ball4num != 21 &&
          ball5num != 21 &&
          ball6num != 21) {
        setState(() {
          ball3num = 21;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 21 &&
          ball2num != 21 &&
          ball3num != 21 &&
          ball5num != 21 &&
          ball6num != 21) {
        setState(() {
          ball4num = 21;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 21 &&
          ball2num != 21 &&
          ball3num != 21 &&
          ball4num != 21 &&
          ball6num != 21) {
        setState(() {
          ball5num = 21;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 21 &&
          ball2num != 21 &&
          ball3num != 21 &&
          ball4num != 21 &&
          ball5num != 21) {
        setState(() {
          ball6num = 21;
        });
      }
    }
    if ((_SearchText == '가래침' ||
            _SearchText == '개구리알' ||
            _SearchText == '거미다리' ||
            _SearchText == '건널목' ||
            _SearchText == '건물주' ||
            _SearchText == '경찰복' ||
            _SearchText == '경찰차' ||
            _SearchText == '계수나무' ||
            _SearchText == '고무보트' ||
            _SearchText == '고문도구' ||
            _SearchText == '권리금' ||
            _SearchText == '꽃마차' ||
            _SearchText == '꽃무지' ||
            _SearchText == '뉴트리아' ||
            _SearchText == '느릅나무' ||
            _SearchText == '느티나무' ||
            _SearchText == '두루마기' ||
            _SearchText == '둥굴레' ||
            _SearchText == '떡볶이' ||
            _SearchText == '레미콘' ||
            _SearchText == '레즈' ||
            _SearchText == '마라톤' ||
            _SearchText == '마스카라' ||
            _SearchText == '막걸리' ||
            _SearchText == '맘모스' ||
            _SearchText == '매실주' ||
            _SearchText == '머리띠' ||
            _SearchText == '메뚜기' ||
            _SearchText == '메머드' ||
            _SearchText == '면사포' ||
            _SearchText == '모닥불' ||
            _SearchText == '문을잠금' ||
            _SearchText == '미술관' ||
            _SearchText == '민속촌' ||
            _SearchText == '바닷물' ||
            _SearchText == '반찬통' ||
            _SearchText == '반팔옷' ||
            _SearchText == '밭두렁' ||
            _SearchText == '배달원' ||
            _SearchText == '베트남' ||
            _SearchText == '분식점' ||
            _SearchText == '분홍색' ||
            _SearchText == '비닐봉지' ||
            _SearchText == '빙판길' ||
            _SearchText == '사채' ||
            _SearchText == '사치품' ||
            _SearchText == '산중턱' ||
            _SearchText == '살구나무' ||
            _SearchText == '삼백초' ||
            _SearchText == '삼태기' ||
            _SearchText == '성적표' ||
            _SearchText == '셔터' ||
            _SearchText == '셔터문' ||
            _SearchText == '속도위반' ||
            _SearchText == '쇼핑백' ||
            _SearchText == '수돗물' ||
            _SearchText == '스케이트' ||
            _SearchText == '스튜디오' ||
            _SearchText == '스프레이' ||
            _SearchText == '스핑크스' ||
            _SearchText == '시멘트' ||
            _SearchText == '신경질' ||
            _SearchText == '안전핀' ||
            _SearchText == '알파벳' ||
            _SearchText == '애무' ||
            _SearchText == '억새풀' ||
            _SearchText == '여자친구,' ||
            _SearchText == '오른쪽' ||
            _SearchText == '요구르트' ||
            _SearchText == '유리그릇' ||
            _SearchText == '인감증명서' ||
            _SearchText == '인터폰' ||
            _SearchText == '자귀나무' ||
            _SearchText == '자두나무' ||
            _SearchText == '자물쇠' ||
            _SearchText == '잡동사니' ||
            _SearchText == '장독대' ||
            _SearchText == '절구통' ||
            _SearchText == '조약돌' ||
            _SearchText == '쭈꾸미' ||
            _SearchText == '철거민' ||
            _SearchText == '철도청' ||
            _SearchText == '청자켓' ||
            _SearchText == '체육관' ||
            _SearchText == '체중계' ||
            _SearchText == '초롱꽃' ||
            _SearchText == '칭기즈칸배우' ||
            _SearchText == '카네이션' ||
            _SearchText == '토마토' ||
            _SearchText == '판사' ||
            _SearchText == '팥빙수' ||
            _SearchText == '페이스북' ||
            _SearchText == '포도잎' ||
            _SearchText == '품절' ||
            _SearchText == '피나물' ||
            _SearchText == '피난민' ||
            _SearchText == '핑크색' ||
            _SearchText == '하와이' ||
            _SearchText == '해물탕') ||
        numButtonSwich[21] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 22 &&
          ball3num != 22 &&
          ball4num != 22 &&
          ball5num != 22 &&
          ball6num != 22) {
        setState(() {
          ball1num = 22;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 22 &&
          ball3num != 22 &&
          ball4num != 22 &&
          ball5num != 22 &&
          ball6num != 22) {
        setState(() {
          ball2num = 22;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 22 &&
          ball2num != 22 &&
          ball4num != 22 &&
          ball5num != 22 &&
          ball6num != 22) {
        setState(() {
          ball3num = 22;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 22 &&
          ball2num != 22 &&
          ball3num != 22 &&
          ball5num != 22 &&
          ball6num != 22) {
        setState(() {
          ball4num = 22;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 22 &&
          ball2num != 22 &&
          ball3num != 22 &&
          ball4num != 22 &&
          ball6num != 22) {
        setState(() {
          ball5num = 22;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 22 &&
          ball2num != 22 &&
          ball3num != 22 &&
          ball4num != 22 &&
          ball5num != 22) {
        setState(() {
          ball6num = 22;
        });
      }
    }
    if ((_SearchText == '가림막' ||
            _SearchText == '거수경례' ||
            _SearchText == '경찰' ||
            _SearchText == '교실청소' ||
            _SearchText == '근친상간' ||
            _SearchText == '네펜데스' ||
            _SearchText == '노천극장' ||
            _SearchText == '높은음자리' ||
            _SearchText == '대학교동창' ||
            _SearchText == '도마뱀' ||
            _SearchText == '돌팔이' ||
            _SearchText == '렌즈통' ||
            _SearchText == '롯데리아' ||
            _SearchText == '먹구름' ||
            _SearchText == '모과나무' ||
            _SearchText == '목' ||
            _SearchText == '문구점' ||
            _SearchText == '문어' ||
            _SearchText == '물웅덩이' ||
            _SearchText == '미루나무' ||
            _SearchText == '미술학원' ||
            _SearchText == '배트' ||
            _SearchText == '베이비시터' ||
            _SearchText == '비구름' ||
            _SearchText == '비닐장갑' ||
            _SearchText == '사주풀이' ||
            _SearchText == '사팔이눈' ||
            _SearchText == '샌드위치' ||
            _SearchText == '세숫대야' ||
            _SearchText == '소똥구리' ||
            _SearchText == '쇠파이프' ||
            _SearchText == '식충식물' ||
            _SearchText == '심부름' ||
            _SearchText == '쌍꺼풀' ||
            _SearchText == '쓰레기장' ||
            _SearchText == '안마' ||
            _SearchText == '암소' ||
            _SearchText == '에버랜드' ||
            _SearchText == '연' ||
            _SearchText == '연탄불' ||
            _SearchText == '연탄재' ||
            _SearchText == '운전면허' ||
            _SearchText == '은색그릇' ||
            _SearchText == '이민' ||
            _SearchText == '잎벌레' ||
            _SearchText == '자동차키' ||
            _SearchText == '장딴지' ||
            _SearchText == '재' ||
            _SearchText == '재떨이' ||
            _SearchText == '재봉틀' ||
            _SearchText == '전광판' ||
            _SearchText == '전쟁터' ||
            _SearchText == '정글숲' ||
            _SearchText == '주방세제' ||
            _SearchText == '컨테이너' ||
            _SearchText == '케이블카' ||
            _SearchText == '탈의실' ||
            _SearchText == '파리지옥' ||
            _SearchText == '포스트잇' ||
            _SearchText == '폭염') ||
        numButtonSwich[22] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 23 &&
          ball3num != 23 &&
          ball4num != 23 &&
          ball5num != 23 &&
          ball6num != 23) {
        setState(() {
          ball1num = 23;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 23 &&
          ball3num != 23 &&
          ball4num != 23 &&
          ball5num != 23 &&
          ball6num != 23) {
        setState(() {
          ball2num = 23;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 23 &&
          ball2num != 23 &&
          ball4num != 23 &&
          ball5num != 23 &&
          ball6num != 23) {
        setState(() {
          ball3num = 23;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 23 &&
          ball2num != 23 &&
          ball3num != 23 &&
          ball5num != 23 &&
          ball6num != 23) {
        setState(() {
          ball4num = 23;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 23 &&
          ball2num != 23 &&
          ball3num != 23 &&
          ball4num != 23 &&
          ball6num != 23) {
        setState(() {
          ball5num = 23;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 23 &&
          ball2num != 23 &&
          ball3num != 23 &&
          ball4num != 23 &&
          ball5num != 23) {
        setState(() {
          ball6num = 23;
        });
      }
    }
    if ((_SearchText == '가슴털' ||
            _SearchText == '감독관' ||
            _SearchText == '개목줄' ||
            _SearchText == '검도칼' ||
            _SearchText == '겨울코트' ||
            _SearchText == '계좌이체' ||
            _SearchText == '고구마줄기' ||
            _SearchText == '골목길' ||
            _SearchText == '관람차' ||
            _SearchText == '교통카드' ||
            _SearchText == '구기자나무' ||
            _SearchText == '꼬마' ||
            _SearchText == '나비넥타이' ||
            _SearchText == '다람쥐' ||
            _SearchText == '다래나무' ||
            _SearchText == '대리운전' ||
            _SearchText == '대추나무' ||
            _SearchText == '도라지잎' ||
            _SearchText == '두릅나무' ||
            _SearchText == '땔감' ||
            _SearchText == '레스토랑' ||
            _SearchText == '로커' ||
            _SearchText == '마루바닥' ||
            _SearchText == '머드팩' ||
            _SearchText == '머스타드' ||
            _SearchText == '멍게' ||
            _SearchText == '메뉴판' ||
            _SearchText == '메추라기' ||
            _SearchText == '모래밭' ||
            _SearchText == '물티슈' ||
            _SearchText == '미국산소고기' ||
            _SearchText == '민요' ||
            _SearchText == '밍크' ||
            _SearchText == '바람꽃' ||
            _SearchText == '백일반지' ||
            _SearchText == '보리수' ||
            _SearchText == '보리수나무' ||
            _SearchText == '보험증권' ||
            _SearchText == '비포장길' ||
            _SearchText == '빈사무실' ||
            _SearchText == '사철나무' ||
            _SearchText == '산울타리' ||
            _SearchText == '삼겹살' ||
            _SearchText == '새치' ||
            _SearchText == '색연필' ||
            _SearchText == '석류나무' ||
            _SearchText == '세면대' ||
            _SearchText == '손세정제' ||
            _SearchText == '솥뚜껑' ||
            _SearchText == '수도세' ||
            _SearchText == '슈퍼맨' ||
            _SearchText == '스트레칭' ||
            _SearchText == '신갈나무' ||
            _SearchText == '신문기자' ||
            _SearchText == '쓰레기통' ||
            _SearchText == '아스팔트' ||
            _SearchText == '아이들' ||
            _SearchText == '애드벌룬' ||
            _SearchText == '야구글러브' ||
            _SearchText == '어머니' ||
            _SearchText == '엄마' ||
            _SearchText == '오프로드' ||
            _SearchText == '용' ||
            _SearchText == '음식' ||
            _SearchText == '이름' ||
            _SearchText == '입금' ||
            _SearchText == '입김' ||
            _SearchText == '자작나무' ||
            _SearchText == '잔치' ||
            _SearchText == '잡지기자' ||
            _SearchText == '재래시장' ||
            _SearchText == '주름' ||
            _SearchText == '주지스님' ||
            _SearchText == '지름길' ||
            _SearchText == '집이물에잠김' ||
            _SearchText == '천둥번개' ||
            _SearchText == '치즈케잌' ||
            _SearchText == '친정어머니' ||
            _SearchText == '카레라이스' ||
            _SearchText == '컵라면,턱' ||
            _SearchText == '팩' ||
            _SearchText == '포도나무' ||
            _SearchText == '포커' ||
            _SearchText == '포크레인') ||
        numButtonSwich[23] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 24 &&
          ball3num != 24 &&
          ball4num != 24 &&
          ball5num != 24 &&
          ball6num != 24) {
        setState(() {
          ball1num = 24;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 24 &&
          ball3num != 24 &&
          ball4num != 24 &&
          ball5num != 24 &&
          ball6num != 24) {
        setState(() {
          ball2num = 24;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 24 &&
          ball2num != 24 &&
          ball4num != 24 &&
          ball5num != 24 &&
          ball6num != 24) {
        setState(() {
          ball3num = 24;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 24 &&
          ball2num != 24 &&
          ball3num != 24 &&
          ball5num != 24 &&
          ball6num != 24) {
        setState(() {
          ball4num = 24;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 24 &&
          ball2num != 24 &&
          ball3num != 24 &&
          ball4num != 24 &&
          ball6num != 24) {
        setState(() {
          ball5num = 24;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 24 &&
          ball2num != 24 &&
          ball3num != 24 &&
          ball4num != 24 &&
          ball5num != 24) {
        setState(() {
          ball6num = 24;
        });
      }
    }
    if ((_SearchText == '가짜' ||
            _SearchText == '검정색고양이' ||
            _SearchText == '게임' ||
            _SearchText == '남대문' ||
            _SearchText == '남방' ||
            _SearchText == '다툼' ||
            _SearchText == '담쟁이넝쿨' ||
            _SearchText == '대형마트' ||
            _SearchText == '동물보호소' ||
            _SearchText == '두대' ||
            _SearchText == '두엄' ||
            _SearchText == '롯데월드' ||
            _SearchText == '마당' ||
            _SearchText == '마약' ||
            _SearchText == '마우스' ||
            _SearchText == '모델하우스' ||
            _SearchText == '모조품' ||
            _SearchText == '무당' ||
            _SearchText == '문' ||
            _SearchText == '물구나무' ||
            _SearchText == '물김치' ||
            _SearchText == '미역' ||
            _SearchText == '미원' ||
            _SearchText == '미장' ||
            _SearchText == '바리게이트' ||
            _SearchText == '범인' ||
            _SearchText == '불꽃놀이' ||
            _SearchText == '비상벨소리' ||
            _SearchText == '상어' ||
            _SearchText == '송어' ||
            _SearchText == '쇼핑카트' ||
            _SearchText == '수염,' ||
            _SearchText == '아욱' ||
            _SearchText == '아침' ||
            _SearchText == '어머니' ||
            _SearchText == '에프킬라' ||
            _SearchText == '엘지' ||
            _SearchText == '여우' ||
            _SearchText == '연말회식' ||
            _SearchText == '오락' ||
            _SearchText == '오케스트라' ||
            _SearchText == '오피스텔' ||
            _SearchText == '우승' ||
            _SearchText == '우유' ||
            _SearchText == '월계수관' ||
            _SearchText == '위조지폐' ||
            _SearchText == '이무기' ||
            _SearchText == '인삼' ||
            _SearchText == '자몽' ||
            _SearchText == '장난꾸러기' ||
            _SearchText == '장미' ||
            _SearchText == '전기장판' ||
            _SearchText == '주먹싸움' ||
            _SearchText == '참나물' ||
            _SearchText == '침' ||
            _SearchText == '크게웃음' ||
            _SearchText == '트레일러' ||
            _SearchText == '후임병') ||
        numButtonSwich[24] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 25 &&
          ball3num != 25 &&
          ball4num != 25 &&
          ball5num != 25 &&
          ball6num != 25) {
        setState(() {
          ball1num = 25;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 25 &&
          ball3num != 25 &&
          ball4num != 25 &&
          ball5num != 25 &&
          ball6num != 25) {
        setState(() {
          ball2num = 25;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 25 &&
          ball2num != 25 &&
          ball4num != 25 &&
          ball5num != 25 &&
          ball6num != 25) {
        setState(() {
          ball3num = 25;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 25 &&
          ball2num != 25 &&
          ball3num != 25 &&
          ball5num != 25 &&
          ball6num != 25) {
        setState(() {
          ball4num = 25;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 25 &&
          ball2num != 25 &&
          ball3num != 25 &&
          ball4num != 25 &&
          ball6num != 25) {
        setState(() {
          ball5num = 25;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 25 &&
          ball2num != 25 &&
          ball3num != 25 &&
          ball4num != 25 &&
          ball5num != 25) {
        setState(() {
          ball6num = 25;
        });
      }
    }
    if ((_SearchText == '중지손가락' ||
            _SearchText == '강물' ||
            _SearchText == '강의' ||
            _SearchText == '곱슬머리' ||
            _SearchText == '광어' ||
            _SearchText == '구름다리' ||
            _SearchText == '그것이알고싶다' ||
            _SearchText == '꿈방' ||
            _SearchText == '나무계단' ||
            _SearchText == '나무판자' ||
            _SearchText == '남색바지' ||
            _SearchText == '남자친구' ||
            _SearchText == '냉이' ||
            _SearchText == '다리' ||
            _SearchText == '다림질' ||
            _SearchText == '담요' ||
            _SearchText == '두부조림' ||
            _SearchText == '뒷덜미' ||
            _SearchText == '땋은머리' ||
            _SearchText == '매트리스' ||
            _SearchText == '멧돼지' ||
            _SearchText == '면도칼' ||
            _SearchText == '목폴라' ||
            _SearchText == '미스터리' ||
            _SearchText == '민들레' ||
            _SearchText == '바가지머리' ||
            _SearchText == '바디랭귀지' ||
            _SearchText == '박달나무' ||
            _SearchText == '밤' ||
            _SearchText == '밤을보임' ||
            _SearchText == '방송' ||
            _SearchText == '법무사' ||
            _SearchText == '별똥별' ||
            _SearchText == '붉은갈색' ||
            _SearchText == '산소마스크' ||
            _SearchText == '상인' ||
            _SearchText == '색동저고리' ||
            _SearchText == '성인' ||
            _SearchText == '소매' ||
            _SearchText == '손목시계' ||
            _SearchText == '수영' ||
            _SearchText == '쓰레기봉투' ||
            _SearchText == '아시아' ||
            _SearchText == '아킬레스건' ||
            _SearchText == '안전벨트' ||
            _SearchText == '암벽' ||
            _SearchText == '암컷' ||
            _SearchText == '애인' ||
            _SearchText == '약지손가락' ||
            _SearchText == '엘란트라' ||
            _SearchText == '여자가슴' ||
            _SearchText == '연어' ||
            _SearchText == '염주' ||
            _SearchText == '오일' ||
            _SearchText == '옥상' ||
            _SearchText == '와인' ||
            _SearchText == '우동' ||
            _SearchText == '유성' ||
            _SearchText == '유흥업소' ||
            _SearchText == '은행원' ||
            _SearchText == '인상' ||
            _SearchText == '잉크' ||
            _SearchText == '작은트럭' ||
            _SearchText == '장님' ||
            _SearchText == '장발' ||
            _SearchText == '전동드릴' ||
            _SearchText == '정문' ||
            _SearchText == '종이' ||
            _SearchText == '중지손가락' ||
            _SearchText == '진딧물' ||
            _SearchText == '텀블러' ||
            _SearchText == '퇴직금' ||
            _SearchText == '팔' ||
            _SearchText == '팔물림' ||
            _SearchText == '펌프카' ||
            _SearchText == '푸른물' ||
            _SearchText == '피라미드' ||
            _SearchText == '헤엄') ||
        numButtonSwich[25] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 26 &&
          ball3num != 26 &&
          ball4num != 26 &&
          ball5num != 26 &&
          ball6num != 26) {
        setState(() {
          ball1num = 26;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 26 &&
          ball3num != 26 &&
          ball4num != 26 &&
          ball5num != 26 &&
          ball6num != 26) {
        setState(() {
          ball2num = 26;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 26 &&
          ball2num != 26 &&
          ball4num != 26 &&
          ball5num != 26 &&
          ball6num != 26) {
        setState(() {
          ball3num = 26;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 26 &&
          ball2num != 26 &&
          ball3num != 26 &&
          ball5num != 26 &&
          ball6num != 26) {
        setState(() {
          ball4num = 26;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 26 &&
          ball2num != 26 &&
          ball3num != 26 &&
          ball4num != 26 &&
          ball6num != 26) {
        setState(() {
          ball5num = 26;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 26 &&
          ball2num != 26 &&
          ball3num != 26 &&
          ball4num != 26 &&
          ball5num != 26) {
        setState(() {
          ball6num = 26;
        });
      }
    }
    if ((_SearchText == '강당' ||
            _SearchText == '강릉시' ||
            _SearchText == '강정' ||
            _SearchText == '검역' ||
            _SearchText == '경매' ||
            _SearchText == '공원' ||
            _SearchText == '공장' ||
            _SearchText == '과속방지턱' ||
            _SearchText == '농장' ||
            _SearchText == '동상' ||
            _SearchText == '동성' ||
            _SearchText == '동요' ||
            _SearchText == '등애' ||
            _SearchText == '레드카펫' ||
            _SearchText == '말미잘' ||
            _SearchText == '매실나무' ||
            _SearchText == '매장' ||
            _SearchText == '면봉' ||
            _SearchText == '면세점' ||
            _SearchText == '명치' ||
            _SearchText == '목욕' ||
            _SearchText == '몽구스' ||
            _SearchText == '문방구' ||
            _SearchText == '미라' ||
            _SearchText == '미숙아' ||
            _SearchText == '미팅' ||
            _SearchText == '민물고기' ||
            _SearchText == '백고양이' ||
            _SearchText == '뺨' ||
            _SearchText == '사슴뿔' ||
            _SearchText == '산양' ||
            _SearchText == '산정상' ||
            _SearchText == '상장' ||
            _SearchText == '성당' ||
            _SearchText == '쇼' ||
            _SearchText == '심문조사' ||
            _SearchText == '아가옷' ||
            _SearchText == '안동시' ||
            _SearchText == '압정' ||
            _SearchText == '앵두' ||
            _SearchText == '양주' ||
            _SearchText == '어묵' ||
            _SearchText == '여물' ||
            _SearchText == '연필꽂이' ||
            _SearchText == '영국' ||
            _SearchText == '영화배우' ||
            _SearchText == '오뎅' ||
            _SearchText == '왕겨' ||
            _SearchText == '요정' ||
            _SearchText == '용산' ||
            _SearchText == '우리은행' ||
            _SearchText == '우익수' ||
            _SearchText == '운동' ||
            _SearchText == '웅변' ||
            _SearchText == '원금' ||
            _SearchText == '원자폭탄' ||
            _SearchText == '위성' ||
            _SearchText == '윙크' ||
            _SearchText == '은행잎' ||
            _SearchText == '잇몸' ||
            _SearchText == '잠옷' ||
            _SearchText == '장막' ||
            _SearchText == '장터' ||
            _SearchText == '전경' ||
            _SearchText == '젖은빨래' ||
            _SearchText == '중위' ||
            _SearchText == '참외' ||
            _SearchText == '창문' ||
            _SearchText == '파마머리' ||
            _SearchText == '포옹' ||
            _SearchText == '피망' ||
            _SearchText == '하얀색고양이' ||
            _SearchText == '현상수배범' ||
            _SearchText == '형광등') ||
        numButtonSwich[26] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 27 &&
          ball3num != 27 &&
          ball4num != 27 &&
          ball5num != 27 &&
          ball6num != 27) {
        setState(() {
          ball1num = 27;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 27 &&
          ball3num != 27 &&
          ball4num != 27 &&
          ball5num != 27 &&
          ball6num != 27) {
        setState(() {
          ball2num = 27;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 27 &&
          ball2num != 27 &&
          ball4num != 27 &&
          ball5num != 27 &&
          ball6num != 27) {
        setState(() {
          ball3num = 27;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 27 &&
          ball2num != 27 &&
          ball3num != 27 &&
          ball5num != 27 &&
          ball6num != 27) {
        setState(() {
          ball4num = 27;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 27 &&
          ball2num != 27 &&
          ball3num != 27 &&
          ball4num != 27 &&
          ball6num != 27) {
        setState(() {
          ball5num = 27;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 27 &&
          ball2num != 27 &&
          ball3num != 27 &&
          ball4num != 27 &&
          ball5num != 27) {
        setState(() {
          ball6num = 27;
        });
      }
    }
    if ((_SearchText == '고등어' ||
            _SearchText == '공룡' ||
            _SearchText == '공유기' ||
            _SearchText == '국민체조' ||
            _SearchText == '군대고참' ||
            _SearchText == '귀뚜라미' ||
            _SearchText == '금붕어' ||
            _SearchText == '다이빙' ||
            _SearchText == '돌길' ||
            _SearchText == '동생' ||
            _SearchText == '돼지머리' ||
            _SearchText == '드레스룸' ||
            _SearchText == '딱정벌레' ||
            _SearchText == '만년필' ||
            _SearchText == '모기장' ||
            _SearchText == '문앞' ||
            _SearchText == '미국인' ||
            _SearchText == '미니스커트' ||
            _SearchText == '미사일' ||
            _SearchText == '바다표범' ||
            _SearchText == '바닥담요' ||
            _SearchText == '바이킹' ||
            _SearchText == '복숭아' ||
            _SearchText == '사슴벌레' ||
            _SearchText == '성형외과' ||
            _SearchText == '소나무분재' ||
            _SearchText == '송아지' ||
            _SearchText == '수제맥주' ||
            _SearchText == '스마트폰' ||
            _SearchText == '썸' ||
            _SearchText == '아몬드' ||
            _SearchText == '액정' ||
            _SearchText == '양파' ||
            _SearchText == '에이드' ||
            _SearchText == '연등' ||
            _SearchText == '영양크림' ||
            _SearchText == '오두막' ||
            _SearchText == '올가미' ||
            _SearchText == '용접' ||
            _SearchText == '우편배달부' ||
            _SearchText == '유모차' ||
            _SearchText == '이구아나' ||
            _SearchText == '임산부' ||
            _SearchText == '자위' ||
            _SearchText == '장롱' ||
            _SearchText == '정원' ||
            _SearchText == '종말' ||
            _SearchText == '청동' ||
            _SearchText == '총알' ||
            _SearchText == '칠판지우개' ||
            _SearchText == '침대커버' ||
            _SearchText == '침팬지' ||
            _SearchText == '카카오톡' ||
            _SearchText == '컴퓨터' ||
            _SearchText == '팔꿈치' ||
            _SearchText == '팽이' ||
            _SearchText == '푸들') ||
        numButtonSwich[27] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 28 &&
          ball3num != 28 &&
          ball4num != 28 &&
          ball5num != 28 &&
          ball6num != 28) {
        setState(() {
          ball1num = 28;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 28 &&
          ball3num != 28 &&
          ball4num != 28 &&
          ball5num != 28 &&
          ball6num != 28) {
        setState(() {
          ball2num = 28;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 28 &&
          ball2num != 28 &&
          ball4num != 28 &&
          ball5num != 28 &&
          ball6num != 28) {
        setState(() {
          ball3num = 28;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 28 &&
          ball2num != 28 &&
          ball3num != 28 &&
          ball5num != 28 &&
          ball6num != 28) {
        setState(() {
          ball4num = 28;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 28 &&
          ball2num != 28 &&
          ball3num != 28 &&
          ball4num != 28 &&
          ball6num != 28) {
        setState(() {
          ball5num = 28;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 28 &&
          ball2num != 28 &&
          ball3num != 28 &&
          ball4num != 28 &&
          ball5num != 28) {
        setState(() {
          ball6num = 28;
        });
      }
    }
    if ((_SearchText == '경운기' ||
            _SearchText == '공문서' ||
            _SearchText == '공사장' ||
            _SearchText == '공포' ||
            _SearchText == '광저우' ||
            _SearchText == '나체' ||
            _SearchText == '냉면' ||
            _SearchText == '녹음기' ||
            _SearchText == '누드' ||
            _SearchText == '담장' ||
            _SearchText == '당구공' ||
            _SearchText == '당첨' ||
            _SearchText == '대형티브이간판' ||
            _SearchText == '동아리' ||
            _SearchText == '등나무' ||
            _SearchText == '떡집' ||
            _SearchText == '레이싱' ||
            _SearchText == '맨드라미' ||
            _SearchText == '모래바람' ||
            _SearchText == '목공소' ||
            _SearchText == '무릎뒤쪽' ||
            _SearchText == '물총' ||
            _SearchText == '방송국' ||
            _SearchText == '방앗간' ||
            _SearchText == '뱀알' ||
            _SearchText == '변명' ||
            _SearchText == '보온병' ||
            _SearchText == '뽕나무' ||
            _SearchText == '뽕잎' ||
            _SearchText == '삼각김밥' ||
            _SearchText == '상사병' ||
            _SearchText == '수영복' ||
            _SearchText == '쌈장' ||
            _SearchText == '아나운서' ||
            _SearchText == '아이돌' ||
            _SearchText == '아카시아나무' ||
            _SearchText == '알몸' ||
            _SearchText == '앨범' ||
            _SearchText == '야구장' ||
            _SearchText == '양귀비' ||
            _SearchText == '에어컨' ||
            _SearchText == '여인숙' ||
            _SearchText == '염료' ||
            _SearchText == '염색' ||
            _SearchText == '오디나무' ||
            _SearchText == '옷걸이' ||
            _SearchText == '옷장사' ||
            _SearchText == '옻나무' ||
            _SearchText == '왕따' ||
            _SearchText == '외국계은행' ||
            _SearchText == '외국인' ||
            _SearchText == '외숙모' ||
            _SearchText == '원시인' ||
            _SearchText == '은행나무' ||
            _SearchText == '이마트' ||
            _SearchText == '이어폰' ||
            _SearchText == '익모초' ||
            _SearchText == '인디언' ||
            _SearchText == '정미소' ||
            _SearchText == '정자' ||
            _SearchText == '조흥은행' ||
            _SearchText == '중국어' ||
            _SearchText == '중령' ||
            _SearchText == '청기와' ||
            _SearchText == '통장' ||
            _SearchText == '통장정리' ||
            _SearchText == '피어싱' ||
            _SearchText == '해태') ||
        numButtonSwich[28] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 29 &&
          ball3num != 29 &&
          ball4num != 29 &&
          ball5num != 29 &&
          ball6num != 29) {
        setState(() {
          ball1num = 29;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 29 &&
          ball3num != 29 &&
          ball4num != 29 &&
          ball5num != 29 &&
          ball6num != 29) {
        setState(() {
          ball2num = 29;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 29 &&
          ball2num != 29 &&
          ball4num != 29 &&
          ball5num != 29 &&
          ball6num != 29) {
        setState(() {
          ball3num = 29;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 29 &&
          ball2num != 29 &&
          ball3num != 29 &&
          ball5num != 29 &&
          ball6num != 29) {
        setState(() {
          ball4num = 29;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 29 &&
          ball2num != 29 &&
          ball3num != 29 &&
          ball4num != 29 &&
          ball6num != 29) {
        setState(() {
          ball5num = 29;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 29 &&
          ball2num != 29 &&
          ball3num != 29 &&
          ball4num != 29 &&
          ball5num != 29) {
        setState(() {
          ball6num = 29;
        });
      }
    }
    if ((_SearchText == '갈치조림' ||
            _SearchText == '강원도' ||
            _SearchText == '강의실' ||
            _SearchText == '겨울옷' ||
            _SearchText == '경상도' ||
            _SearchText == '계획서' ||
            _SearchText == '공모전' ||
            _SearchText == '관광여행' ||
            _SearchText == '구상나무' ||
            _SearchText == '군용차량' ||
            _SearchText == '굴렁쇠' ||
            _SearchText == '기생충' ||
            _SearchText == '김치찌개' ||
            _SearchText == '난쟁이' ||
            _SearchText == '냉장고' ||
            _SearchText == '노점상' ||
            _SearchText == '당구장' ||
            _SearchText == '동치미' ||
            _SearchText == '땅콩' ||
            _SearchText == '떡갈나무' ||
            _SearchText == '롤러스케이트' ||
            _SearchText == '롯데마트' ||
            _SearchText == '마카롱' ||
            _SearchText == '망' ||
            _SearchText == '맥도날드' ||
            _SearchText == '명절풍경' ||
            _SearchText == '명태' ||
            _SearchText == '목걸이' ||
            _SearchText == '반성문' ||
            _SearchText == '방수공사' ||
            _SearchText == '방정식' ||
            _SearchText == '뱃머리' ||
            _SearchText == '베드민턴' ||
            _SearchText == '보육원' ||
            _SearchText == '분유' ||
            _SearchText == '사파이어' ||
            _SearchText == '새송이버섯' ||
            _SearchText == '색종이' ||
            _SearchText == '생수병' ||
            _SearchText == '서울역' ||
            _SearchText == '선인장' ||
            _SearchText == '송풍기' ||
            _SearchText == '스티로폼' ||
            _SearchText == '알로에' ||
            _SearchText == '약장수' ||
            _SearchText == '오토바이' ||
            _SearchText == '온풍기' ||
            _SearchText == '와인잔' ||
            _SearchText == '외계인' ||
            _SearchText == '외상값' ||
            _SearchText == '외한은행' ||
            _SearchText == '유리문' ||
            _SearchText == '유리병' ||
            _SearchText == '유리창' ||
            _SearchText == '유에스비' ||
            _SearchText == '유원지' ||
            _SearchText == '유치원' ||
            _SearchText == '이삿짐' ||
            _SearchText == '잠자리채' ||
            _SearchText == '정원사' ||
            _SearchText == '제일은행' ||
            _SearchText == '종이컵' ||
            _SearchText == '중국옷' ||
            _SearchText == '지팡이' ||
            _SearchText == '철모' ||
            _SearchText == '체육복' ||
            _SearchText == '초인종' ||
            _SearchText == '촬영' ||
            _SearchText == '추석풍경' ||
            _SearchText == '츄리닝' ||
            _SearchText == '트레이닝세트' ||
            _SearchText == '폐암' ||
            _SearchText == '피겨스케이팅' ||
            _SearchText == '황금물고기') ||
        numButtonSwich[29] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 30 &&
          ball3num != 30 &&
          ball4num != 30 &&
          ball5num != 30 &&
          ball6num != 30) {
        setState(() {
          ball1num = 30;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 30 &&
          ball3num != 30 &&
          ball4num != 30 &&
          ball5num != 30 &&
          ball6num != 30) {
        setState(() {
          ball2num = 30;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 30 &&
          ball2num != 30 &&
          ball4num != 30 &&
          ball5num != 30 &&
          ball6num != 30) {
        setState(() {
          ball3num = 30;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 30 &&
          ball2num != 30 &&
          ball3num != 30 &&
          ball5num != 30 &&
          ball6num != 30) {
        setState(() {
          ball4num = 30;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 30 &&
          ball2num != 30 &&
          ball3num != 30 &&
          ball4num != 30 &&
          ball6num != 30) {
        setState(() {
          ball5num = 30;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 30 &&
          ball2num != 30 &&
          ball3num != 30 &&
          ball4num != 30 &&
          ball5num != 30) {
        setState(() {
          ball6num = 30;
        });
      }
    }
    if ((_SearchText == '가오리연' ||
            _SearchText == '경로당' ||
            _SearchText == '공기놀이' ||
            _SearchText == '공주님' ||
            _SearchText == '기모노' ||
            _SearchText == '꽃상여' ||
            _SearchText == '남자화장실' ||
            _SearchText == '노상방뇨' ||
            _SearchText == '마네킹' ||
            _SearchText == '막내삼촌' ||
            _SearchText == '막창' ||
            _SearchText == '명찰' ||
            _SearchText == '미역국' ||
            _SearchText == '방청객' ||
            _SearchText == '베짱이' ||
            _SearchText == '복숭아씨앗' ||
            _SearchText == '부장' ||
            _SearchText == '빚' ||
            _SearchText == '빚쟁이' ||
            _SearchText == '삼일절' ||
            _SearchText == '색안경' ||
            _SearchText == '생수통' ||
            _SearchText == '선무당' ||
            _SearchText == '성냥불' ||
            _SearchText == '소방장비' ||
            _SearchText == '수영선수' ||
            _SearchText == '아랫층' ||
            _SearchText == '아이스박스' ||
            _SearchText == '악어새끼' ||
            _SearchText == '엑티언' ||
            _SearchText == '여자성기' ||
            _SearchText == '열대어' ||
            _SearchText == '오공본드' ||
            _SearchText == '오리나무' ||
            _SearchText == '옷고름' ||
            _SearchText == '완두콩' ||
            _SearchText == '원인류' ||
            _SearchText == '유괴범' ||
            _SearchText == '유리문안' ||
            _SearchText == '음료수' ||
            _SearchText == '응접실' ||
            _SearchText == '이자카야' ||
            _SearchText == '장구애비' ||
            _SearchText == '장식장' ||
            _SearchText == '철물점' ||
            _SearchText == '청국장' ||
            _SearchText == '탕수육' ||
            _SearchText == '택배배달원' ||
            _SearchText == '통나무' ||
            _SearchText == '폭염' ||
            _SearchText == '행글라이더') ||
        numButtonSwich[30] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 31 &&
          ball3num != 31 &&
          ball4num != 31 &&
          ball5num != 31 &&
          ball6num != 31) {
        setState(() {
          ball1num = 31;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 31 &&
          ball3num != 31 &&
          ball4num != 31 &&
          ball5num != 31 &&
          ball6num != 31) {
        setState(() {
          ball2num = 31;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 31 &&
          ball2num != 31 &&
          ball4num != 31 &&
          ball5num != 31 &&
          ball6num != 31) {
        setState(() {
          ball3num = 31;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 31 &&
          ball2num != 31 &&
          ball3num != 31 &&
          ball5num != 31 &&
          ball6num != 31) {
        setState(() {
          ball4num = 31;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 31 &&
          ball2num != 31 &&
          ball3num != 31 &&
          ball4num != 31 &&
          ball6num != 31) {
        setState(() {
          ball5num = 31;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 31 &&
          ball2num != 31 &&
          ball3num != 31 &&
          ball4num != 31 &&
          ball5num != 31) {
        setState(() {
          ball6num = 31;
        });
      }
    }
    if ((_SearchText == '가위바위보' ||
            _SearchText == '검정색천' ||
            _SearchText == '검지손가락' ||
            _SearchText == '꽃등애' ||
            _SearchText == '나이트' ||
            _SearchText == '네온싸인' ||
            _SearchText == '뉴스앵커' ||
            _SearchText == '단란주점' ||
            _SearchText == '동사무소' ||
            _SearchText == '두통약' ||
            _SearchText == '마로니에' ||
            _SearchText == '말뚝박기' ||
            _SearchText == '물방개' ||
            _SearchText == '민둥산' ||
            _SearchText == '바위틈' ||
            _SearchText == '바이올린' ||
            _SearchText == '보정속옷' ||
            _SearchText == '부부싸움' ||
            _SearchText == '부평역' ||
            _SearchText == '살쾡이' ||
            _SearchText == '성경' ||
            _SearchText == '성당신부' ||
            _SearchText == '아구찜' ||
            _SearchText == '아이패드' ||
            _SearchText == '아주버니' ||
            _SearchText == '앙파즙' ||
            _SearchText == '앞치마' ||
            _SearchText == '앵커' ||
            _SearchText == '양복바지' ||
            _SearchText == '양치질' ||
            _SearchText == '어린이집' ||
            _SearchText == '어음' ||
            _SearchText == '에스키모복' ||
            _SearchText == '에이티엠기기' ||
            _SearchText == '에탄올' ||
            _SearchText == '여자동기' ||
            _SearchText == '연극배우' ||
            _SearchText == '예방주사' ||
            _SearchText == '오일쇼크' ||
            _SearchText == '올리브유' ||
            _SearchText == '올빼미' ||
            _SearchText == '왼쪽팔뚝상처' ||
            _SearchText == '유자나무' ||
            _SearchText == '입냄새' ||
            _SearchText == '작은섬' ||
            _SearchText == '장기' ||
            _SearchText == '전동문' ||
            _SearchText == '정액권' ||
            _SearchText == '정장바지' ||
            _SearchText == '중탕기' ||
            _SearchText == '쪽진머리' ||
            _SearchText == '채팅방' ||
            _SearchText == '청첩장' ||
            _SearchText == '축의금' ||
            _SearchText == '칠엽수' ||
            _SearchText == '표범문신' ||
            _SearchText == '학교운동장' ||
            _SearchText == '한미은행' ||
            _SearchText == '현금인출기') ||
        numButtonSwich[31] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 32 &&
          ball3num != 32 &&
          ball4num != 32 &&
          ball5num != 32 &&
          ball6num != 32) {
        setState(() {
          ball1num = 32;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 32 &&
          ball3num != 32 &&
          ball4num != 32 &&
          ball5num != 32 &&
          ball6num != 32) {
        setState(() {
          ball2num = 32;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 32 &&
          ball2num != 32 &&
          ball4num != 32 &&
          ball5num != 32 &&
          ball6num != 32) {
        setState(() {
          ball3num = 32;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 32 &&
          ball2num != 32 &&
          ball3num != 32 &&
          ball5num != 32 &&
          ball6num != 32) {
        setState(() {
          ball4num = 32;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 32 &&
          ball2num != 32 &&
          ball3num != 32 &&
          ball4num != 32 &&
          ball6num != 32) {
        setState(() {
          ball5num = 32;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 32 &&
          ball2num != 32 &&
          ball3num != 32 &&
          ball4num != 32 &&
          ball5num != 32) {
        setState(() {
          ball6num = 32;
        });
      }
    }
    if ((_SearchText == '감시카메라' ||
            _SearchText == '고무장갑' ||
            _SearchText == '곰탕' ||
            _SearchText == '과장' ||
            _SearchText == '국민은행' ||
            _SearchText == '닭강정' ||
            _SearchText == '대중목욕탕' ||
            _SearchText == '대형군함' ||
            _SearchText == '마취제' ||
            _SearchText == '매뉴얼' ||
            _SearchText == '맥주병' ||
            _SearchText == '모르는남자' ||
            _SearchText == '목장갑' ||
            _SearchText == '문자' ||
            _SearchText == '물청소' ||
            _SearchText == '방범카메라' ||
            _SearchText == '병뚜껑' ||
            _SearchText == '복숭아밭' ||
            _SearchText == '볶음밥' ||
            _SearchText == '상고머리' ||
            _SearchText == '상추쌈' ||
            _SearchText == '생선장수' ||
            _SearchText == '설명서' ||
            _SearchText == '성추행범' ||
            _SearchText == '세쌍둥이' ||
            _SearchText == '수양버들' ||
            _SearchText == '스킨' ||
            _SearchText == '식목일' ||
            _SearchText == '신용카드' ||
            _SearchText == '아르바이트' ||
            _SearchText == '양반다리' ||
            _SearchText == '여드름' ||
            _SearchText == '외삼촌' ||
            _SearchText == '외조부모' ||
            _SearchText == '유가증권' ||
            _SearchText == '유람선' ||
            _SearchText == '음표' ||
            _SearchText == '이탈리아' ||
            _SearchText == '인절미' ||
            _SearchText == '잠수경' ||
            _SearchText == '장기자랑' ||
            _SearchText == '장난감' ||
            _SearchText == '장뇌삼' ||
            _SearchText == '장모님' ||
            _SearchText == '줄을섬' ||
            _SearchText == '중학교동창' ||
            _SearchText == '지로용지' ||
            _SearchText == '진열장' ||
            _SearchText == '짬뽕' ||
            _SearchText == '장' ||
            _SearchText == '철갑상어' ||
            _SearchText == '청설모' ||
            _SearchText == '체어맨' ||
            _SearchText == '콧수염' ||
            _SearchText == '큰어머니' ||
            _SearchText == '태풍' ||
            _SearchText == '팽나무' ||
            _SearchText == '프랑스인' ||
            _SearchText == '회' ||
            _SearchText == '학') ||
        numButtonSwich[32] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 33 &&
          ball3num != 33 &&
          ball4num != 33 &&
          ball5num != 33 &&
          ball6num != 33) {
        setState(() {
          ball1num = 33;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 33 &&
          ball3num != 33 &&
          ball4num != 33 &&
          ball5num != 33 &&
          ball6num != 33) {
        setState(() {
          ball2num = 33;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 33 &&
          ball2num != 33 &&
          ball4num != 33 &&
          ball5num != 33 &&
          ball6num != 33) {
        setState(() {
          ball3num = 33;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 33 &&
          ball2num != 33 &&
          ball3num != 33 &&
          ball5num != 33 &&
          ball6num != 33) {
        setState(() {
          ball4num = 33;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 33 &&
          ball2num != 33 &&
          ball3num != 33 &&
          ball4num != 33 &&
          ball6num != 33) {
        setState(() {
          ball5num = 33;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 33 &&
          ball2num != 33 &&
          ball3num != 33 &&
          ball4num != 33 &&
          ball5num != 33) {
        setState(() {
          ball6num = 33;
        });
      }
    }
    if ((_SearchText == '강아지풀' ||
            _SearchText == '검문검색' ||
            _SearchText == '검정색비석' ||
            _SearchText == '계약금' ||
            _SearchText == '고구마이삭' ||
            _SearchText == '국립공원' ||
            _SearchText == '기아자동차' ||
            _SearchText == '나무판자집' ||
            _SearchText == '남자성기' ||
            _SearchText == '단속카메라' ||
            _SearchText == '동대문' ||
            _SearchText == '떡방아간' ||
            _SearchText == '물장군' ||
            _SearchText == '물총새' ||
            _SearchText == '반죽' ||
            _SearchText == '발바닥' ||
            _SearchText == '방송기자' ||
            _SearchText == '백학꿈해몽' ||
            _SearchText == '사촌동생' ||
            _SearchText == '상아' ||
            _SearchText == '설중매' ||
            _SearchText == '아카시아꽃' ||
            _SearchText == '안경가게' ||
            _SearchText == '안경점' ||
            _SearchText == '여자얼굴' ||
            _SearchText == '옆모습' ||
            _SearchText == '왕골자리' ||
            _SearchText == '웨딩사진' ||
            _SearchText == '일회용기저귀' ||
            _SearchText == '작은아버지' ||
            _SearchText == '총검술' ||
            _SearchText == '치아교정기' ||
            _SearchText == '카드단말기' ||
            _SearchText == '턱수염' ||
            _SearchText == '호스') ||
        numButtonSwich[33] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 34 &&
          ball3num != 34 &&
          ball4num != 34 &&
          ball5num != 34 &&
          ball6num != 34) {
        setState(() {
          ball1num = 34;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 34 &&
          ball3num != 34 &&
          ball4num != 34 &&
          ball5num != 34 &&
          ball6num != 34) {
        setState(() {
          ball2num = 34;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 34 &&
          ball2num != 34 &&
          ball4num != 34 &&
          ball5num != 34 &&
          ball6num != 34) {
        setState(() {
          ball3num = 34;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 34 &&
          ball2num != 34 &&
          ball3num != 34 &&
          ball5num != 34 &&
          ball6num != 34) {
        setState(() {
          ball4num = 34;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 34 &&
          ball2num != 34 &&
          ball3num != 34 &&
          ball4num != 34 &&
          ball6num != 34) {
        setState(() {
          ball5num = 34;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 34 &&
          ball2num != 34 &&
          ball3num != 34 &&
          ball4num != 34 &&
          ball5num != 34) {
        setState(() {
          ball6num = 34;
        });
      }
    }
    if ((_SearchText == '개암나무' ||
            _SearchText == '개울물' ||
            _SearchText == '검정색숯' ||
            _SearchText == '계장' ||
            _SearchText == '금동불' ||
            _SearchText == '기름통' ||
            _SearchText == '대성통곡' ||
            _SearchText == '두줄의검정띠' ||
            _SearchText == '마요네즈' ||
            _SearchText == '말통' ||
            _SearchText == '메리야스' ||
            _SearchText == '메이드' ||
            _SearchText == '무좀약' ||
            _SearchText == '물망초' ||
            _SearchText == '밀짚모자' ||
            _SearchText == '방범초소' ||
            _SearchText == '비디오테입' ||
            _SearchText == '산호' ||
            _SearchText == '생맥주' ||
            _SearchText == '송장벌레' ||
            _SearchText == '수학' ||
            _SearchText == '수화' ||
            _SearchText == '스커트' ||
            _SearchText == '식물원' ||
            _SearchText == '아귀찜' ||
            _SearchText == '에델바이스' ||
            _SearchText == '연차' ||
            _SearchText == '영화감독' ||
            _SearchText == '오르가즘' ||
            _SearchText == '우담바라' ||
            _SearchText == '우엉' ||
            _SearchText == '음식점' ||
            _SearchText == '음악' ||
            _SearchText == '이마' ||
            _SearchText == '잉어' ||
            _SearchText == '장미꽃' ||
            _SearchText == '저금통' ||
            _SearchText == '지하' ||
            _SearchText == '천도복숭아' ||
            _SearchText == '철조망' ||
            _SearchText == '침대매트' ||
            _SearchText == '케이에프씨' ||
            _SearchText == '파인애플' ||
            _SearchText == '하녀' ||
            _SearchText == '해고' ||
            _SearchText == '해부' ||
            _SearchText == '허리' ||
            _SearchText == '화가' ||
            _SearchText == '화보' ||
            _SearchText == '회사' ||
            _SearchText == '후추' ||
            _SearchText == '휴가' ||
            _SearchText == '흙') ||
        numButtonSwich[34] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 35 &&
          ball3num != 35 &&
          ball4num != 35 &&
          ball5num != 35 &&
          ball6num != 35) {
        setState(() {
          ball1num = 35;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 35 &&
          ball3num != 35 &&
          ball4num != 35 &&
          ball5num != 35 &&
          ball6num != 35) {
        setState(() {
          ball2num = 35;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 35 &&
          ball2num != 35 &&
          ball4num != 35 &&
          ball5num != 35 &&
          ball6num != 35) {
        setState(() {
          ball3num = 35;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 35 &&
          ball2num != 35 &&
          ball3num != 35 &&
          ball5num != 35 &&
          ball6num != 35) {
        setState(() {
          ball4num = 35;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 35 &&
          ball2num != 35 &&
          ball3num != 35 &&
          ball4num != 35 &&
          ball6num != 35) {
        setState(() {
          ball5num = 35;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 35 &&
          ball2num != 35 &&
          ball3num != 35 &&
          ball4num != 35 &&
          ball5num != 35) {
        setState(() {
          ball6num = 35;
        });
      }
    }
    if ((_SearchText == '가짜꽃' ||
            _SearchText == '개천' ||
            _SearchText == '국화' ||
            _SearchText == '군화' ||
            _SearchText == '귀중품' ||
            _SearchText == '금전출납부' ||
            _SearchText == '냉동탑차' ||
            _SearchText == '대우자동차' ||
            _SearchText == '대한민국' ||
            _SearchText == '모래사장' ||
            _SearchText == '문화상품권' ||
            _SearchText == '민속놀이' ||
            _SearchText == '버스정류장' ||
            _SearchText == '베이비파우더' ||
            _SearchText == '북한' ||
            _SearchText == '삼십육계' ||
            _SearchText == '스타디움' ||
            _SearchText == '아는여자' ||
            _SearchText == '알콜솜' ||
            _SearchText == '얼룩말' ||
            _SearchText == '얼음' ||
            _SearchText == '영어' ||
            _SearchText == '왕비' ||
            _SearchText == '이종격투기' ||
            _SearchText == '인삼뿌리' ||
            _SearchText == '자전거안장' ||
            _SearchText == '작은숙모' ||
            _SearchText == '장례식장' ||
            _SearchText == '전투화' ||
            _SearchText == '조화' ||
            _SearchText == '직장동료' ||
            _SearchText == '찜질팩' ||
            _SearchText == '축하' ||
            _SearchText == '카드게임' ||
            _SearchText == '케이티엑스' ||
            _SearchText == '하객' ||
            _SearchText == '하수구' ||
            _SearchText == '하천' ||
            _SearchText == '한국' ||
            _SearchText == '한복' ||
            _SearchText == '해초' ||
            _SearchText == '화로' ||
            _SearchText == '화분' ||
            _SearchText == '화염방사기' ||
            _SearchText == '화초' ||
            _SearchText == '후진' ||
            _SearchText == '휴지로닦음') ||
        numButtonSwich[35] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 36 &&
          ball3num != 36 &&
          ball4num != 36 &&
          ball5num != 36 &&
          ball6num != 36) {
        setState(() {
          ball1num = 36;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 36 &&
          ball3num != 36 &&
          ball4num != 36 &&
          ball5num != 36 &&
          ball6num != 36) {
        setState(() {
          ball2num = 36;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 36 &&
          ball2num != 36 &&
          ball4num != 36 &&
          ball5num != 36 &&
          ball6num != 36) {
        setState(() {
          ball3num = 36;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 36 &&
          ball2num != 36 &&
          ball3num != 36 &&
          ball5num != 36 &&
          ball6num != 36) {
        setState(() {
          ball4num = 36;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 36 &&
          ball2num != 36 &&
          ball3num != 36 &&
          ball4num != 36 &&
          ball6num != 36) {
        setState(() {
          ball5num = 36;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 36 &&
          ball2num != 36 &&
          ball3num != 36 &&
          ball4num != 36 &&
          ball5num != 36) {
        setState(() {
          ball6num = 36;
        });
      }
    }
    if ((_SearchText == '거미알집' ||
            _SearchText == '걸름망' ||
            _SearchText == '고물장사' ||
            _SearchText == '공양' ||
            _SearchText == '구명조끼' ||
            _SearchText == '남녀공용사우나' ||
            _SearchText == '댕기머리' ||
            _SearchText == '동백꽃' ||
            _SearchText == '동백나무' ||
            _SearchText == '드럼통' ||
            _SearchText == '런닝머신' ||
            _SearchText == '망개떡' ||
            _SearchText == '맞고' ||
            _SearchText == '물푸레나무' ||
            _SearchText == '백합' ||
            _SearchText == '부엉이' ||
            _SearchText == '사다리차' ||
            _SearchText == '사람두개골' ||
            _SearchText == '사람뼈' ||
            _SearchText == '삼계탕' ||
            _SearchText == '상품권' ||
            _SearchText == '샴페인' ||
            _SearchText == '섬광탄' ||
            _SearchText == '소화기' ||
            _SearchText == '수정테이프' ||
            _SearchText == '식혜' ||
            _SearchText == '심장마비' ||
            _SearchText == '아궁이' ||
            _SearchText == '안양시' ||
            _SearchText == '암반수' ||
            _SearchText == '엘리베이터' ||
            _SearchText == '오미자' ||
            _SearchText == '오미자나무' ||
            _SearchText == '웨딩드레스' ||
            _SearchText == '응원' ||
            _SearchText == '입양' ||
            _SearchText == '전학' ||
            _SearchText == '전화' ||
            _SearchText == '조명탄' ||
            _SearchText == '지문인식' ||
            _SearchText == '하수' ||
            _SearchText == '축구응원' ||
            _SearchText == '커피땅콩' ||
            _SearchText == '털뭉치' ||
            _SearchText == '파운데이션' ||
            _SearchText == '패랭이꽃' ||
            _SearchText == '합격' ||
            _SearchText == '해적' ||
            _SearchText == '햇반' ||
            _SearchText == '호환' ||
            _SearchText == '화단' ||
            _SearchText == '환자' ||
            _SearchText == '환호' ||
            _SearchText == '흑색' ||
            _SearchText == '흰개' ||
            _SearchText == '흰눈') ||
        numButtonSwich[36] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 37 &&
          ball3num != 37 &&
          ball4num != 37 &&
          ball5num != 37 &&
          ball6num != 37) {
        setState(() {
          ball1num = 37;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 37 &&
          ball3num != 37 &&
          ball4num != 37 &&
          ball5num != 37 &&
          ball6num != 37) {
        setState(() {
          ball2num = 37;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 37 &&
          ball2num != 37 &&
          ball4num != 37 &&
          ball5num != 37 &&
          ball6num != 37) {
        setState(() {
          ball3num = 37;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 37 &&
          ball2num != 37 &&
          ball3num != 37 &&
          ball5num != 37 &&
          ball6num != 37) {
        setState(() {
          ball4num = 37;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 37 &&
          ball2num != 37 &&
          ball3num != 37 &&
          ball4num != 37 &&
          ball6num != 37) {
        setState(() {
          ball5num = 37;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 37 &&
          ball2num != 37 &&
          ball3num != 37 &&
          ball4num != 37 &&
          ball5num != 37) {
        setState(() {
          ball6num = 37;
        });
      }
    }
    if ((_SearchText == '가위눌림' ||
            _SearchText == '가해자' ||
            _SearchText == '건강검진' ||
            _SearchText == '겨울바람' ||
            _SearchText == '겨울점퍼' ||
            _SearchText == '고양이' ||
            _SearchText == '골동품' ||
            _SearchText == '공부방' ||
            _SearchText == '광선' ||
            _SearchText == '낙하산' ||
            _SearchText == '노여움' ||
            _SearchText == '단풍나무' ||
            _SearchText == '던힐' ||
            _SearchText == '릴레이경주' ||
            _SearchText == '망아지' ||
            _SearchText == '미용사' ||
            _SearchText == '밀양군' ||
            _SearchText == '백색' ||
            _SearchText == '번화가' ||
            _SearchText == '변호사' ||
            _SearchText == '불빛' ||
            _SearchText == '빛' ||
            _SearchText == '사이드브레이크' ||
            _SearchText == '사회자' ||
            _SearchText == '삼십팔도' ||
            _SearchText == '새우튀김' ||
            _SearchText == '선물상자' ||
            _SearchText == '세종문화회관' ||
            _SearchText == '수선화' ||
            _SearchText == '스트레스' ||
            _SearchText == '양갱' ||
            _SearchText == '양말' ||
            _SearchText == '엠씨' ||
            _SearchText == '우렁이' ||
            _SearchText == '자장면' ||
            _SearchText == '종양' ||
            _SearchText == '죽' ||
            _SearchText == '지혈' ||
            _SearchText == '징검다리' ||
            _SearchText == '짜장면' ||
            _SearchText == '팔뒷꿈치' ||
            _SearchText == '편의점' ||
            _SearchText == '합기도' ||
            _SearchText == '합숙소' ||
            _SearchText == '해달' ||
            _SearchText == '허벅지' ||
            _SearchText == '현대그룹' ||
            _SearchText == '호떡' ||
            _SearchText == '혼례' ||
            _SearchText == '화환' ||
            _SearchText == '환불' ||
            _SearchText == '횟집' ||
            _SearchText == '훈련' ||
            _SearchText == '휴게소' ||
            _SearchText == '흰티') ||
        numButtonSwich[37] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 38 &&
          ball3num != 38 &&
          ball4num != 38 &&
          ball5num != 38 &&
          ball6num != 38) {
        setState(() {
          ball1num = 38;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 38 &&
          ball3num != 38 &&
          ball4num != 38 &&
          ball5num != 38 &&
          ball6num != 38) {
        setState(() {
          ball2num = 38;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 38 &&
          ball2num != 38 &&
          ball4num != 38 &&
          ball5num != 38 &&
          ball6num != 38) {
        setState(() {
          ball3num = 38;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 38 &&
          ball2num != 38 &&
          ball3num != 38 &&
          ball5num != 38 &&
          ball6num != 38) {
        setState(() {
          ball4num = 38;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 38 &&
          ball2num != 38 &&
          ball3num != 38 &&
          ball4num != 38 &&
          ball6num != 38) {
        setState(() {
          ball5num = 38;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 38 &&
          ball2num != 38 &&
          ball3num != 38 &&
          ball4num != 38 &&
          ball5num != 38) {
        setState(() {
          ball6num = 38;
        });
      }
    }
    if ((_SearchText == '강냉이' ||
            _SearchText == '골프연습장' ||
            _SearchText == '과학' ||
            _SearchText == '과학자' ||
            _SearchText == '금목걸이' ||
            _SearchText == '김장배추' ||
            _SearchText == '도화지' ||
            _SearchText == '땅콩껍질' ||
            _SearchText == '리허설' ||
            _SearchText == '마에스트로' ||
            _SearchText == '밍크코트' ||
            _SearchText == '삼성전자' ||
            _SearchText == '세운머리' ||
            _SearchText == '소화전' ||
            _SearchText == '송충이' ||
            _SearchText == '수간호사' ||
            _SearchText == '시장골목' ||
            _SearchText == '아는아이' ||
            _SearchText == '아시아나' ||
            _SearchText == '앞니' ||
            _SearchText == '약탈' ||
            _SearchText == '영부인' ||
            _SearchText == '영어시험' ||
            _SearchText == '전시회' ||
            _SearchText == '절도' ||
            _SearchText == '지하실' ||
            _SearchText == '지휘자' ||
            _SearchText == '콩나물밥' ||
            _SearchText == '탱자나무' ||
            _SearchText == '펑크머리' ||
            _SearchText == '한라산' ||
            _SearchText == '헌혈' ||
            _SearchText == '혈관' ||
            _SearchText == '호텔' ||
            _SearchText == '화폐' ||
            _SearchText == '회초리' ||
            _SearchText == '효자손' ||
            _SearchText == '흙길' ||
            _SearchText == '흰바지') ||
        numButtonSwich[38] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 39 &&
          ball3num != 39 &&
          ball4num != 39 &&
          ball5num != 39 &&
          ball6num != 39) {
        setState(() {
          ball1num = 39;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 39 &&
          ball3num != 39 &&
          ball4num != 39 &&
          ball5num != 39 &&
          ball6num != 39) {
        setState(() {
          ball2num = 39;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 39 &&
          ball2num != 39 &&
          ball4num != 39 &&
          ball5num != 39 &&
          ball6num != 39) {
        setState(() {
          ball3num = 39;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 39 &&
          ball2num != 39 &&
          ball3num != 39 &&
          ball5num != 39 &&
          ball6num != 39) {
        setState(() {
          ball4num = 39;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 39 &&
          ball2num != 39 &&
          ball3num != 39 &&
          ball4num != 39 &&
          ball6num != 39) {
        setState(() {
          ball5num = 39;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 39 &&
          ball2num != 39 &&
          ball3num != 39 &&
          ball4num != 39 &&
          ball5num != 39) {
        setState(() {
          ball6num = 39;
        });
      }
    }
    if ((_SearchText == '고속버스터미널' ||
            _SearchText == '공무원' ||
            _SearchText == '학실' ||
            _SearchText == '구운햄' ||
            _SearchText == '굴렁쇠' ||
            _SearchText == '그을음' ||
            _SearchText == '금은방' ||
            _SearchText == '대학교' ||
            _SearchText == '망' ||
            _SearchText == '모르는여자' ||
            _SearchText == '무당벌레' ||
            _SearchText == '빔프로젝터' ||
            _SearchText == '사료' ||
            _SearchText == '상여금' ||
            _SearchText == '수련회' ||
            _SearchText == '승강장' ||
            _SearchText == '식용유' ||
            _SearchText == '신혼부부' ||
            _SearchText == '실내화' ||
            _SearchText == '암행어사' ||
            _SearchText == '앵무새' ||
            _SearchText == '엉겅퀴' ||
            _SearchText == '여자아이' ||
            _SearchText == '영수증' ||
            _SearchText == '외양간' ||
            _SearchText == '원앙새' ||
            _SearchText == '장애인' ||
            _SearchText == '지하철' ||
            _SearchText == '지하철개찰구,' ||
            _SearchText == '철모' ||
            _SearchText == '풀장' ||
            _SearchText == '피자헛' ||
            _SearchText == '하마' ||
            _SearchText == '해란초' ||
            _SearchText == '해바라기' ||
            _SearchText == '해파리' ||
            _SearchText == '허리띠' ||
            _SearchText == '헤드셋' ||
            _SearchText == '호박꽃' ||
            _SearchText == '홈플러스' ||
            _SearchText == '환자복' ||
            _SearchText == '휴전선') ||
        numButtonSwich[39] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 40 &&
          ball3num != 40 &&
          ball4num != 40 &&
          ball5num != 40 &&
          ball6num != 40) {
        setState(() {
          ball1num = 40;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 40 &&
          ball3num != 40 &&
          ball4num != 40 &&
          ball5num != 40 &&
          ball6num != 40) {
        setState(() {
          ball2num = 40;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 40 &&
          ball2num != 40 &&
          ball4num != 40 &&
          ball5num != 40 &&
          ball6num != 40) {
        setState(() {
          ball3num = 40;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 40 &&
          ball2num != 40 &&
          ball3num != 40 &&
          ball5num != 40 &&
          ball6num != 40) {
        setState(() {
          ball4num = 40;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 40 &&
          ball2num != 40 &&
          ball3num != 40 &&
          ball4num != 40 &&
          ball6num != 40) {
        setState(() {
          ball5num = 40;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 40 &&
          ball2num != 40 &&
          ball3num != 40 &&
          ball4num != 40 &&
          ball5num != 40) {
        setState(() {
          ball6num = 40;
        });
      }
    }
    if ((_SearchText == '겔포스' ||
            _SearchText == '계란말이' ||
            _SearchText == '공연장' ||
            _SearchText == '멜빵바지' ||
            _SearchText == '무잎' ||
            _SearchText == '백만장자' ||
            _SearchText == '붙임머리' ||
            _SearchText == '송곳니' ||
            _SearchText == '승무원' ||
            _SearchText == '양식장' ||
            _SearchText == '어금니' ||
            _SearchText == '여동생' ||
            _SearchText == '연예인' ||
            _SearchText == '옛애인' ||
            _SearchText == '올림머리' ||
            _SearchText == '용광로' ||
            _SearchText == '인어공주' ||
            _SearchText == '좌회전' ||
            _SearchText == '쥐똥나무' ||
            _SearchText == '찜질방' ||
            _SearchText == '패러글라이딩' ||
            _SearchText == '학원선생님' ||
            _SearchText == '핸드백' ||
            _SearchText == '호두과자' ||
            _SearchText == '회사선후배') ||
        numButtonSwich[40] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 41 &&
          ball3num != 41 &&
          ball4num != 41 &&
          ball5num != 41 &&
          ball6num != 41) {
        setState(() {
          ball1num = 41;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 41 &&
          ball3num != 41 &&
          ball4num != 41 &&
          ball5num != 41 &&
          ball6num != 41) {
        setState(() {
          ball2num = 41;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 41 &&
          ball2num != 41 &&
          ball4num != 41 &&
          ball5num != 41 &&
          ball6num != 41) {
        setState(() {
          ball3num = 41;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 41 &&
          ball2num != 41 &&
          ball3num != 41 &&
          ball5num != 41 &&
          ball6num != 41) {
        setState(() {
          ball4num = 41;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 41 &&
          ball2num != 41 &&
          ball3num != 41 &&
          ball4num != 41 &&
          ball6num != 41) {
        setState(() {
          ball5num = 41;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 41 &&
          ball2num != 41 &&
          ball3num != 41 &&
          ball4num != 41 &&
          ball5num != 41) {
        setState(() {
          ball6num = 41;
        });
      }
    }
    if ((_SearchText == '경마장' ||
            _SearchText == '계좌' ||
            _SearchText == '고함' ||
            _SearchText == '곰팡이' ||
            _SearchText == '교회친구' ||
            _SearchText == '남자아이' ||
            _SearchText == '동물옷' ||
            _SearchText == '발표회' ||
            _SearchText == '백학도사님' ||
            _SearchText == '보험' ||
            _SearchText == '소년' ||
            _SearchText == '시험' ||
            _SearchText == '시험지' ||
            _SearchText == '오동나무' ||
            _SearchText == '원시인옷' ||
            _SearchText == '졸업한동창생' ||
            _SearchText == '좁은골목' ||
            _SearchText == '종이봉지' ||
            _SearchText == '종이상자' ||
            _SearchText == '카멜레온' ||
            _SearchText == '풍뎅이' ||
            _SearchText == '학교선후배' ||
            _SearchText == '해마' ||
            _SearchText == '핸드폰' ||
            _SearchText == '회덮밥' ||
            _SearchText == '회식자리' ||
            _SearchText == '휴대폰') ||
        numButtonSwich[41] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 42 &&
          ball3num != 42 &&
          ball4num != 42 &&
          ball5num != 42 &&
          ball6num != 42) {
        setState(() {
          ball1num = 42;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 42 &&
          ball3num != 42 &&
          ball4num != 42 &&
          ball5num != 42 &&
          ball6num != 42) {
        setState(() {
          ball2num = 42;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 42 &&
          ball2num != 42 &&
          ball4num != 42 &&
          ball5num != 42 &&
          ball6num != 42) {
        setState(() {
          ball3num = 42;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 42 &&
          ball2num != 42 &&
          ball3num != 42 &&
          ball5num != 42 &&
          ball6num != 42) {
        setState(() {
          ball4num = 42;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 42 &&
          ball2num != 42 &&
          ball3num != 42 &&
          ball4num != 42 &&
          ball6num != 42) {
        setState(() {
          ball5num = 42;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 42 &&
          ball2num != 42 &&
          ball3num != 42 &&
          ball4num != 42 &&
          ball5num != 42) {
        setState(() {
          ball6num = 42;
        });
      }
    }
    if ((_SearchText == '경기용차' ||
            _SearchText == '경락마사지' ||
            _SearchText == '리모델링' ||
            _SearchText == '물에빠짐' ||
            _SearchText == '배달' ||
            _SearchText == '병문안' ||
            _SearchText == '새마을금고' ||
            _SearchText == '아랫니' ||
            _SearchText == '아이스링크' ||
            _SearchText == '알오티씨' ||
            _SearchText == '엑스레이' ||
            _SearchText == '역무원' ||
            _SearchText == '오랑우탄' ||
            _SearchText == '자동차검사' ||
            _SearchText == '장인어른' ||
            _SearchText == '하드디스크' ||
            _SearchText == '흔들그네') ||
        numButtonSwich[42] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 43 &&
          ball3num != 43 &&
          ball4num != 43 &&
          ball5num != 43 &&
          ball6num != 43) {
        setState(() {
          ball1num = 43;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 43 &&
          ball3num != 43 &&
          ball4num != 43 &&
          ball5num != 43 &&
          ball6num != 43) {
        setState(() {
          ball2num = 43;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 43 &&
          ball2num != 43 &&
          ball4num != 43 &&
          ball5num != 43 &&
          ball6num != 43) {
        setState(() {
          ball3num = 43;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 43 &&
          ball2num != 43 &&
          ball3num != 43 &&
          ball5num != 43 &&
          ball6num != 43) {
        setState(() {
          ball4num = 43;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 43 &&
          ball2num != 43 &&
          ball3num != 43 &&
          ball4num != 43 &&
          ball6num != 43) {
        setState(() {
          ball5num = 43;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 43 &&
          ball2num != 43 &&
          ball3num != 43 &&
          ball4num != 43 &&
          ball5num != 43) {
        setState(() {
          ball6num = 43;
        });
      }
    }
    if ((_SearchText == '검정텐트' ||
            _SearchText == '공사장인부' ||
            _SearchText == '괴물' ||
            _SearchText == '금색라이터' ||
            _SearchText == '금화' ||
            _SearchText == '나무공예' ||
            _SearchText == '남동생' ||
            _SearchText == '담쟁이' ||
            _SearchText == '디지털카메라' ||
            _SearchText == '땅강아지' ||
            _SearchText == '만화' ||
            _SearchText == '매화꽃' ||
            _SearchText == '목공예' ||
            _SearchText == '물안경' ||
            _SearchText == '방울뱀' ||
            _SearchText == '백일몽' ||
            _SearchText == '빌딩옥상' ||
            _SearchText == '생강나무' ||
            _SearchText == '앵두나무' ||
            _SearchText == '엄지발가락' ||
            _SearchText == '에이즈' ||
            _SearchText == '영정사진' ||
            _SearchText == '오막살이' ||
            _SearchText == '유치원생' ||
            _SearchText == '젊은이' ||
            _SearchText == '주임원사' ||
            _SearchText == '징그러움' ||
            _SearchText == '코믹' ||
            _SearchText == '태양열집열판' ||
            _SearchText == '폭음' ||
            _SearchText == '학교건물' ||
            _SearchText == '해삼' ||
            _SearchText == '핵' ||
            _SearchText == '현금' ||
            _SearchText == '형님' ||
            _SearchText == '활활타오름') ||
        numButtonSwich[43] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 44 &&
          ball3num != 44 &&
          ball4num != 44 &&
          ball5num != 44 &&
          ball6num != 44) {
        setState(() {
          ball1num = 44;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 44 &&
          ball3num != 44 &&
          ball4num != 44 &&
          ball5num != 44 &&
          ball6num != 44) {
        setState(() {
          ball2num = 44;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 44 &&
          ball2num != 44 &&
          ball4num != 44 &&
          ball5num != 44 &&
          ball6num != 44) {
        setState(() {
          ball3num = 44;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 44 &&
          ball2num != 44 &&
          ball3num != 44 &&
          ball5num != 44 &&
          ball6num != 44) {
        setState(() {
          ball4num = 44;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 44 &&
          ball2num != 44 &&
          ball3num != 44 &&
          ball4num != 44 &&
          ball6num != 44) {
        setState(() {
          ball5num = 44;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 44 &&
          ball2num != 44 &&
          ball3num != 44 &&
          ball4num != 44 &&
          ball5num != 44) {
        setState(() {
          ball6num = 44;
        });
      }
    }
    if ((_SearchText == '검정드레스' ||
            _SearchText == '고흥' ||
            _SearchText == '달맞이꽃' ||
            _SearchText == '무빙워크' ||
            _SearchText == '시한폭탄' ||
            _SearchText == '안마의자' ||
            _SearchText == '은방울꽃' ||
            _SearchText == '이혼' ||
            _SearchText == '조명등' ||
            _SearchText == '진주목걸이' ||
            _SearchText == '칸' ||
            _SearchText == '타작' ||
            _SearchText == '폭우' ||
            _SearchText == '항구' ||
            _SearchText == '해태제과' ||
            _SearchText == '핵폭발' ||
            _SearchText == '허공' ||
            _SearchText == '형부' ||
            _SearchText == '홍수' ||
            _SearchText == '홍시') ||
        numButtonSwich[44] == true) {
      if (selectedBallNum == 0 &&
          ball2num != 45 &&
          ball3num != 45 &&
          ball4num != 45 &&
          ball5num != 45 &&
          ball6num != 45) {
        setState(() {
          ball1num = 45;
        });
      } else if (selectedBallNum == 1 &&
          ball1num != 45 &&
          ball3num != 45 &&
          ball4num != 45 &&
          ball5num != 45 &&
          ball6num != 45) {
        setState(() {
          ball2num = 45;
        });
      } else if (selectedBallNum == 2 &&
          ball1num != 45 &&
          ball2num != 45 &&
          ball4num != 45 &&
          ball5num != 45 &&
          ball6num != 45) {
        setState(() {
          ball3num = 45;
        });
      } else if (selectedBallNum == 3 &&
          ball1num != 45 &&
          ball2num != 45 &&
          ball3num != 45 &&
          ball5num != 45 &&
          ball6num != 45) {
        setState(() {
          ball4num = 45;
        });
      } else if (selectedBallNum == 4 &&
          ball1num != 45 &&
          ball2num != 45 &&
          ball3num != 45 &&
          ball4num != 45 &&
          ball6num != 45) {
        setState(() {
          ball5num = 45;
        });
      } else if (selectedBallNum == 5 &&
          ball1num != 45 &&
          ball2num != 45 &&
          ball3num != 45 &&
          ball4num != 45 &&
          ball5num != 45) {
        setState(() {
          ball6num = 45;
        });
      }
    }
  }

  alreadyNum(int i) {
    print(ball2Switch);
    print(ball1num);
    if (ball2Switch == true && ball1num == i) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 250,
          content: Text(
            '이미 선택한 번호에요',
            style: TextStyle(fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
          backgroundColor: Colors.grey,
          duration: const Duration(milliseconds: 1000),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )));
    } else if (ball3Switch == true && ball2num == i) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 250,
          content: Text(
            '이미 선택한 번호에요',
            style: TextStyle(fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
          backgroundColor: Colors.grey,
          duration: const Duration(milliseconds: 1000),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )));
    } else if (ball4Switch == true && ball3num == i) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 250,
          content: Text(
            '이미 선택한 번호에요',
            style: TextStyle(fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
          backgroundColor: Colors.grey,
          duration: const Duration(milliseconds: 1000),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )));
    } else if (ball5Switch == true && ball4num == i) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 250,
          content: Text(
            '이미 선택한 번호에요',
            style: TextStyle(fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
          backgroundColor: Colors.grey,
          duration: const Duration(milliseconds: 1000),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )));
    } else if (ball6Switch == true && ball5num == i) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 250,
          content: Text(
            '이미 선택한 번호에요',
            style: TextStyle(fontSize: 20.sp),
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

  List<String> button6l = [];

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
          child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: const Text('로또번호 꿈풀이',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Pretendard',
                          fontSize: 30)),
                ),
                button6WantBall(
                    makeBall: makeBall,
                    ball1num: ball1num,
                    ball2num: ball2num,
                    ball3num: ball3num,
                    ball4num: ball4num,
                    ball5num: ball5num,
                    ball6num: ball6num),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showNotification3(context);
                        if (ball1num != 0 &&
                            ball2num != 0 &&
                            ball3num != 0 &&
                            ball4num != 0 &&
                            ball5num != 0 &&
                            ball6num != 0) {
                          setState(() {
                            button6l = [
                              ball1num.toString(),
                              ball2num.toString(),
                              ball3num.toString(),
                              ball4num.toString(),
                              ball5num.toString(),
                              ball6num.toString()
                            ];
                          });

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              width: 320.w,
                              content: Text(
                                '내저장번호목록에 저장되었습니다.',
                                style: TextStyle(fontSize: 18.sp),
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
                          saveLottoNumberList(button6l);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              width: 320.w,
                              content: Text(
                                '번호를 모두 추가해주세요.',
                                style: TextStyle(fontSize: 18.sp),
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
                      child: const Text('번호저장',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Pretendard',
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        minimumSize: Size(20.0.w, 35.0.h),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          for (int i = 0; i < oneTextSwitch.length; i++) {
                            oneTextSwitch[i] = false;
                          }
                        });
                        allReset();
                      },
                      child: const Text('초기화',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.bold)),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        minimumSize: Size(20.0.w, 35.0.h),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                Expanded(
                    flex: 4,
                    child: TextField(
                      textDirection: TextDirection.ltr,
                      key: _textFieldKey,
                      controller: _filter,
                      focusNode: focusNode,
                      // textAlign: TextAlign.center,
                      // enabled: true,
                      onChanged: (val) {
                        _SearchText = val;
                        makeBall();
                      },
                      decoration: InputDecoration(

                          // labelText: '꿈을 검색해보세요',
                          labelStyle: const TextStyle(
                              fontSize: 30, color: Colors.black),
                          filled: true,
                          fillColor: Colors.white70,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _filter.clear();
                                  _SearchText = '';
                                });
                              },
                              icon: const Icon(Icons.cancel)),
                          hintText: '꿈을 검색해보세요',
                          hintStyle: const TextStyle(fontSize: 20)),
                    )),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          minimumSize: Size(20.0.w, 35.0.h),
                        ),
                        child: const Text('추가',
                            softWrap: false,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          setState(() {
                            for (int i = 0; i < oneTextSwitch.length; i++) {
                              oneTextSwitch[i] = false;
                            }
                          });
                          addBut();
                        }))
                // Container(child: ElevatedButton(onPressed: () {}, child: Text('꿈 검색',style:TextStyle(fontSize: 20),)))
              ])),
          Expanded(
            child: Container(
                child: ScrollablePositionedList.builder(
              itemCount: 1, //,
              itemBuilder: (c, i) {
                return Table(
                  border: const TableBorder(
                      horizontalInside: BorderSide(
                          width: 1,
                          color: Colors.grey,
                          style: BorderStyle.solid)),
                  columnWidths: const {
                    0: FixedColumnWidth(40),
                  },
                  defaultColumnWidth: const FlexColumnWidth(),
                  children: [
                    const TableRow(children: [
                      Text('번호',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Pretendard',
                              fontSize: 20)),
                      Text('꿈풀이',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Pretendard',
                              fontSize: 20)),
                    ]),
                    TableRow(
                      children: [
                        GestureDetector(
                            onTap: () {
                              if (numButtonSwich[0] == false) {
                                setState(() {
                                  for (int i = 0; i < 45; i++) {
                                    numButtonSwich[i] = false;
                                  }
                                  numButtonSwich[0] = true;
                                });
                              } else {
                                setState(() {
                                  numButtonSwich[0] = false;
                                });
                              }
                              makeBall();
                              alreadyNum(1);
                            },
                            child: yellowBall(b: 1)),
                        const Text(
                            '가구,가랑비,가래떡,가시,가위,각목,간호사,강,갯지렁이,검,검정우산,고급승용차,고려대학교,고추,고향,골프채,곰,공예,구더기,국,금메달,금부처,금불상,기차,끈,나무기둥,낚시,난, 노을,노트북,녹용,눈(사람),단발머리,담배꽁초,대검,대나무,대지,대통령,대파,도사,돌,돌잔치,동물원,동승,땅,뜨개질,막대기,머리카락,머리핀,면회,모종,목욕탕,못,몽둥이,무기,바느질,바늘,바늘과실,바다,바닷가,바람둥이,밧줄,벼,벽,보살,복도,복숭아나무,볼펜,봉화,부처님,부처상,불곰,불상,붉은색,붉은색자켓,붓,비녀,빨랫줄,사탑,삽,생일케잌,석가모니,설날,성냥,성모마리아,성화,소,소금쟁이,소나기,송곳,순대,스케이트보드,시루떡,신,실,실핀,실험,아우디,애국가,야구방망이,야외풀장,어깨동무,에쿠스,연필,예수님,오피러스,옹달샘,왕,왕따,용암,원피스,유혹,이등병,일등병,일본,임플란트,입(사람),자동차범퍼,자동판매기,작대,작대기,작은꽃무늬,잡초,장검,장대비,전기선,절(건물),정육점,죽순,준장,줄,줄넘기,지네,지렁이,짚,찌름,창(무기),챔피언,첫돌,첫사랑,체어맨,초,침(뾰족한),칼,케이블선,털,토지,티끌,페라리,펜,포르쉐,하나님,하늘,한옥,합판,해변,행사,향수,헬기,헬리콥터,형사,혼인,홍고추,홍초,화살,화상,황사,황제,훈방조치,흑인,흰곰'),
                      ],
                    ),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[1] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[1] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[1] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(2);
                          },
                          child: yellowBall(b: 2)),
                      const Text(
                          '거위,고지서영수증,교감,꿈,나무아미타불,농협은행,단비,듀엣,무임승차,발뒤꿈치,백조,불,비,서울시,서울특별시,소장,수학여행,약혼,연장,염색약,오리,오리고기,외사촌동생,위협,육회,은하수,이빨,잠만경,장화,전화벨,주황색,청둥오리,투피스,학원,한약,합창,해동,해일,행주,헌병,혜성,호통,홍학,화랑,화약,화장,회충,훈장,흰옷'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[2] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[2] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[2] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(3);
                          },
                          child: yellowBall(b: 3)),
                      const Text(
                          '가르마,가슴,갈매기,갓,강아지,개,개울,검정우산,경상남도,공연,귀(사람),금부처,기러기,날개,남자손,낫,노란색,노파,논,농구화,다이아몬드,대한항공,뒷통수,디귿모양,묘지,무덤,무화과,물,물레방아,물벼락,바람,밥,방패연,배(탈것),백구,벼,병풍,보살,보트,복,부처님,부처상,불상,비행기,빗,산,산불,삼각형,삼거리,삼배,삼성자동차,삽,상병,새,석가모니,세발자전거,손,손에뽀뽀,손짓,쇠,시험지,식당밥,심장,아이스크림,악수,알루미늄호일,애완견,야산,왕,왕관,왕자,우비,우산,유성매직,절(건물),주민등록증,중장,집들이선물,책,천원,총학생회장,푸들,하숙방,한가위,한국어,한약,할머니,항아리,해변,해안가,햄버거,허수아비,헝겊,호랑이,호박,활,황제,황토,흉터,흑룡'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[3] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[3] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[3] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(4);
                          },
                          child: yellowBall(b: 4)),
                      const Text(
                          '가구,가수,가시,가위,강도,겨울,고등학교동창,고리대금업자,고사(죽음),고소,관,관광버스,굴,나비,나사,네모,네모난쟁반,네잎클로버,녹색,누나,단독주택,대장,독,돈,두부,뚱뚱한사람,마을버스,만원,머리피몰림,미혼모,박스,발,백골,백사,백치,뱀,뱀머리,뱀뼈,벽,병장,보건선생님,봉고차,봉선화,불,불구덩이,불덩어리불,불바다,불을끔,비누,비서,사각형,사신,사자,사체,사탄,살인,상여,소스,소주,술,숯,스타렉스밴,승합차,시소,시체,신호등,악마,양호선생님,엉덩이,저승,저승사자,주사,죽음,쥐,집,집이무너짐,초록,초상화,코피,클로버,토끼풀,통통한사람,프로스펙스,피,한국인,한라봉,해군사관학교,허름한집,회사원'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[4] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[4] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[4] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(5);
                          },
                          child: yellowBall(b: 5)),
                      const Text(
                          '가게,가루,가지,개기월식,거즈,거지,고개,고삐,고소,고추,고향집,고혈압,과거,과부,교수,구두,국가,국기,굴곡,귤,그네,기도,기차,깁스,냉동만두,노루,노숙자,노트,뉴스,달,덩굴장미,덫,도시,돌,돌더미,동호회,두부,드라마세트장,등산화,디스,몽둥이,미꾸라지,바다,바지벗음,바지보기,박물관,박수,반사,밤하늘,밥먹는꿈,방해꾼,밭,배구경기,백치,버선,버섯,번개,법사,별,보석,부자,부추,부츠,분노,분수,분홍색,비녀,비석,사과,사업자등록증,사자,산소,상점,생선회,선수,소주,손에뽀뽀,손오공,솥,쇠,수건,수리,수박,수선,습기,승리,식사,신부(결혼식),쌀,애정표현,에스엠5,여성가슴,여성성기,연주회,오곡,오목,오이,오징어,원수,월식,유방,잡지,전구,젖,조기,조사,좋은기분,주걱,주소,중학교,지구,지하상가,채송화,책,초등학교동창,카누,칼,커브,코너,큰형수,키스,톱,티슈,파란색카드,하모니카,하이파이브,한옥집,할미새,함박눈,헬맷,혀,현기증,현수막,호두나무,화장지,회의실,휘발유,휴양지,휴지,흰머리'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[5] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[5] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[5] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(6);
                          },
                          child: yellowBall(b: 6)),
                      const Text(
                          '가발,가수,가재,가족,가지,간식,갈기,갈비,강물다리,개꼬리,개사료,거실,건배,겨자,고가구,고래,고발,과속,과자,관기,괴물,교각,교복,구명보트,국자,군복,굴비,귀걸이,귀신,귀지,기계,기린,기술과목,까치,꼽추,낙지,낚시,난,난간,난로,남색,납치,내복,넙치,노란배추,노래,노름,노트,녹두,녹차,늘보,단서,달팽이,닭,대구,대학생,대학원,덧니,도끼,도박,도배,독사,독창,동영상,두건,때,떡,로또,로봇,리본,린스,맨바닥,민물가재,바나나,바둑,박새,박쥐,반지,반지하,배추,백사,백수,번개,베개,변,변기,병아리,보험가입서류,복권,복도,본드,부적,부채,북극,비계,비구니,비늘,비료,뿌리,사람다리,사람성기,사람음모,사전,사진,사촌,산초,살구,삽,삿갓,서류,선녀,선배,설사,성관계,성기,세로,세배,섹스,소고기,소나기,소설,소쿠리,소포,손자,수술,수첩,수컷,숟가락,시계,시골,시체,신호위반,심폐소생술,싸리,악마,영화관,요양원,유령,육개장,인라인스케이트,자두,자석,전갈,전구,전기,점심,제기,제비,제사,조개,조끼,조카,죄수,주스,주식,주황색,죽순,죽은사람,중사,증명사진,지네,집사,채소,처녀,천연기념물,체리,체스,초밥,축가,축구,치과,치석,치즈,친구,칡,콩나물,털,투구,파스,풀꽃,하루살이,하얀색장갑,하얀소복,하얀장갑,할로윈,할아버지,해당화,해병대,헤어젤,헬스장,혼혈아,화장대,화장실,환풍기,휠체어,흐뭇함'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[6] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[6] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[6] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(7);
                          },
                          child: yellowBall(b: 7)),
                      const Text(
                          '가계부,가습기,갈고리형쇠꼬챙이,갈대,갈치,갓길,개고기,건대역7호선,건물키,계곡,고깔,고등학교,고라니,고무헤라,고사리,곡괭이,과제물,관복,교실,구기자,구더기,구두,국어선생님,군대,귀지,그네,글씨,기린,기숙사,깃발,꽈리,나그네,낙타,날개,낫,너구리,네잎클로버,네트,녹색줄기,논,누비라,눈길,눈꼽,눈썹,늑개,늑골,늑대,다래,단속,단지,단추,대게,대본,대추,댄서,더덕,덤프트럭,도끼,도둑,도포,돼지,뒤주,드론,딸,로또,로션,로프,마일드세븐,말(동물),말(사람),망치,무지개,바가지,박쥐,박하사탕,밧줄,방송카메라,방충망,배관,배꼽,배수구,백로,백조,백치,밴드,버찌,벌새,벌초,벤츠,벤치,벼룩,벽지,보라매,보라색,복권,북두칠성,분홍내복,불교,비닐하우스,비키니,비행접시,사가정역7호선,사찰,사탄,사탑,산길,산불,상사,새싹,생리혈,샤프,석류,선전,설교,소나무,소뿔,소철,소형트럭,손해배상,쇼파,수달,수표,숙제,순대,순록,술집,슈퍼마켓,시소,신발,신발가게,쑥갓,양쪽팔,역사학자,열쇠,왈츠,우유를문아기,유한락스,자갈,작두,작은슈퍼,잔디,잡곡,잡지,저금통장,적군,전복,전주시,전차,절구,젓소,제주시,좌석,주사기,지게,지진,지퍼,진주,집게,찬밥,참치회,처제,천식,철사,체리,체조,초록색줄기,추락,춤,치타,칠면조,커피,컵,코(사람),콘도,쿠션,클로버,타조,탁구,터번,토끼,토끼풀,퇴비,트럭,티코,파도,파리,팥,포도,포로,포크,피난,피리,피자,핀셋,학교,햄스터,현금영수증,호미,화물선,화물차'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[7] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[7] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[7] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(8);
                          },
                          child: yellowBall(b: 8)),
                      const Text(
                          '가디건,각질,간판,갈대,갈색,감,강,개,개구리,개나리,개미,거미,건달,건조기,걸레,검정돼지,계단,계란,곰,과꽃,과녘,교도소,권투,귀(사람),금돼지,기저귀,긴바지,깡패,꽈배기,나시,남자가슴,냅킨,노숙,눈사람,다이너마이트,닫힌수갑,달걀,대벌레,대전광역시,대파,도너츠,도자기,독가스,독촉,돈까스,돌계단,돌하르방,동성애,돼지,돼지발,돼지코,된장찌개,두꺼비,디스크,따귀,라벨,렌즈,로켓,롯데(동물),롯데(회사),리본,망사스타킹,매,모닝(차량),목(사람),못,묶음,문을닫음,미로,바니걸,바다게,바지선,박수,박치기,박카스,반바지,발자국,밤줍기,밥솥,밧줄,배수로,백혈병,벌레,벌집,병원응급차,보리밥,보리차,보조개,볼트,부둣가,부츠,분꽃,불고기,불륜,붓꽃,뷔페,비행기표,뻐꾸기,사다리,사진사,산수국,선글라스,섬,셀카,소변기,소쿠리,손뼉,손톱,솜,수갑,수돗가,수사관,수제비,수학시험,술잔,술집,숫돌,숲속,신기루,쌀밥,안경,애벌레,여자가슴,역기,영업사원,오뚜기,옹기,일등상사,자라,잠수함,잡채,저수지,전갈,전축,제단,조수석,조폭,주점,쥐포,지구본,직장후배,참치캔,찻집,천재,철근,청개구리,초,초등학교,촛대,촛불,출근,출산,취직,칫솔,카지노,카페,커튼,코브라,콜라,콧대,콩,쿠폰,키보드,탁자,택시,터널,토기,토란,트럭,파리,파티,팔월군번,팝콘,포도,하얀색손수건,항아리,해변,호적등본,회사동료,횡단보도,후라이팬,흰쌀밥'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[8] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[8] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[8] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(9);
                          },
                          child: yellowBall(b: 9)),
                      const Text(
                          '가락지,개량한복,개살구,거래처,거인,게,결제,계산기,고속버스,고스톱,공주드레스,교차로,구두,구두솔,구렁이,구름,구멍,구미호,군부대,굴삭기,급경사,기술자,깃털,깍두기,껍질,꿀벌,나룻배,나병,낚시추,낭떠러지,내리막길,누룽지,다슬기,달래,달빛,달팽이,대궐,대출,대패,도끼빗,도너츠,도라지,도라지뿌리,도서관,도시락,도시락통,독수리,돈,돋보기,돌,두더지,등대,딱새,딸기,딸기나무,떡국,만화책,망원경,머리폭발,메달,미행,바느질,바다게,바비큐,발차기,발톱,밥풀,배기가스,백묵,백화점,버스표,번데기,벌,벚꽃,벨트,벼,벽돌,별빛,병실침대,병원침대,복분자,봉돌,부자,분필,불꽃,불사신,비둘기,비밀번호,비스켓,빈자리,빗자루,빨래,사거리,사골국,사람이빠짐,살코기,삼성르노,삼성자동차,샌달,샛별,설사,소방서,소주잔,손가락,손바닥,손사래,솔밭,솔숲,쇠,쇠구슬,수저,숟가락,스카프,스크린,스티커,스피커,시라소니,쓰레기,여종업원,여직원,역,연설,올챙이,원숭이,음성메세지,자전거,장수하늘소,재판,전기,전기선,전철,전철역,전표,절벽,조리,졸업앨범,좁쌀,죄수복,주걱,주차선,지리산,지폐,지하철역,진찰,진흙탕,짚신,철골,초가집,축구,축구경기,친할머니,칫솔,코끼리,콩나물,킥보드,타자기,타잔,테니스,티켓,팝콘,팬더,편지,폭발,폭설,폭죽,풍선,피바다,피클,핀셋,학원교실,한복치마,할미꽃,핫도그,항문,현관,혼잣말,홍삼,화투,황토'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[9] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[9] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[9] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(10);
                          },
                          child: yellowBall(b: 10)),
                      const Text(
                          '가락지,가로세로퀴즈,가로수,가마,가위,갈비뼈,감,강강술래,개기일식,갯벌,거미,거울,거품,건전지,건포도,검은콩,검정색,결혼식장,경주,계란,고가다리,고릴라,고모,고자질,골키퍼,골프공,공,공깃돌,공짜,과일,교차로,교차로신문,교회,구덩이,굴렁쇠,급식실,기차표,기찻길,길바닥,까투리,껌,꽃밭,꾀꼬리,꿈,꿩,나무,난로,노린재,눈(사람),단추,달,달걀,달력,달리기,닭고기,담벼락,당구,대리석,대머리,댄스,더하기기호,도너츠,도토리,독서실,돈,동굴,동네아줌마,동전,들판,랍스터,랜턴,말(사람),망,먼지,모기,모래,모시,목사,무기,물,물벼락,미사,미소,밀,바닷가뻘밭,발가락,발자국,발전기,배구선수,배꼽,백두산,백만원권수표,뱀,벌목,베란다,벽시계,볏짚,보닛,보따리,보름달,보리,보리가루,보자기,본넷,볼링공,볼펜,부싯돌,부잣집,북,불도저,브라질,사거리,사수자리,사진첩,사탕,산기슭,산사태,산토끼,살구,새끼쥐,서리태,석고보드,성교육,세탁기,세탁소,솜,쇠,수건,수박,수박서리,수조,수족관,순대국,숟가락,스님,스킨쉽,스펀지,시골길,시골집,시식,시줏돈,십만원,십자가,쌀,쑥떡,아식스,아줌마,야구공,어항,예식장,요강,우물,자갈,자동차본네트,자투리,자판기,잠,잡곡밥,쟁반,전원주택,전투기,점을뺌,접시,젓가락,족두리,족제비,종교인,주전자,지하주차장,진주,짐,징,채찍,철,철모,첫돌,체육대회,초코파이,춤,칠판,칼국수,코란도,코뿔소,콧구멍,콩,퀵보드,클로버,킥보드,타이어,탁구,태극기,태양,텃밭,테라스,텐트,토끼굴,토끼풀,토스트,투기꾼,투피스,튜브,파스타,판소리,팬티,펜,펜션,폐백,포도,포도주,폭탄,피자,해,해운대,핸들,헤드라이터,호두,홍어,흰테이블'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[10] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[10] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[10] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(11);
                          },
                          child: blueBall(b: 11)),
                      const Text(
                          '가격표,가랑비,가래떡,가스벨브,가시,감옥,개구리밥,고목,고속도로,고슴도치,고춧가루,골키퍼,공항,교도소,교장선생님,구경,그네,금,기도,기찻길,꽃바구니,꽃수레,나무기둥,나무젓가락,낚시,낚싯대,낚싯줄,날도래,날파리,널판지,노을,녹색신호등,다방,단비,담배꽁초,대나무,도면,도배,돈다발,돌고래,돌다리,돼지코,때수건,뗏목,라면,립글로즈,립스틱,막대기,머리카락,못,몽둥이,바늘,바늘과실,박수,반딧불,반말,발레복,방울토마토,배추밭,버티컬,변기커버,볼펜,부탄가스,불가사리,비,비바람,빨랫줄,사다리차,사자탈,사절단,샌드백,샐러드,서울대,서울대학,석기시대,선글라스,선로,설계도,소나기,소방서,손뼉,송판,쇠창살,수류탄,수제비,순금덩어리,스키,스탠드,슬리퍼,시루떡,신발끈,실,쌍둥이,입(사람),잡채,장대비,장마,전기,전기파리채,전단지,전봇대,전화통화,절단기,젓가락,제기,제비꽃,조각칼,족집게,주전자물,지렁이,찰떡,찻집,철도,철쭉,쳇바퀴,축구선수,카세트,카페,칼국수,커피숍,탈곡기,털,테두리,토끼굴,토지,통화,투구꽃,튤립팥,트로피,파라솔,파리채,파스,파출소,파티복,팥죽,펜,폭포,하얀색타올,화장품,황금'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[11] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[11] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[11] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(12);
                          },
                          child: blueBall(b: 12)),
                      const Text(
                          '가래떡,가스레인지,가슴,가재,감기,감주,개미,개밥그릇,갤로퍼,검사,경사길,고목,고무인형,고민,골프채,곰보,과태료,그룹섹스,금,금고,금니,꽃다발,남자가슴,단비,대걸레,대벌레,댐,도둑,도마,돈벌레,돈육,돌잔치,돼지,돼지고기,랙스톤,마루,마산,마커,마크,머루,머리,머리깎기,머리폭발,머리피몰림,메기,모자,목수,무쏘,미국,미군,미납,미로,미신,바닷가재,발가벗음,벌레,벽시계,보디빌더,본드,부검,비석,비탈길,사슴,산딸기,서울특별시,선글라스,성탄절,성폭행,세종대학교,소금,소문,손빨래,수도꼭지,수도배관,순찰대장,스님,스케치북,스포츠카,시계,시계바늘,시골친구,시댁식구,신발가게,신체검사,씨래기국,씨씨티비,여행,연세대학교,영혼,영화,오빠,왼쪽팔뚝,은행,인형,자동차보조좌석,작두,잔디,잔디밭,전기스토브,절(건물),젖꼭지,조선시대,집개미,짝짓기,처마,철조끼,청소차,체조선수,최루탄,치마,커터칼,코딱지,콘센트,크리스마스,크리스마스회식,크린랩,탁구선수,태권도,털조끼,파렛트,팔뚝,표고버섯,형'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[12] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[12] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[12] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(13);
                          },
                          child: blueBall(b: 13)),
                      const Text(
                          '강,검정색양복,고속철도,골프선수,공,구두뒷굽,권투선수,기자,나팔꽃,노란색,단지,돌계단,뜨개질,모기향,무궁화,무술대회,발레리나,방,방공호,백구,백숙,백호,벙커,보도블럭,보스턴백,붉은색자켓,블루베리,블루투스,산꼭대기,산불,삼거리,상,석고대죄,수리,스파게티,쌍용자동차,쓰레받기,양,양복,양은냄비,연극공연장,옷,자수,적갈색,줄다리기,진달래,철,철책선,체크카드,초콜릿,카스텔라,크레파스,트랙터,파스타,파스텔,팬티,포켓볼,포플러,표지판,풀피리,항아리,향나무,현대자동차,호랑이,황토실'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[13] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[13] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[13] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(14);
                          },
                          child: blueBall(b: 14)),
                      const Text(
                          '가면,각목,감자,감초,갓난아기,거름,검도,검도장,검정색콩,고구마,고구마밭,고름,고모부,광어회,교문,구름,권총,그림,그물,기름,기름공장,기프트콘,김밥,김치,남극,남자,냄비,네모난쟁반,노름,녹색,논문,닭볶음탕,담비,대마,도라지하얀꽃,돼지새끼,등,등판,마늘,마법,마술,마작,막내,만두,먼지,메주,명함,모란,모래,모터,목단,목화,묘지,무궁화,무대,묵주,문산시,문신,미래,미술,밑반찬,바바리코트,바퀴벌레,박스,반지케이스,발포,배추벌레,백두대간,백묵,백수,병실침대,보물,보배,보아,보아뱀,복권,부대찌개,분필가루,불구덩이,비듬,빨랫줄,빵,사내,사다리,산삼,서리태,서점,소나무,손금,손목,손톱깎이,수박껍질,술래잡기,숨바꼭질,스님,스탠그릇,신문,아기,어부,옷장,옻,이(벌레),이사,잠바,잠수,저금,전기밥솥,점퍼,조준,좀비,종,종이학,주먹,주목,즉석복권,지문,징,찌르레기,찻숟가락,처남,천사,총,카탈로그,콘크리트,콩,트렌치코트,티스푼,푸드코트,프린터,필리핀,하이에나,홈에버,홍어회,흐린구름'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[14] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[14] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[14] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(15);
                          },
                          child: blueBall(b: 15)),
                      const Text(
                          '가루세제,가방,가위,강가,강시,개미핥기,거위,거인,검정색양복,게이,고궁,고깃배,고무양동이,공구,공부,기와,까투리,꿩,나방,노인,농부,농사,누에,단오,도시,드라큘라,레코드판,롯데(회사),마감,마누라,매미,목마,바위,방구,배우,보건실,보조배터리,봉사,봉황새,부인,북어,비옷,빨래바구니,빨랫줄,사람성기,사위,상가,새끼손가락,새우,성가,성기,소위,수능,수업,수행원,숙모할머니,십오만원,아내,아버지,아파트상가,악기,악보,악수,양버즘나무,양호실,어선,언니,엘피판,여수시,여자성기,열린수갑,오곡,오빠,와이프,우비,우산,운동화,운동회,의사,이끼,이리,인사,입구,장마,전자레인지,절(건물),주차딱지,주차위반증,집게벌레,찬송가,커피포트,클라리넷,텔런트,파파야,팥죽,플라타너스,한약방,합의금,형수,휴대폰케이스'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[15] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[15] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[15] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(16);
                          },
                          child: blueBall(b: 16)),
                      const Text(
                          '가르마,가양쪽,감독,갑옷,강간,강도,거머리,거울,거품,건물,경비,고무신,곤봉,골목,곰,곶감,관기,광고,괴물,구루마,군인,금색,기녀,기생,기프트콘,깨물기,나병,냄새,노을,녹색식물,눈물,다방,다시마,단감,닭,담배,당구,대금,대변,도면,동서,동창회,드럼,딱따구리,땅,떡,똥,라면,럼주,레몬,마사지,마스크,만화방,맛집,매듭,매실,매제,맥주,메론,모내기,목발,목포시,물,물개,미나리,믹서기,발등,발목,밥상,방석,배나무,배낭,백곰,백일홍,변,복면,봉분,부엌,북,분무기,불곰,브래지어,비늘,빙산,사냥,사마귀,사우나,사원,삼촌,상복,상자,상처,상추,생수,샤워,서명,서울특별시,석궁,석양,석유,선물,성게,성관계,성폭행,세무서,섹스,속옷,수세미,수육,순두부,승리,시장,시청,싸인,씨름,씨앗,아녀자,안개,안주,약,약사,어깨,억새,업음,여신,여자,여주시,여치,역주행,연고,연기,영화,왁스,완구,외국,요리,울음,원서,윗니,유도,의자,이불,이슬,인두,일기,일본군입주,자궁,장구,장사,장어,재산상속,적금,전신거울,조깅,족발,주머니,주방,주인,주점,주택복권,중학생,지붕,참빗,참새,참치,창부,천막,천일홍,철모,청소,체스,키위,파리바게트,팬티,포대기,푸드트럭,퓨마,학생증,학원생,휴대폰충전기,흉터,흰곰'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[16] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[16] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[16] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(17);
                          },
                          child: blueBall(b: 17)),
                      const Text(
                          '가오리,간장,간장게장,감금,개울,거래,거북이,건빵,검문,검정봉투,겨울,곱창,공터,과일,광주광역시,광화문,교장선생님,군청,궁전,권투글러브,극장,남학생,네이버,농기구,다이소,단독주택,단상,담배꽁초,당근,대봉투,대야,대위,도랑,도장,도청,동네,등산,런닝,마담,면허증,목검,묘목,묘지,무덤,미술전시회,밥알,백장미,뱃사람,법당,벙어리장갑,벼랑끝,보라색,분장,붕대,비디오,비상구,빈병,사이다,사장님,사탕,산소,산장,산타클로스,살인,삼각요트,삼각형,상투,생리,생선,선장,성곽,성폭행,소령,소방서,소풍,손등,수의사,수통,수학선생님,스위스,스크린골프,스포츠토토,식당,식빵,신랑,아가씨,아들,아버지,안타,액자,야채,약국,언덕,여관,여권,역도,연극,염라대왕,영화표,예배,오소리,옥수수,온실,온천,와사비,외투,욕조,우거지,우표,우황청심원,운전,유럽,유전,유채,유흥주은,육교,육지,은색,이비인후과,인공호흡,일본,일식,일제강점기,입술,자라,잔잔한물,장갑,장학금,재래식화장실,쟁기,저울,전어,전통혼례,정리,정자(건물),종교,중국,집,창녀,천안시,청자,청주시,충주시,충치,치약,카니발,컨닝,컴퓨터싸인펜,큰방,테니스라켓,파도,푸세식화장실,풍선,플랜카드,하나은행,하얀색봉투,하얀색장갑,학원강사,현미경,혼인서약,홍당무,화장,황금새,휴대폰안테나,흰장미'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[17] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[17] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[17] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(18);
                          },
                          child: blueBall(b: 18)),
                      const Text(
                          '가랑비,가로세로퀴즈,가시나무,감로수,감탄사,건축설계도,검정색망사옷,검찰,경전,계정,고기(육류),고등학생,고환,공짜,공책,과메기,광대,구경,구루마,국회의원,권총,귀마개,귤,금가루,기상도,긴머리,까마귀,남학생,내무반,논,놀람,눈밑,늦잠,다리미,단청,대나무,독일,돌,동굴물,동전,두루미,뒷문,뒷물,등대,등불,딱밤,라디오,레종,리어카,마술사,말벌,맨발,머리감기,메꽃,메두사,면발,면접,멸치,모니터,목련,목소리,목젖,목줄,목탁,무료,무릎,문고리,문지기,문패,물고기,미니밴,미술가,바자문,방송비제이,배구공,밴드,뱀술,버거킹,벚나무,베이커리,벼이삭,보살,봉고차,부처님,부처상,불경,불법체류자,불상,붕어,비바람,비빔밥,빌딩,빗,빵집,사무실,사시나무,산수유,살롱,살모사,살찐사람,생고기,생전,생쥐,생활관,샤워기,샴푸,서울은행,석가모니,섬,성조기,소방복,소방차,속치마,솔나무,송판,쇼핑,수리공,수증기,술병,숯,스파이,시금치,실종,썰매,아동학대,아저씨,암에걸림,앞산,애국가,양념게장,어플,얼굴,에쿠스,역류,열쇠,엽전,오로라,온돌,올케,옷가게,왈츠,왜적,요리사,욕설,욕실,우주복,우주선,우체부,월급,이발사,인형뽑기,작약,잠바,잠수,잠수부,잣나무,장대,장작,쟁반,전나무,전병,전생,점퍼,정글지대,정수기,제과점,종아리,주사위,주유소,중화요리,쥐,지우개,직장,참깨,창밖,창포,책상,천정,철봉,청년,청소기,침대,커튼사이로얼굴,케이크,콘돔,콧물,쿠킹호일,타올,탱고,텔레비전,통로,투명한케이스,튀김,펑크,표범,풍난,피나무,피아노,하이마트,회장'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[18] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[18] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[18] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(19);
                          },
                          child: blueBall(b: 19)),
                      const Text(
                          '가로등,가스통,감나무,강바닥,개업,개울,갯바위,거북이등껍질,건달,검정색자동차,경기도,경비복,경비실,고추장,곡예사,광대,군용헬기,귀걸이,급경사,기와집,깡패,꽃병,꿈,나무문,낙엽,내리막길,냉각수,노른자,다세대주택,다홍치마,단풍,대령,대형,도로표지판,동물,동태,된장,딤섬,땅속,뚜껑,라이벌,라이터,럭비공,링겔,망,매점,무역회사,바리깡,바지,밤나무,방구,방바닥,배우,법조인,별장,보일러,부동산,부랑배,부모,빨래건조대,사모님,사이렌,삼나무,새우젓,생식기,설탕,소방관,소방서,소주병,송편,스컹크,시위대,신한은행,애꾸눈,연꽃,연탄,열기구,예금통장,예비군,오디션,오리발,오솔길,외갓집,외할머니,왼쪽,우리집,우체국,유자차,음악디제이,이력서,일일구신고,자취방,재규어,전쟁,전차,정수리,제삿상,조각,조끼,좌익수,중고차,질병,찬송가,청바지,초등학생,축구공,컬링,콩가루,키위새,탄광,탄창,탱크,털옷,텔레비전,트랜스젠더,패딩,피시방,한국은행,혓바닥,형광펜,황금빛,황금새'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[19] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[19] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[19] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(20);
                          },
                          child: blueBall(b: 20)),
                      const Text(
                          '가락지,가마솥,가물치,간(사람),갈매기,감,감전사,갓난아기,강강술래,강탈,개그,개그맨,개기일식,개미굴,거미줄,거울,거품,검은콩,검정색,견인차,계란,계약서,고구마순,고급승용차,고드름,고무줄,고인돌,골프공,공,공깃돌,공작새,공짜,과일,구덩이,군입대,굴렁쇠,귀(사람),귤,귤나무,금반지,금시계,기관총,깻잎,남편,넥타이,놀이기구,놀이터,누에고치,눈(사람),눈금선,눈사람,다락방,단추,달,달걀,닭장,답안지,당구,당구대,대머리,대학원생,대형여객선,덤벨,도너츠,도박장,돈,동굴,동전,드라이기,드라이버,드라이브,드링크,램프,롤스로이스,리모컨,리무진,마사지,마티즈,막대기,말보로,망,머리끈,먼지,메추리,멜론,면도기,모래,모텔,목도리,목제소,미아,밀가루,바디워시,배(과일),배(사람),배꼽,백미러,백사장,백수,버드나무,베레모,병,보름달,보물선,보신탕,보자기,복권방,볼링공,부엌가구,부침개,북,사과나무,사랑,사법고시,사자춤,사탕,산나물,살구,서랍장,서리태,선배,선풍기,설거지,세금,소개팅,소독약,손,솜,수박,수산물,수상스키,스님,스웨터,스타킹,스토킹,스프링,승용차,식당밥,신문지,신분증,심장사상충,십자매,싱크대,쌀,썰물,씀바귀,아기,아반테,아보카도,아파트,아파트상가,안테나,야구선수,약수터,양배추,언니,연필,예술가,옛사랑,오골계,오락실,오렌지,오픈카,요강,우물,운동복,울음,워크샵,원피스,월드컵,유적지,유튜브,이삭줍기,이쑤시개,인력거,인터뷰,일본도,잎사귀,자갈,자동차,자취방,작대기,작업차,잠수복,장대비,장지갑,쟁반,접시,좌측,주먹밥,주차장,진주,징,찌름,찐빵,처방전,철가방,철모,첫사랑,청소년,청소솔,초상집,초코파이,추리닝,축구장,출산,출입구,충전기,카메라,캥거루,코(사람),코미디언,코스모스,코알라,콧구멍,콩,크레인,타박상,타이어,탁구,탈모,태양,테잎,토끼굴,튜브,팔목,패물,펌프,펭귄,포도,폭풍,프랑스,피라미,피에로,피자,함박꽃나무,해,핸들,헤어드라이기,호두'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[20] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[20] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[20] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(21);
                          },
                          child: redBall(b: 21)),
                      const Text(
                          '가래떡,가시,갈비탕,검사,경찰서,계량기,고향마을,공수부대,관광지,구둘장,구역질,굴렁쇠,기타,나무기둥,남녀공학교실,남한산성,납골당,노을,단오,닭고기,담배꽁초,대입시험,등산객,라일락,로또,로또방,링거,막대기,메모,목사,못,몽둥이,몽땅연필,무너짐,무우,물뱀,밀림,밀물,방아깨비,방파제,보안카드,보이스톡,볼펜,브레이크,블라우스,빨랫줄,뻥튀기,사촌언니,사촌오빠,사탕수수,산부인과,삼성라이온즈,상견례,생리대,생선가시,쇼케이스,수리,수산시장,승용차짐칸,신발장,실내화주머니,아나콘다,아이스하키선수,악세서리,앞바퀴,애벌레,약,어댑터,연락처,옆구리,오피러스,운전기사,유리구두,의사,이모,이산가족,인터넷,입(사람),자격증,전기공사,전조등,중세기사,지렁이,참나무,창녀촌,창호지문,체온계,초능력,치과의사,코요테,큰아버지,탁자,탕비실,털,테이블,통닭,트렁크,펜,풀,필통,황토물'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[21] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[21] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[21] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(22);
                          },
                          child: redBall(b: 22)),
                      const Text(
                          '가래침,개구리알,개기일식,거미다리,거짓말,건널목,건물주,건물키,경찰복,경찰차,계수나무,고무대야,고무보트,고문도구,관광버스,교통사고,권리금,꽃마차,꽃무지,뉴트리아,느릅나무,느티나무,단비,도둑,두루마기,둥굴레,떡볶이,뗏목,레미콘,레즈,마라톤,마스카라,막걸리,맘모스,매실주,머리띠,머리핀,메뚜기,메머드,면사포,모닥불,문을잠금,미술관,민속촌,바닷물,반찬통,반팔옷,발,밭두렁,배달원,베트남,보디빌더,분식점,분홍색,비닐봉지,빙판길,사채,사치품,산신령,산중턱,살구나무,살충제,삼백초,삼태기,서울특별시,성적표,셔터,셔터문,속도위반,쇼핑백,수돗물,스케이트,스케이트보드,스튜디오,스프레이,스핑크스,시멘트,신경질,쌍둥이,안전핀,알파벳,애무,억새,억새풀,여자친구,여치,오른쪽,요구르트,월드컵,유리그릇,인감증명서,인터폰,자귀나무,자두나무,자물쇠,잠자리,잡동사니,장독대,장례식,장작,절구,절구통,젖가슴,조약돌,줄넘기,쭈꾸미,철거민,철도청,청개구리,청자켓,체육관,체중계,초롱꽃,초코파이,칡,칭기즈칸배우,카네이션,토마토,판사,팥빙수,페이스북,포도잎,품절,피나물,피난민,핑크색,하와이,해물탕,횡단보도'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[22] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[22] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[22] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(23);
                          },
                          child: redBall(b: 23)),
                      const Text(
                          '가림막,개기월식,거수경례,경찰,교실청소,구멍,근친상간,끈끈이주걱,네펜데스,노란색,노천극장,높은음자리,대학교동창,도마뱀,돌팔이,렌즈통,롯데리아,먹구름,모과나무,목(사람),문구점,문어,물웅덩이,미루나무,미술학원,밥,배트,베이비시터,비구름,비닐장갑,사주풀이,사팔이눈,산불,삼거리,샌드위치,세숫대야,소똥구리,쇠파이프,식충식물,심부름,쌍꺼풀,쓰레기장,안마,암소,야구방망이,에버랜드,역,연,연탄불,연탄재,운전면허,월식,은색그릇,이민,잎벌레,자동차키,장딴지,재,재떨이,재봉틀,전광판,전쟁터,전철역,정글숲,주방세제,컨테이너,케이블카,탈의실,파리지옥,포스트잇,폭염'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[23] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[23] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[23] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(24);
                          },
                          child: redBall(b: 24)),
                      const Text(
                          '가슴털,감독관,개기월식,개목줄,검도칼,겨울코트,계좌이체,고구마밭,고구마줄기,고슴도치,골목길,곰,관람차,교통카드,구기자,구기자나무,꼬마,나비넥타이,낭떠러지,네모난쟁반,녹색,다람쥐,다래,다래나무,단호박,담벼락,대리운전,대추나무,도라지잎,도망,두릅,두릅나무,땔감,레스토랑,로커,마루바닥,말(동물),머드팩,머스타드,머플러,멍게,메뉴판,메추라기,모래밭,물티슈,미국산소고기,미꾸라지,민요,밍크,바람꽃,바바리코트,박스,반짝임,방문,백일반지,보름달,보리수,보리수나무,보험증권,북두칠성,불구덩이,비포장길,빈사무실,사철나무,산울타리,삼겹살,삼성,새치,색연필,석류나무,세면대,손세정제,솥뚜껑,수도세,슈퍼맨,스트레칭,시장,신갈나무,신문기자,싸움,쓰레기통,아스팔트,아이들,애드벌룬,야구글러브,어머니,엄마,염소,오이,오줌,오프로드,옷장,용,음식,이름,이사,입금,입김,자작나무,잔치,잠바,잡지기자,재래시장,전병,절벽,점퍼,주름,주지스님,지름길,집이물에잠김,천둥번개,치즈케잌,친정어머니,카레라이스,컵라면,턱(사람),트렌치코트,팩,포도나무,포커,포크레인,피난'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[24] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[24] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[24] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(25);
                          },
                          child: redBall(b: 25)),
                      const Text(
                          '가짜,감옥,검정색고양이,게임,교도소,남대문,남방,다툼,담쟁이넝쿨,당근,대형마트,도망,도시,동물보호소,두대,두엄,롯데월드,마당,마약,마우스,마을,망치,머플러,모델하우스,모임,모조품,모종,무당,문,물구나무,물김치,미역,미원,미장,바리게이트,방문,범인,불꽃놀이,붕어,비상벨소리,산타클로스,살충제,상어,서명,성탄절,송어,쇼핑카트,수염,싸움,싸인,아욱,아침,앞마당,어머니,에프킬라,엘지,여우,연말회식,연못,열린수갑,염소,오락,오줌,오케스트라,오피스텔,옹기,우물,우승,우유,월계수관,위조지폐,이무기,인삼,자몽,장난꾸러기,장마,장미,전기장판,주먹싸움,참나물,침(사람),크게웃음,크리스마스,크리스마스회식,트레일러,홍당무,후임병'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[25] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[25] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[25] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(26);
                          },
                          child: redBall(b: 26)),
                      const Text(
                          '중지손가락,강물,강의,곱슬머리,광어,구름다리,귀신,그것이알고싶다,김장,꿈방,끈끈이주걱,나무계단,나무판자,남색바지,남자친구,냉이,다리(사람),다림질,닭,담요,덧니,두부조림,뒷덜미,땋은머리,떡,마이크,매트리스,머리카락,멧돼지,면도칼,목폴라,미스터리,민들레,바가지머리,바디랭귀지,박달나무,밤,밤을보임,방송,법무사,별똥별,붉은갈색,비늘,산소마스크,상여,상인,상점,색동저고리,성에,성인,성탄절,섹스,소매,소형트럭,손목시계,수영,신체검사,쓰레기봉투,아시아,아킬레스건,안전벨트,암벽,암컷,애인,약지손가락,엘란트라,여자가슴,연못,연어,염주,오일,옥상,와인,요강,우동,유령,유성,유흥업소,은행원,인상,잉크,작은트럭,장님,장발,장어,저수지,적갈색,전동드릴,정문,젖가슴,종이,중지손가락,진딧물,참치캔,칠면조,크리스마스,텀블러,퇴직금,팔,팔물림,펌프카,푸른물,피라미드,헤엄,흙탕물'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[26] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[26] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[26] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(27);
                          },
                          child: redBall(b: 27)),
                      const Text(
                          '강당,강릉시,강정,검역,경매,공예,공원,공장,과속방지턱,금메달,김장,남자가슴,녹용,농장,도박,동상,동성,동요,된장찌개,등애,레드카펫,마이크,말미잘,매실나무,매장,머리,면봉,면세점,명치,목욕,몽구스,문방구,미라,미숙아,미팅,민물고기,백고양이,보라색,뺨,사슴뿔,산꼭대기,산양,산정상,상장,생강,석유,성냥,성당,쇼,수학선생님,시장,심문조사,아가옷,아는남자,아버지,안경,안동시,압정,앵두,양복,양주,어묵,엉덩이,여물,연필꽂이,영국,영화배우,오뎅,옷장,왕겨,왕자,요정,용산,우리은행,우익수,우편물,운동,웅변,원금,원자폭탄,위성,윙크,은행잎,이사,잇몸,잠옷,장막,장터,전경,젖은빨래,중위,참외,창문,파도,파마머리,포옹,피망,하얀색고양이,현상수배범,형광등'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[27] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[27] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[27] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(28);
                          },
                          child: redBall(b: 28)),
                      const Text(
                          '강아지,거짓말,고등어,공룡,공유기,구덩이,구렁이,국민체조,군대고참,귀뚜라미,금붕어,내리막길,다이빙,다이아몬드,단발머리,돌길,동생,돼지머리,두릅,드레스룸,딱정벌레,만년필,머리염색,모기장,문앞,미국인,미니스커트,미사일,바다표범,바닥담요,바이킹,배꼽,병원,복숭아,사슴벌레,성형외과,소나무분재,손오공,송아지,수제맥주,스마트폰,썸,아몬드,액정,야구공,양파,에이드,연등,연장,영양크림,오두막,올가미,욕설,용접,우편배달부,유모차,이구아나,임산부,자위,장롱,정원,종말,청동,총알,칠판지우개,침대커버,침팬지,카카오톡,컴퓨터,타이어,팔꿈치,팽이,푸들'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[28] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[28] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[28] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(29);
                          },
                          child: redBall(b: 29)),
                      const Text(
                          '경운기,공문서,공사장,공포,광저우,나체,냉면,녹음기,누드,닭,담장,당구공,당첨,대형티브이간판,독,동아리,등나무,떡집,런닝,레이싱,맨드라미,모래바람,목공소,무릎뒤쪽,물총,발가벗음,방송국,방앗간,방충망,뱀알,변명,병아리,병풍,보온병,뽕나무,뽕잎,삼각김밥,상사병,손목,수영복,스승,스포트라이트,쌈장,아나운서,아이돌,아카시아나무,알몸,앨범,야구장,양귀비,에어컨,여인숙,염료,염불,염색,오디나무,옷걸이,옷장사,옻나무,왕따,외국계은행,외국인,외숙모,원시인,은행나무,이마트,이어폰,익모초,인디언,점심,정미소,정자(사람),조흥은행,중국어,중령,지렁이,청기와,통장,통장정리,피어싱,해태'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[29] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[29] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[29] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(30);
                          },
                          child: redBall(b: 30)),
                      const Text(
                          '가락지,갈치조림,감,강강술래,강원도,강의실,개기일식,거울,거품,검은콩,검정색,겨울옷,경상도,계란,계획서,곡괭이,골프공,공,공깃돌,공모전,공짜,과일,관광여행,구덩이,구상나무,군용차량,굴렁쇠,기생충,김치찌개,나무젓가락,난쟁이,냉장고,노점상,눈(사람),단추,달,달걀,당구,당구장,대머리,도너츠,도토리나무,돈,동굴,동전,동치미,땅콩,떡갈나무,롤러스케이트,롯데마트,마카롱,망,맥도날드,먼지,명절풍경,명태,모래,목걸이,반성문,반지,방수공사,방정식,배꼽,백장미,뱃머리,베드민턴,병원,보름달,보육원,보자기,볼링공,북,분유,사장님,사탕,사파이어,살구,상수리나무,새송이버섯,색종이,생수병,서리태,서울역,선인장,성교육,소녀,손톱,솜,송풍기,수박,수영장,술래잡기,숨바꼭질,스님,스티로폼,스포츠머리,쌀,아는언니,아주머니,알로에,야구공,약장수,양배추,오토바이,온풍기,와인잔,외계인,외상값,외한은행,요강,우물,운동복,유리문,유리병,유리창,유에스비,유원지,유치원,이삿짐,자갈,잠자리채,쟁반,접시,정원사,제일은행,종교인,종이컵,주전자물,중국옷,지팡이,진주,징,철모,체육복,초인종,초코파이,촬영,추석풍경,츄리닝,콧구멍,콩,타이어,탁구,태양,토끼굴,튜브,트레이닝세트,폐암,포도,피겨스케이팅,피자,해,핸들,호두,황금물고기,흰장미'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[30] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[30] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[30] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(31);
                          },
                          child: greyBall(b: 31)),
                      const Text(
                          '가래떡,가시,가오리연,강간,경로당,공기놀이,공주님,기모노,기자,꽃상여,나무기둥,남자화장실,노상방뇨,노을,놀이공원,담배꽁초,리포터,마네킹,막내삼촌,막대기,막창,명찰,못,몽둥이,미역국,발목,방아깨비,방청객,베짱이,복숭아씨앗,볼링공,볼펜,부장,빚,빚쟁이,빨랫줄,사장님,삼일절,삼촌,색안경,생선,생수통,선무당,성냥불,소방장비,수영선수,수통,아랫층,아이스박스,아주머니,악어새끼,엑티언,여자성기,여직원,열대어,예수님,예식장,옛사랑,오공본드,오리나무,옷고름,완두콩,원인류,유괴범,유리문안,음료수,응접실,의사,이자카야,입(사람),장구애비,장식장,지렁이,철물점,첫사랑,청국장,콧구멍,탕수육,택배배달원,털,통나무,펜,폭염,행글라이더'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[31] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[31] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[31] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(32);
                          },
                          child: greyBall(b: 32)),
                      const Text(
                          '가위바위보,검정색,검정색천,검지손가락,교사,교차로신문,꽃등애,나이트,네온싸인,뉴스앵커,단란주점,단비,동사무소,두통약,마로니에,말뚝박기,물방개,민둥산,바위틈,바이올린,발톱,방패연,보정속옷,부부싸움,부평역,불상,살쾡이,서울특별시,선생님,선수,설계도,성경,성당신부,소주,아구찜,아이패드,아주버니,앙파즙,앞치마,앵커,양복바지,양치질,어린이집,어음,에스키모복,에이티엠기기,에탄올,여자동기,연극배우,예방주사,오일쇼크,올리브유,올빼미,왼쪽팔뚝상처,유자나무,이불,입냄새,작은섬,잠자리,장기,전동문,정액권,정장바지,중탕기,쪽진머리,채팅방,청첩장,축의금,칠엽수,표범문신,학교운동장,한미은행,현금인출기'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[32] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[32] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[32] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(33);
                          },
                          child: greyBall(b: 33)),
                      const Text(
                          '가게,감시카메라,개,갯지렁이,검정색,고무장갑,곰탕,과장,교사,구멍가게,국민은행,나무기둥,노란색,달팽이,닭강정,대중목욕탕,대형군함,마취제,매,매뉴얼,맥주병,모르는남자,목장갑,무릎,문자,물청소,미용실,방범카메라,백열등,병뚜껑,복숭아밭,볶음밥,불,비바람,사이비종교,산불,삼거리,상고머리,상추쌈,생선장수,생수,샹들리에,선생님,설명서,성추행범,세쌍둥이,수양버들,스승,스킨,식목일,신용카드,아르바이트,양반다리,여드름,올케,외삼촌,외조부모,유가증권,유람선,율무차,음표,이탈리아,인절미,잠수경,장기자랑,장난감,장뇌삼,장모님,줄을섬,중학교동창,지로용지,진열장,짬뽕,차장,철갑상어,청설모,체어맨,콧수염,콩나물,큰어머니,태풍,팽나무,폭풍,프랑스인,학,항공모함,회'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[33] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[33] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[33] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(34);
                          },
                          child: greyBall(b: 34)),
                      const Text(
                          '강,강아지풀,검문검색,검정색비석,검정색자동차,계약금,고구마이삭,국립공원,기아자동차,나무판자집,남자성기,네모난쟁반,녹색,단속,단속카메라,덤프트럭,동대문,떡방아간,리포터,매니큐어,물장군,물총새,미치광이,박스,반죽,발가락,발바닥,방송기자,백학꿈해몽,불구덩이,사촌동생,살찐사람,삼촌,상아,설중매,아는남자,아카시아꽃,안경가게,안경점,여자얼굴,옆모습,왕골자리,웨딩사진,일회용기저귀,작은아버지,저수지,총검술,치아교정기,카드단말기,턱수염,트럭,호수,호스'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[34] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[34] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[34] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(35);
                          },
                          child: greyBall(b: 35)),
                      const Text(
                          '개암나무,개울물,거래처,검정색숯,계장,금동불,기름통,대성통곡,도시,두줄의검정띠,마요네즈,말통,매니큐어,메리야스,메이드,무좀약,물망초,밀짚모자,방범초소,비디오테입,산호,생맥주,샹들리에,송장벌레,수학,수화,스커트,시골,식물원,아귀찜,아파트상가,에델바이스,연차,열린수갑,영화감독,오르가즘,우담바라,우물,우엉,음식점,음악,이마,잉어,장미꽃,저금통,지하,천도복숭아,철조망,침대매트,케이에프씨,파인애플,하녀,해고,해부,허리,호두,호박,화가,화보,회사,후추,휴가,흙'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[35] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[35] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[35] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(36);
                          },
                          child: greyBall(b: 36)),
                      const Text(
                          '가짜꽃,강강술래,개천,교실,교회,국화,군화,귀중품,금전출납부,냉동탑차,닭,대우자동차,대한민국,도토리나무,떡,모래사장,문화상품권,민속놀이,배수구,백호,버스정류장,베이비파우더,북한,비늘,사탄,삼십육계,상수리나무,성에,섹스,스타디움,아는언니,아는여자,알콜솜,얼룩말,얼음,엠뷸런스,영어,왕비,우편물,울음,이종격투기,인삼뿌리,자전거안장,작은숙모,장례식장,전투화,조화,직장동료,찜질팩,초등학교동창,축하,카드게임,케이티엑스,피난,하객,하늘,하수구,하천,학교,한국,한복,한자,해초,화로,화분,화염방사기,화초,후진,휴지로닦음'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[36] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[36] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[36] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(37);
                          },
                          child: greyBall(b: 37)),
                      const Text(
                          '간호사,거미알집,걸름망,검정색,고무대야,고물장사,고스톱,공양,구명보트,구명조끼,남녀공용사우나,눈(날씨),댕기머리,동굴물,동백꽃,동백나무,드럼통,런닝머신,마을,망개떡,맞고,물푸레나무,백골,백구,백합,법사,보라색,부엉이,사다리차,사람두개골,사람뼈,삼계탕,상가,상품권,샴페인,섬광탄,소화기,수정테이프,식혜,심장마비,아궁이,안양시,암반수,엘리베이터,오미자,오미자나무,우편물,웨딩드레스,윗니,응원,입양,전학,전화,조명탄,지문인식,지하수,찬밥,챔피언,축구응원,커피땅콩,털뭉치,파도,파운데이션,패랭이꽃,폭설,합격,해골,해적,햇반,호환,화단,화투,환자,환호,회,흑색,흰개,흰눈'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[37] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[37] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[37] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(38);
                          },
                          child: greyBall(b: 38)),
                      const Text(
                          '가위눌림,가해자,강물다리,건강검진,겨울바람,겨울점퍼,결혼식,고스톱,고양이,골동품,공부방,광선,구멍가게,낙하산,노여움,단풍나무,던힐,등대,랜턴,램프,릴레이경주,망아지,미용사,밀양군,반짝임,백색,백열등,버선,번화가,변호사,별빛,불빛,빛,사이드브레이크,사회자,삼십팔도,새우튀김,선물상자,성화,세종문화회관,수선화,스트레스,스포트라이트,양갱,양말,에스컬레이터,엠씨,오징어,우렁이,자장면,종양,죽,지혈,징검다리,짜장면,팔뒷꿈치,팔뚝,편의점,합기도,합숙소,합판,핫도그,해달,허벅지,현대그룹,호떡,혼례,화환,환불,횟집,훈련,휴게소,흰티'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[38] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[38] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[38] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(39);
                          },
                          child: greyBall(b: 39)),
                      const Text(
                          '가게,강냉이,골프연습장,과학,과학자,금목걸이,김장배추,단호박,도화지,땅콩껍질,리허설,마에스트로,모임,물,밍크코트,배추,삼성,삼성전자,세운머리,소화전,송충이,수간호사,시장골목,쌀,아는아이,아시아나,앞니,약탈,영부인,영어시험,원숭이,이빨,입술,전시회,전화통화,절도,지하실,지휘자,콩나물밥,탱자나무,펑크머리,한라산,핸들,헌혈,혈관,호수,호텔,화폐,회초리,효자손,흙길,흰바지'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[39] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[39] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[39] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(40);
                          },
                          child: greyBall(b: 40)),
                      const Text(
                          '가락지,감,강강술래,강낭콩,개기일식,거울,거품,검은콩,검정색,검정옷,계란,고속버스터미널,골프공,공,공깃돌,공무원,공짜,과녘,과일,과학실,구덩이,구운햄,굴렁쇠,그을음,금은방,눈(사람),단추,달,달걀,당구,대머리,대학교,도너츠,돈,동굴,동성애,동전,망,먼지,모래,모르는여자,무당벌레,배꼽,보름달,보자기,볼링공,북,빔프로젝터,사료,사탕,살구,상여금,서리태,소녀,솜,수련회,수박,수영장,스님,승강장,식용유,신혼부부,실내화,쌀,쌍둥이,암행어사,앵무새,야구공,엉겅퀴,에스컬레이터,엠뷸런스,여자아이,영수증,외양간,요강,우물,원앙새,자갈,장애인,쟁반,절(인사),접시,지하철,지하철개찰구,진주,징,철모,초코파이,콧구멍,콩,타이어,탁구,태양,토끼굴,튜브,포도,풀장,피자,피자헛,하마,해,해란초,해바라기,해파리,핸들,허리띠,헤드셋,호두,호미,호박꽃,홈플러스,환자복,휴전선'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[40] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[40] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[40] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(41);
                          },
                          child: greenBall(b: 41)),
                      const Text(
                          '가래떡,가시,검정돼지,겔포스,결혼식,계란말이,공연장,극장,나무기둥,노을,담배꽁초,막대기,머리염색,멜빵바지,못,몽둥이,무잎,발등,백만장자,볼펜,붙임머리,빨랫줄,송곳니,수영장,승무원,양식장,어금니,여동생,연극공연장,연예인,옛애인,올림머리,올챙이,용광로,율무차,인어공주,입(사람),좌회전,쥐똥나무,지렁이,찜질방,축구,털,패러글라이딩,펜,학원선생님,핸드백,호두과자,회사선후배,휠체어,흙탕물'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[41] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[41] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[41] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(42);
                          },
                          child: greenBall(b: 42)),
                      const Text(
                          '강낭콩,검정옷,경마장,계좌,고함,곰팡이,교회친구,남자아이,단비,대학교수,댄서,도사,동물옷,미용실,발표회,백학도사님,보험,사이비종교,산신령,서울특별시,소년,시험,시험지,엄지손가락,오동나무,원시인옷,졸업한동창생,좁은골목,종이봉지,종이상자,카멜레온,풍뎅이,학교선후배,해마,핸드폰,회덮밥,회식자리,휴대폰'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[42] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[42] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[42] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(43);
                          },
                          child: greenBall(b: 43)),
                      const Text(
                          '경기용차,경락마사지,노란색,놀이공원,리모델링,물에빠짐,배달,병문안,산불,삼거리,새마을금고,수술,아랫니,아이스링크,알오티씨,엄지손가락,엑스레이,역무원,오랑우탄,자동차검사,장인어른,하드디스크,횡단보도,흔들그네'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[43] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[43] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[43] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(44);
                          },
                          child: greenBall(b: 44)),
                      const Text(
                          '검정텐트,공사장인부,관,괴물,교통사고,구미호,귀신,금색라이터,금화,나무공예,남동생,네모난쟁반,녹색,담쟁이,독사,디지털카메라,땅강아지,만화,매화꽃,목공예,목화,물안경,미치광이,박스,방울뱀,백골,백일몽,보석,불구덩이,불바다,빌딩옥상,사신,살모사,상여,생강,생강나무,소주,시체,쌍둥이,앞마당,앵두나무,엄지발가락,에이즈,영정사진,오막살이,유령,유치원생,장례식,저승사자,젊은이,주임원사,죽은사람,죽음,집게,징그러움,초상집,코믹,태양열집열판,폭음,학교건물,항공모함,해골,해삼,핵,핵폭탄,향수,현금,형,형님,활활타오름,흐린구름'),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            if (numButtonSwich[44] == false) {
                              setState(() {
                                for (int i = 0; i < 45; i++) {
                                  numButtonSwich[i] = false;
                                }
                                numButtonSwich[44] = true;
                              });
                            } else {
                              setState(() {
                                numButtonSwich[44] = false;
                              });
                            }
                            makeBall();
                            alreadyNum(45);
                          },
                          child: greenBall(b: 45)),
                      const Text(
                          '검정드레스,고급승용차,고흥,달맞이꽃,대학교수,도시,로또,롯데(동물),무빙워크,벙어리장갑,복권,선전,성모마리아,스포츠머리,시한폭탄,안마의자,열린수갑,염불,영혼,유령,은방울꽃,이혼,조명등,진주목걸이,짚,찻집,청소,최루탄,친구,카페,칸,콧구멍,키보드,타작,튜브,폭우,한자,항구,해태제과,핵폭발,핵폭탄,허공,형부,홍수,홍시'),
                    ]),
                  ],
                );
              },
            )),
          )
        ],
      )),
      bottomNavigationBar: returnAd(),
    );
  }
}

class button6WantBall extends StatefulWidget {
  button6WantBall(
      {Key? key,
      this.makeBall,
      this.ball1num,
      this.ball2num,
      this.ball3num,
      this.ball4num,
      this.ball5num,
      this.ball6num})
      : super(key: key);
  var makeBall;
  var ball1num;
  var ball2num;
  var ball3num;
  var ball4num;
  var ball5num;
  var ball6num;

  @override
  _button6WantBallState createState() => _button6WantBallState();
}

class _button6WantBallState extends State<button6WantBall> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
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
                  getBall(widget.ball1num),
                  getBall(widget.ball2num),
                  getBall(widget.ball3num),
                  getBall(widget.ball4num),
                  getBall(widget.ball5num),
                  getBall(widget.ball6num),
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
