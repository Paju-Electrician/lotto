import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lotto/pages/lottoNumber.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:lotto/provider/allpages_Provider.dart';
import 'package:lotto/provider/naverSearch_Provider.dart';
import 'package:lotto/widget/mainWidgets.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'ad_number.dart';
import 'lottoNumber.dart';

class button7Page extends StatefulWidget {
  const button7Page({Key? key}) : super(key: key);

  @override
  State<button7Page> createState() => _button7PageState();
}

class _button7PageState extends State<button7Page> {
  final ItemScrollController _scrollController = ItemScrollController();

  // int downward_num=0;
  // upNum(){
  //   setState(() {
  //     if(downward_num!=0) {
  //       downward_num = downward_num - 10;
  //     }else{
  //       return;
  //     }
  //   });
  // }
  // downNum(){
  //   setState(() {
  //     downward_num = downward_num+10;
  //   });
  // }

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

  // List totalLottoData = [];
  List<int> _valueList = [];
  List<int> _valueListinit = [];
  var _selectedValue = 1;
  var _selectedValueinit;

  valueListInit() {
    setState(() {
      _valueList = List<int>.generate(
          context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] +
              1,
          (int index) => index + 1);
      _valueListinit = List<int>.generate(
          context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] +
              1,
          (int index) => index + 1).reversed.toList();

      // print(_valueListinit);
      _selectedValueinit =
          context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] +
              1;

      // totalLottoData = getTotalDataList();
    });
  }

  makeInitContainer(i) {
    if (i ==context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] +1) {

      return Row(
        children: [
          Container(
              // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              alignment: Alignment.centerRight,
              child: (context
                          .watch<Mainpage_Store>()
                          .button5RoundInfo['drwNo'] ==
                      null
                  ? (context
                          .watch<naverSearch_FirstNum_Store>()
                          .naverSearch_FirstNum
                          .isEmpty
                      ? const CircularProgressIndicator()
                      : AutoSizeText(
                          maxLines: 1,
                          softWrap: true,
                          '${context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] + 1}회',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w900,
                            color: const Color(0xffd43301),
                          )))
                  : AutoSizeText(
                      maxLines: 1,
                      softWrap: true,
                      '${context.watch<Mainpage_Store>().button5RoundInfo['drwNo'] + 1}회',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w900,
                        color: const Color(0xffd43301),
                      )))),

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
                  getBall(0),
                  getBall(0),
                  getBall(0),
                  getBall(0),
                  getBall(0),
                  getBall(0),
                ],
              ),
            ),
          ),
        ],
      );
    } else {

      // return totalBallButton7(a: context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] - i);
      return totalBallButton7(a: i-1);

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
          // title: AutoSizeText('로또당첨자가 만든 로또앱'),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        // _scrollController.scrollTo(
                        //     index: context
                        //         .read<Mainpage_Store>()
                        //         .totalLottoData
                        //         .length,
                        //     duration: const Duration(milliseconds: 500));
                      });
                    },
                    icon: const Icon(Icons.refresh)),
                AutoSizeText('로또회귀분석',
                    maxLines: 1,
                    softWrap: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Pretendard',
                        fontSize: 30.sp)),
                const IconButton(onPressed: null, icon: Icon(null))
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.h),
            child: AutoSizeText('*회귀분석: 과거의 규칙이 일정한 간격으로 반복되는 것 ',
                maxLines: 1,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Pretendard',
                    fontSize: 15.sp)),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        child: DropdownSearch<int>(
                            selectedItem: _selectedValueinit,
                            items: (String filter, LoadProps? loadProps) async {
                              // 입력된 필터에 따라 항목을 필터링
                              return _valueListinit
                                  .where((item) =>
                                      item.toString().contains(filter))
                                  .toList();
                            },
                            popupProps: PopupProps.menu(
                              menuProps: MenuProps(align: MenuAlign.topCenter),
// listViewProps: ListViewProps(),
                              searchFieldProps: TextFieldProps(
                                  style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 20.sp)),
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
                                        fontFamily: 'Pretendard',
                                        fontSize: 20.sp), // 항목의 글꼴 크기 설정
                                  ),
                                );
                              },
                            ),
                            decoratorProps: DropDownDecoratorProps(
                              baseStyle: TextStyle(
                                  fontFamily: 'Pretendard', fontSize: 20.sp),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  // contentPadding:EdgeInsets.fromLTRB(0,0,0,0) ,
                                  // isCollapsed: true,
                                  border: InputBorder.none
                                  // labelText: "회차선택",
                                  // border: OutlineInputBorder(),
                                  ),
                            ),
                          onChanged: (newVal) {

                            // totalLottoData가 비어있는지 확인

                            setState(() {
                              _selectedValueinit = newVal!;

                            });



                            // print(newVal);
                            // print(context.read<Mainpage_Store>().totalLottoData.length);
                            //
                            // if (newVal! <=context.read<Mainpage_Store>().totalLottoData.length+1) {
                            //   print(newVal);
                            //   print(context.read<Mainpage_Store>().totalLottoData.length);
                            //   setState(() {
                            //     _selectedValueinit = newVal;
                            //
                            //   });
                            // }else{
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(
                            //       content: Text("로딩중... 다시 선택해주세요"),
                            //       duration: Duration(seconds: 2),
                            //     ),
                            //   );
                            // }





                            // 유효한 인덱스인 경우에만 상태 업데이트

                          },











                        ),
                      ),

                      // DropdownButton<int>(
                      //   value: _selectedValueinit,
                      //   items: _valueListinit.map((int value) {
                      //     return DropdownMenuItem(
                      //       alignment: Alignment.center,
                      //       value: value,
                      //       child: AutoSizeText(value.toString(),
                      //           style: TextStyle(fontSize: 20.sp
                      //             ,fontFamily: 'Pretendard',
                      //
                      //           )),
                      //     );
                      //   }).toList(),
                      //   onChanged: (newVal) {
                      //     setState(() {
                      //       _selectedValueinit = newVal!;
                      //     });
                      //   },
                      // ),

                      AutoSizeText(
                        maxLines: 1,
                        softWrap: true,
                        '회차선택',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DropdownSearch<int>(
                          selectedItem: _selectedValue,
                          items: (String filter, LoadProps? loadProps) async {
                            // 입력된 필터에 따라 항목을 필터링
                            return _valueList
                                .where(
                                    (item) => item.toString().contains(filter))
                                .toList();
                          },
                          popupProps: PopupProps.menu(
                            menuProps: MenuProps(align: MenuAlign.topCenter),
// listViewProps: ListViewProps(),
                            searchFieldProps: TextFieldProps(
                                style: TextStyle(
                                    fontFamily: 'Pretendard', fontSize: 20.sp)),
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
                                      fontFamily: 'Pretendard',
                                      fontSize: 20.sp), // 항목의 글꼴 크기 설정
                                ),
                              );
                            },
                          ),
                          decoratorProps: DropDownDecoratorProps(
                            baseStyle: TextStyle(
                                fontFamily: 'Pretendard', fontSize: 20.sp),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(border: InputBorder.none
                                // labelText: "회차선택",
                                // border: OutlineInputBorder(),
                                ),
                          ),
                          onChanged: (newVal) {
                            if (newVal != null) {
                              setState(() {
                                _selectedValue = newVal;
                              });
                            }
                          },
                        ),
                      ),
                      AutoSizeText('회귀보기',
                          maxLines: 1,
                          softWrap: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Pretendard',
                              fontSize: 20.sp))
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ,style: TextStyle(color: Color(0xff767676),fontSize: 20,fontWeight: FontWeight.bold),)),
          makeInitContainer(_selectedValueinit),
          // Row(
          //   children: [
          //     Container(
          //       // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           (context.watch<Mainpage_Store>().button5RoundInfo['drwNo'] == null
          //               ? (context
          //                       .watch<naverSearch_FirstNum_Store>()
          //                       .naverSearch_FirstNum
          //                       .isEmpty
          //                   ? CircularProgressIndicator()
          //                   : AutoSizeText(
          //                       '${context.watch<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] + 1}회',
          //                       style: TextStyle(
          //                         fontSize: 20.sp,
          //                         fontWeight: FontWeight.w900,
          //                         color: Color(0xffd43301),
          //                       )))
          //               : AutoSizeText(
          //                   '${context.watch<Mainpage_Store>().button5RoundInfo['drwNo'] + 1}회',
          //                   style: TextStyle(
          //                     fontSize: 20.sp,
          //                     fontWeight: FontWeight.w900,
          //                     color: Color(0xffd43301),
          //                   )))
          //         ],
          //       ),
          //     ),
          //     Expanded(
          //       child: Container(
          //         margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.h),
          //         padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
          //         // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          //         decoration: BoxDecoration(
          //           color: Color(0xffe5e5e5),
          //           borderRadius: BorderRadius.only(
          //               topLeft: Radius.circular(10),
          //               topRight: Radius.circular(10),
          //               bottomLeft: Radius.circular(10),
          //               bottomRight: Radius.circular(10)),
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             getBall(0),
          //             getBall(0),
          //             getBall(0),
          //             getBall(0),
          //             getBall(0),
          //             getBall(0),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          Expanded(
            // child: ListView.builder(itemCount:context.watch<Mainpage_Store>().lottoData['drwNo'], itemBuilder: (c,i){
            child: Stack(children: [
                ScrollablePositionedList.builder(
                    // itemCount: context.watch<Mainpage_Store>().totalLottoData.length,
                    itemCount: lottoTotalNumber.length,
                    itemScrollController: _scrollController,
                    itemBuilder: (c, i) {
                      // print(_selectedValueinit-context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11]);

                      if (((i +_selectedValueinit-context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11]) %
                                  _selectedValue ==0) &&(i > context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] -
                                  _selectedValueinit)) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                _scrollController.scrollTo(
                                    index: i,
                                    duration: const Duration(milliseconds: 500));
                              });

                              // print('클림됨${i}');
                            },
                            // onVerticalDragStart: _onDragStartHandler,
                            // onVerticalDragUpdate: _onDragUpdateHandler,
                            // child: totalBallButton7(a: i));
                            child: newTotalBallButton7(a: i));
                      // child:Container());
                      // child: totalBallButton7New(a: i));
                      } else {
                        return Container();
                      }
                    }
                    //   return AutoSizeText('a');

                    ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 20.w, 80.h),
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    // upNum();
                    _scrollController.scrollTo(
                        index: 0, duration: const Duration(milliseconds: 500));
                  },
                  backgroundColor: Colors.white10,
                  child: const Icon(
                    Icons.arrow_upward,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.fromLTRB(0,0,20.w,20.h),
              //   alignment: Alignment.bottomRight,
              //   child: FloatingActionButton(onPressed: (){
              //     downNum();
              //     _scrollController.scrollTo(
              //         index: downward_num,
              //         duration: Duration(milliseconds: 500));
              //
              //   },child: Icon(Icons.arrow_downward,size: 50,color: Colors.white,),  backgroundColor: Colors.white10,),
              // ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar:  SafeArea(
        child: returnAd(), // 광고 배너만 SafeArea로 감싸서 네비게이션 바 위에 표시
      ),
    );
  }
}
