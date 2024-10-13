
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lotto/provider/store1.dart';
import 'package:lotto/widget/base_map.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:provider/provider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class button3Page extends StatefulWidget {
  const button3Page({Key? key}) : super(key: key);

  @override
  _button3PageState createState() => _button3PageState();
}

class _button3PageState extends State<button3Page> {

  getToday() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));
    DateTime now = tz.TZDateTime.now(tz.local); // print('now는${now}');
    DateTime dateTime1 = DateTime(now.year, now.month, now.day);
    DateTime dateTime2 = DateTime(
        (DateTime.parse(
                context.watch<Store1>().placeLottoData['drwNoDate'] ?? '2022-10-24'))
            .year,
        (DateTime.parse(
                context.watch<Store1>().placeLottoData['drwNoDate'] ?? '2022-10-24'))
            .month,
        (DateTime.parse(
                context.watch<Store1>().placeLottoData['drwNoDate'] ?? '2022-10-24'))
            .day);
    Duration duration = dateTime2.difference(dateTime1);
    return duration.inDays;
  }

  seta(i) async {
    NaverMapController controller = await context.read<Store1>().abc.future;

    var cameraUpdate = CameraUpdate.toCameraPosition(CameraPosition(
      target: LatLng(context.read<Store1>().MarkerWhere[i][1],
          context.read<Store1>().MarkerWhere[i][0]),
      zoom: 12.0,
    ));

    controller.moveCamera(cameraUpdate);
  }

  setBasicPosition() async {
    NaverMapController controller = await context.read<Store1>().abc.future;
    var cameraUpdate = CameraUpdate.toCameraPosition(const CameraPosition(
      target: LatLng(35.8, 127.6),
      zoom: 5,
    ));
    controller.moveCamera(cameraUpdate);
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
          ),
        ),
        body: Column(
          children: [
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
                children: [
                  // Text('${getToday()}', ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: (context
                                        .watch<Store1>()
                                        .placeLottoData['drwNoDate'] ==
                                    null
                                ? Text(
                                    DateFormat('yyyy.MM.dd').format(DateTime.parse(context.watch<Store1>().lottoData['drwNoDate'])),
                                    style: const TextStyle(
                                      color: Color(0xff767676),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    DateFormat('yyyy.MM.dd').format(DateTime.parse(context.watch<Store1>().placeLottoData['drwNoDate'])),
                                    style: const TextStyle(
                                      color: Color(0xff767676),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))),
                        Container(
                          padding:  EdgeInsets.fromLTRB(0, 0, 0, 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    context.read<Store1>().placeMinus();
                                    setBasicPosition();
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 0),
                                    minimumSize: Size(50.0.w, 35.0.h),
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                    ),

                                  ),
                                  child:  Text(
                                    '<',
                                    style: TextStyle(
                                      color: Colors.white,
                                        fontFamily: 'Jua',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 30.sp),
                                  )),
                              (context
                                          .watch<Store1>()
                                          .placeLottoData['drwNo'] ==
                                      null
                                  ? Text(
                                      '${context.watch<Store1>().lottoRound}회',
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xffd43301),
                                      ))
                                  : Text(
                                      '${context.watch<Store1>().placeLottoData['drwNo']}회',
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xffd43301),
                                      ))),
                              ElevatedButton(
                                  onPressed: (getToday() == null ||
                                          (getToday()! <= 0 &&
                                              getToday()! > -7))
                                      ? null
                                      : () {
                                          context.read<Store1>().placePlus();
                                          setBasicPosition();
                                        },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 0),
                                    minimumSize: Size(50.0.w, 35.0.h),
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                    ),

                                  ),
                                  // context.read<Store1>().changeRoundPlus();

                                  child:  Text(
                                    '>',
                                    style: TextStyle(
                                      color:Colors.white,
                                        fontFamily: 'Jua',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 30.sp),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: Stack(children: [
                // BaseMapPage(controller:_controller),
                const BaseMapPage(),
                Positioned(
                    top: 250,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: () {
                        setBasicPosition();
                      },
                      child: const Text("전체보기",
                          style: TextStyle(
                            color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20)),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        minimumSize: Size(20.0.w, 35.0.h),
                      ),
                    ))
              ]),
            ),
            Expanded(
              child: Container(
                child: ListView.separated(
                  itemCount:
                      context.watch<Store1>().firstLottoPlaceSet.length - 1,
                  itemBuilder: (c, i) {
                    return GestureDetector(
                        onTap: () {
                          seta(i);


                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Text('${i + 1}',
                                      style: const TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                              Expanded(
                                flex: 13,
                                child: Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${context.watch<Store1>().firstLottoPlaceSet[i][0].trim()}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w200,
                                              fontFamily: 'Jua'),
                                        ),
                                        Text(
                                          '${context.watch<Store1>().firstLottoPlaceSet[i][1].trim()}',
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ]),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  height: 50,
                                  child: Row(children: [
                                    Text(
                                      '${context.watch<Store1>().firstWay[i].trim()} ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: context
                                                      .watch<Store1>()
                                                      .firstWay[i]
                                                      .trim() ==
                                                  '반자동'
                                              ? 14
                                              : 20,
                                          fontFamily: 'Jua'),
                                    ),
                                    Image.asset(
                                      'assets/mark.png',
                                      width: 30,
                                      height: 30,
                                    )
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                  separatorBuilder: (c, i) {
                    return const Divider(thickness: 1);
                  },
                ),
              ),
            )
          ],
        ));
  }
}
