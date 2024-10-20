import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lotto/pages/notification.dart';
import 'package:lotto/pages/sharedpreferences.dart';
import 'package:lotto/provider/allpages_Provider.dart';
import 'package:lotto/provider/naverSearch_Provider.dart';
import 'package:lotto/widget/mainWidgets.dart';
import 'package:provider/provider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class button5Page extends StatefulWidget {
  const button5Page({Key? key}) : super(key: key);

  @override
  State<button5Page> createState() => _button5PageState();
}

class _button5PageState extends State<button5Page> {

  var number5 = [0, 0, 0, 0, 0, 0];
  var number1 = [0, 0, 0, 0, 0, 0];
  var number2 = [0, 0, 0, 0, 0, 0];
  var number3 = [0, 0, 0, 0, 0, 0];
  var number4 = [0, 0, 0, 0, 0, 0];


  onPressBuy() {
    for (int i = 1; i < 3000; i = i + 100) {
      Timer(Duration(milliseconds: i), () {
        if (!mounted) return;
        setState(() {
          number1 = (List<int>.generate(45, (i) => i + 1)
            ..shuffle()).sublist(0, 6);
          number1.sort();
          number2 = (List<int>.generate(45, (i) => i + 1)
            ..shuffle()).sublist(0, 6);
          number2.sort();
          number3 = (List<int>.generate(45, (i) => i + 1)
            ..shuffle()).sublist(0, 6);
          number3.sort();
          number4 = (List<int>.generate(45, (i) => i + 1)
            ..shuffle()).sublist(0, 6);
          number4.sort();
          number5 = (List<int>.generate(45, (i) => i + 1)
            ..shuffle()).sublist(0, 6);
          number5.sort();
        });
      });
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
        child: Column(

            children: [
              randomNumBall(
                number5: number5,
                onPressBuy: onPressBuy,
                number1: number1,
                number2: number2,
                number3: number3,
                number4: number4,),
              Expanded(child: randomNumBallList(number1: number1,
                  number2: number2,
                  number3: number3,
                  number4: number4,
                  number5: number5)),


            ]
        ),
      ),
    );
  }
}


class randomNumBall extends StatefulWidget {
  randomNumBall  (  {  Key  ?  key  ,  this.number5,this.number1,this.number2,this.number3,this.number4,this.onPressBuy}) :super(key: key);

var number1;
var number2;
var number3;
var number4;
var number5;

var onPressBuy;

@override
_randomNumBallState createState() => _randomNumBallState();}

class _randomNumBallState extends State<randomNumBall> {
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
    return Column(
        children: [
          Container(
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
            padding: EdgeInsets.fromLTRB(5.w, 10.w, 5.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child:

                    (context
                        .watch<Mainpage_Store>()
                        .lottoData['drwNoDate'] == null
                        ? (context
                        .watch<naverSearch_FirstNum_Store>()
                        .naverSearch_FirstNum
                        .isEmpty
                        ? const CircularProgressIndicator()
                        : Text(
                      DateFormat('yyyy.MM.dd').format(DateTime.parse(context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum[10].replaceAll('.', '-')).add(
                          const Duration(days: 7))),
                      style: TextStyle(
                          color: const Color(0xff767676),
                          fontSize: 20.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold),
                    ))
                        : Text(
                      DateFormat('yyyy.MM.dd').format(DateTime.parse(context
                          .watch<Mainpage_Store>()
                          .button5RoundInfo['drwNoDate']).add(
                          const Duration(days: 7))),
                      style: TextStyle(
                          color: const Color(0xff767676),
                          fontSize: 20.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold),
                    ))),
                // ,style: TextStyle(color: Color(0xff767676),fontSize: 20,fontWeight: FontWeight.bold),)),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      (context
                          .watch<Mainpage_Store>()
                          .button5RoundInfo['drwNo'] == null
                          ? (context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum
                          .isEmpty
                          ? const CircularProgressIndicator()
                          : Text(
                          '${context
                              .watch<naverSearch_FirstNum_Store>()
                              .naverSearch_FirstNum[11] + 1}회 예상번호',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Pretendard',
                            color: const Color(0xffd43301),
                          )))
                          : Text(
                          '${context
                              .watch<Mainpage_Store>()
                              .button5RoundInfo['drwNo'] + 1}회 예상번호',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Pretendard',
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


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [


             ElevatedButton(onPressed: () {
                            widget.onPressBuy();
                          },
                            style:TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                ),
                                minimumSize: Size(20.0.w, 35.0.h),
                                padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 3.h)
                            ),
                            child: Text('당첨번호구매하기', style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Pretendard',
                              fontSize: 25.sp, fontWeight: FontWeight.bold,)),
                          ),


                     ElevatedButton(
                            onPressed: () {
                              showNotification3(context);
                              // print(widget.number1);
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
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                ),
                                minimumSize: Size(20.0.w, 35.0.h),
                                padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 3.h)
                            ),
                            child: Text('번호저장', style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Pretendard',
                              fontSize: 25.sp, fontWeight: FontWeight.bold,)),

                    ),
                  ],
                )


              ],
            ),
          )
        ]);
  }
}

class randomNumBallList extends StatefulWidget {
  randomNumBallList(
      {Key? key, this.number1, this.number2, this.number3, this.number4, this.number5})
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
      margin: EdgeInsets.fromLTRB(0, 5.h, 0, 60.h),
      width: double.infinity,
      // height: 505.h,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffe5e5e5), width: 10.w),
          color: const Color(0xfff8f8f8),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10.w, 10.h, 0, 0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lotto 6/45', style: TextStyle(
                    fontSize: 15.sp, fontWeight: FontWeight.w900),),
                Text('발행일: ${DateFormat('yyyy/MM/dd H시 m분 s초').format(
                    getToday())}'),
                context
                    .watch<Mainpage_Store>()
                    .button5RoundInfo['drwNoDate'] == null ?
                (context
                    .watch<naverSearch_FirstNum_Store>()
                    .naverSearch_FirstNum[10] == null
                    ? const CircularProgressIndicator()
                    :
                Text('추첨일: ${DateFormat('yyyy/MM/dd').format(
                    DateTime.parse(context
                        .watch<naverSearch_FirstNum_Store>()
                        .naverSearch_FirstNum[10].replaceAll('.', '-')).add(
                        const Duration(days: 7)))}')
                ) : Text('추첨일: ${DateFormat('yyyy/MM/dd').format(
                    DateTime.parse(context
                        .watch<Mainpage_Store>()
                        .button5RoundInfo['drwNoDate']).add(
                        const Duration(days: 7)))}'),


                context
                    .watch<Mainpage_Store>()
                    .button5RoundInfo['drwNoDate'] == null ?
                (context
                    .watch<naverSearch_FirstNum_Store>()
                    .naverSearch_FirstNum[10] == null
                    ? const CircularProgressIndicator()
                    :
                Text('추첨일: ${DateFormat('yyyy/MM/dd').format(
                    DateTime.parse(context
                        .watch<naverSearch_FirstNum_Store>()
                        .naverSearch_FirstNum[10].replaceAll('.', '-')).add(
                        const Duration(days: 372)))}')
                ) : Text('지급기한: ${DateFormat('yyyy/MM/dd').format(
                    DateTime.parse(context
                        .watch<Mainpage_Store>()
                        .button5RoundInfo['drwNoDate']).add(
                        const Duration(days: 372)))}'),
              ],
            ),
          ),


          Expanded(
            child: Column(
              children: [
                Expanded(child: eachRandomBall(
                    abcde: abcde[0], number: widget.number1)),

                Expanded(child: eachRandomBall(
                    abcde: abcde[1], number: widget.number2)),

                Expanded(child: eachRandomBall(
                    abcde: abcde[2], number: widget.number3)),

                Expanded(child: eachRandomBall(
                    abcde: abcde[3], number: widget.number4)),

                Expanded(child: eachRandomBall(
                    abcde: abcde[4], number: widget.number5))

              ],
            ),
          ),


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
              Text('${widget.abcde}  자동',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900),)
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
