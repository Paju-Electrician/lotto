import 'package:auto_size_text/auto_size_text.dart';
import 'package:charts_painter/chart.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotto/pages/DirectInput.dart';
import 'package:lotto/provider/naverSearch_Provider.dart';
import 'package:lotto/widget/mainWidgets.dart';
import 'package:provider/provider.dart';
import 'package:cp949/cp949.dart' as cp949;

import 'ad_number.dart';

class button8Page extends StatefulWidget {
  const button8Page({Key? key}) : super(key: key);

  @override
  State<button8Page> createState() => _button8PageState();
}

class _button8PageState extends State<button8Page> {



  final List _bonusValueList = ['포함', '미포함'];
  var _bonusValue = '포함';

  List _firstRoundList = [];
  var _firstRound;

  List _secondRoundList = [];
  var _secondRound;

  var a;

  var selectNum = 1;

  makeSelectNum(i) {
    setState(() {
      selectNum = i;
    });
    // print(selectNum);
    // print('바뀜');
  }

  bool _isLoading = true;

  Future<void> _loadWhatMaxNumData() async {
    // 데이터 로드 함수
    await whatMaxNum();
    setState(() {
      _isLoading = false; // 데이터 로딩 완료
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    button8ListInit();
    getButton8Info();
    super.initState();
    _loadWhatMaxNumData();
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

    // FocusNode의 포커스 상태 변화 감지
    _focusNode.addListener(() {
      setState(() {}); // 상태를 업데이트하여 UI를 다시 그리도록 합니다.
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose

    print('dispose실행됨');

    banner!.dispose();
    _focusNode.dispose(); // 메모리 누수를 방지하기 위해 FocusNode를 dispose 합니다.
    super.dispose();
  }

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

  button8ListInit() {
    setState(() {
      _firstRoundList = List<int>.generate(
          context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11],
          (int index) => index + 1);
      _secondRoundList = List<int>.generate(
          context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11],
          (int index) => index + 1).reversed.toList();

      _firstRound = 1;
      _secondRound =
          context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11];
    });
  }

  var postMap = <String, dynamic>{};
  var typpostMap = <String, dynamic>{};

  getButton8Info() async {
    setState(() {
      if (_bonusValue == '포함') {
        postMap['sltBonus'] = '1';
      } else {
        postMap['sltBonus'] = '0';
      }
      postMap['sttDrwNo'] = _firstRound.toString();
      postMap['edDrwNo'] = _secondRound.toString();
      // print(postMap);
    });

    var placeResponse = await http.post(
        Uri.parse(
            'https://www.dhlottery.co.kr/gameResult.do?method=statByNumber'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: postMap);
    var responseBody = cp949.decode(placeResponse.bodyBytes);
    BeautifulSoup bs = BeautifulSoup(responseBody);
    // print(bs);
    var d = bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .findAll('tr')
        .toList();
    // print(d);
    //
    var e = [];
    for (var a in d) {
      e.add(a.nextElement!.nextElement!.nextElement!.nextElement!.nextElement!
          .nextElement!
          .getText());
    }

    setState(() {
      a = int.parse(e[selectNum - 1]);
    });
    e.clear();
    whatMaxNum();

    // notifyListeners();
  }

  var makeAbool = false;
  var e = [];
  var typE = [];

  whatMaxNum() async {
    setState(() {
      typpostMap['srchType'] = 'dir';
      typpostMap['sltBonus'] = postMap['sltBonus'];
      typpostMap['sttDrwNo'] = postMap['sttDrwNo'];
      typpostMap['edDrwNo'] = postMap['edDrwNo'];
    });
    var placeResponse = await http.post(
        Uri.parse(
            'https://www.dhlottery.co.kr/gameResult.do?method=statByNumber'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: typpostMap);

    var responseBody = cp949.decode(placeResponse.bodyBytes);
    BeautifulSoup bs = BeautifulSoup(responseBody);
    var d = bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .findAll('tr')
        .toList();
    typE.clear();
    for (var a in d) {
      typE.add(a.nextElement!.nextElement!.getText());
    }

    // print('typE는${typE}');
  }

  // maxNum() {
  //   FutureBuilder<dynamic>(
  //       future: whatMaxNum(),
  //       builder: (context, snapshot) {
  //         print(snapshot.data.toString());
  //         print(typE[0]);
  //         print(typE[0]);
  //         if (snapshot.data != null) {
  //           return getBall(int.parse(typE[0]));
  //         } else {
  //           return Text('null1111');
  //         }
  //       }
  //   );}

  makeA() async {
    setState(() {
      makeAbool = true;
      if (_bonusValue == '포함') {
        postMap['sltBonus'] = '1';
      } else {
        postMap['sltBonus'] = '0';
      }
      postMap['sttDrwNo'] = _firstRound.toString();
      postMap['edDrwNo'] = _secondRound.toString();
    });
    var placeResponse = await http.post(
        Uri.parse(
            'https://www.dhlottery.co.kr/gameResult.do?method=statByNumber'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: postMap);

    var responseBody = cp949.decode(placeResponse.bodyBytes);
    BeautifulSoup bs = BeautifulSoup(responseBody);
    var d = bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .findAll('tr')
        .toList();
    e.clear();
    for (var a in d) {
      e.add(a.nextElement!.nextElement!.nextElement!.nextElement!.nextElement!
          .nextElement!
          .getText());
    }

    setState(() {
      a = int.parse(e[selectNum - 1]);
      makeAbool = false;
    });
    whatMaxNum();
    // e.clear();
    return a;
  }

  minMake() {
    List minMax = e.map((e) => int.parse(e).toDouble()).toList();
    minMax.sort();
    return minMax[0];
  }

  MaxMake() {
    List minMax = e.map((e) => int.parse(e).toDouble()).toList();
    minMax.sort();
    return minMax.last;
  }

  middleNumber() {
    List minMax = e.map((e) => int.parse(e)).toList();
    // print(minMax);
    // print(minMax.length);
    // minMax.indexWhere((e) => e==(minMake()+MaxMake())/2||((minMake()+MaxMake())/2).ceil()||((minMake()+MaxMake())/2).floor());
    // print((minMake()+MaxMake())/2);
    // print(((minMake()+MaxMake())/2).ceil());
    // print(((minMake()+MaxMake())/2).floor());
    Set numSet = {};
    // print(  minMax.indexWhere((e) => e==(minMake()+MaxMake())/2||e==((minMake()+MaxMake())/2).ceil()||e==((minMake()+MaxMake())/2).floor(),0));
    Set tempset = {};
    for (int i = 0; i < 45; i++) {
      tempset.add(minMax.indexWhere(
              (e) =>
                  e == (minMake() + MaxMake()) / 2 ||
                  e == ((minMake() + MaxMake()) / 2).ceil() ||
                  e == ((minMake() + MaxMake()) / 2).floor(),
              i) +
          1);
    }
    // for(var e in minMax.in){
    //   if( e==(minMake()+MaxMake())/2||e==((minMake()+MaxMake())/2).ceil()||e==((minMake()+MaxMake())/2).floor()) {
    //     tempset.add();
    //   }
    // }
    tempset.remove(0);
    // print(tempset);

    return tempset;
  }

  final FocusNode _focusNode = FocusNode();




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
      body: Column(children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     IconButton(onPressed: () {
        //       setState(() {
        //
        //
        //       });
        //     }, icon: Icon(Icons.refresh)),
        //     Text('출현/미출현번호',
        //         style: TextStyle(
        //             fontWeight: FontWeight.w500,
        //             fontFamily: 'Pretendard',
        //             fontSize: 30.sp
        //         )),
        //     IconButton(onPressed: null, icon: Icon(null)
        //     )
        //
        //   ],
        // ),
        Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5.h),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffe5e5e5), width: 10.w),
                color: const Color(0xfff8f8f8),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          maxLines: 1,
                          softWrap: true,
                          '보너스번호  ',
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w900),
                        ),
                        DropdownButton(
                          value: _bonusValue,
                          items: _bonusValueList.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: AutoSizeText(
                                value.toString(),
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w900),
                              ),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              _bonusValue = newVal.toString();
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Row(children: [
                            Expanded(
                                child: DropdownSearch<int>(

                                  selectedItem: _firstRound,
                                  items: (String filter, LoadProps? loadProps) async {
                                    // 입력된 필터에 따라 항목을 필터링
                                    return  _firstRoundList
                                        .where((item) => item.toString().contains(filter))
                                        .cast<int>() // List<dynamic>을 List<int>로 변환
                                        .toList(); // List<int>로 변환된 리스트 반환
                                  },
                                  popupProps: PopupProps.menu(
                                    menuProps: MenuProps(align: MenuAlign.topCenter),
                                                          // listViewProps: ListViewProps(),
                                    searchFieldProps: TextFieldProps(
                                        style: TextStyle(fontFamily: 'Pretendard',fontSize: 20.sp),
                                      focusNode: _focusNode, // FocusNode를 여기 설정

                                    ),
                                    scrollbarProps:  ScrollbarProps(thickness: 20,thumbVisibility:true,trackVisibility:true),
                                    showSearchBox: true,
                                    // suggestedItemProps: SuggestedItemProps(suggestedItemsAlignment: MainAxisAlignment.center)
                                    itemBuilder: (BuildContext context, int item, bool isSelected, bool isHighlighted) {
                                      return Container(
                                        padding: const EdgeInsets.all(10.0), // 항목의 패딩 조절
                                        color: isHighlighted ? Colors.grey[300] : Colors.transparent, // 강조 표시 색상 설정
                                        child: Text(
                                          // textAlign: TextAlign.center,
                                          item.toString(),
                                          style: TextStyle(fontFamily: 'Pretendard', fontSize: 25.sp), // 항목의 글꼴 크기 설정
                                        ),
                                      );
                                    },
                                  ),
                                  decoratorProps: DropDownDecoratorProps(
                                    baseStyle: TextStyle(fontFamily: 'Pretendard',fontSize: 25.sp),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none
                                      // labelText: "회차선택",
                                      // border: OutlineInputBorder(),
                                    ),
                                  ),
                                  onChanged: (newVal) {
                                    if (_secondRound >= newVal) {
                                      setState(() {
                                        _firstRound = newVal;
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                              width: 320.w,
                                              content: AutoSizeText(
                                                maxLines: 1,
                                                softWrap: true,
                                                '앞자리 숫자가 뒷자리 숫자보다 클 수 없어요',
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w900),
                                                textAlign: TextAlign.center,
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10.h, 0, 10.h),
                                              backgroundColor: Colors.red,
                                              duration:
                                              const Duration(milliseconds: 1000),
                                              behavior: SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                              )));
                                    }
                                  },
                                ),
                            ),





                            //
                            // DropdownButton(
                            //   value: _firstRound,
                            //   items: _firstRoundList.map((value) {
                            //     return DropdownMenuItem(
                            //       value: value,
                            //       child: AutoSizeText(
                            //         value.toString(),
                            //         style: TextStyle(
                            //             fontSize: 25.sp,
                            //             fontFamily: 'Pretendard',
                            //             fontWeight: FontWeight.w900),
                            //       ),
                            //     );
                            //   }).toList(),
                            //   onChanged: (newVal) {
                            //     if (_secondRound >= newVal) {
                            //       setState(() {
                            //         _firstRound = newVal;
                            //       });
                            //     } else {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //           SnackBar(
                            //               width: 320.w,
                            //               content: AutoSizeText(
                            //                 maxLines: 1,
                            //                 softWrap: true,
                            //                 '앞자리 숫자가 뒷자리 숫자보다 클 수 없어요',
                            //                 style: TextStyle(
                            //                     fontSize: 18.sp,
                            //                     fontWeight: FontWeight.w900),
                            //                 textAlign: TextAlign.center,
                            //               ),
                            //               padding: EdgeInsets.fromLTRB(
                            //                   0, 10.h, 0, 10.h),
                            //               backgroundColor: Colors.red,
                            //               duration:
                            //                   const Duration(milliseconds: 1000),
                            //               behavior: SnackBarBehavior.floating,
                            //               shape: RoundedRectangleBorder(
                            //                 borderRadius:
                            //                     BorderRadius.circular(20),
                            //               )));
                            //     }
                            //   },
                            // ),







                            AutoSizeText('회차  ',
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w900))
                          ]),
                        ),
                        AutoSizeText('~',
                            style: TextStyle(
                                fontSize: 25.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w900)),
                        Expanded(
                          child: Row(children: [




                            Expanded(
                              child: DropdownSearch<int>(

                                selectedItem: _secondRound,
                                items: (String filter, LoadProps? loadProps) async {
                                  // 입력된 필터에 따라 항목을 필터링
                                  return  _secondRoundList
                                      .where((item) => item.toString().contains(filter))
                                      .cast<int>() // List<dynamic>을 List<int>로 변환
                                      .toList(); // List<int>로 변환된 리스트 반환
                                },
                                popupProps: PopupProps.menu(
                                  menuProps: MenuProps(align: MenuAlign.topCenter),
                                  // listViewProps: ListViewProps(),
                                  searchFieldProps: TextFieldProps(maxLines:1,style:TextStyle(fontFamily: 'Pretendard',fontSize: 20.sp)),
                                  scrollbarProps:  ScrollbarProps(thickness: 20,thumbVisibility:true,trackVisibility:true),
                                  showSearchBox: true,
                                  // suggestedItemProps: SuggestedItemProps(suggestedItemsAlignment: MainAxisAlignment.center)
                                  itemBuilder: (BuildContext context, int item, bool isSelected, bool isHighlighted) {
                                    return Container(
                                      padding: const EdgeInsets.all(10.0), // 항목의 패딩 조절
                                      color: isHighlighted ? Colors.grey[300] : Colors.transparent, // 강조 표시 색상 설정
                                      child: Text(
                                        // softWrap: true,
                                        // maxLines: 1,
                                        // textAlign: TextAlign.center,
                                        item.toString(),
                                        style: TextStyle(fontFamily: 'Pretendard', fontSize: 25.sp), // 항목의 글꼴 크기 설정
                                      ),
                                    );
                                  },
                                ),
                                decoratorProps: DropDownDecoratorProps(
                                  baseStyle: TextStyle(fontFamily: 'Pretendard',fontSize: 25.sp),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(

                                      border: InputBorder.none
                                    // labelText: "회차선택",
                                    // border: OutlineInputBorder(),
                                  ),

                                ),
                                onChanged: (newVal) {
                                  if (int.parse(newVal.toString()) >= _firstRound) {
                                    setState(() {
                                      _secondRound = newVal;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            width: 320.w,
                                            content: AutoSizeText(
                                              maxLines: 1,
                                              softWrap: true,
                                              '앞자리 숫자가 뒷자리 숫자보다 클 수 없어요',
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontFamily: 'Pretendard',
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            padding: EdgeInsets.fromLTRB(
                                                10.w, 10.h, 10.w, 10.h),
                                            backgroundColor: Colors.grey,
                                            duration:
                                            const Duration(milliseconds: 1000),
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                            )));
                                  }
                                },
                              ),
                            ),












                            // DropdownButton(
                            //   value: _secondRound,
                            //   items: _secondRoundList.map((value) {
                            //     return DropdownMenuItem(
                            //       value: value,
                            //       child: AutoSizeText(
                            //         value.toString(),
                            //         style: TextStyle(
                            //             fontSize: 25.sp,
                            //             fontFamily: 'Pretendard',
                            //             fontWeight: FontWeight.w900),
                            //       ),
                            //     );
                            //   }).toList(),
                            //   onChanged: (newVal) {
                            //     if (int.parse(newVal.toString()) >= _firstRound) {
                            //       setState(() {
                            //         _secondRound = newVal;
                            //       });
                            //     } else {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //           SnackBar(
                            //               width: 320.w,
                            //               content: AutoSizeText(
                            //                 maxLines: 1,
                            //                 softWrap: true,
                            //                 '앞자리 숫자가 뒷자리 숫자보다 클 수 없어요',
                            //                 style: TextStyle(
                            //                   fontSize: 18.sp,
                            //                   fontFamily: 'Pretendard',
                            //                 ),
                            //                 textAlign: TextAlign.center,
                            //               ),
                            //               padding: EdgeInsets.fromLTRB(
                            //                   10.w, 10.h, 10.w, 10.h),
                            //               backgroundColor: Colors.grey,
                            //               duration:
                            //                   const Duration(milliseconds: 1000),
                            //               behavior: SnackBarBehavior.floating,
                            //               shape: RoundedRectangleBorder(
                            //                 borderRadius:
                            //                     BorderRadius.circular(20),
                            //               )));
                            //     }
                            //   },
                            // ),
                            //
                            //









                            AutoSizeText('회차  ',
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w900))
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),

                if (!_focusNode.hasFocus) ...[
                  e.isEmpty
                      ? Container(child: const AutoSizeText('그래프를 불러오고 있습니다...'))
                      : chartTest(e: e),
                ],

                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        e.isEmpty
                            ? Container(
                                child: const Text('준비중..'),
                              )
                            : Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        AutoSizeText('최대출현번호 : ',
                                            softWrap: true,
                                            style: const TextStyle(
                                                // fontSize: 30.sp,
                                                fontFamily: 'Pretendard')),
                                        _isLoading // 데이터 로딩 상태에 따라 위젯 표시
                                            ?  Expanded(
                                              child: SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: FittedBox(
                                                      fit: BoxFit.fitHeight,
                                                      child:
                                                          // width: 40.w, height: 40.h,
                                                          CircularProgressIndicator())),
                                            )
                                            : Expanded(
                                              child: SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: FittedBox(
                                                      fit: BoxFit.fitHeight,
                                                      child: getBall(
                                                          int.parse(typE[0])))),
                                            ),
                                        AutoSizeText(
                                            softWrap: true,
                                            '  , ${MaxMake().toStringAsFixed(0).toString()} 회',
                                            style: const TextStyle(
                                                // fontSize: 30.sp,
                                                fontFamily: 'Pretendard'))
                                      ],
                                    ),
                                  ],
                                )),
                        e.isEmpty
                            ? Container(
                                child: const Text('준비중..'),
                              )
                            : Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        AutoSizeText('최소출현번호 : ',
                                            style: const TextStyle(
                                                // fontSize: 30.sp,
                                                fontFamily: 'Pretendard')),
                                        _isLoading // 데이터 로딩 상태에 따라 위젯 표시
                                            ?  Expanded(
                                              child: SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: FittedBox(
                                                      fit: BoxFit.fitHeight,
                                                      child:
                                                          // width: 40.w, height: 40.h,
                                                          CircularProgressIndicator())),
                                            )
                                            : Expanded(
                                              child: SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: FittedBox(
                                                      fit: BoxFit.fitHeight,
                                                      child: getBall(
                                                          int.parse(typE[44])))),
                                            ),
                                        AutoSizeText(
                                            '  , ${minMake().toStringAsFixed(0).toString()} 회',
                                            style: const TextStyle(
                                                // fontSize: 30.sp,
                                                fontFamily: 'Pretendard'))
                                      ],
                                    ),
                                  ],
                                )),
                        //
                        // e.isEmpty
                        //     ? Container(
                        //         child: const Text('준비중..'),
                        //       )
                        //     : Container(
                        //         padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                        //         child: Row(
                        //           children: [
                        //             const Column(
                        //               children: [
                        //                 AutoSizeText('중간출현번호 : ',
                        //                     style: TextStyle(
                        //                       // fontSize: 30.sp,
                        //
                        //                       fontFamily: 'Pretendard',
                        //                     )),
                        //                 AutoSizeText('(후나츠사카이)',
                        //                     style: TextStyle(
                        //                       // fontSize: 30.sp,
                        //                       fontFamily: 'Pretendard',
                        //                     )),
                        //               ],
                        //             ),
                        //             Expanded(
                        //               child: Container(
                        //                 decoration: BoxDecoration(
                        //                     border: Border.all(
                        //                         color: Colors.black)),
                        //                 child: AutoSizeText(
                        //                     middleNumber()
                        //                         .toString()
                        //                         .replaceAll('{', '')
                        //                         .replaceAll('}', ''),
                        //                     style: TextStyle(
                        //                         // fontSize: 30.sp,
                        //                         fontFamily: 'Pretendard',
                        //                         color: Colors.red)),
                        //               ),
                        //             ),
                        //           ],
                        //         )),
                      ],
                    )),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child: getBall(selectNum))),
                                ),
                                const AutoSizeText(' 의 출현횟수 : ',
                                    style: TextStyle(
                                        // fontSize: 30.sp,
                                        fontFamily: 'Pretendard')),
                                a == null || makeAbool == true
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child:
                                                // width: 40.w, height: 40.h,
                                                CircularProgressIndicator()))
                                    : FutureBuilder<dynamic>(
                                        future: makeA(),
                                        builder: (context, snapshot) {
                                          if (snapshot.data != null) {
                                            return Row(
                                              children: [
                                                AutoSizeText(
                                                    snapshot.data.toString(),
                                                    style: const TextStyle(
                                                        // fontSize: 40.sp,
                                                        fontFamily:
                                                            'Pretendard',
                                                        color: Colors.blue)),
                                                const AutoSizeText('회',
                                                    style: TextStyle(
                                                        // fontSize: 40.sp,
                                                        fontFamily:
                                                            'Pretendard')),
                                              ],
                                            );
                                          } else {
                                            return const SizedBox(
                                                height: 20,
                                                width: 20,
                                                child: FittedBox(
                                                    fit: BoxFit.fitHeight,
                                                    child:
                                                        CircularProgressIndicator()));
                                          }
                                        })
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child: getBall(selectNum))),
                                ),
                                const AutoSizeText(' 의 미출현횟수 : ',
                                    style: TextStyle(
                                        // fontSize: 30.sp,
                                        fontFamily: 'Pretendard')),
                                a == null
                                    ?  Expanded(
                                      child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: FittedBox(
                                              fit: BoxFit.fitHeight,
                                              child:
                                                  // width: 40.w, height: 40.h,
                                                  CircularProgressIndicator())),
                                    )
                                    : Row(
                                        children: [
                                          AutoSizeText(
                                              '${_secondRound - _firstRound != 0 ? (_secondRound - _firstRound - a + 1).toString() : 1 - a}',
                                              style: const TextStyle(
                                                  // fontSize: 40.sp,
                                                  fontFamily: 'Pretendard')),
                                          const AutoSizeText('회',
                                              style: TextStyle(
                                                  // fontSize: 40.sp,
                                                  fontFamily: 'Pretendard')),
                                        ],
                                      )
                              ],
                            ),
                            Row(children: [
                              Expanded(
                                child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: FittedBox(
                                        fit: BoxFit.fitHeight,
                                        child: getBall(selectNum))),
                              ),
                              const AutoSizeText(' 의 출현확률 :',
                                  style: TextStyle(
                                      // fontSize: 30.sp,
                                      fontFamily: 'Pretendard')),
                              a == null
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child:
                                              // width: 40.w, height: 40.h,
                                              CircularProgressIndicator()))
                                  : AutoSizeText(
                                      '${(a / (_secondRound - _firstRound + 1) * 100).toStringAsFixed(2)}%',
                                      style: const TextStyle(
                                          // fontSize: 40.sp,
                                          fontFamily: 'Pretendard')),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),

          Expanded(
            child: buttonBox(makeSelectNum: makeSelectNum),
          )


      ]),
      bottomNavigationBar: returnAd(),

      //   Container(
      // decoration: BoxDecoration(
      // image: DecorationImage(image: AssetImage("assets/lotto.png"),fit: BoxFit.fill)
      // ),
      // child: AlertDialog(
      // backgroundColor: Colors.white70,
      // title: AutoSizeText("로또당첨자가 새로운 기능이 추가되었습니다. 업데이트 한번 부탁드립니다! 당신의 로또 1등을 기원합니다!!",
      // style: TextStyle(fontFamily: "Pretendard", color: Colors.black,fontSize: 20
      // ),),
      // actionsAlignment: MainAxisAlignment.center,
      // actions: [
      // ElevatedButton(onPressed:  null,
      // style: ElevatedButton.styleFrom(onSurface: Colors.blue),
      // child: AutoSizeText("업데이트",style: TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w700 ,color: Colors.blue,fontSize: 30
      // ),))
      // ],
      // ),
      // // MyApp()
      // )
    );
  }
}

class buttonBox extends StatelessWidget {
  buttonBox({Key? key, this.makeSelectNum}) : super(key: key);
  var makeSelectNum;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 0.h),
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
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      makeSelectNum(1);
                    },
                    child: yellowBall(b: 1)),
                GestureDetector(
                    onTap: () {
                      makeSelectNum(2);
                    },
                    child: yellowBall(b: 2)),
                GestureDetector(
                    onTap: () {
                      makeSelectNum(3);
                    },
                    child: yellowBall(b: 3)),
                GestureDetector(
                    onTap: () {
                      makeSelectNum(4);
                    },
                    child: yellowBall(b: 4)),
                GestureDetector(
                    onTap: () {
                      makeSelectNum(5);
                    },
                    child: yellowBall(b: 5)),
                GestureDetector(
                    onTap: () {
                      makeSelectNum(6);
                    },
                    child: yellowBall(b: 6)),
                GestureDetector(
                    onTap: () {
                      makeSelectNum(7);
                    },
                    child: yellowBall(b: 7)),
              ],
            ),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(8);
                      },
                      child: yellowBall(b: 8)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(9);
                      },
                      child: yellowBall(b: 9)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(10);
                      },
                      child: yellowBall(b: 10)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(11);
                      },
                      child: blueBall(b: 11)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(12);
                      },
                      child: blueBall(b: 12)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(13);
                      },
                      child: blueBall(b: 13)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(14);
                      },
                      child: blueBall(b: 14)),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(15);
                      },
                      child: blueBall(b: 15)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(16);
                      },
                      child: blueBall(b: 16)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(17);
                      },
                      child: blueBall(b: 17)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(18);
                      },
                      child: blueBall(b: 18)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(19);
                      },
                      child: blueBall(b: 19)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(20);
                      },
                      child: blueBall(b: 20)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(21);
                      },
                      child: redBall(b: 21)),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(22);
                      },
                      child: redBall(b: 22)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(23);
                      },
                      child: redBall(b: 23)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(24);
                      },
                      child: redBall(b: 24)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(25);
                      },
                      child: redBall(b: 25)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(26);
                      },
                      child: redBall(b: 26)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(27);
                      },
                      child: redBall(b: 27)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(28);
                      },
                      child: redBall(b: 28)),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(29);
                      },
                      child: redBall(b: 29)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(30);
                      },
                      child: redBall(b: 30)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(31);
                      },
                      child: greyBall(b: 31)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(32);
                      },
                      child: greyBall(b: 32)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(33);
                      },
                      child: greyBall(b: 33)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(34);
                      },
                      child: greyBall(b: 34)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(35);
                      },
                      child: greyBall(b: 35)),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(36);
                      },
                      child: greyBall(b: 36)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(37);
                      },
                      child: greyBall(b: 37)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(38);
                      },
                      child: greyBall(b: 38)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(39);
                      },
                      child: greyBall(b: 39)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(40);
                      },
                      child: greyBall(b: 40)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(41);
                      },
                      child: greenBall(b: 41)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(42);
                      },
                      child: greenBall(b: 42)),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(43);
                      },
                      child: greenBall(b: 43)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(44);
                      },
                      child: greenBall(b: 44)),
                  GestureDetector(
                      onTap: () {
                        makeSelectNum(45);
                      },
                      child: greenBall(b: 45)),
                  const xColorBall(),
                  const xColorBall(),
                  const xColorBall(),
                  const xColorBall(),
                ]),
          )
        ]));
  }
}

class chartTest extends StatefulWidget {
  chartTest({Key? key, this.e}) : super(key: key);
  var e;

  @override
  State<chartTest> createState() => _chartTestState();
}

class _chartTestState extends State<chartTest> {
  minMake() {
    List minMax = widget.e.map((e) => int.parse(e).toDouble()).toList();
    minMax.sort();
    return minMax[0];
  }

  MaxMake() {
    List minMax = widget.e.map((e) => int.parse(e).toDouble()).toList();
    minMax.sort();
    return minMax.last;
  }

  @override
  Widget build(BuildContext context) {
    return Chart<void>(
      // height: 600.0,
      // width: double.infinity,
      state: ChartState(
        ChartData(
          [
            widget.e.isNotEmpty // widget.e 리스트가 비어 있지 않은지 확인
                ? List<ChartItem>.generate(
                    widget.e.length, // widget.e 리스트의 길이만큼 ChartItem 객체 생성
                    (i) => ChartItem(
                        i,
                        0,
                        widget.e.isNotEmpty &&
                                widget.e.length >
                                    i // widget.e 리스트가 비어 있지 않고 i가 widget.e 리스트의 범위를 벗어나지 않는지 확인
                            ? int.parse(widget.e[i]).toDouble() // 기존 로직 유지
                            : 0.0)) // widget.e 리스트가 비어 있거나 i가 widget.e 리스트의 범위를 벗어나는 경우 0.0으로 채움
                : List<ChartItem>.generate(45, (i) => ChartItem(i, 0, 0.0)),
            // widget.e 리스트가 비어 있는 경우 0.0으로 채움
          ],
          // [
          //   [int.parse(widget.e[0]), int.parse(widget.e[1]), int.parse(widget.e[2]), int.parse(widget.e[3]), int.parse(widget.e[4]), int.parse(widget.e[5]), int.parse(widget.e[6]), int.parse(widget.e[7]), int.parse(widget.e[8]),int.parse(widget.e[9]),int.parse(widget.e[10]),int.parse(widget.e[11]),int.parse(widget.e[12]),int.parse(widget.e[13]),int.parse(widget.e[14]),int.parse(widget.e[15]),int.parse(widget.e[16]),int.parse(widget.e[17]),int.parse(widget.e[18]),int.parse(widget.e[19]),int.parse(widget.e[20]),int.parse(widget.e[21]),int.parse(widget.e[22]),int.parse(widget.e[23]),int.parse(widget.e[24]),int.parse(widget.e[25]),int.parse(widget.e[26]),int.parse(widget.e[27]),int.parse(widget.e[28]),int.parse(widget.e[29]),int.parse(widget.e[30]),int.parse(widget.e[31]),int.parse(widget.e[32]),int.parse(widget.e[33]),int.parse(widget.e[34]),int.parse(widget.e[35]),int.parse(widget.e[36]),int.parse(widget.e[37]),int.parse(widget.e[38]),int.parse(widget.e[39]),int.parse(widget.e[40]),int.parse(widget.e[41]),int.parse(widget.e[42]),int.parse(widget.e[43]),int.parse(widget.e[44])].map((e) => BarValue<void>(e.toDouble())).toList(),
          //
          //
          //
          // ],

          axisMax: MaxMake() * 1.5,
          axisMin: 0,
          // valueAxisMaxOver: 150
        ),
        behaviour: const ChartBehaviour(
          // 1) Make sure the chart can scroll
          isScrollable: true,
          // scrollSettings: ScrollSettings.noneㅊ
        ),
        itemOptions: BarItemOptions(
          // color: Colors.black,
          colorForKey: (i, key) {
            // print('item1은${i}');
            // print(key.horizontalSpace)
            // print(ChartData(_items))
            // return [Colors.green, Colors.red, Colors.blue][1];
            // key[0][]
            //  print('key는${key}');
            if (i.value < 10) {
              return const Color(0xfffbc400);
            } else if (i.value > 9 && i.value < 20) {
              return const Color(0xff69c8f2);
            } else if (i.value > 19 && i.value < 30) {
              return const Color(0xffff7272);
            } else if (i.value > 29 && i.value < 40) {
              return const Color(0xffaaaaaa);
            } else {
              return const Color(0xffb0d840);
            }
            // //   // return [Colors.green, Colors.red, Colors.blue][key];
          },
          // colorForValue: (Color, value,[i]) {
          //   // if(value!>=130){
          //   //   return Colors.red;
          //   // }
          //
          //   print(value);
          //   print([i]);
          //   print(i);
          //
          //
          //   return [Colors.green, Colors.red, Colors.blue][0];
          // },
          maxBarWidth: 4.0.w,
          padding: EdgeInsets.symmetric(horizontal: 2.1.w),
          // multiValuePadding: EdgeInsets.symmetric(horizontal: 1.w),
          radius: const BorderRadius.vertical(top: Radius.circular(42.0)),
        ),
        backgroundDecorations: [
          GridDecoration(
            textStyle: const TextStyle(color: Colors.black, fontSize: 5),
            // textScale: 0.1,
            // showHorizontalValues: true,
            verticalAxisValueFromIndex: (int) {
              return (int + 1).toString();
            },
            showVerticalValues: true,
            verticalAxisStep: 1,
            horizontalAxisStep: 1,
          ),
        ],
        foregroundDecorations: [
          BorderDecoration(borderWidth: 2.0),
          TargetLineDecoration(
              target: minMake(),
              targetLineColor: Colors.black,
              dashArray: [5.0]),
          TargetLineDecoration(
              target: MaxMake(),
              targetLineColor: Colors.black,
              dashArray: [5.0]),
          TargetLineDecoration(
              target: (MaxMake() + minMake()) / 2, targetLineColor: Colors.red)
        ],
      ),
    );
  }
}
