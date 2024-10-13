import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotto/pages/lottoNumber.dart';

import 'package:lotto/provider/store1.dart';
import 'package:lotto/provider/store3.dart';
import 'package:lotto/widget/mainWidgets.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  }

  // List totalLottoData = [];
  List<int> _valueList = [];
  List<int> _valueListinit = [];
  var _selectedValue = 1;
  var _selectedValueinit;

  valueListInit() {
    setState(() {
      _valueList = List<int>.generate(
          context.read<firstLotto>().firstLottoNumNaver[11] + 1,
          (int index) => index + 1);
      _valueListinit = List<int>.generate(
          context.read<firstLotto>().firstLottoNumNaver[11] + 1,
          (int index) => index + 1).reversed.toList();

      // print(_valueListinit);
      _selectedValueinit =
          context.read<firstLotto>().firstLottoNumNaver[11] + 1;
      // totalLottoData = getTotalDataList();
    });
  }

  makeInitContainer(i) {
    if (i == context.read<firstLotto>().firstLottoNumNaver[11] + 1) {
      return Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              alignment:Alignment.centerRight,
              child:                 (context.watch<Store1>().button2RoundInfo['drwNo'] == null
                      ? (context.watch<firstLotto>().firstLottoNumNaver.isEmpty
                          ? const CircularProgressIndicator()
                          : Text(
                              softWrap: false,
                              '${context.watch<firstLotto>().firstLottoNumNaver[11] + 1}회',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w900,
                                color: const Color(0xffd43301),
                              )))
                      : Text(
                          softWrap: false,
                          '${context.watch<Store1>().button2RoundInfo['drwNo'] + 1}회',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xffd43301),
                          )))
                ,
          )),


          // flex: 1,

          Expanded(
            flex: 5,
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
            // flex: 5,
          ),
        ],
      );
    } else {
      return totalBallButton7(
          a: context.read<firstLotto>().firstLottoNumNaver[11] - i);
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
                        _scrollController.scrollTo(
                            index: context.read<Store1>().totalLottoData.length,
                            duration: const Duration(milliseconds: 500));
                      });
                    },
                    icon: const Icon(Icons.refresh)),
                Text('로또회귀분석',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DoHyeon',
                        fontSize: 30.sp)),
                const IconButton(onPressed: null, icon: Icon(null))
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.h),
            child: Text('*회귀분석: 과거의 규칙이 일정한 간격으로 반복되는 것. ',
                softWrap: false,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'DoHyeon',
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
                      DropdownButton<int>(
                        value: _selectedValueinit,
                        items: _valueListinit.map((int value) {
                          return DropdownMenuItem(
                            alignment: Alignment.center,
                            value: value,
                            child: Text(value.toString(),
                                style: TextStyle(fontSize: 20.sp)),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            _selectedValueinit = newVal!;
                          });
                        },
                      ),
                      Text(
                        '기준회차선택',
                        style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<int>(
                        value: _selectedValue,
                        items: _valueList.map((int value) {
                          return DropdownMenuItem(
                            value: value,
                            alignment: Alignment.center,
                            child: Text(value.toString(),
                                style: TextStyle(fontSize: 20.sp),
                                textAlign: TextAlign.end),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            _selectedValue = newVal!;
                          });
                        },
                      ),
                      Text('회귀보기', style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.sp))
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
          //           (context.watch<Store1>().button2RoundInfo['drwNo'] == null
          //               ? (context
          //                       .watch<firstLotto>()
          //                       .firstLottoNumNaver
          //                       .isEmpty
          //                   ? CircularProgressIndicator()
          //                   : Text(
          //                       '${context.watch<firstLotto>().firstLottoNumNaver[11] + 1}회',
          //                       style: TextStyle(
          //                         fontSize: 20.sp,
          //                         fontWeight: FontWeight.w900,
          //                         color: Color(0xffd43301),
          //                       )))
          //               : Text(
          //                   '${context.watch<Store1>().button2RoundInfo['drwNo'] + 1}회',
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
            // child: ListView.builder(itemCount:context.watch<Store1>().lottoData['drwNo'], itemBuilder: (c,i){
            child: Stack(children: [
              ScrollablePositionedList.builder(
                  // itemCount: context.watch<Store1>().totalLottoData.length,
                  itemCount: lottoTotalNumber.length,
                  itemScrollController: _scrollController,
                  itemBuilder: (c, i) {
                    // print(_selectedValueinit-context.read<firstLotto>().firstLottoNumNaver[11]);

                    if (((i +
                                    _selectedValueinit -
                                    context
                                        .read<firstLotto>()
                                        .firstLottoNumNaver[11]) %
                                _selectedValue ==
                            0) &&
                        (i >
                            context.read<firstLotto>().firstLottoNumNaver[11] -
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

                      // child: totalBallButton7New(a: i));
                    } else {
                      return Container();
                    }
                  }
                  //   return Text('a');

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
    );
  }
}
