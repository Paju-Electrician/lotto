import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotto/pages/lottoNumber.dart';
import 'package:lotto/pages/sharedpreferences.dart';
import 'package:lotto/widget/mainWidgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final notifications = FlutterLocalNotificationsPlugin();

//1. 앱로드시 실행할 기본설정
initNotification(context) async {
  //안드로이드용 아이콘파일 이름
  var androidSetting = const AndroidInitializationSettings('app_icon');

  //ios에서 앱 로드시 유저에게 권한요청하려면
  var iosSetting = const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  var initializationSettings =InitializationSettings(android: androidSetting, iOS: iosSetting);

  await notifications.initialize(
    initializationSettings,
    // onSelectNotification:((payload) {
    //   print('aaaaaaaaaaaaa');
    //   // Future.delayed(Duration.zero).then((_){
    //
    //     print('bbbbbbbbbbbbb');
    //     Navigator.push(context,
    //         MaterialPageRoute(builder: (c) {
    //           print('cccccccccccc');
    //           return button12Page();
    //         }
    //         ));
    //   // });
    //
    // }
   );
  // );


  //
  // final NotificationAppLaunchDetails? notificationAppLaunchDetails = await notifications .getNotificationAppLaunchDetails();
  //
  // final didNotificationLaunchApp = notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;
  //
  // final initialRoute = didNotificationLaunchApp ? '/second' : '/first';


  // String initialRoute = MyApp.routeName;
  // if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
  //   selectedNotificationPayload = notificationAppLaunchDetails!.payload;
  //   initialRoute = SecondPage.routeName;
  // }
    //알림 누를때 함수실행하고 싶으면
    //onSelectNotification: 함수명추가


}





showNotification2(BuildContext context) async {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Seoul'));




  var now = tz.TZDateTime.now(tz.local);
  exactSaturday() {
    var now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =  tz.TZDateTime(tz.local, now.year, now.month, now.day, 18,0,0);
    if (scheduledDate.isBefore(now)) {
      return 7;
    }
    return 0;
  }

  var androidDetails = const AndroidNotificationDetails(
    '유니크한 알림 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    // color: Colors.black,
  );
  var iosDetails = const DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );











  notifications.zonedSchedule(
    2,
    '로또당첨자',
    '${makeRound()}회 로또 사셨나요? 꼭 사서 당첨되시기 바랍니다 ^^',
    tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day +
            (now.weekday == 7
                ? 6
                : now.weekday == 6
                    ?exactSaturday()
                    : now.weekday == 5
                        ? 1
                        : now.weekday == 4
                            ? 2
                            : now.weekday == 3
                                ? 3
                                : now.weekday == 2
                                    ? 4
                                    : now.weekday == 1
                                        ? 5
                                        : 0),
        18,
        0,
        0),
    NotificationDetails(android: androidDetails, iOS: iosDetails),
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );

}


showNotification3(BuildContext context) async {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Seoul'));




  var now = tz.TZDateTime.now(tz.local);
  exactSaturday() {
    var now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =  tz.TZDateTime(tz.local, now.year, now.month, now.day, 20,50,0);
    if (scheduledDate.isBefore(now)) {
      return 7;
    }
    return 0;
  }

  var androidDetails = const AndroidNotificationDetails(
    '유니크한 알림 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    // color: Colors.black,
  );
  var iosDetails = const DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );


  notifications.zonedSchedule(
    3,
    '로또당첨자',
    '로또당첨결과가 나왔습니다~!!저장번호목록에서 확인해주세요!',
    tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day +
            (now.weekday == 7
                ? 6
                : now.weekday == 6
                ?exactSaturday()
                : now.weekday == 5
                ? 1
                : now.weekday == 4
                ? 2
                : now.weekday == 3
                ? 3
                : now.weekday == 2
                ? 4
                : now.weekday == 1
                ? 5
                : 0),
        21,
        0,
        0),

      // tz.TZDateTime(
      //     tz.local,
      //     now.year,
      //     now.month,
      //     now.day,
      //     18,
      //     59,
      //     0),
    NotificationDetails(android: androidDetails, iOS: iosDetails),
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
    UILocalNotificationDateInterpretation.absoluteTime,
     payload: '3'

  );
}


seeMatchNumber(context){
//회차를 정확하게 가져온다.
// 회차에 맞는 번호를 가져온다.

  ItemScrollController scrollController = ItemScrollController();
  List matchRank=[];

  getBall(b) {
    if (b == 0) {
      return blackBall(b: b);
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

  showDialog(
      context: context,
      builder: (_) => AlertDialog(
          title: const Text('우왕 잘됩니다!!!!우와아아아아아아앙!!!'),
          content: FutureBuilder<dynamic>(
              future: getLottoNumberList(),
              builder: (context, snapi) {
                List tempLottoList = snapi.data;

                // print(tempLottoList[0]);
                // print(tempLottoList[0].split(','));



                return ScrollablePositionedList.builder(
                  // itemCount: context.watch<Store1>().totalLottoData.length,
                    itemCount: tempLottoList==null?0:tempLottoList.length,
                    itemScrollController: scrollController,
                    itemBuilder: (c, i) {
                      int match = 0;
                      var tempMyNum = [];
                      String? rank ;

                      var lottoList = tempLottoList[i].toString().split(',');

                      lottoList[0] = lottoList[0].replaceAll('[','');
                      lottoList[5] =lottoList[5].replaceAll(']', '');

                      var intLottoList = [int.parse(lottoList[0]),int.parse(lottoList[1]),int.parse(lottoList[2]),int.parse(lottoList[3]),int.parse(lottoList[4]),int.parse(lottoList[5])];
                      intLottoList.sort();

                      for (var lotto in lottoTotalNumber[10]) {
                        for(var num in intLottoList){
                          if(lotto==num){
                            match++;
                            tempMyNum.add(num);
                          }
                        }
                      }
                      if (match == 6) {
                        rank = '1등';

                      } else if (match == 5 &&
                          intLottoList.contains(lottoTotalNumber[10][7])) {

                        rank = '2등';

                      } else if (match == 5) {

                        rank = '3등';

                      } else if (match == 4) {

                        rank = '4등';

                      } else if (match == 3) {

                        rank = '5등';

                      } else{
                        matchRank.add('꽝');
                      }









                      return  Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin:
                              EdgeInsets.fromLTRB(5.w, 0, 5.w, 10.h),
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
                                  getBall(tempMyNum.contains(intLottoList[0])?intLottoList[0]:0),
                                  getBall(tempMyNum.contains(intLottoList[1])?intLottoList[1]:0),
                                  getBall(tempMyNum.contains(intLottoList[2])?intLottoList[2]:0),
                                  getBall(tempMyNum.contains(intLottoList[3])?intLottoList[3]:0),
                                  getBall(tempMyNum.contains(intLottoList[4])?intLottoList[4]:0),
                                  getBall(tempMyNum.contains(intLottoList[5])?intLottoList[5]:0),
                                ],
                              ),
                            ),
                          ),
                          Text(rank!)

                        ],
                      );
                    });
              })
      ));


}









makeRound() {

  var fixRound = 1011;
  var fixDate = tz.TZDateTime(tz.local, 2022, 4, 16, 20, 50, 0);
  var now = tz.TZDateTime.now(tz.local);

  Duration duration = fixDate.difference(now);

  //now가 토요일이 아니라면

  var realRound = fixRound + ((-(duration.inDays) / 7).floor() + 1);

  //now가 토요일이라면





  return realRound;

}

makeRealRound() {


  var fixRound = 1011;
  var fixDate = tz.TZDateTime(tz.local, 2022, 4, 16, 20, 50, 0);
  var now = tz.TZDateTime.now(tz.local);

  Duration duration = fixDate.difference(now);

  var realRound = fixRound + ((-(duration.inDays) / 7).floor());
  return realRound;
}




// makeDate() {
//   var now = tz.TZDateTime.now(tz.local);
//   var saturday = tz.TZDateTime(
//       tz.local,
//       now.year,
//       now.month,
//       now.day +
//           (now.weekday == 7
//               ? 6
//               : now.weekday == 6
//                   ? 0
//                   : now.weekday == 5
//                       ? 1
//                       : now.weekday == 4
//                           ? 2
//                           : now.weekday == 3
//                               ? 3
//                               : now.weekday == 2
//                                   ? 4
//                                   : now.weekday == 1
//                                       ? 5
//                                       : 0));
//   var whenSaturday = DateFormat('yyyy.MM.dd').format(saturday);
//   return whenSaturday;
// }
