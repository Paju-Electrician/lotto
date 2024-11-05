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
  import 'package:dotted_border/dotted_border.dart';

  class button18Page extends StatefulWidget {
    const button18Page({Key? key}) : super(key: key);

    @override
    State<button18Page> createState() => _button18PageState();
  }

  class _button18PageState extends State<button18Page> {
    final ItemScrollController _scrollController = ItemScrollController();
    List<int?> selectedValues = []; // 선택된 값 초기화
    final List<int> _valueList = List.generate(45, (index) => index + 1); // 초기화


    // var _selectedValueinit;
    // valueListInit() {
    //   setState(() {
    //
    //
    //     // print(_valueListinit);
    //     _selectedValueinit =
    //         context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] +
    //             1;
    //
    //     // totalLottoData = getTotalDataList();
    //   });
    // }

    @override
    void initState() {
      super.initState();
      // valueListInit();

      banner = BannerAd(
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) => print('Ad loaded.'),
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
            print('Ad failed to load: $error');
          },
        ),
        size: AdSize.banner,
        adUnitId: androidTestUnitId,
        request: const AdRequest(),
      )..load();
    }

    @override
    void dispose() {
      banner?.dispose();
      super.dispose();
    }

    Widget getBall(int b) {
      if (b == 0) {
        return TextBall(b: b);
      } else if (b < 11) {
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

    Widget makeInitContainer(int i) {
      if (i ==
          context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] +
              1) {
        return Row(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: AutoSizeText(
                maxLines: 1,
                '${context.watch<Mainpage_Store>().button5RoundInfo['drwNo'] ?? 0 + 1}회',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w900,
                  color: const Color(0xffd43301),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.all(5.w),
                decoration: const BoxDecoration(
                  color: Color(0xffe5e5e5),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(6, (_) => getBall(0)),
                ),
              ),
            ),
          ],
        );
      } else {
        return totalBallButton7(a: i - 1);
      }
    }

    Future<List<int>> _loadItems(String filter, LoadProps? loadProps) async {
      await Future.delayed(Duration(seconds: 1)); // 비동기 작업 예시
      return _valueList
          .where((item) => item.toString().contains(filter))
          .toList();
    }

    // 선택된 숫자들이 모두 포함되어 있는지 확인

    // 선택된 숫자 리스트를 기반으로 필터링 로직
    bool _containsSelectedNumbers(int index) {
      // lottoTotalNumber[index]가 null이 아닌지 확인
      if (lottoTotalNumber[index] != null) {



        // 마지막 숫자를 제외할지 여부 결정
        List<int> numbersToCheck = bonusselectedbool
            ? lottoTotalNumber[index] // bonusselectedbool이 true일 경우 전체 번호 사용
            : lottoTotalNumber[index].sublist(0, lottoTotalNumber[index].length - 1); // 마지막 번호 제외






        // 선택된 숫자들이 모두 포함되어 있는지 확인
        return selectedValues.every((value) {
          return value != null && numbersToCheck.contains(value);
        });


      }
      return false; // 숫자가 없을 경우 false 반환
    }



    Future<List<int>> _fetchItems(String filter, LoadProps? loadProps) async {
      return _valueList; // 또는 여기에 필터링 로직을 추가
    }

    void _clearSelectedValues() {
      setState(() {
        selectedValues.clear(); // 선택된 값 초기화
      });
    }

    bool bonusselectedbool = true;

    void bonusselected() {
      setState(() {
        bonusselectedbool = !bonusselectedbool;
        // _containsSelectedNumbers;
      });

    }

    void _toggleBonus() {
      setState(() {
        bonusselectedbool = !bonusselectedbool; // 보너스 포함 여부 토글
      });
    }
// 필터링된 child의 수를 계산하는 함수
    int _getVisibleChildCount() {


      int visibleChildCount = 0;

      for (int i = 0; i < lottoTotalNumber.length; i++) {
        if (_containsSelectedNumbers(i)) {
          visibleChildCount++;
        }
      }

      return visibleChildCount;
    }

    maketext(){

      if (selectedValues.length==0){
        return Container();
      }else{
        List<int> sortedValues = List<int>.from(selectedValues ?? [])..sort();
      return Container(child: AutoSizeText('${sortedValues.where((value) => value != null).join(', ')} 패턴은 총 ${_getVisibleChildCount()}회 출현'
      ,style: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 20, // 텍스트 크기
      fontWeight: FontWeight.bold, // 텍스트 두께
      ),
      ));
      }

    }

    @override
    Widget build(BuildContext context) {
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
              '로또패턴 검색',
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              padding:EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // 그림자 위치 조정
                  ),
                ],
              ),
              child: DropdownSearch<int>(
              mode: Mode.custom,
              // 모드를 CUSTOM으로 설정
              items: _fetchItems,
              // 비동기 아이템 로딩 함수
              onChanged: (int? selectedValue) {
                // 선택된 아이템을 int?로 받습니다.
                setState(() {
                  if (selectedValue != null) {
                    // 기존 선택된 값을 업데이트합니다.
                    if (!selectedValues.contains(selectedValue)) {
                      selectedValues.add(selectedValue);
                    } else {
                      selectedValues
                          .remove(selectedValue); // 이미 선택된 값은 제거합니다.
                    }
                  }
                });
              },
              dropdownBuilder: (context, selectedItem) {
                return button18Numbers(selectedValues:selectedValues);
                //   Text(
                //   _selectedValues.isNotEmpty ? _selectedValues.join(', ') : "선택하세요",
                //   style: TextStyle(fontSize: 16),
                // );
              },
              itemAsString: (item) => item.toString(),
              compareFn: (item1, item2) => item1 == item2,
              selectedItem: selectedValues.isNotEmpty
                  ? selectedValues.last
                  : null,


                popupProps: PopupProps.dialog(
                  showSearchBox: true,
                  scrollbarProps:ScrollbarProps(thickness: 20,thumbVisibility:true),
                  // fit: FlexFit.tight,
                  dialogProps: DialogProps(
                    backgroundColor: Colors.white,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // insetPadding: EdgeInsets.symmetric(horizontal: 0), // 좌우 패딩 조정
                  ),
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.3,  // 화면의 50%로 최소 너비 설정
                    maxWidth: MediaQuery.of(context).size.width * 0.3,  // 화면의 50%로 최대 너비 설정
                    maxHeight: MediaQuery.of(context).size.height * 0.7,
                  ),
                  itemBuilder: (context, item, isSelected, isFocused) {
                    return Container(
                       // width: 300, // 원하는 너비로 조정
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      // padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blueAccent.withOpacity(0.1)
                            : isFocused
                            ? Colors.grey.withOpacity(0.05)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected ? Colors.blueAccent : Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: ListTile(
                          // minLeadingWidth:0,
                          // horizontalTitleGap:0,
                        // leading: CircleAvatar(
                        //   backgroundColor: isSelected ? Colors.blueAccent : Colors.grey.shade300,
                        //   child: Text(
                        //     item.toString(),
                        //     style: TextStyle(
                        //       color: isSelected ? Colors.white : Colors.black,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                        title: Center(child: getBall(item)),
                        // trailing: isSelected
                        //     ? Icon(Icons.check, color: Colors.blueAccent)
                        //     : Icon(Icons.circle_outlined, color: Colors.grey),
                      ),
                    );
                  },
                ),

                // 마지막 선택된 아이템을 선택합니다.
              // popupProps: PopupProps.dialog(
              //   itemBuilder: (context, item, isSelected, isFocused) {
              //     // 4개의 매개변수를 받도록 수정
              //     return ListTile(
              //       title: Text(item.toString()),
              //       trailing: isSelected ? Icon(Icons.check) : null,
              //     );
              //   },
              // ),








              filterFn: (item, filter) =>
                  item.toString().contains(filter), // 필터링 기능
            )),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [



              // SizedBox(height: 10), // 버튼 간격 조정

              ElevatedButton(
                onPressed: _toggleBonus, // 보너스 포함/미포함 버튼
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: bonusselectedbool ? Colors.red : Colors.green, // 버튼 텍스트 색상
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // 버튼 패딩
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // 모서리 둥글게
                  ),
                  elevation: 5, // 그림자 효과
                  shadowColor: bonusselectedbool ? Colors.greenAccent.withOpacity(0.5) : Colors.redAccent.withOpacity(0.5), // 그림자 색상
                ),
                child: AutoSizeText(
                  bonusselectedbool ? "보너스 미포함" : "보너스 포함", // 토글 상태에 따라 텍스트 변경
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 20, // 텍스트 크기
                    fontWeight: FontWeight.bold, // 텍스트 두께
                  ),
                ),
              ),
                  ElevatedButton(
                    onPressed: _clearSelectedValues, // 클리어 버튼 눌렀을 때 선택 초기화
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue, // 버튼 텍스트 색상
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // 버튼 패딩
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // 모서리 둥글게
                      ),
                      elevation: 5, // 그림자 효과
                      shadowColor: Colors.blueAccent.withOpacity(0.5), // 그림자 색상
                    ),
                    child: AutoSizeText(
                      "숫자 초기화",
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 20  , // 텍스트 크기
                        fontWeight: FontWeight.bold, // 텍스트 두께
                      ),
                    ),
                  ),
            ]),

            maketext(),

            Expanded(
              child: Stack(
                children: [
                  ScrollablePositionedList.builder(
                    itemCount: lottoTotalNumber.length,
                    itemScrollController: _scrollController,
                    itemBuilder: (c, i) {
                      // print(selectedValues);
                      return selectedValues != null
                          ? GestureDetector(
                              onTap: () {
                                _scrollController.scrollTo(
                                  index: i,
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                              child: _containsSelectedNumbers(i) // 필터링 조건 추가
                                  ? newTotalBallButton18(
                                      a: i,
                                      selectedValues: selectedValues,
                                      bonusselectedbool: bonusselectedbool)
                                  : Container(),
                            )
                          : Container();
                    },
                  ),
                  Positioned(
                    right: 20.w,
                    bottom: 80.h,
                    child: FloatingActionButton(
                      onPressed: () {
                        _scrollController.scrollTo(
                          index: 0,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      backgroundColor: Colors.white10,
                      child: const Icon(
                        Icons.arrow_upward,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(child: returnAd()),
      );
    }
  }

  class newTotalBallButton18 extends StatefulWidget {
    const newTotalBallButton18({
      Key? key,
      this.a,
      required this.selectedValues,
      this.bonusselectedbool,
    }) : super(key: key);

    final int? a;
    final List<int?> selectedValues; // 선택된 값 리스트
    final bool? bonusselectedbool; // bool 타입으로 변경

    @override
    State<newTotalBallButton18> createState() => _newTotalBallButton18State();
  }

  class _newTotalBallButton18State extends State<newTotalBallButton18> {
    int bonusselectednum() {
      return widget.bonusselectedbool == true ? 7 : 6;
    }

    Widget getTotalBall(int b) {
      // 각 색깔 공을 반환하는 메소드
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

    Widget getBallWithBorder(List<int> balls) {
      print('실행됩니다.');
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: balls.map((b) {
          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.selectedValues.contains(b) ? Colors.red : Colors.black,
                  width: 5, // 테두리 두께
                ),
              ),
              child: getTotalBall(b), // 각 숫자에 대해 공을 그립니다.
            ),
          );
        }).toList(),
      );
    }

    @override
    Widget build(BuildContext context) {
      if (widget.a != null && widget.a! < lottoTotalNumber.length) {
        List<int?> currentRoundNumbers = lottoTotalNumber[widget.a!];

        return Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: AutoSizeText(
                      '${currentRoundNumbers[0]}회',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                      padding: EdgeInsets.all(5.w),
                      decoration: const BoxDecoration(
                        color: Color(0xffe5e5e5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(bonusselectednum(), (i) {
                          int? ballNumber = currentRoundNumbers[i + 1]; // Nullable int로 변경
                          if (ballNumber != null) {
                            final List<int> selectedNumbers = widget.selectedValues.whereType<int>().toList(); // null 제거
                            bool isSelected = selectedNumbers.contains(ballNumber);

                            return Expanded(
                              child: isSelected
                                  ? DottedBorder(
                                borderType: BorderType.Circle,
                                color: Colors.red,
                                dashPattern: [6, 3],
                                strokeWidth: 4,
                                child: Center(child: getTotalBall(ballNumber)),
                              )
                                  : Center(child: getTotalBall(ballNumber)),
                            );
                          } else {
                            return Container(); // ballNumber가 null일 경우 빈 컨테이너 반환
                          }
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
      return Container(); // 유효하지 않은 경우 빈 컨테이너 반환
    }
  }



  class button18Numbers extends StatefulWidget {
    button18Numbers({Key? key, this.selectedValues}) : super(key: key);

    var selectedValues;
    @override
    State<button18Numbers> createState() => _button10NumbersState();
  }

  class _button10NumbersState extends State<button18Numbers> {
    getBall(b) {
      if (b == 0) {
        return TextBall(b: b);
      }
      if (b == 46) {
        return xNumBall(b: b);
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

      List<int> sortedValues = List<int>.from(widget.selectedValues ?? [])..sort();
      return Column(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ,style: TextStyle(color: Color(0xff767676),fontSize: 20,fontWeight: FontWeight.bold),)),

            Container(
              margin: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
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
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < 6; i++)
                    i < sortedValues.length
                        ? getBall(sortedValues[i]) // 정렬된 리스트 사용
                        : getBall(0), // 기본값 또는 빈 볼
                ],
              ),

            ),
          ],
        )
      ]);
    }
  }







