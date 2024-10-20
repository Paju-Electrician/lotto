import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:lotto/main.dart';
import 'package:lotto/pages/button12Page.dart';
import 'package:lotto/pages/notification.dart';
import 'package:lotto/provider/allpages_Provider.dart';
import 'package:lotto/provider/naverSearch_Provider.dart';
import 'package:provider/provider.dart';
import 'package:in_app_update/in_app_update.dart';

class Splash extends StatefulWidget {
  Splash({Key? key, this.context, this.payload}) : super(key: key);
  final context;
  var payload;

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  AppUpdateInfo? _updateInfo;

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void _showError(dynamic exception) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black38,
      content: Text(
        exception.toString(),
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontFamily: "Pretendard",
          fontWeight: FontWeight.bold,
        ),
      ),
      duration: const Duration(seconds: 3),
    ));
  }

  @override
  void initState() {
    super.initState();
    initNotification(widget.context);
    showNotification2(widget.context);
    // getData();
    checkForUpdate();
    context.read<Mainpage_Store>().lottoRoundis();
    context.read<naverSearch_FirstNum_Store>().getFirstLottonaver();
    context.read<Mainpage_Store>().firstRound();
    context.read<Mainpage_Store>().button5pageInfoSave();

    _controller = AnimationController(vsync: this);

    // 화면이 시작되고 몇초간의 딜레이 후, 다음 화면으로 넘어가는 부분

    // new Future.delayed(
    //
    //     const Duration(seconds: 1),
    //
    //         () => Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (BuildContext context) => MyApp()),
    //         (route) => false));
  }

  goMain() {
    if (context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[0] !=
        null) {
      if (widget.payload == '3') {
        print('3333333333333333실행됨');
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const MyApp();
        }), (route) => false);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const button12Page()),
        );

        //
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //     builder: (BuildContext context) {
        //       return   button12Page();
        //
        // })   ,(route) => false);
      } else {
        // if(context.read<Mainpage_Store>().lottoData['drwNoDate']!=null){
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return _updateInfo?.updateAvailability ==
                  UpdateAvailability.updateAvailable
              ? Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/lotto.png"),
                          fit: BoxFit.fill)),
                  child: AlertDialog(
                    backgroundColor: Colors.white70,
                    title: const Text(
                      "로또당첨자가 새로운 기능이 추가되었습니다. 업데이트 한번 부탁드립니다! 당신의 로또 1등을 기원합니다!!",
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: _updateInfo?.updateAvailability ==
                                  UpdateAvailability.updateAvailable
                              ? () {
                                  InAppUpdate.performImmediateUpdate()
                                      .catchError((e) => _showError(e));
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                              disabledForegroundColor:
                                  Colors.blue.withOpacity(0.38),
                              disabledBackgroundColor:
                                  Colors.blue.withOpacity(0.12)),
                          child: const Text(
                            "업데이트",
                            style: TextStyle(
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 30),
                          ))
                    ],
                  ),
                  // MyApp()
                )
              : const MyApp();
        }), (route) => false);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(

                  // 크기 지정

                  width: 500,
                  height: 500,

                  // 내가 저장한 lottie 에셋 지정

                  child: Lottie.asset('assets/lottie/bounce.json',
                      controller: _controller, onLoaded: (composition) {
                    _controller.addStatusListener((status) {
                      // 애니메이션이 끝나면 반대로 재생

                      // 애니메이션이 사라지면 다시 생성

                      if (status == AnimationStatus.dismissed) {
                        _controller.forward();
                      } else if (status == AnimationStatus.completed)
                        _controller.reverse();
                    });

                    // Configure the AnimationController with the duration of the

                    // Lottie file and start the animation.

                    _controller
                      ..duration = composition.duration
                      ..forward().whenComplete(() => goMain());
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
