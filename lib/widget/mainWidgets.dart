import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lottie/lottie.dart';
import 'package:lotto/pages/button10Page.dart';
import 'package:lotto/pages/button11Page.dart';
import 'package:lotto/pages/button12Page.dart';
import 'package:lotto/pages/button1Page.dart';
import 'package:lotto/pages/button5Page.dart';
import 'package:lotto/pages/button3Page.dart';
import 'package:lotto/pages/button4Page.dart';
import 'package:lotto/pages/button2Page.dart';
import 'package:lotto/pages/button6Page.dart';
import 'package:lotto/pages/button7Page.dart';
import 'package:lotto/pages/button8Page.dart';
import 'package:lotto/pages/button9Page.dart';
import 'package:lotto/pages/lottoNumber.dart';
import 'package:lotto/pages/notification.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:lotto/provider/allpages_Provider.dart';
import 'package:lotto/provider/naverSearch_Provider.dart';

import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class xNumBall extends StatelessWidget {
  xNumBall({Key? key, this.b}) : super(key: key);
  var b;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 0,
                blurRadius: 5,
                offset: const Offset(0, 4),
              )
            ]),
        child: Text(
          'X',
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

class yellowBall extends StatelessWidget {
  yellowBall({Key? key, this.b}) : super(key: key);
  var b;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 40.sp,
        height: 40.sp,
        decoration: BoxDecoration(
          color: const Color(0xfffbc400),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.4),
          //     spreadRadius: 0,
          //     blurRadius: 20,
          //     offset: const Offset(0, 4),
          //   )
          // ]
          boxShadow: [
            BoxShadow(
              color: Colors.yellow.shade600,
              spreadRadius: 0.1,
              blurRadius: 3,
              offset: const Offset(0.1, 0.1),
            ),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-0.1, -0.1),
                blurRadius: 3,
                spreadRadius: 0.1),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.yellow.shade200,
              Colors.yellow.shade300,
              Colors.yellow.shade400,
              Colors.yellow.shade500,
            ],
          ),
        ),
        child: AutoSizeText(
          '$b',
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

class blueBall extends StatelessWidget {
  blueBall({Key? key, this.b}) : super(key: key);
  var b;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 40.sp,
        height: 40.sp,
        decoration: BoxDecoration(
          color: const Color(0xff69c8f2),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.4),
          //     spreadRadius: 0,
          //     blurRadius: 20,
          //     offset: const Offset(0, 4),
          //   )
          // ]
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade600,
              spreadRadius: 0.1,
              blurRadius: 3,
              offset: const Offset(0.1, 0.1),
            ),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-0.1, -0.1),
                blurRadius: 3,
                spreadRadius: 0.1),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade200,
              Colors.blue.shade300,
              Colors.blue.shade400,
              Colors.blue.shade500,
            ],
          ),
        ),
        child: AutoSizeText(
          '$b',
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

class redBall extends StatelessWidget {
  redBall({Key? key, this.b}) : super(key: key);
  var b;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 40.sp,
        height: 40.sp,
        decoration: BoxDecoration(
          color: const Color(0xffff7272),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.4),
          //     spreadRadius: 0,
          //     blurRadius: 20,
          //     offset: const Offset(0, 4),
          //   )
          // ]
          boxShadow: [
            BoxShadow(
              color: Colors.red.shade600,
              spreadRadius: 0.1,
              blurRadius: 3,
              offset: const Offset(0.1, 0.1),
            ),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-0.1, -0.1),
                blurRadius: 3,
                spreadRadius: 0.1),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.red.shade200,
              Colors.red.shade300,
              Colors.red.shade400,
              Colors.red.shade500,
            ],
          ),
        ),
        child: AutoSizeText(
          '$b',
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

class greenBall extends StatelessWidget {
  greenBall({Key? key, this.b}) : super(key: key);
  var b;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 40.sp,
        height: 40.sp,
        decoration: BoxDecoration(
          color: const Color(0xffb0d840),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.4),
          //     spreadRadius: 0,
          //     blurRadius: 20,
          //     offset: const Offset(0, 4),
          //   )
          // ]
          boxShadow: [
            BoxShadow(
              color: Colors.green.shade600,
              spreadRadius: 0.1,
              blurRadius: 3,
              offset: const Offset(0.1, 0.1),
            ),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-0.1, -0.1),
                blurRadius: 3,
                spreadRadius: 0.1),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.shade200,
              Colors.green.shade300,
              Colors.green.shade400,
              Colors.green.shade500,
            ],
          ),
        ),
        child: AutoSizeText(
          '$b',
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

class greyBall extends StatelessWidget {
  greyBall({Key? key, this.b}) : super(key: key);
  var b;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 40.sp,
        height: 40.sp,
        decoration: BoxDecoration(
          color: const Color(0xffaaaaaa),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.4),
          //     spreadRadius: 0,
          //     blurRadius: 20,
          //     offset: const Offset(0, 4),
          //   )
          // ]
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 0.1,
              blurRadius: 3,
              offset: const Offset(0.1, 0.1),
            ),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-0.1, -0.1),
                blurRadius: 3,
                spreadRadius: 0.1),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey.shade200,
              Colors.grey.shade300,
              Colors.grey.shade400,
              Colors.grey.shade500,
            ],
          ),
        ),
        child: AutoSizeText(
          '$b',
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

class TextBall extends StatelessWidget {
  TextBall({Key? key, this.b}) : super(key: key);
  var b;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: const Color(0xffcccccc),
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
        child: AutoSizeText(
          '?',
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

class button1 extends StatefulWidget {
  const button1({Key? key}) : super(key: key);

  @override
  _button1State createState() => _button1State();
}

class _button1State extends State<button1> {
  var clickState = false;

  makeButton1FullLottoTotalNumberStart() {
    if (context.read<Mainpage_Store>().totalLottoData.length >=
        makeRealRound() - lottoTotalNumber.length) {
      makeButton1FullLottoTotalNumber();
      Navigator.push(context, MaterialPageRoute(builder: (c) {
        return const button1Page();
      }));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //Dialog Main Title
              title: const Column(
                children: <Widget>[
                  Text("로딩중입니다.."),
                ],
              ),
              //

              content: SizedBox(
                  width: 200.w,
                  height: 100.h,
                  child: FittedBox(
                      fit: BoxFit.none,
                      child: Lottie.asset('assets/lottie/bounce.json',
                          width: 200.w))),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    "확인",
                    style: TextStyle(color: Colors.blue, fontSize: 20.sp),
                  ),
                  onPressed: () {
                    if (context.read<Mainpage_Store>().totalLottoData.length >=
                        makeRealRound() - lottoTotalNumber.length) {
                      makeButton1FullLottoTotalNumber();

                      //
                      // Navigator.push(context, MaterialPageRoute(builder: (c) {
                      //   return button7Page();
                      // }));

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const button1Page();
                        }),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            );
          });
    }
  }

  addTotalDataToLottoNumber() {
    var fixStartDate = tz.TZDateTime(tz.local, 2002, 12, 07);

    for (int i = lottoTotalNumber.length - 1; i >= 0; i--) {
      var addDate = fixStartDate.add(Duration(days: 7 * (i)));
      var startDate = int.parse(intl.DateFormat('yyyyMMdd').format(addDate));
      lottoTotalNumber[lottoTotalNumber.length - 1 - i].add(startDate);
    }

    // print(lottoTotalNumber);
  }

  makeButton1FullLottoTotalNumber() {
    // print(makeRound());
    // print(lottoTotalNumber.length);
    if (lottoTotalNumber.length != makeRealRound()) {
      // for (int i = 0; i < makeRound() - 1 - lottoTotalNumber.length; i++) {
      for (int i = makeRealRound() - lottoTotalNumber.length - 1; i >= 0; i--) {
        List<int> emptyList = [];
        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwNo']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo1']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo2']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo3']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo4']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo5']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo6']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['bnusNo']);

        print(emptyList);

        lottoTotalNumber.insert(0, emptyList);
        // emptyList.clear();
      }
      print(lottoTotalNumber);
    }

    if (lottoTotalNumber[0].length == 8) {
      addTotalDataToLottoNumber();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            if (context.read<Mainpage_Store>().lottoData['drwtNo6'] == null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  width: 320.w,
                  content: Text(
                    '서버점검시간',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                  backgroundColor: Colors.red,
                  duration: const Duration(milliseconds: 1000),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )));
            } else {
              // Navigator.of(context)..pop()..pop();
              //
              // Navigator.push(context, MaterialPageRoute(builder: (c) {
              //   return button1Page();
              // }));
              makeButton1FullLottoTotalNumberStart();
            }
          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed) ||
                  states.contains(WidgetState.hovered)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed) ||
                  states.contains(WidgetState.hovered) ||
                  states.contains(WidgetState.selected)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed) ||
                  states.contains(WidgetState.hovered) ||
                  states.contains(WidgetState.selected)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    '당첨번호보기',
                    softWrap: true,
                    // softWrap: false,
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      // fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                      width: double.infinity,
                      height: 96.h,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/number1.json',
                              fit: BoxFit.fill))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class button5 extends StatefulWidget {
  const button5({Key? key}) : super(key: key);

  @override
  _button5State createState() => _button5State();
}

class _button5State extends State<button5> {
  var clickState = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return const button5Page();
            }));
          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '로또번호생성',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      width: double.infinity,
                      height: 96.h,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/button2.json',
                              fit: BoxFit.fill))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class button3 extends StatefulWidget {
  const button3({Key? key}) : super(key: key);

  @override
  _button3State createState() => _button3State();
}

class _button3State extends State<button3> {
  var clickState = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            if (context.read<Mainpage_Store>().lottoData['drwtNo6'] == null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  width: 320.w,
                  content: Text(
                    '서버점검시간',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                  backgroundColor: Colors.red,
                  duration: const Duration(milliseconds: 1000),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )));
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return const button3Page();
              }));
            }
          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),

            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '당첨지역보기',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: double.infinity,
                      height: 96.h,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/jido.json',
                              fit: BoxFit.fill))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class button4 extends StatefulWidget {
  const button4({Key? key}) : super(key: key);

  @override
  _button4State createState() => _button4State();
}

class _button4State extends State<button4> {
  final Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return const button4Page();
            }));
          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '로또번호뽑기',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      // padding: EdgeInsets.fromLTRB(0, 0, 0, 5.h),
                      height: 96.h,
                      width: double.infinity,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),

                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/button4tong.json',
                              fit: BoxFit.fill))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class button2 extends StatefulWidget {
  const button2({Key? key}) : super(key: key);

  @override
  _button2State createState() => _button2State();
}

class _button2State extends State<button2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return const button2Page();
            }));
          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '로또당첨후기',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                      // padding: EdgeInsets.fromLTRB(0,5,0,0),
                      height: 96.h,
                      width: double.infinity,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/board.json',
                              fit: BoxFit.fill
                              // height: 96.h
                              ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class button6 extends StatefulWidget {
  const button6({Key? key}) : super(key: key);

  @override
  _button6State createState() => _button6State();
}

class _button6State extends State<button6> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return const button6Page();
            }));
          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '꿈풀이분석기',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                      // padding: EdgeInsets.fromLTRB(0,5,0,0),
                      height: 96.h,
                      width: double.infinity,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/button6.json',
                              fit: BoxFit.fill))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class button7 extends StatefulWidget {
  const button7({Key? key}) : super(key: key);

  @override
  _button7State createState() => _button7State();
}

class _button7State extends State<button7> {
  makeFullLottoTotalNumberStart() {
    if (context.read<Mainpage_Store>().totalLottoData.length >=
        makeRealRound() - lottoTotalNumber.length) {
      makeFullLottoTotalNumber();
      Navigator.push(context, MaterialPageRoute(builder: (c) {
        return const button7Page();
      }));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //Dialog Main Title
              title: const Column(
                children: <Widget>[
                  Text("로딩중입니다.."),
                ],
              ),
              //

              content: SizedBox(
                  width: 200.w,
                  height: 100.h,
                  child: FittedBox(
                      fit: BoxFit.none,
                      child: Lottie.asset('assets/lottie/bounce.json',
                          width: 200.w))),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    "확인",
                    style: TextStyle(color: Colors.blue, fontSize: 20.sp),
                  ),
                  onPressed: () {
                    if (context.read<Mainpage_Store>().totalLottoData.length >=
                        makeRealRound() - lottoTotalNumber.length) {
                      makeFullLottoTotalNumber();
                      //
                      // Navigator.push(context, MaterialPageRoute(builder: (c) {
                      //   return button7Page();
                      // }));

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const button7Page();
                        }),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            );
          });
    }
  }

  makeFullLottoTotalNumber() {
    print(makeRealRound());
    print(lottoTotalNumber.length);
    if (lottoTotalNumber.length != makeRealRound()) {
      // for (int i = 0; i < makeRound() - 1 - lottoTotalNumber.length; i++) {
      for (int i = makeRealRound() - lottoTotalNumber.length - 1; i >= 0; i--) {
        print(i);
        List<int> emptyList = [];
        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwNo']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo1']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo2']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo3']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo4']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo5']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo6']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['bnusNo']);

        print(emptyList);

        lottoTotalNumber.insert(0, emptyList);
        // emptyList.clear();
      }
      print(lottoTotalNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            if (context.read<Mainpage_Store>().lottoData['drwtNo6'] == null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  width: 320.w,
                  content: Text(
                    '서버점검시간',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                  backgroundColor: Colors.red,
                  duration: const Duration(milliseconds: 1000),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )));
            } else {
              // Navigator.of(context)..pop()..pop();
              makeFullLottoTotalNumberStart();
            }
          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '로또회귀분석',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      // padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                      height: 96.h,
                      width: double.infinity,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/button7.json',
                              fit: BoxFit.fill))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class button8 extends StatefulWidget {
  const button8({Key? key}) : super(key: key);

  @override
  _button8State createState() => _button8State();
}

class _button8State extends State<button8> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            if (context.read<Mainpage_Store>().lottoData['drwtNo6'] == null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  width: 320.w,
                  content: Text(
                    '서버점검시간',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                  backgroundColor: Colors.red,
                  duration: const Duration(milliseconds: 1000),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )));
            } else {
              // Navigator.of(context)..pop()..pop();

              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return const button8Page();
              }));
            }
          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '출현/미출현수',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      // padding:  EdgeInsets.fromLTRB(0, 50.h, 0, 50.h),
                      height: 96.h,
                      width: double.infinity,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/button8.json',
                              fit: BoxFit.fill))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class button9 extends StatefulWidget {
  const button9({Key? key}) : super(key: key);

  @override
  _button9State createState() => _button9State();
}

class _button9State extends State<button9> {
  makeFullLottoTotalNumberStart() {
    if (context.read<Mainpage_Store>().totalLottoData.length >=
        makeRealRound() - lottoTotalNumber.length) {
      makeFullLottoTotalNumber();
      Navigator.push(context, MaterialPageRoute(builder: (c) {
        return const button9Page();
      }));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //Dialog Main Title
              title: const Column(
                children: <Widget>[
                  Text("로딩중입니다.."),
                ],
              ),
              //

              content: SizedBox(
                  width: 200.w,
                  height: 100.h,
                  child: FittedBox(
                      fit: BoxFit.none,
                      child: Lottie.asset('assets/lottie/bounce.json',
                          width: 200.w))),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    "확인",
                    style: TextStyle(color: Colors.blue, fontSize: 20.sp),
                  ),
                  onPressed: () {
                    if (context.read<Mainpage_Store>().totalLottoData.length >=
                        makeRealRound() - lottoTotalNumber.length) {
                      makeFullLottoTotalNumber();
                      //
                      // Navigator.push(context, MaterialPageRoute(builder: (c) {
                      //   return button7Page();
                      // }));

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const button9Page();
                        }),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            );
          });
    }
  }

  makeFullLottoTotalNumber() {
    // print(makeRound());
    // print(lottoTotalNumber.length);
    if (lottoTotalNumber.length != makeRealRound()) {
      // for (int i = 0; i < makeRound() - 1 - lottoTotalNumber.length; i++) {
      for (int i = makeRealRound() - lottoTotalNumber.length - 1; i >= 0; i--) {
        List<int> emptyList = [];
        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwNo']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo1']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo2']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo3']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo4']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo5']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo6']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['bnusNo']);

        print(emptyList);

        lottoTotalNumber.insert(0, emptyList);
        // emptyList.clear();
      }
      print(lottoTotalNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context)..pop()..pop();
            makeFullLottoTotalNumberStart();
            // Navigator.push(context, MaterialPageRoute(builder: (c) {
            //   return button9Page();
            // }));
          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '강력추천번호',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      height: 96.h,
                      width: double.infinity,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/reco2.json',
                              fit: BoxFit.fill))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class button10 extends StatefulWidget {
  const button10({Key? key}) : super(key: key);

  @override
  _button10State createState() => _button10State();
}

class _button10State extends State<button10> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context)..pop()..pop();

            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return const button10Page();
            }));
          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '제외수/고정수',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      height: 96.h,
                      width: double.infinity,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/fixNumber.json',
                              fit: BoxFit.fill))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class button11 extends StatefulWidget {
  const button11({Key? key}) : super(key: key);

  @override
  _button11State createState() => _button11State();
}

class _button11State extends State<button11> {
  button11MakeFullLottoTotalNumberStart() {
    if (context.read<Mainpage_Store>().totalLottoData.length >=
        makeRealRound() - lottoTotalNumber.length) {
      button11MakeFullLottoTotalNumber();
      Navigator.push(context, MaterialPageRoute(builder: (c) {
        return const button11Page();
      }));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //Dialog Main Title
              title: const Column(
                children: <Widget>[
                  Text("로딩중입니다.."),
                ],
              ),
              //

              content: SizedBox(
                  width: 200.w,
                  height: 100.h,
                  child: FittedBox(
                      fit: BoxFit.none,
                      child: Lottie.asset('assets/lottie/bounce.json',
                          width: 200.w))),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    "확인",
                    style: TextStyle(color: Colors.blue, fontSize: 20.sp),
                  ),
                  onPressed: () {
                    if (context.read<Mainpage_Store>().totalLottoData.length >=
                        makeRealRound() - lottoTotalNumber.length) {
                      button11MakeFullLottoTotalNumber();
                      //
                      // Navigator.push(context, MaterialPageRoute(builder: (c) {
                      //   return button7Page();
                      // }));

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const button11Page();
                        }),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            );
          });
    }
  }

  button11MakeFullLottoTotalNumber() {
    // print(makeRound());
    // print(lottoTotalNumber.length);
    if (lottoTotalNumber.length != makeRealRound()) {
      // for (int i = 0; i < makeRound() - 1 - lottoTotalNumber.length; i++) {
      for (int i = makeRealRound() - lottoTotalNumber.length - 1; i >= 0; i--) {
        List<int> emptyList = [];
        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwNo']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo1']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo2']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo3']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo4']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo5']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo6']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['bnusNo']);

        print(emptyList);

        lottoTotalNumber.insert(0, emptyList);
        // emptyList.clear();
      }
      print(lottoTotalNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context)..pop()..pop();
            button11MakeFullLottoTotalNumberStart();
            // Navigator.push(context, MaterialPageRoute(builder: (c) {
            //   return button11Page();
            // }));
          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '동반/미동반수',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      height: 96.h,
                      width: double.infinity,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/button11.json',
                              fit: BoxFit.fill))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class button12 extends StatefulWidget {
  const button12({Key? key}) : super(key: key);

  @override
  _button12State createState() => _button12State();
}

class _button12State extends State<button12> {
  button12MakeFullLottoTotalNumberStart() {
    if (context.read<Mainpage_Store>().totalLottoData.length >=
        makeRealRound() - lottoTotalNumber.length) {
      button12MakeFullLottoTotalNumber();
      Navigator.push(context, MaterialPageRoute(builder: (c) {
        return const button12Page();
      }));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //Dialog Main Title
              title: const Column(
                children: <Widget>[
                  Text("로딩중입니다.."),
                ],
              ),
              //

              content: SizedBox(
                  width: 200.w,
                  height: 100.h,
                  child: FittedBox(
                      fit: BoxFit.none,
                      child: Lottie.asset('assets/lottie/bounce.json',
                          width: 200.w))),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    "확인",
                    style: TextStyle(color: Colors.blue, fontSize: 20.sp),
                  ),
                  onPressed: () {
                    if (context.read<Mainpage_Store>().totalLottoData.length >=
                        makeRealRound() - lottoTotalNumber.length) {
                      button12MakeFullLottoTotalNumber();
                      //
                      // Navigator.push(context, MaterialPageRoute(builder: (c) {
                      //   return button7Page();
                      // }));

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const button11Page();
                        }),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            );
          });
    }
  }

  button12MakeFullLottoTotalNumber() {
    // print(makeRound());
    // print(lottoTotalNumber.length);
    if (lottoTotalNumber.length != makeRealRound()) {
      // for (int i = 0; i < makeRound() - 1 - lottoTotalNumber.length; i++) {
      for (int i = makeRealRound() - lottoTotalNumber.length - 1; i >= 0; i--) {
        List<int> emptyList = [];
        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwNo']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo1']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo2']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo3']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo4']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo5']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['drwtNo6']);

        emptyList
            .add(context.read<Mainpage_Store>().totalLottoData[i]['bnusNo']);

        print(emptyList);

        lottoTotalNumber.insert(0, emptyList);
        // emptyList.clear();
      }
      print(lottoTotalNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context)..pop()..pop();
            button12MakeFullLottoTotalNumberStart();
            // Navigator.push(context, MaterialPageRoute(builder: (c) {
            //   return button12Page();
            // }));
          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '저장번호목록',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      height: 96.h,
                      width: double.infinity,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Lottie.asset('assets/lottie/save.json',
                              fit: BoxFit.fill))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class button13 extends StatefulWidget {
  const button13({super.key});

  @override
  State<button13> createState() => _button13State();
}

class _button13State extends State<button13> {

 _openKakaoChat() async{
    final Uri kakaoUrl= Uri.parse('https://open.kakao.com/o/gopckofe');
    if (await canLaunchUrl(kakaoUrl)){
      await launchUrl(kakaoUrl);
    }else{
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        //Dialog Main Title
        title: const Column(
          children: <Widget>[
            Text("로딩중입니다.."),
          ],
        ),
        //

        content: SizedBox(
            width: 200.w,
            height: 100.h,
            child: FittedBox(
                fit: BoxFit.none,
                child: Lottie.asset('assets/lottie/bounce.json',
                    width: 200.w))),
        actions: <Widget>[
          TextButton(
            child: Text(
              "확인",
              style: TextStyle(color: Colors.blue, fontSize: 20.sp),
            ),
            onPressed: () {
              _openKakaoChat();
            // else {
            //     Navigator.pop(context);
            //   }
            },
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed:  _openKakaoChat,
          //     () {
          //   Navigator.of(context)..pop()..pop();
          //   button12MakeFullLottoTotalNumberStart();
          //   Navigator.push(context, MaterialPageRoute(builder: (c) {
          //     return button12Page();
          //   }));
          //
          //
          // },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '로또커뮤니티',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      height: 96.h,
                      width: double.infinity,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/kakaotalk.json',
                              fit: BoxFit.fill))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class button14 extends StatefulWidget {
  const button14({super.key});

  @override
  State<button14> createState() => _button14State();
}

class _button14State extends State<button14> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {

              final shareCourtUrl = 'https://play.google.com/store/apps/details?id=com.khs.lotto&pcampaignid=web_share';
              Share.share(
                shareCourtUrl,
              );

          },
          style: ButtonStyle(
            animationDuration: const Duration(microseconds: 100),

            foregroundColor: WidgetStateProperty.all(Colors.black),
            //syleForm에서  primarycolor랑 같다.
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return const Color(0xffffffff);
              } else {
                return const Color(0xffffffff);
              }
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return TextStyle(
                  fontSize: 25.sp,
                );
              } else {
                return TextStyle(fontSize: 27.sp);
              }
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.white60))),

            maximumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(double.infinity, 140.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            minimumSize: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                return Size(160.w, 130.0.h);
              } else {
                return Size(double.infinity, 150.0.h);
              }
            }),
            padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                  child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '어플공유하기',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      height: 96.h,
                      width: double.infinity,
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Lottie.asset('assets/lottie/share.json',
                              fit: BoxFit.fill
                          )

                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

















class textMarquee extends StatelessWidget {
  const textMarquee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        //
        margin: EdgeInsets.fromLTRB(0, 5.sp, 0, 0),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        alignment: Alignment.center,
        width: double.infinity,
        height: 30.sp,
        child: context
                .watch<naverSearch_FirstNum_Store>()
                .naverSearch_FirstNum
                .isEmpty
            ? (context.watch<Mainpage_Store>().lottoData['firstPrzwnerCo'] ==
                    null
                ? SizedBox(width: 10.w, height: 10.h)
                // child: const CircularProgressIndicator())
                : Marquee(
                    text:
                        '1등 총 ${context.watch<Mainpage_Store>().lottoData['firstPrzwnerCo']}명, 1인당 당첨금액 ${intl.NumberFormat('###,###,###,###').format(context.watch<Mainpage_Store>().lottoData['firstWinamnt']).replaceAll(' ', '')}원',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w900),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    blankSpace: 100.0,
                    velocity: 100.0,
                    pauseAfterRound: const Duration(seconds: 3),
                    // startPadding: 35.w,
                    startPadding: (MediaQuery.of(context).size.width.w / 12).w,
                    accelerationDuration: const Duration(seconds: 3),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  ))
            : Marquee(
                text:
                    '1등 총 ${context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[7]}명, 1인당 당첨금액 ${context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[8].replaceAll(' ', '')}원',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 15.sp),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                blankSpace: 100.0,
                velocity: 100.0,
                pauseAfterRound: const Duration(seconds: 3),
                // startPadding: 35.w,
                startPadding: (MediaQuery.of(context).size.width.w / 12).w,
                accelerationDuration: const Duration(seconds: 3),
                accelerationCurve: Curves.linear,
                decelerationDuration: const Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ));
  }
}

class totalBall extends StatefulWidget {
  totalBall({Key? key, this.a}) : super(key: key);

  int? a;

  @override
  State<totalBall> createState() => _totalBallState();
}

class _totalBallState extends State<totalBall> {
  getTotalBall(b) {
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
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
              child: Row(children: [
                Container(
                    child: Text(
                        '${context.watch<Mainpage_Store>().totalLottoData[widget.a!]['drwNo']}회',
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                        ))),
                Container(
                    height: 25.h,
                    alignment: Alignment.center,
                    child: Text(
                        '  ${context.watch<Mainpage_Store>().totalLottoData[widget.a!]['drwNoDate']}')),
              ])),
          Container(
            margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.h),
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
                context.watch<Mainpage_Store>().lottoData['drwtNo1'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : getTotalBall(context
                        .watch<Mainpage_Store>()
                        .totalLottoData[widget.a!]['drwtNo1']),
                context.watch<Mainpage_Store>().lottoData['drwtNo2'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : getTotalBall(context
                        .watch<Mainpage_Store>()
                        .totalLottoData[widget.a!]['drwtNo2']),
                context.watch<Mainpage_Store>().lottoData['drwtNo3'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : getTotalBall(context
                        .watch<Mainpage_Store>()
                        .totalLottoData[widget.a!]['drwtNo3']),
                context.watch<Mainpage_Store>().lottoData['drwtNo4'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : getTotalBall(context
                        .watch<Mainpage_Store>()
                        .totalLottoData[widget.a!]['drwtNo4']),
                context.watch<Mainpage_Store>().lottoData['drwtNo5'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : getTotalBall(context
                        .watch<Mainpage_Store>()
                        .totalLottoData[widget.a!]['drwtNo5']),
                context.watch<Mainpage_Store>().lottoData['drwtNo6'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : getTotalBall(context
                        .watch<Mainpage_Store>()
                        .totalLottoData[widget.a!]['drwtNo6']),
                const Icon(Icons.add),
                context.watch<Mainpage_Store>().lottoData['bnusNo'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : getTotalBall(context
                        .watch<Mainpage_Store>()
                        .totalLottoData[widget.a!]['bnusNo']),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class blackBall extends StatelessWidget {
  blackBall({Key? key, this.b}) : super(key: key);
  var b;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 40.w,
        height: 40.h,
        decoration: const BoxDecoration(
          color: Color(0xffe5e5e5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Text(
          '$b',
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

class totalBallButton7 extends StatefulWidget {
  totalBallButton7({Key? key, this.a}) : super(key: key);

  int? a;

  @override
  State<totalBallButton7> createState() => _totalBallButton7State();
}

class _totalBallButton7State extends State<totalBallButton7> {
  getTotalBall(b) {
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
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.centerRight,
            child: AutoSizeText(
                '${context.watch<Mainpage_Store>().totalLottoData[widget.a!]['drwNo']}회',
                softWrap: true,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Pretendard'
                )))
        ,
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
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
                // snapshot.data!=null
                //     ? getTotalBall(
                //     snapshot.data[widget.a!]['drwtNo1'])
                //     :
                context.watch<Mainpage_Store>().lottoData['drwtNo1'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : Expanded(child: getTotalBall(context
                    .watch<Mainpage_Store>()
                    .totalLottoData[widget.a!]['drwtNo1'])),
                // snapshot.data!=null
                //     ? getTotalBall(
                //     snapshot.data[widget.a!]['drwtNo2'])
                //     :
                context.watch<Mainpage_Store>().lottoData['drwtNo2'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : Expanded(child: getTotalBall(context
                    .watch<Mainpage_Store>()
                    .totalLottoData[widget.a!]['drwtNo2'])),
                // snapshot.data!=null
                //     ? getTotalBall(
                //     snapshot.data[widget.a!]['drwtNo3'])
                //     :
                context.watch<Mainpage_Store>().lottoData['drwtNo3'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : Expanded(child: getTotalBall(context
                    .watch<Mainpage_Store>()
                    .totalLottoData[widget.a!]['drwtNo3'])),
                // snapshot.data!=null
                //     ? getTotalBall(
                //     snapshot.data[widget.a!]['drwtNo4'])
                //     :
                context.watch<Mainpage_Store>().lottoData['drwtNo4'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : Expanded(child: getTotalBall(context
                    .watch<Mainpage_Store>()
                    .totalLottoData[widget.a!]['drwtNo4']
                  // 0
                )),
                // snapshot.data!=null
                //     ? getTotalBall(
                //     snapshot.data[widget.a!]['drwtNo5'])
                //     :
                context.watch<Mainpage_Store>().lottoData['drwtNo5'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : Expanded(child: getTotalBall(context
                    .watch<Mainpage_Store>()
                    .totalLottoData[widget.a!]['drwtNo5'])),
                // snapshot.data!=null
                //     ? getTotalBall(
                //     snapshot.data[widget.a!]['drwtNo6'])
                //     :
                context.watch<Mainpage_Store>().lottoData['drwtNo6'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : Expanded(child: getTotalBall(context
                    .watch<Mainpage_Store>()
                    .totalLottoData[widget.a!]['drwtNo6'])),
                const Icon(Icons.add),
                // snapshot.data!=null
                //     ? getTotalBall(snapshot.data[widget.a!]['bnusNo'])
                //     :
                context.watch<Mainpage_Store>().lottoData['bnusNo'] == null
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: const CircularProgressIndicator())
                    : Expanded(child: getTotalBall(context
                    .watch<Mainpage_Store>()
                    .totalLottoData[widget.a!]['bnusNo'])),
              ],
            ),
          ),
        ),

      ],
      //   );
      // }
    );
  }
}

class newTotalBallButton7 extends StatefulWidget {
  newTotalBallButton7({Key? key, this.a}) : super(key: key);

  int? a;

  @override
  State<newTotalBallButton7> createState() => _newTotalBallButton7State();
}

class _newTotalBallButton7State extends State<newTotalBallButton7> {
  getTotalBall(b) {
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
    return Container(
        padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                alignment: Alignment.centerRight,
                child: AutoSizeText(
                    softWrap: true,
                    maxLines: 1,
                    '${lottoTotalNumber[widget.a!][0]}회',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w900,
                    ))),
            // flex: 1,

            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
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
                    // snapshot.data!=null
                    //     ? getTotalBall(
                    //     snapshot.data[widget.a!]['drwtNo1'])
                    //     :
                    context.watch<Mainpage_Store>().lottoData['drwtNo1'] == null
                        ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                        : Expanded(
                            child:
                                getTotalBall(lottoTotalNumber[widget.a!][1])),
                    // snapshot.data!=null
                    //     ? getTotalBall(
                    //     snapshot.data[widget.a!]['drwtNo2'])
                    //     :
                    context.watch<Mainpage_Store>().lottoData['drwtNo2'] == null
                        ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                        : Expanded(
                            child:
                                getTotalBall(lottoTotalNumber[widget.a!][2])),
                    // snapshot.data!=null
                    //     ? getTotalBall(
                    //     snapshot.data[widget.a!]['drwtNo3'])
                    //     :
                    context.watch<Mainpage_Store>().lottoData['drwtNo3'] == null
                        ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                        : Expanded(
                            child:
                                getTotalBall(lottoTotalNumber[widget.a!][3])),
                    // snapshot.data!=null
                    //     ? getTotalBall(
                    //     snapshot.data[widget.a!]['drwtNo4'])
                    //     :
                    context.watch<Mainpage_Store>().lottoData['drwtNo4'] == null
                        ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                        : Expanded(
                            child: getTotalBall(lottoTotalNumber[widget.a!][4]
                                // 0
                                )),
                    // snapshot.data!=null
                    //     ? getTotalBall(
                    //     snapshot.data[widget.a!]['drwtNo5'])
                    //     :
                    context.watch<Mainpage_Store>().lottoData['drwtNo5'] == null
                        ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                        : Expanded(
                            child:
                                getTotalBall(lottoTotalNumber[widget.a!][5])),
                    // snapshot.data!=null
                    //     ? getTotalBall(
                    //     snapshot.data[widget.a!]['drwtNo6'])
                    //     :
                    context.watch<Mainpage_Store>().lottoData['drwtNo6'] == null
                        ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                        : Expanded(
                            child:
                                getTotalBall(lottoTotalNumber[widget.a!][6])),
                    const Icon(Icons.add),
                    // snapshot.data!=null
                    //     ? getTotalBall(snapshot.data[widget.a!]['bnusNo'])
                    //     :
                    context.watch<Mainpage_Store>().lottoData['bnusNo'] == null
                        ? SizedBox(
                            width: 10.w,
                            height: 10.h,
                            child: const CircularProgressIndicator())
                        : Expanded(
                            child:
                                getTotalBall(lottoTotalNumber[widget.a!][7])),
                  ],
                ),
              ),
              // flex: 5,
            ),
          ],
          //   );
          // }
        ));
  }
}

class reTotalBall extends StatefulWidget {
  reTotalBall({Key? key, this.a}) : super(key: key);

  int? a;

  @override
  State<reTotalBall> createState() => _reTotalBallState();
}

class _reTotalBallState extends State<reTotalBall> {
  getTotalBall(b) {
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
    return Container(
      height: 95.sp,
      padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
              child: Row(children: [
                AutoSizeText('${lottoTotalNumber[widget.a!][0]}회',
                    softWrap: true,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w900,
                    )),
                Container(
                    height: 25.sp,
                    alignment: Alignment.center,
                    child: AutoSizeText(
                        '  ${(lottoTotalNumber[widget.a!][8].toString().substring(0, 4))}-${lottoTotalNumber[widget.a!][8].toString().substring(4, 6)}-${lottoTotalNumber[widget.a!][8].toString().substring(6, 8)}',
                        style: TextStyle(
                          fontSize: 12.sp,

                          // fontWeight: FontWeight.w900,
                        ))),
              ])),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.h),
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
                  lottoTotalNumber[widget.a!][1] == null
                      ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                      : getTotalBall(lottoTotalNumber[widget.a!][1]),
                  lottoTotalNumber[widget.a!][2] == null
                      ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                      : getTotalBall(lottoTotalNumber[widget.a!][2]),
                  lottoTotalNumber[widget.a!][3] == null
                      ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                      : getTotalBall(lottoTotalNumber[widget.a!][3]),
                  lottoTotalNumber[widget.a!][4] == null
                      ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                      : getTotalBall(lottoTotalNumber[widget.a!][4]),
                  lottoTotalNumber[widget.a!][5] == null
                      ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                      : getTotalBall(lottoTotalNumber[widget.a!][5]),
                  lottoTotalNumber[widget.a!][6] == null
                      ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                      : getTotalBall(lottoTotalNumber[widget.a!][6]),
                  const Icon(Icons.add),
                  lottoTotalNumber[widget.a!][7] == null
                      ? SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: const CircularProgressIndicator())
                      : getTotalBall(lottoTotalNumber[widget.a!][7]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// class totalBallButton7New extends StatefulWidget {
//   totalBallButton7New({Key? key, this.a}) : super(key: key);
//
//   int? a;
//
//   @override
//   State<totalBallButton7New> createState() => _totalBallButton7NewState();
// }
//
// class _totalBallButton7NewState extends State<totalBallButton7New> {
//   getTotalBall(b) {
//     if (b < 11) {
//       return yellowBall(b: b);
//     } else if (b < 21) {
//       return blueBall(b: b);
//     } else if (b < 31) {
//       return redBall(b: b);
//     } else if (b < 41) {
//       return greyBall(b: b);
//     } else {
//       return greenBall(b: b);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
//         child:
//
//         Row(
//           children: [
//             Expanded(
//               child: Container(
//                   alignment: Alignment.centerRight,
//                   child:
//
//                   Text(
//                       '${context.watch<lottoInfo>().lottoList[widget.a!]['draw_no']}회',
//                       style: TextStyle(
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w900,
//                       ))),
//               flex: 1,
//             ),
//             Expanded(
//               child: Container(
//                 margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
//                 padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
//                 // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//                 decoration: BoxDecoration(
//                   color: Color(0xffe5e5e5),
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10),
//                       bottomLeft: Radius.circular(10),
//                       bottomRight: Radius.circular(10)),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     // snapshot.data!=null
//                     //     ? getTotalBall(
//                     //     snapshot.data[widget.a!]['drwtNo1'])
//                     //     :
//                     context.watch<lottoInfo>().lottoList[0] ==
//                         null
//                         ? SizedBox(
//                         width: 10.w,
//                         height: 10.h,
//                         child: CircularProgressIndicator())
//                         : getTotalBall(
//                         context.watch<lottoInfo>().lottoList[widget.a!]['numbers'][0]
//
//                     ),
//                     // snapshot.data!=null
//                     //     ? getTotalBall(
//                     //     snapshot.data[widget.a!]['drwtNo2'])
//                     //     :
//                     context.watch<lottoInfo>().lottoList[0] ==
//                         null
//                         ? SizedBox(
//                         width: 10.w,
//                         height: 10.h,
//                         child: CircularProgressIndicator())
//                         : getTotalBall(
//                         context.watch<lottoInfo>().lottoList[widget.a!]['numbers'][1]
//
//                     ),
//                     // snapshot.data!=null
//                     //     ? getTotalBall(
//                     //     snapshot.data[widget.a!]['drwtNo3'])
//                     //     :
//                     context.watch<lottoInfo>().lottoList[0] ==
//                         null
//                         ? SizedBox(
//                         width: 10.w,
//                         height: 10.h,
//                         child: CircularProgressIndicator())
//                         : getTotalBall(
//                         context.watch<lottoInfo>().lottoList[widget.a!]['numbers'][2]
//
//                     ),
//                     // snapshot.data!=null
//                     //     ? getTotalBall(
//                     //     snapshot.data[widget.a!]['drwtNo4'])
//                     //     :
//                     context.watch<lottoInfo>().lottoList[0] ==
//                         null
//                         ? SizedBox(
//                         width: 10.w,
//                         height: 10.h,
//                         child: CircularProgressIndicator())
//                         : getTotalBall(
//                         context.watch<lottoInfo>().lottoList[widget.a!]['numbers'][3]
//                       // 0
//                     ),
//                     // snapshot.data!=null
//                     //     ? getTotalBall(
//                     //     snapshot.data[widget.a!]['drwtNo5'])
//                     //     :
//                     context.watch<lottoInfo>().lottoList[0] ==
//                         null
//                         ? SizedBox(
//                         width: 10.w,
//                         height: 10.h,
//                         child: CircularProgressIndicator())
//                         : getTotalBall(
//                         context.watch<lottoInfo>().lottoList[widget.a!]['numbers'][4]
//
//                     ),
//                     // snapshot.data!=null
//                     //     ? getTotalBall(
//                     //     snapshot.data[widget.a!]['drwtNo6'])
//                     //     :
//                     context.watch<lottoInfo>().lottoList[0] ==
//                         null
//                         ? SizedBox(
//                         width: 10.w,
//                         height: 10.h,
//                         child: CircularProgressIndicator())
//                         : getTotalBall(
//                         context.watch<lottoInfo>().lottoList[widget.a!]['numbers'][5]
//
//                     ),
//                     Icon(Icons.add),
//                     // snapshot.data!=null
//                     //     ? getTotalBall(snapshot.data[widget.a!]['bnusNo'])
//                     //     :
//                     context.watch<lottoInfo>().lottoList[0] ==
//                         null
//                         ? SizedBox(
//                         width: 10.w,
//                         height: 10.h,
//                         child: CircularProgressIndicator())
//                         : getTotalBall(
//                         context.watch<lottoInfo>().lottoList[widget.a!]['bonus_no']
//
//                     ),
//                   ],
//                 ),
//               ),
//               flex: 5,
//             ),
//           ],
//           //   );
//           // }
//         ));
//   }
// }
