import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:lotto/pages/ad_number.dart';
import 'package:provider/provider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../provider/allpages_Provider.dart';
import '../provider/naverSearch_Provider.dart';
import '../widget/mainWidgets.dart';

class LottoMarker extends StatefulWidget {
  @override
  _LottoMarkerState createState() => _LottoMarkerState();
}

class _LottoMarkerState extends State<LottoMarker> {


  getToday() {



    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));
    DateTime now = tz.TZDateTime.now(tz.local); // print('now는${now}');
    DateTime dateTime1 = DateTime(now.year, now.month, now.day);
    // DateTime dateTime1 = DateTime(2022,4,16,20,0,0);

    DateTime dateTime2 = DateTime(
        (DateTime.parse(
            context.read<Mainpage_Store>().patternlottoData['drwNoDate'] ??
                '2022-10-24'))
            .year,
        (DateTime.parse(
            context.read<Mainpage_Store>().patternlottoData['drwNoDate'] ??
                '2022-10-24'))
            .month,
        (DateTime.parse(
            context.read<Mainpage_Store>().patternlottoData['drwNoDate'] ??
                '2022-10-24'))
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

  bool isButtonDisabled = false;

  void handleButtonClick() {
    // print('실행됨111111');
    setState(() {
      _selectedValueinit =  _selectedValueinit+1;
    });
    if (isButtonDisabled) return; // 버튼이 비활성화 상태면 함수 종료

    setState(() {
      isButtonDisabled = true; // 버튼 비활성화
    });

    // 원하는 작업 수행
    context.read<Mainpage_Store>().patternchangeRoundPlus();

    // 일정 시간 후 버튼 활성화
    Future.delayed(Duration(milliseconds:150 ), () {
      setState(() {
        isButtonDisabled = false; // 버튼 다시 활성화
      });
    });
  }
  @override
  void initState() {
    super.initState();
    valueListInit();
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

  List<int> _valueList = [];
  List<int> _valueListinit = [];
  var _selectedValueinit;

  valueListInit() {
    setState(() {

      _valueListinit = List<int>.generate(
          context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] +
              1,
              (int index) => index ).reversed.toList();

      // print(_valueListinit);
      _selectedValueinit =
          context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] ;

      // totalLottoData = getTotalDataList();
    });
  }
selectedminus(){
  setState(() {
    _selectedValueinit =  _selectedValueinit-1;
  });
  context.read<Mainpage_Store>().patternlottoData['drwtNo6'] ==
      null
      ? (){}
      : context.read<Mainpage_Store>().patternchangeRoundMinus();



}
  selectedplus() {
    print('실행됨');

    // getToday() 값을 미리 변수에 저장하여 중복 호출 방지
    var today = getToday();
    var drwtNo6 = context.read<Mainpage_Store>().patternlottoData['drwtNo6'];

    if (today == null || (today <= 0 && today > -7) || drwtNo6 == null) {
      print('실행됨123');
      // 필요한 동작 추가
    } else {
      handleButtonClick(); // 클릭 핸들러 호출
    }
  }




  selectedwhen(){
    return Container(
      // height:  MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffe5e5e5), width: 10),
          color: const Color(0xfff8f8f8),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 15),
      child: Column(
        children: [
          // AutoSizeText('${getToday()}', ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    padding: EdgeInsets.fromLTRB(0, 5.sp, 0, 0),
                    child: context
                        .watch<Mainpage_Store>()
                        .patternlottoData['drwNoDate'] ==
                        null
                        ? (context
                        .watch<naverSearch_FirstNum_Store>()
                        .naverSearch_FirstNum
                        .isEmpty
                        ? const CircularProgressIndicator()
                        : AutoSizeText(
                      '${context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[10]}',
                      style: TextStyle(
                          color: const Color(0xff767676),
                          fontSize: 20.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold),
                    ))
                        : AutoSizeText(
                      textAlign: TextAlign.center,
                      DateFormat('yyyy.MM.dd').format(DateTime.parse(context
                          .watch<Mainpage_Store>()
                          .patternlottoData['drwNoDate'])),
                      style: TextStyle(
                          color: const Color(0xff767676),
                          fontSize: 20.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold),
                    )),


                Container(
                  padding:  EdgeInsets.fromLTRB(0, 0, 0, 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: AnimatedButton(

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
                            onPressed:selectedminus,

                            width: 50.0.sp,
                            height: 50.0.sp,
                            enabled: true,
                          ),
                        ),
                      ),









                      Flexible(
                        flex:2,
                        child: Center(
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownSearch<int>(
                                  selectedItem: context.watch<Mainpage_Store>().patternRound,
                                  items: (String filter, LoadProps? loadProps) async {
                                    // 입력된 필터에 따라 항목을 필터링
                                    return _valueListinit
                                        .where((item) =>
                                        item.toString().contains(filter))
                                        .toList();
                                  },
                                  popupProps: PopupProps.menu(
                                    menuProps: MenuProps(align: MenuAlign.topCenter
                                    ),
                                // listViewProps: ListViewProps(),
                                    searchFieldProps: TextFieldProps(
                                        style: TextStyle(
                                          color: Color(0xffd43301),
                                            fontFamily: 'Pretendard',
                                            fontSize: MediaQuery.of(context).size.width * 0.08)),
                                    scrollbarProps: ScrollbarProps(
                                        thickness: 20,
                                        thumbVisibility: true,
                                        trackVisibility: true),
                                    showSearchBox: true,
                                    // suggestedItemProps: SuggestedItemProps(suggestedItemsAlignment: MainAxisAlignment.center)
                                    itemBuilder: (BuildContext context, int item,
                                        bool isSelected, bool isHighlighted) {
                                      return Container(
                                        padding: const EdgeInsets.all(10.0),
                                        // 항목의 패딩 조절
                                        color: isHighlighted
                                            ? Colors.grey[300]
                                            : Colors.transparent,
                                        // 강조 표시 색상 설정
                                        child: Text(
                                          // textAlign: TextAlign.center,
                                          item.toString(),
                                          style: TextStyle(
                                              // color: Color(0xffd43301),
                                              fontFamily: 'Pretendard',
                                              fontSize: MediaQuery.of(context).size.width * 0.08), // 항목의 글꼴 크기 설정
                                        ),
                                      );
                                    },
                                  ),
                                  decoratorProps: DropDownDecoratorProps(

                                    baseStyle: TextStyle(
                                        color: Color(0xffd43301),
                                        fontFamily: 'Pretendard',
                                        fontSize:MediaQuery.of(context).size.width * 0.08


                                    ),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(


                                      // iconColor: Colors.red,

                                      // isDense: true,
                                       // contentPadding:EdgeInsets.fromLTRB(0,0,0,0) ,
                                      // isCollapsed: true,
                                        border: InputBorder.none
                                      // labelText: "회차선택",
                                      // border: OutlineInputBorder(),
                                    ),
                                  ),
                                  onChanged: (newVal) {
                                    // totalLottoData가 비어있는지 확인
                                    context.read<Mainpage_Store>().patternRoundselected(newVal!);
                                    // setState(() {
                                    //   _selectedValueinit = newVal!;
                                    //
                                    // });
                                  },
                                ),
                              ),
                              AutoSizeText('회',
   style:  TextStyle(
    color: Color(0xffd43301),
    fontFamily: 'Pretendard',
    fontSize:MediaQuery.of(context).size.width * 0.08


    )
                              )
                            ],
                          ),
                        ),
                      ),



                      // context.watch<Mainpage_Store>().patternlottoData['drwNo'] == null
                      //     ? (context
                      //     .watch<naverSearch_FirstNum_Store>()
                      //     .naverSearch_FirstNum
                      //     .isEmpty
                      //     ? const CircularProgressIndicator()
                      //     : AutoSizeText(
                      //     '${context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[9]}',
                      //     style: TextStyle(
                      //       fontSize: 35.sp,
                      //       fontWeight: FontWeight.w900,
                      //       color: const Color(0xffd43301),
                      //     )))
                      //     : AutoSizeText(
                      //     '${context.watch<Mainpage_Store>().patternlottoData['drwNo']}회',
                      //     style: TextStyle(
                      //       fontSize: 35.sp,
                      //       fontWeight: FontWeight.w900   ,
                      //       fontFamily: 'Pretendard',
                      //       color: const Color(0xffd43301),
                      //     )),








                      Flexible(
                        flex: 1,
                        child: Center(
                          child: AnimatedButton(
                            child: AutoSizeText(
                              textAlign: TextAlign.center,
                              '→',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30.sp),
                            ),
                            color: Colors.blue,
                            onPressed:selectedplus,
                            width: 50.0.sp,
                            height: 50.0.sp,
                            enabled: (() {
                              print('getToday(): ${getToday()}');
                              print('patternlottoData[drwtNo6]: ${context.watch<Mainpage_Store>().patternlottoData['drwtNo6']}');
                              print('isButtonDisabled: $isButtonDisabled');

                              return (getToday() == null ||
                                  (getToday()! <= 0 && getToday()! > -7) ||
                                  context.watch<Mainpage_Store>().patternlottoData['drwtNo6'] == null)
                                  ? false
                                  : !isButtonDisabled;
                            })(),


                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5.sp, 0, 0),
            padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.black12,width: 2.0),
              color: Color(0xffe5e5e5),
              // color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),

              boxShadow : [
                BoxShadow (
                  color : Colors.grey.shade600,
                  spreadRadius : 0.1 ,
                  blurRadius : 10 ,
                  offset : const Offset ( 5 , 5 ),
                ),
                const BoxShadow (
                    color : Colors.white,
                    offset : Offset (- 1 ,- 1 ),
                    blurRadius : 15 ,
                    spreadRadius : 1
                ),
              ],
              // gradient : LinearGradient (
              //   begin : Alignment.topLeft,
              //   end : Alignment.bottomRight,
              //   colors : [
              //     Colors.grey.shade200,
              //     Colors.grey.shade300,
              //     Colors.grey.shade400,
              //     Colors.grey.shade500,
              //   ],
              // ),





            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                context.watch<Mainpage_Store>().patternlottoData['drwtNo1'] == null
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
                    context.watch<Mainpage_Store>().patternlottoData['drwtNo1']),
                context.watch<Mainpage_Store>().patternlottoData['drwtNo2'] == null
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
                    context.watch<Mainpage_Store>().patternlottoData['drwtNo2']),
                context.watch<Mainpage_Store>().patternlottoData['drwtNo3'] == null
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
                    context.watch<Mainpage_Store>().patternlottoData['drwtNo3']),
                context.watch<Mainpage_Store>().patternlottoData['drwtNo4'] == null
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
                    context.watch<Mainpage_Store>().patternlottoData['drwtNo4']),
                context.watch<Mainpage_Store>().patternlottoData['drwtNo5'] == null
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
                    context.watch<Mainpage_Store>().patternlottoData['drwtNo5']),
                context.watch<Mainpage_Store>().patternlottoData['drwtNo6'] == null
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
                    context.watch<Mainpage_Store>().patternlottoData['drwtNo6']),
                const Icon(Icons.add),
                context.watch<Mainpage_Store>().patternlottoData['bnusNo'] == null
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
                    context.watch<Mainpage_Store>().patternlottoData['bnusNo']),
              ],
            ),
          ),

        ],
      ),
    );
  }






















  bool showLines = false;



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final Map<int, Offset> numberPositions = {
      for (int i = 1; i <= 45; i++)

        i: Offset(
          (MediaQuery.of(context).size.height <=640)?0.322 + ((i - 1) % 7) * 0.0552 :
          (MediaQuery.of(context).size.height <= 712)?0.272 + ((i - 1) % 7) * 0.0710   :
           (MediaQuery.of(context).size.height <= 760)?0.262 + ((i - 1) % 7) * 0.074   :
          (MediaQuery.of(context).size.height <=830)?0.25   + ((i - 1) % 7) * 0.0782:
          (MediaQuery.of(context).size.height <=851)?0.235    + ((i - 1) % 7) * 0.0825:
          (MediaQuery.of(context).size.height <=883)?0.209   + ((i - 1) % 7) * 0.0905:
          (MediaQuery.of(context).size.height <=915)?0.158    + ((i - 1) % 7) * 0.107:
          0.22 + ((i - 1) % 7) * 0.0865,


    (MediaQuery.of(context).size.height <=640)?0.1805 + (i - 1) ~/ 7 * 0.12:
    (MediaQuery.of(context).size.height <=712)?0.168 + (i - 1) ~/7 * 0.113 :
    (MediaQuery.of(context).size.height <=760)?0.177 + (i - 1) ~/7 * 0.1175 :
      (MediaQuery.of(context).size.height <=830)?0.1815   + (i - 1) ~/ 7 * 0.12    :
      (MediaQuery.of(context).size.height <=851)? 0.183   + (i - 1) ~/ 7 * 0.12:
      (MediaQuery.of(context).size.height <=883)? 0.1765   + (i - 1) ~/ 7 * 0.12:
      (MediaQuery.of(context).size.height <=915)? 0.183   + (i - 1) ~/ 7 * 0.12:
      0.183 + (i - 1) ~/ 7 * 0.1195,


        ),
    };
    double imageWidth = 300.0;
    double imageHeight = (MediaQuery.of(context).size.height <=640)? 255:
    (MediaQuery.of(context).size.height <=760)? 350:
    (MediaQuery.of(context).size.height <=830)? 360:
    (MediaQuery.of(context).size.height <=851)? 383:
    (MediaQuery.of(context).size.height <=883)? 420:
    (MediaQuery.of(context).size.height <=915)? 498:
    // (MediaQuery.of(context).size.height <=960)? 580:
    400.0;

    final List<int> selectedNumbers = [






      context.watch<Mainpage_Store>().patternlottoData['drwtNo1'] ?? 0,
      context.watch<Mainpage_Store>().patternlottoData['drwtNo2'] ?? 0,
      context.watch<Mainpage_Store>().patternlottoData['drwtNo3'] ?? 0,
      context.watch<Mainpage_Store>().patternlottoData['drwtNo4'] ?? 0,
      context.watch<Mainpage_Store>().patternlottoData['drwtNo5'] ?? 0,
      context.watch<Mainpage_Store>().patternlottoData['drwtNo6'] ?? 0,





    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff8f8f8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen by popping the current route
            Navigator.of(context).pop();
          },),
        centerTitle: true,
        title: Container(

          padding:  EdgeInsets.fromLTRB(0, 7.sp, 0, 0),
          child:
          // Row(
          //   children: [
          // ElevatedButton(onPressed: (){testclear();}, child: Text('테스트버튼')),
          AutoSizeText(
            '로또용지 패턴보기',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w100,
                fontFamily: 'Pretendard'),
            textAlign: TextAlign.center,
          ),
          // ],

        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          selectedwhen(),


          Expanded(
            child: Container(
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: imageWidth,
                      height: imageHeight,
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/loto.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          if (showLines)
                            CustomPaint(
                              size: Size(imageWidth, imageHeight),
                              painter: LinePainter(
                                positions: selectedNumbers
                                    .map((num) => Offset(
                                  numberPositions[num]!.dx * imageWidth + 5, // 중심 좌표 보정
                                  numberPositions[num]!.dy * imageHeight + 10, // 중심 좌표 보정
                                ))
                                    .toList(),
                              ),
                            ),
                          ...selectedNumbers.map((number) {
                            if (numberPositions.containsKey(number)) {
                              Offset position = numberPositions[number]!;
                              return Positioned(
                                left: position.dx * imageWidth,
                                top: position.dy * imageHeight,
                                child: Container(
                                  width: (MediaQuery.of(context).size.height <=640)?7 :
                                  (MediaQuery.of(context).size.height <=760)? 9:
                                  (MediaQuery.of(context).size.height <=830)? 9:
                                  (MediaQuery.of(context).size.height <=851)? 10:
                                  (MediaQuery.of(context).size.height <=883)? 11:
                                  (MediaQuery.of(context).size.height <=915)? 12:
                                  10,
                                  height: (MediaQuery.of(context).size.height <=640)?15 :
                                  (MediaQuery.of(context).size.height <=760)? 18:
                                  (MediaQuery.of(context).size.height <=830)? 20:
                                  (MediaQuery.of(context).size.height <=851)? 20:
                                  (MediaQuery.of(context).size.height <=915)? 25:
                                  20,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              );
                            }
                            return SizedBox.shrink();
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,10),
            child:SizedBox(
              // height:  (MediaQuery.of(context).size.height <=1280)?MediaQuery.of(context).size.height*0.05 :null,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    print(MediaQuery.of(context).size.width);
                    print(MediaQuery.of(context).size.height);
                    print(MediaQuery.of(context).devicePixelRatio);
                    showLines = !showLines;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, // 텍스트 색상
                  backgroundColor: Colors.redAccent, // 배경 색상
                  padding: EdgeInsets.symmetric(vertical: (MediaQuery.of(context).size.height <=830)?0 :15, horizontal: 0), // 패딩 조절
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // 둥근 모서리
                    side: BorderSide(color: Colors.red, width: 2), // 테두리 설정
                  ),
                  elevation: 8, // 그림자 효과 강화
                  shadowColor: Colors.black54, // 그림자 색상
                ).copyWith(
                  // shadowColor: Colors.red.withOpacity(0.5), // 버튼 클릭 시 그림자 색상
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // 텍스트 중앙 정렬
                  children: [
                    Icon(
                      showLines ? Icons.visibility_off : Icons.visibility, // 아이콘 변경
                      size: 24, // 아이콘 크기
                    ),
                    SizedBox(width: 8), // 아이콘과 텍스트 사이 여백
                    AutoSizeText(
                      softWrap: true,
                      showLines ? '선 숨기기' : '선 표시하기',
                      style: TextStyle(
                        fontSize:
                        (MediaQuery.of(context).size.height <=760)?15 :
                        (MediaQuery.of(context).size.height <=830)?15 :

                        20, // 텍스트 크기
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.bold, // 텍스트 두께
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child:returnAd()

      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final List<Offset> positions;

  LinePainter({required this.positions});

  @override
  void paint(Canvas canvas, Size size) {
    if (positions.isEmpty) return;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < positions.length - 1; i++) {
      canvas.drawLine(positions[i], positions[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
