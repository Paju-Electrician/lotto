import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart'; /*날짜*/
import 'package:http/http.dart' as http;
import 'package:lotto/pages/DirectInput.dart';
import 'package:lotto/pages/notification.dart';
import 'package:lotto/pages/splash.dart';
import 'package:lotto/provider/store1.dart';
import 'package:lotto/provider/store2.dart';
import 'package:lotto/provider/store3.dart';
// import 'package:lotto/widget/google_admop_widget.dart';

import 'package:lotto/widget/mainWidgets.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:barcode_scan2/barcode_scan2.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MobileAds.instance.initialize();

  final NotificationAppLaunchDetails? notificationAppLaunchDetails =
      await notifications.getNotificationAppLaunchDetails();

  String? payload = notificationAppLaunchDetails!.payload;

  tz.initializeTimeZones();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (c) => Store1()),
      ChangeNotifierProvider(create: (c) => DataBase()),
      ChangeNotifierProvider(create: (c) => firstLotto()),
      // ChangeNotifierProvider(create: (c) => lottoInfo()),
    ],

    // child: MaterialApp(home: MyApp() /* 앱  시작해주세요 */),
    child: lottoMan(payload: payload),
  ));
}

extension on NotificationAppLaunchDetails {
  String? get payload => null;
}

class lottoMan extends StatefulWidget {
  lottoMan({Key? key, this.payload}) : super(key: key);
  var payload;

  @override
  State<lottoMan> createState() => _lottoManState();
}

class _lottoManState extends State<lottoMan> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
        designSize: const Size(392, 822),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              useInheritedMediaQuery: true,
              home: Splash(payload: widget.payload, context: context),
            ));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getData() async {
    // print('3');
    var result = await http.get(Uri.parse(
        'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1007'));
    if (result.statusCode == 200) {
      // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.
      Map DataList = jsonDecode(result.body);

      context.read<Store1>().changelottoData(DataList);
    } else {
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }

  final String androidTestUnitId = 'ca-app-pub-3940256099942544/6300978111'; //6300978111은 테스트용 광고 아이디

  // final String androidTestUnitId = 'ca-app-pub-3525010127354180/7867321461';

  BannerAd? banner;

  @override
  void initState() {
    super.initState();

    context.read<Store1>().getbut1one();
    context.read<Store1>().getTotalLottoData();
    // .whenComplete(() => saveTotalDataList());

    context.read<Store1>().getFirstLottoPlace();

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

    // context.read<Store1>().getTotalLottoData().whenComplete(() => saveTotalDataList());
  }

//   saveTotalDataList() async{
//     var storage = await SharedPreferences.getInstance();
//
// var temp =json.encode(context.read<Store1>().totalLottoData);
//       if(storage.getString('totalLottoData')==null) {
//         storage.setString('totalLottoData', temp);
//         print('저장됬어요');
//       }
//
//   }

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
        margin: EdgeInsets.fromLTRB(0,0,0,40.h),
        child: AdWidget(ad: banner!));
    
  }

  @override
  void dispose() {
    // TODO: implement dispose

    print('dispose실행됨');

    banner!.dispose();

    super.dispose();
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
            const lottoNumber(),
            const Expanded(child: lottoGridView()),
            returnAd()
            // BannerAdContainer()

          ],
        ));
  }
}

class lottoNumber extends StatefulWidget {
  const lottoNumber({Key? key}) : super(key: key);

  @override
  _lottoNumberState createState() => _lottoNumberState();
}

class _lottoNumberState extends State<lottoNumber> {
  getToday() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));
    DateTime now = tz.TZDateTime.now(tz.local); // print('now는${now}');
    DateTime dateTime1 = DateTime(now.year, now.month, now.day);
    // DateTime dateTime1 = DateTime(2022,4,16,20,0,0);

    DateTime dateTime2 = DateTime(
        (DateTime.parse(
                context.watch<Store1>().lottoData['drwNoDate'] ?? '2022-10-24'))
            .year,
        (DateTime.parse(
                context.watch<Store1>().lottoData['drwNoDate'] ?? '2022-10-24'))
            .month,
        (DateTime.parse(
                context.watch<Store1>().lottoData['drwNoDate'] ?? '2022-10-24'))
            .day,
        21,
        00,
        00);

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

  Future<bool> _getStatuses() async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.storage, Permission.camera].request();

    if (await Permission.camera.isGranted &&
        await Permission.storage.isGranted) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  _scan() async {
    await _getStatuses();
    var barcode = await scanner.BarcodeScanner.scan();
    setState(() => output = barcode.rawContent.toString());
    launchURL('$output');
  }

  var iconBool = true;

  iconBoolSwitch() {
    if (iconBool == true) {
      return const Icon(Icons.notifications_active);
    } else {
      return const Icon(Icons.notifications_off);
    }
  }

  iconSwitch() async {
    if (iconBool == true) {
      await notifications.cancel(2);
      setState(() {
        iconBool = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 320.w,
          content: Text(
            '토요일 저녁6시 알람이 꺼졌습니다.',
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
      showNotification2(context);
      setState(() {
        iconBool = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 320.w,
          content: Text(
            '토요일 저녁6시 알람이 켜졌습니다.',
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
    return Container(
      width: double.infinity,
      // height: 220.h,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffe5e5e5), width: 10),
          color: const Color(0xfff8f8f8),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
      child: Column(
        children: [
          // Text('${getToday()}', ),
          Container(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: const Icon(Icons.refresh),
                            padding: const EdgeInsets.all(0),
                            color: const Color(0xff999999),
                            constraints: const BoxConstraints(),
                          )),
                    ),
                    Container(
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        padding: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                        child: context.watch<Store1>().lottoData['drwNoDate'] ==
                                null
                            ? (context
                                    .watch<firstLotto>()
                                    .firstLottoNumNaver
                                    .isEmpty
                                ? const CircularProgressIndicator()
                                : Text(
                                    '${context.watch<firstLotto>().firstLottoNumNaver[10]}',
                                    style: TextStyle(
                                        color: const Color(0xff767676),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ))
                            : Text(
                          textAlign: TextAlign.center,
                                DateFormat('yyyy.MM.dd').format(DateTime.parse(
                                    context
                                        .watch<Store1>()
                                        .lottoData['drwNoDate'])),
                                style: TextStyle(
                                    color: const Color(0xff767676),
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              )),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                          alignment: Alignment.centerRight,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                          child: IconButton(
                            iconSize: 25,
                            onPressed: () {
                              iconSwitch();
                            },
                            icon: iconBoolSwitch(),
                            padding: const EdgeInsets.all(0),
                            color: const Color(0xffffcc00),
                            constraints: const BoxConstraints(),
                          )),
                    ),
                  ],
                ),
                Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 5.h),
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed:
                              context.watch<Store1>().lottoData['drwtNo6'] ==
                                      null
                                  ? null
                                  : () {
                                      context.read<Store1>().changeRoundMinus();
                                    },
                          style: TextButton.styleFrom(
                            // alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 0),
                            maximumSize: Size(50.0.w, 40.0.h),
                            minimumSize: Size(50.0.w, 35.0.h),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                            ),

                          ),
                          child: Text(
                            '<',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Jua',
                                fontWeight: FontWeight.w900,
                                fontSize: 30.sp),
                          )),
                      context.watch<Store1>().lottoData['drwNo'] == null
                          ? (context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver
                                  .isEmpty
                              ? const CircularProgressIndicator()
                              : Text(
                                  '${context.watch<firstLotto>().firstLottoNumNaver[9]}',
                                  style: TextStyle(
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.w900,
                                    color: const Color(0xffd43301),
                                  )))
                          : Text(
                              '${context.watch<Store1>().lottoData['drwNo']}회',
                              style: TextStyle(
                                fontSize: 35.sp,
                                fontWeight: FontWeight.w900,
                                color: const Color(0xffd43301),
                              )),
                      ElevatedButton(
                          onPressed: (getToday() == null ||
                                      (getToday()! <= 0 && getToday()! > -7)) ||
                                  context
                                          .watch<Store1>()
                                          .lottoData['drwtNo6'] ==
                                      null
                              ? null
                              : () {
                                  context.read<Store1>().changeRoundPlus();
                                },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 0),
                            maximumSize: Size(50.0.w, 40.0.h),
                            minimumSize: Size(50.0.w, 35.0.h),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                            ),

                          ),
                          child: Text(
                            '>',
                            style: TextStyle(
                              color: Colors.white,
                                fontFamily: 'Jua',
                                fontWeight: FontWeight.w900,
                                fontSize: 30.sp),
                          )),
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
                      context.watch<Store1>().lottoData['drwtNo1'] == null
                          ? (context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver
                                  .isEmpty
                              ? SizedBox(
                                  width: 10.w,
                                  height: 10.h,
                                  child: const CircularProgressIndicator())
                              : getBall(context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver[0]))
                          : getBall(
                              context.watch<Store1>().lottoData['drwtNo1']),
                      context.watch<Store1>().lottoData['drwtNo2'] == null
                          ? (context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver
                                  .isEmpty
                              ? SizedBox(
                                  width: 10.w,
                                  height: 10.h,
                                  child: const CircularProgressIndicator())
                              : getBall(context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver[1]))
                          : getBall(
                              context.watch<Store1>().lottoData['drwtNo2']),
                      context.watch<Store1>().lottoData['drwtNo3'] == null
                          ? (context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver
                                  .isEmpty
                              ? SizedBox(
                                  width: 10.w,
                                  height: 10.h,
                                  child: const CircularProgressIndicator())
                              : getBall(context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver[2]))
                          : getBall(
                              context.watch<Store1>().lottoData['drwtNo3']),
                      context.watch<Store1>().lottoData['drwtNo4'] == null
                          ? (context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver
                                  .isEmpty
                              ? SizedBox(
                                  width: 10.w,
                                  height: 10.h,
                                  child: const CircularProgressIndicator())
                              : getBall(context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver[3]))
                          : getBall(
                              context.watch<Store1>().lottoData['drwtNo4']),
                      context.watch<Store1>().lottoData['drwtNo5'] == null
                          ? (context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver
                                  .isEmpty
                              ? SizedBox(
                                  width: 10.w,
                                  height: 10.h,
                                  child: const CircularProgressIndicator())
                              : getBall(context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver[4]))
                          : getBall(
                              context.watch<Store1>().lottoData['drwtNo5']),
                      context.watch<Store1>().lottoData['drwtNo6'] == null
                          ? (context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver
                                  .isEmpty
                              ? SizedBox(
                                  width: 10.w,
                                  height: 10.h,
                                  child: const CircularProgressIndicator())
                              : getBall(context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver[5]))
                          : getBall(
                              context.watch<Store1>().lottoData['drwtNo6']),
                      const Icon(Icons.add),
                      context.watch<Store1>().lottoData['bnusNo'] == null
                          ? (context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver
                                  .isEmpty
                              ? SizedBox(
                                  width: 10.w,
                                  height: 10.h,
                                  child: const CircularProgressIndicator())
                              : getBall(context
                                  .watch<firstLotto>()
                                  .firstLottoNumNaver[6]))
                          : getBall(
                              context.watch<Store1>().lottoData['bnusNo']),
                    ],
                  ),
                ),
                const textMarquee(),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _scan();
                        },
                        child: Row(
                          children: [
                            const Icon(
                                Icons.qr_code_scanner,color: Colors.white),
                            Text(
                              ' 큐알코드 ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            )
                          ],
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                          ),
                          minimumSize: Size(20.0.w, 35.0.h),
                        ),
                      ),
                      ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                            ),
                            minimumSize: Size(20.0.w, 35.0.h),
                          ),
                          onPressed: () {
                            if (context.read<Store1>().lottoData['drwtNo6'] ==
                                null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      width: 320.w,
                                      content: Text(
                                        '서버점검시간',
                                        style: TextStyle(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.w900),
                                        textAlign: TextAlign.center,
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          10.w, 10.h, 10.w, 10.h),
                                      backgroundColor: Colors.red,
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )));
                            } else {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (c) {
                                return const DirectInput();
                              }));
                            }
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle,color: Colors.white),
                              Text(' 직접입력 ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp)),
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class lottoGridView extends StatefulWidget {
  const lottoGridView({Key? key}) : super(key: key);

  @override
  _lottoGridViewState createState() => _lottoGridViewState();
}

class _lottoGridViewState extends State<lottoGridView> {
  var button = [
    const button1(),
    const button2(),
    const button3(),
    const button4(),
    const button5(),
    const button6(),
    const button7(),
    const button8(),
    const button9(),
    const button10(),
    const button11(),
    const button12()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
      decoration: const BoxDecoration(
        color: Color(0xfff8f8f8),
        // border: Border.all(color: Colors.black)
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 0,
          mainAxisExtent: 160.h,
        ),
        itemBuilder: (c, i) {
          return Container(
              padding: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
              // decoration: BoxDecoration(border : Border.all(color: Colors.black)),
              child: button[i]);
        },
        itemCount: 12,
      ),
    );
  }
}
