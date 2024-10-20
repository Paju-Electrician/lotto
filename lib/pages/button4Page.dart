import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:lotto/pages/notification.dart';
import 'package:lotto/pages/sharedpreferences.dart';
import 'package:lotto/provider/allpages_Provider.dart';
import 'package:lotto/widget/mainWidgets.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../provider/allpages_Provider.dart';

class button4Page extends StatefulWidget {
  const button4Page({Key? key}) : super(key: key);

// var context;
  @override
  State<button4Page> createState() => _button4PageState();
}

class _button4PageState extends State<button4Page>
    with TickerProviderStateMixin {
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

  var button4RandomNumber =
  (List<int>.generate(45, (i) => i + 1)..shuffle()).sublist(0, 6);

  var alignmentList = [
    Alignment(15.w, 190.h),
    Alignment(10.w, 190.h),
    Alignment(0, 190.h),
    Alignment(0, 190.h),
    Alignment(-10.w, 190.h),
    Alignment(-15.w, 190.h)
      ];
  var alignment = [
     Alignment(0, 0),
     Alignment(0, 0),
     Alignment(0, 0),
     Alignment(0, 0),
     Alignment(0, 0),
     Alignment(0, 0),
     Alignment(0, 0)
  ];

  var switchbool1 = false;
  var switchbool2 = false;
  var switchbool3 = false;
  var switchbool4 = false;
  var switchbool5 = false;
  var switchbool6 = false;

  AudioPlayer player = AudioPlayer(); //Audio 객체 생성
  Future audioPlayer() async {
    await player.setVolume(75); //볼륨
    await player.setSpeed(2); //재생 속도
    await player.setAsset('assets/boing.mp3'); //경로
    player.play(); //재생
  }

  var Imagebool = false;

  onTapButton() {
    setState(() {
      Imagebool = true;
      // _controller.forward();

      selected = !selected;
    });

    if (switchbool1 == false ||
        switchbool2 == false ||
        switchbool3 == false ||
        switchbool4 == false ||
        switchbool5 == false ||
        switchbool6 == false) {
      audioPlayer();
    }

    // setState(() {
    //   button4RandomNumber.sort();
    // });
    if (switchbool1 == false) {
      setState(() {
        alignmentList[0] = alignment[0];
        switchbool1 = true;
        return;
      });
    } else if (switchbool2 == false) {
      setState(() {
        alignmentList[1] = alignment[1];
        switchbool2 = true;
        return;
      });
    } else if (switchbool3 == false) {
      setState(() {
        alignmentList[2] = alignment[2];
        switchbool3 = true;
        return;
      });
    } else if (switchbool4 == false) {
      setState(() {
        alignmentList[3] = alignment[3];
        switchbool4 = true;
        return;
      });
    } else if (switchbool5 == false) {
      setState(() {
        alignmentList[4] = alignment[4];
        switchbool5 = true;
        return;
      });
    } else if (switchbool6 == false) {
      setState(() {
        alignmentList[5] = alignment[5];
        switchbool6 = true;
        return;
      });
    }
  }

  onResetButton() {
    setState(() {
      switchbool1 = false;
      switchbool2 = false;
      switchbool3 = false;
      switchbool4 = false;
      switchbool5 = false;
      switchbool6 = false;
      alignmentList[0] = Alignment(15.w, 190.h);
      alignmentList[1] = Alignment(10.w, 190.h);
      alignmentList[2] = Alignment(0, 190.h);
      alignmentList[3] = Alignment(0, 190.h);
      alignmentList[4] = Alignment(-10.w, 190.h);
      alignmentList[5] = Alignment(-15.w, 190.h);
      button4RandomNumber =
          (List<int>.generate(45, (i) => i + 1)..shuffle()).sublist(0, 6);
    });
  }

  var allMatchList = []; //5위 이상한 회차
  var allMatchAllNumber = [];
  var allMatchNumver = [];
  var allMatchRank = [];

  seeAllMatchNum() {
    allMatchNumver.clear();
    allMatchList.clear();
    allMatchRank.clear();
    allMatchAllNumber.clear();
    var myClickNumber = [
      button4RandomNumber[0],
      button4RandomNumber[1],
      button4RandomNumber[2],
      button4RandomNumber[3],
      button4RandomNumber[4],
      button4RandomNumber[5]
    ]; //L
    List<Map> lottoAllDataInfo = List<Map>.empty(growable: true);
    List<List> lottoAllDataNumberList = List<List>.empty(growable: true);
    for (int i = 0; i < context.read<Mainpage_Store>().totalLottoData.length; i++) {
      lottoAllDataInfo.add({
        'drwNo': context.read<Mainpage_Store>().totalLottoData[i]['drwNo'],
        'drwtNo1': context.read<Mainpage_Store>().totalLottoData[i]['drwtNo1'],
        'drwtNo2': context.read<Mainpage_Store>().totalLottoData[i]['drwtNo2'],
        'drwtNo3': context.read<Mainpage_Store>().totalLottoData[i]['drwtNo3'],
        'drwtNo4': context.read<Mainpage_Store>().totalLottoData[i]['drwtNo4'],
        'drwtNo5': context.read<Mainpage_Store>().totalLottoData[i]['drwtNo5'],
        'drwtNo6': context.read<Mainpage_Store>().totalLottoData[i]['drwtNo6'],
        'bnusNo': context.read<Mainpage_Store>().totalLottoData[i]['bnusNo']
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
        allMatchRank.add('1등');
        allMatchNumver.add(tempMyNum);
        allMatchList.add(lottoAllDataInfo[i]['drwNo']);
        allMatchAllNumber.add(lottoAllDataNumberList[i]);
      } else if (match == 5 &&
          myClickNumber.contains(lottoAllDataInfo[i]['bnusNo'])) {
        tempMyNum.add(lottoAllDataInfo[i]['bnusNo']);
        allMatchNumver.add(tempMyNum);
        allMatchList.add(lottoAllDataInfo[i]['drwNo']);
        allMatchRank.add('2등');
        allMatchAllNumber.add(lottoAllDataNumberList[i]);
      } else if (match == 5) {
        allMatchNumver.add(tempMyNum);
        allMatchList.add(lottoAllDataInfo[i]['drwNo']);
        allMatchRank.add('3등');
        allMatchAllNumber.add(lottoAllDataNumberList[i]);
      } else if (match == 4) {
        allMatchNumver.add(tempMyNum);
        allMatchList.add(lottoAllDataInfo[i]['drwNo']);
        allMatchRank.add('4등');
        allMatchAllNumber.add(lottoAllDataNumberList[i]);
      } else if (match == 3) {
        allMatchNumver.add(tempMyNum);
        allMatchList.add(lottoAllDataInfo[i]['drwNo']);
        allMatchRank.add('5등');
        allMatchAllNumber.add(lottoAllDataNumberList[i]);
      }
      tempMyNum = [];
      match = 0;
    }
  }

  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  animationWhat() {
    if (Imagebool == false) {
      return Image.asset(
        'assets/tong.png',
        width: MediaQuery.of(context).size.width + 280.w,
        height: MediaQuery.of(context).size.height,
      );
    } else {
      return Lottie.asset(
        'assets/lottie/tong.json',
        width: MediaQuery.of(context).size.width + 280.w,
        height: MediaQuery.of(context).size.height,
      );
    }
  }

  List<String> l = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: const Color(0xfff8f8f8),
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200.h,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
                  child: AutoSizeText(
                    '공 누르면 랜덤추첨 ',
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
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
                    child: Row(children: [
                      Expanded(
                        child: AnimatedAlign(
                          alignment: alignmentList[0],
                          duration: const Duration(milliseconds: 200),
                          child: getBall(button4RandomNumber[0]),
                        ),
                      ),
                      Expanded(
                        child: AnimatedAlign(
                          alignment: alignmentList[1],
                          duration: const Duration(milliseconds: 200),
                          child: getBall(button4RandomNumber[1]),
                        ),
                      ),
                      Expanded(
                        child: AnimatedAlign(
                          alignment: alignmentList[2],
                          duration: const Duration(milliseconds: 200),
                          child: getBall(button4RandomNumber[2]),
                        ),
                      ),
                      Expanded(
                        child: AnimatedAlign(
                          alignment: alignmentList[3],
                          duration: const Duration(milliseconds: 200),
                          child: getBall(button4RandomNumber[3]),
                        ),
                      ),
                      Expanded(
                        child: AnimatedAlign(
                          alignment: alignmentList[4],
                          duration: const Duration(milliseconds: 200),
                          child: getBall(button4RandomNumber[4]),
                        ),
                      ),
                      Expanded(
                        child: AnimatedAlign(
                          alignment: alignmentList[5],
                          duration: const Duration(milliseconds: 200),
                          child: getBall(button4RandomNumber[5]),
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showNotification3(context);
                            if (switchbool1 == true &&
                                switchbool2 == true &&
                                switchbool3 == true &&
                                switchbool4 == true &&
                                switchbool5 == true &&
                                switchbool6 == true) {
                              setState(() {
                                l = [
                                  button4RandomNumber[0].toString(),
                                  button4RandomNumber[1].toString(),
                                  button4RandomNumber[2].toString(),
                                  button4RandomNumber[3].toString(),
                                  button4RandomNumber[4].toString(),
                                  button4RandomNumber[5].toString()
                                ];
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      width: 320.w,
                                      content: AutoSizeText(
                                        '내저장번호목록에 저장되었습니다.',
                                        style: TextStyle(fontSize: 18.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          10.w, 10.h, 10.w, 10.h),
                                      backgroundColor: Colors.grey,
                                      duration: const Duration(milliseconds: 1000),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )));
                              saveLottoNumberList(l);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      width: 320.w,
                                      content: AutoSizeText(
                                        '번호를 모두 추가해주세요.',
                                        style: TextStyle(fontSize: 18.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          10.w, 10.h, 10.w, 10.h),
                                      backgroundColor: Colors.grey,
                                      duration: const Duration(milliseconds: 1000),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                              ),
                              padding: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h)
                            // primary: Colors.red
                          ),
                          child: AutoSizeText('번호저장',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              button4RandomNumber.sort();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                              ),
                              padding: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h)
                            // primary: Colors.red
                          ),
                          child: AutoSizeText('숫자정렬하기',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            onResetButton();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                              ),
                              padding: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h)
                            // primary: Colors.red
                          ),
                          child: AutoSizeText('지우기',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: FittedBox(
                fit: BoxFit.none,
                child: GestureDetector(
                  onTap: onTapButton,
                  onDoubleTap: onTapButton,
                  child: Stack(children: [
                    const AutoSizeText('test'),
                    Image.asset(
                      'assets/tong.png',
                      width: MediaQuery.of(context).size.width + 280.w,
                      height: MediaQuery.of(context).size.height,
                    ),
                    animationWhat()
                  ]),
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 70.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (context.read<Mainpage_Store>().lottoData['drwtNo6'] == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            width: 320.w,
                            content: AutoSizeText(
                              '서버점검시간',
                              style: TextStyle(
                                  fontSize: 25.sp, fontWeight: FontWeight.w900),
                              textAlign: TextAlign.center,
                            ),
                            padding:
                            EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                            backgroundColor: Colors.red,
                            duration: const Duration(milliseconds: 1000),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )));
                      } else {
                        if (switchbool1 == false ||
                            switchbool2 == false ||
                            switchbool3 == false ||
                            switchbool4 == false ||
                            switchbool5 == false ||
                            switchbool6 == false) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              width: 320.w,
                              content: AutoSizeText(
                                '로또번호 6개를 모두 뽑아주세요',
                                style: TextStyle(fontSize: 20.sp),
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
                          seeAllMatchNum();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  insetPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      10.0.w, 0.0, 10.0.w, 0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0)),
                                  //Dialog Main Title
                                  title: Column(
                                    children: <Widget>[
                                      AutoSizeText(
                                        "과거당첨결과 확인",
                                        style: TextStyle(
                                          // color: Colors.blue,
                                            fontSize: 32.sp,
                                            fontFamily: 'Pretendard'),
                                      ),
                                    ],
                                  ),
                                  //
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: button4resultAllNumBall(
                                                allMatchList: allMatchList,
                                                allMatchRank: allMatchRank,
                                                allMatchNumver: allMatchNumver,
                                                allMatchAllNumber:
                                                allMatchAllNumber),
                                          ),
                                        ),
                                      ]),

                                  actions: <Widget>[
                                    TextButton(
                                      child: AutoSizeText(
                                        "확인",
                                        style: TextStyle(color:Colors.blue,fontSize: 25.sp),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                  actionsAlignment: MainAxisAlignment.center,
                                );
                              });
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h)),

                    child: AutoSizeText('과거당첨보기',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold, fontSize: 30.sp)),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class button4resultAllNumBall extends StatefulWidget {
  button4resultAllNumBall(
      {Key? key,
        this.allMatchList,
        this.allMatchRank,
        this.allMatchNumver,
        this.allMatchAllNumber})
      : super(key: key);
  var allMatchList;
  var allMatchRank;
  var allMatchNumver;
  var allMatchAllNumber;

  @override
  _button4resultAllNumBallState createState() =>
      _button4resultAllNumBallState();
}

class _button4resultAllNumBallState extends State<button4resultAllNumBall> {
  getBall(i, b) {
    if (widget.allMatchNumver[i].contains(b)) {
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

  final ItemScrollController _scrollController1 = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 570.h,
      width: 400.w,
      child: ScrollablePositionedList.builder(
          itemCount: widget.allMatchList.length, //
          itemScrollController: _scrollController1,
          itemBuilder: (c, i) {
            return Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: AutoSizeText('${widget.allMatchList[i]}회',
                                style: TextStyle(
                                    fontSize: 27.sp,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.red))),
                        Container(
                            height: 25.h,
                            alignment: Alignment.center,
                            child: AutoSizeText('  ${widget.allMatchRank[i]}',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w900)))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
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
                        context.watch<Mainpage_Store>().lottoData['drwtNo1'] == null
                            ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                            : getBall(i, widget.allMatchAllNumber[i][0]),
                        context.watch<Mainpage_Store>().lottoData['drwtNo2'] == null
                            ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                            : getBall(i, widget.allMatchAllNumber[i][1]),
                        context.watch<Mainpage_Store>().lottoData['drwtNo3'] == null
                            ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                            : getBall(i, widget.allMatchAllNumber[i][2]),
                        context.watch<Mainpage_Store>().lottoData['drwtNo4'] == null
                            ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                            : getBall(i, widget.allMatchAllNumber[i][3]),
                        context.watch<Mainpage_Store>().lottoData['drwtNo5'] == null
                            ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                            : getBall(i, widget.allMatchAllNumber[i][4]),
                        context.watch<Mainpage_Store>().lottoData['drwtNo6'] == null
                            ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                            : getBall(i, widget.allMatchAllNumber[i][5]),
                        const Icon(Icons.add),
                        context.watch<Mainpage_Store>().lottoData['bnusNo'] == null
                            ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                            : getBall(i, widget.allMatchAllNumber[i][6]),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}