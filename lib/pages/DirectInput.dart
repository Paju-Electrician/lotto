import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lotto/pages/lottoNumber.dart';
import 'package:lotto/provider/allpages_Provider.dart';
import 'package:lotto/widget/mainWidgets.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../provider/naverSearch_Provider.dart';

class DirectInput extends StatefulWidget {
  const DirectInput({Key? key}) : super(key: key);

  @override
  State<DirectInput> createState() => _DirectInputState();
}

class _DirectInputState extends State<DirectInput> {
  var buttonSwitch = true;
  var clearSwitch = false;
  String one = '';
  String two = '';
  String three = '';
  String four = '';
  String five = '';
  String six = '';
  List ex = [];

  clearText() {
    setState(() {
      one = '';
      two = '';
      three = '';
      four = '';
      five = '';
      six = '';
    });
  }

  buttonable() {
    setState(() {
      if (one == '' ||
          two == '' ||
          three == '' ||
          four == '' ||
          five == '' ||
          six == '') {
        buttonSwitch = true;
      } else {
        buttonSwitch = false;
      }
    });
  }

  clearColor() {
    if (one == '' &&
        two == '' &&
        three == '' &&
        four == '' &&
        five == '' &&
        six == '') {
      clearSwitch = false;
    }
  }

  claerBallColo() {
    setState(() {
      clearSwitch = true;
      buttonSwitch = true;
    });
  }

  makeNum(int i) {
    setState(() {
      clearSwitch = false;

      if (one == '' &&
          two != i.toString() &&
          three != i.toString() &&
          four != i.toString() &&
          five != i.toString() &&
          six != i.toString()) {
        one = i.toString();

        buttonable();

        return;
      } else if (one == i.toString()) {
        one = '';
        // print(one);
        buttonable();

        return;
      }

      if (two == '' &&
          one != i.toString() &&
          three != i.toString() &&
          four != i.toString() &&
          five != i.toString() &&
          six != i.toString()) {
        two = i.toString();

        buttonable();
        return;
      } else if (two == i.toString()) {
        two = '';

        buttonable();
        return;
      }

      if (three == '' &&
          one != i.toString() &&
          two != i.toString() &&
          four != i.toString() &&
          five != i.toString() &&
          six != i.toString()) {
        three = i.toString();
        buttonable();

        return;
      } else if (three == i.toString()) {
        three = '';
        buttonable();

        return;
      }
      if (four == '' &&
          one != i.toString() &&
          two != i.toString() &&
          three != i.toString() &&
          five != i.toString() &&
          six != i.toString()) {
        four = i.toString();
        buttonable();

        return;
      } else if (four == i.toString()) {
        four = '';

        buttonable();
        return;
      }

      if (five == '' &&
          two != i.toString() &&
          three != i.toString() &&
          four != i.toString() &&
          one != i.toString() &&
          six != i.toString()) {
        five = i.toString();

        buttonable();
        return;
      } else if (five == i.toString()) {
        five = '';

        buttonable();
        return;
      }
      if (six == '' &&
          two != i.toString() &&
          three != i.toString() &&
          four != i.toString() &&
          five != i.toString() &&
          one != i.toString()) {
        six = i.toString();

        buttonable();
        return;
      } else if (six == i.toString()) {
        six = '';

        buttonable();
        return;
      }

      if (one != '' &&
          two != '' &&
          three != '' &&
          four != '' &&
          five != '' &&
          six != '') {
        buttonable();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            width: 250,
            content: Text(
              softWrap: false,
              '6개 까지만 선택가능해요',
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
        return;
      }
    });
  }

///////////////////////////////////

  var yellow = const Color(0xfffbc400);
  var blue = const Color(0xff69c8f2);
  var red = const Color(0xffff7272);
  var green = const Color(0xffb0d840);
  var grey = const Color(0xffaaaaaa);

  makeColorNumBall(i) {
    if (i > 0 && i < 11) {
      return yellow;
    } else if (i > 10 && i < 21) {
      return blue;
    } else if (i > 20 && i < 31) {
      return red;
    } else if (i > 30 && i < 41) {
      return grey;
    } else {
      return green;
    }
  }

  List colo = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ];

  onTapButColor(i) {
    setState(() {
      if (buttonSwitch == true) {
        if (colo[i] == Colors.grey) {
          colo[i] = makeColorNumBall(i);
        } else {
          colo[i] = Colors.grey;
        }
      } else {
        colo[i] = Colors.grey;
      }
    });
  }

  compareNum() {
    List newEX = [
      one == '' ? 46 : int.parse(one),
      two == '' ? 46 : int.parse(two),
      three == '' ? 46 : int.parse(three),
      four == '' ? 46 : int.parse(four),
      five == '' ? 46 : int.parse(five),
      six == '' ? 46 : int.parse(six)
    ];
    newEX.sort();

    return Row(
      children: [
        textColorBall(i: newEX[0] == 46 ? '?' : newEX[0]),
        textColorBall(i: newEX[1] == 46 ? '?' : newEX[1]),
        textColorBall(i: newEX[2] == 46 ? '?' : newEX[2]),
        textColorBall(i: newEX[3] == 46 ? '?' : newEX[3]),
        textColorBall(i: newEX[4] == 46 ? '?' : newEX[4]),
        textColorBall(i: newEX[5] == 46 ? '?' : newEX[5]),
      ],
    );
  }

  var greyWhite = [
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc),
    const Color(0xffcccccc)
  ];

  greyWhiteChange(i) {
    setState(() {
      if (buttonSwitch == true) {
        if (greyWhite[i] == const Color(0xffcccccc)) {
          greyWhite[i] = Colors.white;
          return;
        } else {
          greyWhite[i] = const Color(0xffcccccc);
          return;
        }
      } else {
        greyWhite[i] = const Color(0xffcccccc);
      }
    });
  }

  var resultNum = [];

  seeMatchNum() {
    var drwtNo1 = context.read<Mainpage_Store>().lottoData == null
        ? 46
        : (context.read<Mainpage_Store>().lottoData['drwtNo1']);
    var drwtNo2 = context.read<Mainpage_Store>().lottoData == null
        ? 46
        : (context.read<Mainpage_Store>().lottoData['drwtNo2']);
    var drwtNo3 = context.read<Mainpage_Store>().lottoData == null
        ? 46
        : (context.read<Mainpage_Store>().lottoData['drwtNo3']);
    var drwtNo4 = context.read<Mainpage_Store>().lottoData == null
        ? 46
        : (context.read<Mainpage_Store>().lottoData['drwtNo4']);
    var drwtNo5 = context.read<Mainpage_Store>().lottoData == null
        ? 46
        : (context.read<Mainpage_Store>().lottoData['drwtNo5']);
    var drwtNo6 = context.read<Mainpage_Store>().lottoData == null
        ? 46
        : (context.read<Mainpage_Store>().lottoData['drwtNo6']);

    var bnusNo = context.read<Mainpage_Store>().lottoData == null
        ? 46
        : (context.read<Mainpage_Store>().lottoData['bnusNo']);
    var lottoDataNumber = [
      drwtNo1,
      drwtNo2,
      drwtNo3,
      drwtNo4,
      drwtNo5,
      drwtNo6
    ];

    var myClickNumber = [
      int.parse(one),
      int.parse(two),
      int.parse(three),
      int.parse(four),
      int.parse(five),
      int.parse(six)
    ]; //L

    int match = 0;

    resultNum = [];

    for (var lotto in lottoDataNumber) {
      for (var myNum in myClickNumber) {
        if (lotto == myNum) {
          match++;

          resultNum.add(myNum);
        }
      }
    }
    myClickNumber.remove(resultNum);

    if (match == 6) {
      return Column(
        children: [
          Text('축하합니다!!!', style: TextStyle(fontSize: 20.sp)),
          Text('1등, 당첨번호6개 일치', style: TextStyle(fontSize: 20.sp)),
          Text('당첨번호 $resultNum', style: TextStyle(fontSize: 20.sp)),
        ],
      );
    } else if (match == 5 && myClickNumber.contains(bnusNo)) {
      resultNum = myClickNumber;

      return Column(
        children: [
          Text('축하합니다!!', style: TextStyle(fontSize: 20.sp)),
          Text('2등, 당첨번호5개 일치', style: TextStyle(fontSize: 20.sp)),
          Text('당첨번호 $resultNum', style: TextStyle(fontSize: 20.sp)),
        ],
      );
    } else if (match == 5) {
      return Column(
        children: [
          Text('축하합니다!!', style: TextStyle(fontSize: 20.sp)),
          Text(
            '3등, 당첨번호 5개 일치',
            style: TextStyle(fontSize: 20.sp),
          ),
          Text(
            '당첨번호 $resultNum',
            style: TextStyle(fontSize: 20.sp),
          ),
        ],
      );
    } else if (match == 4) {
      return Column(
        children: [
          Text('축하합니다!!', style: TextStyle(fontSize: 20.sp)),
          Text('4등, 당첨번호 4개 일치', style: TextStyle(fontSize: 20.sp)),
          Text('당첨번호 $resultNum, 50,000원', style: TextStyle(fontSize: 20.sp)),
        ],
      );
    } else if (match == 3) {
      return Column(
        children: [
          Text('축하합니다!!', style: TextStyle(fontSize: 20.sp)),
          Text('5등, 당첨번호 3개 일치', style: TextStyle(fontSize: 20.sp)),
          Text('당첨번호 $resultNum, 5,000원', style: TextStyle(fontSize: 20.sp)),
        ],
      );
    } else {
      if (resultNum.isEmpty) {
        return Column(
          children: [
            Text('아쉽네요.. $match개의 당첨번호', style: TextStyle(fontSize: 20.sp)),
            Text('당첨번호가 없어요ㅠㅠ', style: TextStyle(fontSize: 20.sp)),
          ],
        );
      } else {
        return Column(
          children: [
            Text('아쉽네요.. $match개의 당첨번호', style: TextStyle(fontSize: 20.sp)),
            Text('당첨번호 $resultNum가 있습니다!', style: TextStyle(fontSize: 20.sp)),
          ],
        );
      }
    }
  }

  var allMatchList = []; //5위 이상한 회차
  // var allMatchNumver = [];
  var allMatchAllNumber = [];
  var allMatchNumver = [];
  var allMatchRank = [];

  seeAllMatchNum() {
    allMatchNumver.clear();
    allMatchList.clear();
    allMatchRank.clear();
    allMatchAllNumber.clear();
    var myClickNumber = [
      int.parse(one),
      int.parse(two),
      int.parse(three),
      int.parse(four),
      int.parse(five),
      int.parse(six)
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

    // print('모든매치된회차는${allMatchList}');
    // print('모든매치된번호는${allMatchNumver}');
    // print('모든매치된랭킹는${allMatchRank}');
    // print('모든매치된랭킹는${allMatchAllNumber}');
  }

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
          const newlottoNumber(),
          Container(
              padding: EdgeInsets.fromLTRB(0, 15.h, 0, 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 2.0))),
                      padding: EdgeInsets.fromLTRB(0, 0, 10.w, 5.h),
                      child: compareNum()),
                  ElevatedButton(
                      onPressed: () {
                        clearText();
                        claerBallColo();
                        // coloReset();
                        for (int i = 0; i < 46; i++) {
                          setState(() {
                            colo[i] = Colors.grey;
                          });
                        }
                        for (int i = 0; i < 46; i++) {
                          setState(() {
                            greyWhite[i] = const Color(0xffcccccc);
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        minimumSize: Size(20.0.w, 35.0.h),
                      ),
                      child: AutoSizeText('초기화',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Pretendard',
                              fontSize: 20.sp)))
                ],
              )),
          Expanded(
            child: DirectInputBox(
                makeNum: makeNum,
                buttonSwitch: buttonSwitch,
                clearSwitch: clearSwitch,
                colo: colo,
                makeColorNumBall: makeColorNumBall,
                onTapButColor: onTapButColor,
                greyWhite: greyWhite,
                greyWhiteChange: greyWhiteChange),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 70.h),
            // padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    minimumSize: Size(20.0.w, 35.0.h),
                  ),
                  onPressed: () {
                    if (one == '' ||
                        two == '' ||
                        three == '' ||
                        four == '' ||
                        five == '' ||
                        six == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          width: 320,
                          content: Text(
                            softWrap: false,
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
                      seeAllMatchNum();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              insetPadding:
                                  const EdgeInsets.fromLTRB(0, 0.0, 0, 0),
                              contentPadding: EdgeInsets.fromLTRB(
                                  10.0.w, 10.0.h, 10.0.w, 0),
                              // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              //Dialog Main Title
                              title: Column(
                                children: <Widget>[
                                  Text(
                                    "과거당첨결과 확인",
                                    style: TextStyle(
                                        fontSize: 32.sp, fontFamily: 'Pretendard'),
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
                                          allMatchList: allMatchList,
                                          allMatchRank: allMatchRank,
                                          allMatchNumver: allMatchNumver,
                                          allMatchAllNumber: allMatchAllNumber),
                                    ),
                                  )
                                ],
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
                  child: Text('과거당첨보기',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp)),
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      minimumSize: Size(20.0.w, 35.0.h),
                    ),
                    onPressed: () {
                      if (one == '' ||
                          two == '' ||
                          three == '' ||
                          four == '' ||
                          five == '' ||
                          six == '') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            width: 320.w,
                            content: const Text(
                              softWrap: false,
                              '로또번호 6개를 모두 선택해주세요',
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
                                      "${context.watch<Mainpage_Store>().lottoData['drwNo']}회 당첨결과확인",
                                      style: TextStyle(
                                          fontSize: 30.sp,
                                          fontFamily: 'Pretendard'),
                                    ),
                                  ],
                                ),
                                //
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        seeMatchNum(),
                                        resultNumBall(resultNum: resultNum)
                                      ],
                                    )
                                  ],
                                ),
                                actions: <Widget>[
                                  Center(
                                    child: TextButton(
                                      child: Text(
                                        "확인",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 25.sp),
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
                    child: Text('당첨결과확인',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp))),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DirectInputBox extends StatelessWidget {
  DirectInputBox(
      {Key? key,
      this.makeNum,
      this.buttonSwitch,
      this.clearSwitch,
      this.colo,
      this.makeColorNumBall,
      this.onTapButColor,
      this.greyWhite,
      this.greyWhiteChange})
      : super(key: key);
  var makeNum;
  var buttonSwitch;
  var clearSwitch;
  var colo;
  var makeColorNumBall;
  var onTapButColor;
  var greyWhite;
  var greyWhiteChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                noColorBall(
                    BallNum: 1,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 2,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 3,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 4,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 5,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 6,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 7,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                noColorBall(
                    BallNum: 8,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 9,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 10,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 11,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 12,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 13,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 14,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                noColorBall(
                    BallNum: 15,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 16,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 17,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 18,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 19,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 20,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 21,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                noColorBall(
                    BallNum: 22,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 23,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 24,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 25,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 26,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 27,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 28,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                noColorBall(
                    BallNum: 29,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 30,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 31,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 32,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 33,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 34,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 35,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                noColorBall(
                    BallNum: 36,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 37,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 38,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 39,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 40,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 41,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 42,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                noColorBall(
                    BallNum: 43,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 44,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                noColorBall(
                    BallNum: 45,
                    makeNum: makeNum,
                    buttonSwitch: buttonSwitch,
                    clearSwitch: clearSwitch,
                    colo: colo,
                    makeColorNumBall: makeColorNumBall,
                    onTapButColor: onTapButColor,
                    greyWhite: greyWhite,
                    greyWhiteChange: greyWhiteChange),
                const xColorBall(),
                const xColorBall(),
                const xColorBall(),
                const xColorBall(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class noColorBall extends StatefulWidget {
  noColorBall(
      {Key? key,
      this.BallNum,
      this.makeNum,
      this.buttonSwitch,
      this.clearSwitch,
      this.colo,
      this.makeColorNumBall,
      this.onTapButColor,
      this.greyWhite,
      this.greyWhiteChange})
      : super(key: key);
  var BallNum;
  var makeNum;
  var buttonSwitch;
  var clearSwitch;
  var colo;
  var makeColorNumBall;
  var onTapButColor;
  var greyWhite;
  var greyWhiteChange;

  @override
  State<noColorBall> createState() => _noColorBallState();
}

class _noColorBallState extends State<noColorBall> {
  realcolo() {
    if (widget.colo[widget.BallNum] == Colors.grey) {
      return Colors.white;
    } else {
      return widget.colo[widget.BallNum];
    }
  }

  greyWhiteColor() {
    if (widget.greyWhite[widget.BallNum] == const Color(0xffcccccc)) {
      return const Color(0xffcccccc);
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // ElevatedButton(
      // style: ElevatedButton.styleFrom(
      //     primary: Color(0xffe5e5e5).withOpacity(1),
      //     minimumSize: Size(30.w,30.h),
      //     maximumSize: Size(30.w,30.h,),
      //     padding:EdgeInsets.zero,
      //   shape: new RoundedRectangleBorder(
      //     borderRadius: new BorderRadius.circular(30.0),
      //   ),
      //     elevation: 5.0
      // ),
      // onPressed: () {

      onTap: () {
        widget.onTapButColor(widget.BallNum);
        widget.greyWhiteChange(widget.BallNum);
        widget.makeNum(widget.BallNum);
      },
      child: Container(
          margin: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
          alignment: Alignment.center,
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: (widget.clearSwitch == true) ? Colors.white : realcolo(),
              //클릭이된것만 색갈이 바뀐다..
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                )
              ]),
          child: Text(
            '${widget.BallNum}',
            style: TextStyle(
              color: (widget.clearSwitch == true)
                  ? const Color(0xffcccccc)
                  : greyWhiteColor(),
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}

class xColorBall extends StatefulWidget {
  const xColorBall({Key? key}) : super(key: key);

  @override
  State<xColorBall> createState() => _xColorBallState();
}

class _xColorBallState extends State<xColorBall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40.w,
      height: 40.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      child: Text(
        '',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class textColorBall extends StatefulWidget {
  textColorBall({Key? key, this.i}) : super(key: key);
  var i;

  @override
  State<textColorBall> createState() => _textColorBallState();
}

class _textColorBallState extends State<textColorBall> {
  var yellow = const Color(0xfffbc400);
  var blue = const Color(0xff69c8f2);
  var red = const Color(0xffff7272);
  var green = const Color(0xffb0d840);
  var grey = const Color(0xffaaaaaa);

  makeColorNumBall(i) {
    if (i.runtimeType == String) {
      return const Color(0xffcccccc);
    } else {
      if (i > 0 && i < 11) {
        return yellow;
      } else if (i > 10 && i < 21) {
        return blue;
      } else if (i > 20 && i < 31) {
        return red;
      } else if (i > 30 && i < 41) {
        return grey;
      } else if (i > 40 && i < 46) {
        return green;
      } else {
        return Colors.grey;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 2, 0),
        // padding: EdgeInsets.fromLTRB(0,0,0,0),
        alignment: Alignment.center,
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: makeColorNumBall(widget.i),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Text(
          '${widget.i}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            shadows: const [
              Shadow(
                blurRadius: 2.0,
                color: Colors.black,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
        ));
  }
}

class newlottoNumber extends StatefulWidget {
  const newlottoNumber({Key? key}) : super(key: key);

  @override
  _newlottoNumberState createState() => _newlottoNumberState();
}

class _newlottoNumberState extends State<newlottoNumber> {
  getToday() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));
    DateTime now = tz.TZDateTime.now(tz.local); // print('now는${now}');
    DateTime dateTime1 = DateTime(now.year, now.month, now.day);
    DateTime dateTime2 = DateTime(
        (DateTime.parse(
                context.watch<Mainpage_Store>().lottoData['drwNoDate'] ?? '2022-10-24'))
            .year,
        (DateTime.parse(
                context.watch<Mainpage_Store>().lottoData['drwNoDate'] ?? '2022-10-24'))
            .month,
        (DateTime.parse(
                context.watch<Mainpage_Store>().lottoData['drwNoDate'] ?? '2022-10-24'))
            .day);
    Duration duration = dateTime2.difference(dateTime1);
    return duration.inDays;
  }

  getBall(b) {
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

  var output;

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffe5e5e5), width: 10.w),
          color: const Color(0xfff8f8f8),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      padding: EdgeInsets.fromLTRB(5.w, 15.h, 5.w, 10.h),
      child: Column(
        children: [
          // Text('${getToday()}', ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                    child: context.watch<Mainpage_Store>().lottoData['drwNoDate'] ==
                        null
                        ? (context
                        .watch<naverSearch_FirstNum_Store>()
                        .naverSearch_FirstNum
                        .isEmpty
                        ? const CircularProgressIndicator()
                        : Text(
                      '${context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[10]}',
                      style: TextStyle(
                          color: const Color(0xff767676),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ))
                        : AutoSizeText(
                      textAlign: TextAlign.center,
                      DateFormat('yyyy.MM.dd').format(DateTime.parse(
                          context
                              .watch<Mainpage_Store>()
                              .lottoData['drwNoDate'])),
                      style: TextStyle(
                          color: const Color(0xff767676),
                          fontSize: 20.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10.h),
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
                        onPressed:
                        context.watch<Mainpage_Store>().lottoData['drwtNo6'] ==
                            null
                            ? (){}
                            : () {
                          context.read<Mainpage_Store>().changeRoundMinus();
                        },
                        width: 50.0.sp,
                        height: 50.0.sp,
                      ),
                      context.watch<Mainpage_Store>().lottoData['drwNo'] == null
                          ? (context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum
                          .isEmpty
                          ? const CircularProgressIndicator()
                          : AutoSizeText(
                          '${context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[9]}',
                          style: TextStyle(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xffd43301),
                          )))
                          : AutoSizeText(
                          '${context.watch<Mainpage_Store>().lottoData['drwNo']}회',
                          style: TextStyle(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w900   ,
                            fontFamily: 'Pretendard',
                            color: const Color(0xffd43301),
                          )),
                      AnimatedButton(
                        child: AutoSizeText(
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
                            (getToday()! <= 0 && getToday()! > -7)) ||
                            context
                                .watch<Mainpage_Store>()
                                .lottoData['drwtNo6'] ==
                                null
                            ? (){}
                            : () {
                          context.read<Mainpage_Store>().changeRoundPlus();
                        },
                        width: 50.0.sp,
                        height: 50.0.sp,
                      ),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       context.read<Mainpage_Store>().changeRoundMinus();
                      //     },
                      //     style: TextButton.styleFrom(
                      //       backgroundColor: Colors.red,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius:
                      //             const BorderRadius.all(Radius.circular(8)),
                      //       ),
                      //       minimumSize: Size(20.0.w, 35.0.h),
                      //     ),
                      //     child: Text(
                      //       '<',
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontFamily: 'Pretendard',
                      //           fontWeight: FontWeight.w900,
                      //           fontSize: 20.sp),
                      //     )),
                      // (context.watch<Mainpage_Store>().lottoData['drwNo'] == null
                      //     ? const CircularProgressIndicator()
                      //     : Text(
                      //         '${context.watch<Mainpage_Store>().lottoData['drwNo']}회',
                      //         style: TextStyle(
                      //           fontSize: 35.sp,
                      //           fontWeight: FontWeight.w900,
                      //           color: const Color(0xffd43301),
                      //         ))),
                      // ElevatedButton(
                      //     onPressed:
                      //     (getToday() == null ||
                      //             (getToday()! <= 0 && getToday()! > -7))
                      //         ? null
                      //         : () {
                      //             context.read<Mainpage_Store>().changeRoundPlus();
                      //           },
                      //     // onPressed: (getToday() == null ||(getToday()! <= 0 && getToday()! > -7)) ||context.watch<Mainpage_Store>().lottoData['drwtNo6'] ==null? null
                      //     //     : () {context.read<Mainpage_Store>().changeRoundPlus();},
                      //     style: TextButton.styleFrom(
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius:
                      //             const BorderRadius.all(Radius.circular(8)),
                      //       ),
                      //       minimumSize: Size(20.0.w, 35.0.h),
                      //       backgroundColor: Colors.blue,
                      //     ),
                      //     child: Text(
                      //       '>',
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontFamily: 'Pretendard',
                      //           fontWeight: FontWeight.w900,
                      //           fontSize: 20.sp),
                      //     )),
                    ],
                  ),
                ),
                Container(
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
                      // context.watch<Mainpage_Store>().lottoData['drwtNo1'] == null
                      //     ? SizedBox(
                      //         width: 10.w,
                      //         height: 10.h,
                      //         child: const CircularProgressIndicator())
                      //     : getBall(
                      //         context.watch<Mainpage_Store>().lottoData['drwtNo1']),
                      context.watch<Mainpage_Store>().lottoData['drwtNo1'] == null
                          ? (context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum
                          .isEmpty
                          ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                          : getBall(context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum[0]))
                          : getBall(
                          context.watch<Mainpage_Store>().lottoData['drwtNo1']),
                      context.watch<Mainpage_Store>().lottoData['drwtNo2'] == null
                          ? (context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum
                          .isEmpty
                          ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                          : getBall(context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum[1]))
                          : getBall(
                          context.watch<Mainpage_Store>().lottoData['drwtNo2']),
                      context.watch<Mainpage_Store>().lottoData['drwtNo3'] == null
                          ? (context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum
                          .isEmpty
                          ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                          : getBall(context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum[2]))
                          : getBall(
                          context.watch<Mainpage_Store>().lottoData['drwtNo3']),
                      context.watch<Mainpage_Store>().lottoData['drwtNo4'] == null
                          ? (context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum
                          .isEmpty
                          ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                          : getBall(context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum[3]))
                          : getBall(
                          context.watch<Mainpage_Store>().lottoData['drwtNo4']),
                      context.watch<Mainpage_Store>().lottoData['drwtNo5'] == null
                          ? (context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum
                          .isEmpty
                          ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                          : getBall(context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum[4]))
                          : getBall(
                          context.watch<Mainpage_Store>().lottoData['drwtNo5']),
                      context.watch<Mainpage_Store>().lottoData['drwtNo6'] == null
                          ? (context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum
                          .isEmpty
                          ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                          : getBall(context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum[5]))
                          : getBall(
                          context.watch<Mainpage_Store>().lottoData['drwtNo6']),
                      const Icon(Icons.add),
                      context.watch<Mainpage_Store>().lottoData['bnusNo'] == null
                          ? (context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum
                          .isEmpty
                          ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                          : getBall(context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum[6]))
                          : getBall(
                          context.watch<Mainpage_Store>().lottoData['bnusNo']),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class resultNumBall extends StatefulWidget {
  resultNumBall({Key? key, this.resultNum}) : super(key: key);
  var resultNum;

  @override
  _resultNumBallState createState() => _resultNumBallState();
}

class _resultNumBallState extends State<resultNumBall> {
  getBall(b) {
    if (widget.resultNum.contains(b)) {
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
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10.h, 0, 5.h),
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
              : getBall(context.watch<Mainpage_Store>().lottoData['drwtNo1']),
          context.watch<Mainpage_Store>().lottoData['drwtNo2'] == null
              ? SizedBox(
                  width: 10.w,
                  height: 10.h,
                  child: const CircularProgressIndicator())
              : getBall(context.watch<Mainpage_Store>().lottoData['drwtNo2']),
          context.watch<Mainpage_Store>().lottoData['drwtNo3'] == null
              ? SizedBox(
                  width: 10.w,
                  height: 10.h,
                  child: const CircularProgressIndicator())
              : getBall(context.watch<Mainpage_Store>().lottoData['drwtNo3']),
          context.watch<Mainpage_Store>().lottoData['drwtNo4'] == null
              ? SizedBox(
                  width: 10.w,
                  height: 10.h,
                  child: const CircularProgressIndicator())
              : getBall(context.watch<Mainpage_Store>().lottoData['drwtNo4']),
          context.watch<Mainpage_Store>().lottoData['drwtNo5'] == null
              ? SizedBox(
                  width: 10.w,
                  height: 10.h,
                  child: const CircularProgressIndicator())
              : getBall(context.watch<Mainpage_Store>().lottoData['drwtNo5']),
          context.watch<Mainpage_Store>().lottoData['drwtNo6'] == null
              ? SizedBox(
                  width: 10.w,
                  height: 10.h,
                  child: const CircularProgressIndicator())
              : getBall(context.watch<Mainpage_Store>().lottoData['drwtNo6']),
          const Icon(Icons.add),
          context.watch<Mainpage_Store>().lottoData['bnusNo'] == null
              ? SizedBox(
                  width: 10.w,
                  height: 10.h,
                  child: const CircularProgressIndicator())
              : getBall(context.watch<Mainpage_Store>().lottoData['bnusNo']),
        ],
      ),
    );
  }
}

class resultAllNumBall extends StatefulWidget {
  resultAllNumBall(
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
  _resultAllNumBallState createState() => _resultAllNumBallState();
}

class _resultAllNumBallState extends State<resultAllNumBall> {
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
              // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
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
                    padding: EdgeInsets.fromLTRB(5.w, 0, 10.h, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            // decoration: BoxDecoration(border:Border.all(color: Colors.black)),
                            child: Text('${widget.allMatchList[i]}회',
                                style: TextStyle(
                                    fontSize: 27.sp,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.red))),
                        Container(
                            // decoration: BoxDecoration(border:Border.all(color: Colors.black)),
                            height: 25.h,
                            alignment: Alignment.center,
                            child: Text('  ${widget.allMatchRank[i]}',
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

//   return Text('a');
          }),
    );
  }
}
