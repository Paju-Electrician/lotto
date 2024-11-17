import 'dart:convert';

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
import 'package:shared_preferences/shared_preferences.dart';

import 'ad_number.dart';

import 'package:http/http.dart' as http;
import 'package:beautiful_soup_dart/beautiful_soup.dart';

import 'package:cp949/cp949.dart' as cp949;

class button19Page extends StatefulWidget {
  const button19Page({Key? key}) : super(key: key);

  @override
  State<button19Page> createState() => _button19PageState();
}

class _button19PageState extends State<button19Page> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create(); // 스크롤 위치 추적



  Widget getTotalBall(int oddValue) {
    // 숫자가 아닌 문자를 모두 제거하는 로직은 이미 String에서 숫자만 남기는 방식으로 처리됐으므로
    // 여기서 추가적으로 문자를 제거할 필요는 없습니다.

    if (oddValue < 11) {
      return yellowBall(b: oddValue);
    } else if (oddValue < 21) {
      return blueBall(b: oddValue);
    } else if (oddValue < 31) {
      return redBall(b: oddValue);
    } else if (oddValue < 41) {
      return greyBall(b: oddValue);
    } else {
      return greenBall(b: oddValue);
    }
  }

  void _scrollListener() async {
    if (_isLoading || !_hasMoreData) {
      return;
    }

    final positions = _itemPositionsListener.itemPositions.value;
    if (positions.isNotEmpty) {
      final lastPosition = positions.last;

      // 스크롤 끝에 도달한 경우 데이터 요청하지 않고 UI 갱신
      if (lastPosition.index >= allLottoData.length - 1 &&
          lastPosition.itemTrailingEdge >= 0.9) {
        print('끝에 도달했습니다. 데이터 요청 없이 UI 업데이트');
        setState(() {}); // 스크롤 시 UI만 업데이트
      }
    }
  }



  // SharedPreferences 인스턴스
  late SharedPreferences prefs;
  Future<void> _loadDataFromPreferences() async {
    prefs = await SharedPreferences.getInstance();
    List<String>? savedData = prefs.getStringList('lottoData');
    // await prefs.clear();  // 모든 데이터 삭제
    // 저장된 데이터가 있는 경우
    if (savedData != null && savedData.isNotEmpty) {
      allLottoData = savedData.map((data) => Map<String, String>.from(jsonDecode(data))).toList();

      // 저장된 데이터 길이와 _secondRound 비교
      if (allLottoData.length < int.parse(_secondRound.toString())) {
        print("저장된 데이터가 부족하여 추가 데이터를 받아옵니다.");
        // currentPage = (allLottoData.length ~/ 10) + 1; // 불러올 페이지 설정
        await getAllOddEvenDataInfo();
      } else if (allLottoData.length == int.parse(_secondRound.toString())) {
        setState(() {}); // 모든 데이터가 불러와졌을 때 UI 업데이트
      } else {
        // 데이터가 너무 많은 경우 불일치하는 데이터 제거 후 저장
        allLottoData = allLottoData.sublist(0, int.parse(_secondRound.toString()));
        await _saveDataToPreferences();
        setState(() {});
      }
    } else {
      // 저장된 데이터가 없을 때
      await getAllOddEvenDataInfo();
    }
  }

// SharedPreferences에서 데이터 로드 후, 데이터가 있을 경우 로딩하지 않도록 조건 추가
//   Future<void> _loadDataFromPreferences() async {
//     prefs = await SharedPreferences.getInstance();
//     // await prefs.clear();  // 모든 데이터 삭제
//     List<String>? savedData = prefs.getStringList('lottoData');
//
//     print(allLottoData.length);
//     print(int.parse(_secondRound.toString()));
//
//
//     // 저장된 데이터가 있는 경우
//     if (savedData != null && savedData.isNotEmpty) {
//       var loadedData = savedData.map((data) => Map<String, String>.from(jsonDecode(data))).toList();
//
//       // _secondRound와 데이터 길이를 비교하여 조건을 만족하면 불러오기
//       if (loadedData.length == int.parse(_secondRound.toString())) {
//         allLottoData = loadedData;
//         setState(() {});
//       } else {
//         // 조건을 만족하지 않으면 데이터를 새로 받아옴
//         print("조건 불충족: 데이터를 새로 로드합니다.");
//         await getAllOddEvenDataInfo();
//       }
//     } else {
//       // 데이터가 없으면 getAllOddEvenDataInfo() 실행
//       getAllOddEvenDataInfo();
//     }
//   }

  // 데이터를 SharedPreferences에 저장
  Future<void> _saveDataToPreferences() async {
    List<String> dataToSave = allLottoData
        .map((data) => jsonEncode(data)) // Map을 JSON 문자열로 변환
        .toList();

    await prefs.setStringList('lottoData', dataToSave);
  }



  bool _isDisposed = false; // disposed 여부를 확인하는 플래그 추가

  @override
  void initState() {
    super.initState();
    button19ListInit();


    _loadDataFromPreferences(); // 앱 시작 시 데이터 불러오기
    // ItemPositionsListener의 itemPositions에 addListener를 설정하여 스크롤 이벤트를 감지
    _itemPositionsListener.itemPositions.addListener(_scrollListener);
    // SharedPreferences에 데이터가 없으면 getAllOddEvenDataInfo() 호출








    // FocusNode의 포커스 상태 변화 감지
    _focusNode.addListener(() {
      if (!_isDisposed) {
        setState(() {}); // 상태 업데이트
      }
    });

    // getAllOddEvenDataInfo();
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
    _isDisposed = true; // dispose 되었음을 표시
    banner?.dispose();
    _itemPositionsListener.itemPositions
        .removeListener(_scrollListener); // 리스너 제거
    _focusNode.dispose(); // 메모리 누수를 방지하기 위해 FocusNode를 dispose 합니다.
    super.dispose();
  }


  void _scrollToBottom() async {
    if (_itemScrollController.isAttached) {
      await Future.delayed(Duration(milliseconds: 100));
      _itemScrollController.scrollTo(
        index: allLottoData.length - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }


  List _firstRoundList = [];
  var _firstRound;

  List _secondRoundList = [];
  var _secondRound;
  var a;

  var selectNum = 1;



  button19ListInit() {
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

  bool _isLoading = false;
  int currentPage = 1; // 현재 페이지 상태
  var postMap = <String, dynamic>{};
  bool _hasMoreData = true; // 더 이상 데이터가 있는지 여부
  List<Map<String, String>> allLottoData = [];






  Future<void> getAllOddEvenDataInfo() async {


    // // 이미 데이터가 있을 경우 더 이상 실행하지 않음
    // if (allLottoData.isNotEmpty) {
    //   print('이미 데이터가 존재하므로 추가 로딩을 하지 않습니다.');
    //   return;
    // }


    print('getAllOddEvenDataInfo 호출: _isLoading = $_isLoading, _hasMoreData = $_hasMoreData');
    if (_isLoading || !_hasMoreData) {
      print('로딩 중이거나 더 이상 데이터가 없습니다.');
      return;
    }

    setState(() {
      _isLoading = true;
      print('로딩 상태 변경: _isLoading = $_isLoading');
    });

    postMap['sttDrwNo'] = _firstRound.toString();
    postMap['edDrwNo'] = _secondRound.toString();
    // print('현재 세컨라운드ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ');
    // print(_secondRound);

    try {
      while (_hasMoreData&& !_isDisposed) {
        // 페이지마다 데이터를 받아오기 위한 반복문
        postMap['startPage'] = currentPage.toString();
        postMap['currentPage'] = currentPage.toString();
        print('POST 데이터: $postMap');

        var placeResponse = await http.post(
          Uri.parse('https://dhlottery.co.kr/gameResult.do?method=statOddEven'),
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: postMap,
        );

        print('응답 상태 코드: ${placeResponse.statusCode}');
        if (placeResponse.statusCode != 200) {
          print('응답 실패. 상태 코드: ${placeResponse.statusCode}');
          setState(() {
            _isLoading = false;
            print('로딩 상태 변경: _isLoading = $_isLoading');
          });
          return;
        }

        var responseBody = cp949.decode(placeResponse.bodyBytes);
        BeautifulSoup bs = BeautifulSoup(responseBody);

        var table = bs.find('table', class_: 'tbl_data');
        var tbody = table?.find('tbody');

        if (tbody == null) {
          print('tbody 요소를 찾을 수 없습니다.');
          setState(() {
            _isLoading = false;
            _hasMoreData = false;
            print('로딩 상태 변경: _isLoading = $_isLoading, _hasMoreData = $_hasMoreData');
          });
          return;
        }

        var rows = tbody.findAll('tr');
        print('로드된 행 수: ${rows.length}');

        if (rows.isEmpty) {
          print('데이터가 없습니다. 더 이상 데이터를 불러올 수 없습니다.');
          setState(() {
            _isLoading = false;
            _hasMoreData = false;
            print('로딩 상태 변경: _isLoading = $_isLoading, _hasMoreData = $_hasMoreData');
          });
          return;
        }

        // 각 행의 데이터를 처리
        for (var row in rows) {
          var cells = row.findAll('td');
          if (cells.length >= 5) {
            String order = cells[0].text.trim();
            String day = cells[1].text.trim();
            List<String> odd = cells[2].findAll('span').map((e) =>
                e.text.trim()).toList();
            List<String> even = cells[3].findAll('span').map((e) =>
                e.text.trim()).toList();
            String sum = cells[4].text.trim();

            // 중복된 데이터가 존재하는지 확인
            bool isDuplicate = allLottoData.any((existingData) {
              return existingData['회차'] == order && existingData['당첨일자'] == day;
            });


            // 중복되지 않으면 데이터를 추가
            if (!isDuplicate) {
              allLottoData.add({
                '회차': order,
                '당첨일자': day,
                '홀수': odd.join(', '),
                '짝수': even.join(', '),
                '번호합': sum,
              });

              // 데이터가 추가될 때마다 UI 갱신
              setState(() {});

              // 데이터를 추가할 때마다 SharedPreferences에 즉시 저장
              await _saveDataToPreferences();
            } else {
              print('중복된 데이터가 있어 건너뜁니다: 회차 $order, 당첨일자 $day');
            }

            // await _saveDataToPreferences();
          }
        }

        // 페이지 증가 후 UI 갱신
        if (!_isDisposed) {
        setState(() {
          _isLoading = false;
          currentPage++;

          if (rows.length < 10) {
            _hasMoreData = false;
          } else {
            _hasMoreData = true;
          }

          print('데이터 로딩 완료. 현재 페이지: $currentPage, 더 이상 데이터 없음: $_hasMoreData');
          print('로딩 상태 변경: _isLoading = $_isLoading, _hasMoreData = $_hasMoreData');
        });
        }
        // 데이터 로딩 후 하단으로 스크롤 이동 (UI가 완전히 렌더링된 후)
        // _scrollToBottom();

        // 데이터를 SharedPreferences에 저장

        // await _saveDataToPreferences();

        // 데이터를 더 받아오지 않도록 조건 확인
        if (!_hasMoreData) {
          break;
        }




      }
    } catch (error) {
      print('오류 발생: $error');

      if (!_isDisposed) {
        setState(() {
          _isLoading = false;
          print('로딩 상태 변경: _isLoading = $_isLoading');
        });

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('오류 발생'),
              content: Text('데이터 로딩 중 오류가 발생했습니다: $error'),
              actions: <Widget>[
                TextButton(
                  child: Text('확인'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }


  // var postMap = <String, dynamic>{};
  //
  // List<Map<String, String>> allLottoData = [];
  // Future<void> getAllOddEvenDataInfo() async {
  //   int currentPage = 1;
  //
  //
  //   // 페이지가 끝날 때까지 반복
  //   while (true) {
  //     // POST 요청을 위한 데이터 설정
  //     postMap['sttDrwNo'] = _firstRound.toString();
  //     postMap['edDrwNo'] = _secondRound.toString();
  //      postMap['sortOrder'] = 'DESC';
  //      postMap['startPage'] = '1';
  //      // postMap['endPage'] = '10';
  //     postMap['currentPage'] = currentPage.toString();
  //
  //     // 페이지 요청
  //     var placeResponse = await http.post(
  //       Uri.parse('https://dhlottery.co.kr/gameResult.do?method=statOddEven'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/x-www-form-urlencoded',
  //       },
  //       body: postMap,
  //     );
  //
  //     // 페이지 응답을 CP949로 디코딩하여 HTML로 변환
  //     var responseBody = cp949.decode(placeResponse.bodyBytes);
  //     BeautifulSoup bs = BeautifulSoup(responseBody);
  //
  //     // 테이블의 tbody 요소 가져오기
  //     var table = bs.find('table', class_: 'tbl_data');
  //     var tbody = table?.find('tbody');
  //     if (tbody == null) break; // tbody가 없으면 데이터가 없는 것으로 간주하여 중단
  //
  //     // tbody 안의 모든 tr 요소를 가져오기
  //     var rows = tbody.findAll('tr');
  //     if (rows.isEmpty) break; // 데이터가 없으면 중단
  //
  //     // 각 행에서 필요한 데이터 추출
  //     for (var row in rows) {
  //       var cells = row.findAll('td');
  //       if (cells.length >= 5) {
  //         String order = cells[0].text.toString().trim();
  //         String day = cells[1].text.toString().trim();
  //
  //         // 홀수와 짝수 데이터를 추출
  //         List<String> odd = cells[2].findAll('span').map((e) => e.text.toString().trim()).toList();
  //         List<String> even = cells[3].findAll('span').map((e) => e.text.toString().trim()).toList();
  //         String sum = cells[4].text.toString().trim();
  //
  //         // 데이터를 리스트에 추가
  //         allLottoData.add({
  //           '회차': order,
  //           '당첨일자': day,
  //           '홀수': odd.join(', '),
  //           '짝수': even.join(', '),
  //           '번호합': sum,
  //         });
  //       }
  //     }
  //
  //     // 다음 페이지로 이동
  //     currentPage++;
  //   }
  //   // 데이터 로딩이 끝나면 상태 업데이트
  //   setState(() {
  //     _isLoading = false; // 로딩 끝
  //   });
  //
  //
  //   // 전체 데이터 출력
  //   for (var data in allLottoData) {
  //     print('회차: ${data['회차']}, 당첨일자: ${data['당첨일자']}, 홀수: ${data['홀수']}, 짝수: ${data['짝수']}, 번호합: ${data['번호합']}');
  //   }
  //
  //   // notifyListeners();  // UI 업데이트 필요 시 사용
  // }

  final FocusNode _focusNode = FocusNode();


  bool _firstRoundswitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
            '홀짝 / 번호합',
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
      // IconButton(
      //     onPressed: () {
      //       setState(() {
      //         // _scrollController.scrollTo(
      //         //     index: context
      //         //         .read<Mainpage_Store>()
      //         //         .totalLottoData
      //         //         .length,
      //         //     duration: const Duration(milliseconds: 500));
      //       });
      //     },
      //     icon: const Icon(Icons.refresh)),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      selectedItem: _firstRound ?? (_firstRoundList.isNotEmpty ? _firstRoundList.first : null),

                      items: (String filter, LoadProps? loadProps) async {
                        // 입력된 필터에 따라 항목을 필터링
                        return _firstRoundList
                            .where((item) => item.toString().contains(filter))
                            .cast<int>() // List<dynamic>을 List<int>로 변환
                            .toList(); // List<int>로 변환된 리스트 반환
                      },
                      popupProps: PopupProps.menu(
                        menuProps: MenuProps(align: MenuAlign.topCenter),
                        // listViewProps: ListViewProps(),
                        searchFieldProps: TextFieldProps(
                          style: TextStyle(
                              fontFamily: 'Pretendard', fontSize: 20.sp),
                          focusNode: _focusNode, // FocusNode를 여기 설정
                        ),
                        scrollbarProps: ScrollbarProps(
                            thickness: 20,
                            thumbVisibility: true,
                            trackVisibility: true),
                        showSearchBox: true,
                        // suggestedItemProps: SuggestedItemProps(suggestedItemsAlignment: MainAxisAlignment.center)
                        itemBuilder: (BuildContext context, int item,
                            bool isSelected, bool isHighlighted) {
                          return Container(
                            padding: const EdgeInsets.all(10.0), // 항목의 패딩 조절
                            color: isHighlighted
                                ? Colors.grey[300]
                                : Colors.transparent, // 강조 표시 색상 설정
                            child: Text(
                              // textAlign: TextAlign.center,
                              item.toString(),
                              style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 25.sp), // 항목의 글꼴 크기 설정
                            ),
                          );
                        },
                      ),
                      decoratorProps: DropDownDecoratorProps(
                        baseStyle: TextStyle(
                            fontFamily: 'Pretendard', fontSize: 25.sp),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(border: InputBorder.none
                            // labelText: "회차선택",
                            // border: OutlineInputBorder(),
                            ),
                      ),
                      onChanged: (newVal) {
                        // _secondRound와 newVal 값이 null이 아닌지 확인
                        if (_secondRound != null && newVal != null && _secondRound >= newVal) {
                          setState(() {
                            _firstRound = newVal;
                            _firstRoundswitch = true;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                              padding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
                              backgroundColor: Colors.red,
                              duration: const Duration(milliseconds: 1000),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )));
                        }
                      },
                    ),
                  ),
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
                        return _secondRoundList
                            .where((item) => item.toString().contains(filter))
                            .cast<int>() // List<dynamic>을 List<int>로 변환
                            .toList(); // List<int>로 변환된 리스트 반환
                      },
                      popupProps: PopupProps.menu(
                        menuProps: MenuProps(align: MenuAlign.topCenter),
                        // listViewProps: ListViewProps(),
                        searchFieldProps: TextFieldProps(
                            maxLines: 1,
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
                            padding: const EdgeInsets.all(10.0), // 항목의 패딩 조절
                            color: isHighlighted
                                ? Colors.grey[300]
                                : Colors.transparent, // 강조 표시 색상 설정
                            child: Text(
                              // softWrap: true,
                              // maxLines: 1,
                              // textAlign: TextAlign.center,
                              item.toString(),
                              style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 25.sp), // 항목의 글꼴 크기 설정
                            ),
                          );
                        },
                      ),
                      decoratorProps: DropDownDecoratorProps(
                        baseStyle: TextStyle(
                            fontFamily: 'Pretendard', fontSize: 25.sp),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(border: InputBorder.none
                            // labelText: "회차선택",
                            // border: OutlineInputBorder(),
                            ),
                      ),
                      onChanged: (newVal) {
                        if (int.parse(newVal.toString()) >= _firstRound) {
                          // print('실행되미ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ');
                          setState(() {
                            _secondRound = newVal;
                            // print(_secondRoundList.length);
                            // print(int.parse(_secondRound.toString()));
                            // print(_secondRoundList.length-int.parse(_secondRound.toString()));
                            if (_itemScrollController.isAttached) {
                              _itemScrollController.scrollTo(
                                index: _secondRoundList.length-int.parse(_secondRound.toString()),
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }




                          });

                          // print(_secondRound);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                              padding:
                                  EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                              backgroundColor: Colors.grey,
                              duration: const Duration(milliseconds: 1000),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )));
                        }
                      },
                    ),
                  ),
                  AutoSizeText('회차  ',
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w900))
                ]),
              ),
            ],
          ),

// 4. ListView.builder에 페이징 기능 적용
          Expanded(
            child: Stack(
              children: [
                _isLoading
                    ? Center(child: CircularProgressIndicator()) // 로딩 중일 때
                    :










                ScrollablePositionedList.builder(
                  itemCount: _firstRoundswitch?allLottoData.length-int.parse(_firstRound.toString())+1:allLottoData.length,

                  //  itemCount: _secondRound > allLottoData.length ? allLottoData.length : _secondRound, // _secondRound와 allLottoData.length를 비교하여 안전한 범위로 설정
                        itemScrollController: _itemScrollController,
                        // ItemScrollController 사용
                        itemPositionsListener: _itemPositionsListener,
                  initialScrollIndex: 0, // 시작할 인덱스를 0으로 설정하여 앞쪽에서 시작
                        // ItemPositionsListener 사용
                        itemBuilder: (c, i) {
                          if (i >= allLottoData.length) {
                            return SizedBox(); // 범위 초과 시 빈 공간 반환
                          }

                          var item = allLottoData[i];
                          // List<String> oddValues = item['홀수']
                          //         ?.split(',')
                          //         .map((e) => e.trim())
                          //         .toList() ??[];
                          // List<String> evenValues = item['짝수']
                          //         ?.split(',')
                          //         .map((e) => e.trim())
                          //         .toList() ??
                          //     [];


                          List<String> oddValues = (item['홀수']?.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList()) ?? [];
                          List<String> evenValues = (item['짝수']?.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList()) ?? [];


                          // print('oddValues: $oddValues');
                          // print('evenValues: $evenValues');
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 0.h, horizontal: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                   // 왼쪽 정렬로 변경
                                  children: [
                                    Text(
                                      '${item['회차']}',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Pretendard'
                                      ),
                                    ),

                                    Text(
                                      '   ${item['당첨일자']}',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.normal,
                                      ),
                                    ),


                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬로 변경
                                  children: [

                                   oddValues.isEmpty?Container():Container(

                                      margin:
                                          EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                                      padding: EdgeInsets.fromLTRB(
                                          5.w, 5.h, 5.w, 5.h),
                                      decoration: const BoxDecoration(
                                        color: Color(0xffe5e5e5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.min, // 자식들이 자신의 크기만큼 차지하도록 설정
                                        children:
                                            oddValues.map<Widget>((oddValue) {
                                          // print('oddValue는 $oddValue');

                                          // int.tryParse를 사용하여 값이 유효한지 확인
                                          int? oddNumber =
                                              int.tryParse(oddValue);
                                          // print(oddValues);
                                          // 값이 유효하지 않으면 기본값을 사용하거나 오류 메시지를 출력
                                          if (oddNumber == null) {
                                            // print('Invalid number: $oddValue');

                                            oddNumber = 0; // 기본값을 사용하거나 예외 처리를 할 수 있습니다.
                                          }

                                          return Center(child: getTotalBall(oddNumber));
                                        }).toList(),
                                      ),
                                    ),



                                   Container(
                                      margin:
                                          EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                                      padding: EdgeInsets.fromLTRB(
                                          5.w, 5.h, 5.w, 5.h),
                                      decoration: const BoxDecoration(
                                        color: Color(0xffe5e5e5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child:

                                      Row(
                                        mainAxisSize: MainAxisSize.min, // 자식들이 자신의 크기만큼 차지하도록 설정
                                        children: evenValues
                                            .map<Widget>((evenValue) {
                                          int evenNumber =
                                              int.parse(evenValue);
                                          // print(evenValues);
                                          if (evenNumber == null) {
                                            // print('Invalid number: $evenValue');

                                          }

                                            return Center(child: getTotalBall(evenNumber));
                                        }).toList(),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                                        children: [
                                          // 홀짝

                                          Row(
                                            children: [
                                              AutoSizeText(
                                                '홀짝: ',
                                                style: TextStyle(fontSize: 14.sp),
                                              ),
                                              SizedBox(width: 8),
                                              // 홀수 비율을 원형으로 표시
                                              Expanded(
                                                child: Container(
                                                  width: 24.w, // 너비 설정
                                                  height: 24.h, // 높이 설정
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.blue, // 홀수 색상
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Center(
                                                    child: AutoSizeText(
                                                      '${oddValues.length}',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 4.w),
                                              // 짝수 비율을 원형으로 표시
                                              Expanded(
                                                child: Container(
                                                  width: 24.w,
                                                  height: 24.h,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.green, // 짝수 색상
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Center(
                                                    child: AutoSizeText(
                                                      '${evenValues.length}',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5.h), // 두 항목 사이의 여백
                                          // 번호합
                                          Row(
                                            children: [

                                              AutoSizeText(
                                                '합:',
                                                style: TextStyle(fontSize: 14.sp),
                                              ),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                  decoration: BoxDecoration(
                                                    color: Colors.orange[200], // 번호합의 배경색
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Center(
                                                    child: AutoSizeText(
                                                      maxLines: 1,
                                                      softWrap: true,
                                                      '${item['번호합']}',
                                                      style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: 'Pretendard',
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )

                                    ),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          );
                        },
                      ),









              ],
            ),
          )

//           Expanded(
//             // child: ListView.builder(itemCount:context.watch<Mainpage_Store>().lottoData['drwNo'], itemBuilder: (c,i){
//             child: Stack(children: [_isLoading
//                 ? Center(child: CircularProgressIndicator()) // 로딩 중일 때
//                 :
//             ScrollablePositionedList.builder(
//                 itemCount: _secondRound > allLottoData.length ? allLottoData.length : _secondRound, // _secondRound와 allLottoData.length를 비교하여 안전한 범위로 설정
//                 itemScrollController: _scrollController,
//                 itemBuilder: (c, i) {
//                   if (i >= allLottoData.length) {
//                     return SizedBox(); // 인덱스가 범위를 벗어난 경우 빈 공간을 반환
//                   }
//
//                   var item = allLottoData[i];
//                   if (item == null) {
//                     return SizedBox(); // null 값일 경우 처리
//                   }
//
//                   print('홀수: ${item['홀수']}');
//
//                   // 홀수와 짝수 데이터 처리
//                   List<String> oddValues = item['홀수']?.split(',').map((e) => e.trim()).toList() ?? [];
//                   List<String> evenValues = item['짝수']?.split(',').map((e) => e.trim()).toList() ?? [];
//
//                   return Container(
//                     padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '${item['회차']}',
//                           style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
//                                 padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xffe5e5e5),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(10),
//                                     topRight: Radius.circular(10),
//                                     bottomLeft: Radius.circular(10),
//                                     bottomRight: Radius.circular(10),
//                                   ),
//                                 ),
//                                 child: Row(
//                                   children: oddValues.map<Widget>((oddValue) {
//                                     int oddNumber = int.parse(oddValue);
//                                     return Expanded(child: getTotalBall(oddNumber));
//                                   }).toList(),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
//                                 padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xffe5e5e5),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(10),
//                                     topRight: Radius.circular(10),
//                                     bottomLeft: Radius.circular(10),
//                                     bottomRight: Radius.circular(10),
//                                   ),
//                                 ),
//                                 child: Row(
//                                   children: evenValues.map<Widget>((evenValue) {
//                                     int evenNumber = int.parse(evenValue);
//                                     return Expanded(child: getTotalBall(evenNumber));
//                                   }).toList(),
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               '번호합: ${item['번호합']}',
//                               style: TextStyle(fontSize: 14.sp),
//                             ),
//                           ],
//                         ),
//                         Divider(),
//                       ],
//                     ),
//                   );
//                 },
//               )
// ,
//               // 스크롤 업 버튼 추가
//               Positioned(
//                 bottom: 80.h,
//                 right: 20.w,
//                 child: FloatingActionButton(
//                   onPressed: () {
//                     _scrollController.scrollTo(
//                       index: 0,
//                       duration: const Duration(milliseconds: 500),
//                     );
//                   },
//                   backgroundColor: Colors.white10,
//                   child: const Icon(
//                     Icons.arrow_upward,
//                     size: 50,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ]),
//           ),
//
//
//
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: returnAd(), // 광고 배너만 SafeArea로 감싸서 네비게이션 바 위에 표시
      ),
    );
  }
}
