import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotto/pages/lottoNumber.dart';
import 'package:lotto/provider/store1.dart';
import 'package:lotto/widget/mainWidgets.dart';
import 'package:provider/provider.dart';
import 'package:cp949/cp949.dart' as cp949;
import 'package:http/http.dart' as http;
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

Future<List<LottoWeb>> fetchPost(i) async {
  List<LottoWeb> LottoWebData = [];
  List<String> rawWebData = [];

  var map = <String, dynamic>{};

  map['drwNo'] = i.toString();
  map['drwNoList'] = i.toString();
  final response = await http.get(
      Uri.parse('https://dhlottery.co.kr/gameResult.do?method=byWin'),
      headers: {'Content-Type': 'application/json'});
  final postResponse = await http.post(
      Uri.parse('https://dhlottery.co.kr/gameResult.do?method=byWin'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: map);

  var responseBody = cp949.decode(postResponse.bodyBytes);


  BeautifulSoup bs = BeautifulSoup(responseBody);

  rawWebData.add(bs
      .find('table', class_: 'tbl_data tbl_data_col')!
      .find('tbody')!
      .find('tr')!
      .find('td', class_: 'tar')!
      .findNextSibling("td")!
      .getText());
  rawWebData.add(bs
      .find('table', class_: 'tbl_data tbl_data_col')!
      .find('tbody')!
      .find('tr')!
      .find('td', class_: 'tar')!
      .findNextSibling("td")!
      .findNextSibling("td")!
      .getText());
  rawWebData.add(bs
      .find('table', class_: 'tbl_data tbl_data_col')!
      .find('tbody')!
      .find('tr')!
      .findNextSibling('tr')!
      .find('td', class_: 'tar')!
      .findNextSibling("td")!
      .getText());
  rawWebData.add(bs
      .find('table', class_: 'tbl_data tbl_data_col')!
      .find('tbody')!
      .find('tr')!
      .findNextSibling('tr')!
      .find('td', class_: 'tar')!
      .findNextSibling("td")!
      .findNextSibling("td")!
      .getText());
  rawWebData.add(bs
      .find('table', class_: 'tbl_data tbl_data_col')!
      .find('tbody')!
      .find('tr')!
      .findNextSibling('tr')!
      .findNextSibling('tr')!
      .find('td', class_: 'tar')!
      .findNextSibling("td")!
      .getText());
  rawWebData.add(bs
      .find('table', class_: 'tbl_data tbl_data_col')!
      .find('tbody')!
      .find('tr')!
      .findNextSibling('tr')!
      .findNextSibling('tr')!
      .find('td', class_: 'tar')!
      .findNextSibling("td")!
      .findNextSibling("td")!
      .getText());
  rawWebData.add(bs
      .find('table', class_: 'tbl_data tbl_data_col')!
      .find('tbody')!
      .find('tr')!
      .findNextSibling('tr')!
      .findNextSibling('tr')!
      .findNextSibling('tr')!
      .find('td', class_: 'tar')!
      .findNextSibling("td")!
      .getText());
  rawWebData.add(bs
      .find('table', class_: 'tbl_data tbl_data_col')!
      .find('tbody')!
      .find('tr')!
      .findNextSibling('tr')!
      .findNextSibling('tr')!
      .findNextSibling('tr')!
      .find('td', class_: 'tar')!
      .findNextSibling("td")!
      .findNextSibling("td")!
      .getText());
  rawWebData.add(bs
      .find('table', class_: 'tbl_data tbl_data_col')!
      .find('tbody')!
      .find('tr')!
      .findNextSibling('tr')!
      .findNextSibling('tr')!
      .findNextSibling('tr')!
      .findNextSibling('tr')!
      .find('td', class_: 'tar')!
      .findNextSibling("td")!
      .getText());
  rawWebData.add(bs
      .find('table', class_: 'tbl_data tbl_data_col')!
      .find('tbody')!
      .find('tr')!
      .findNextSibling('tr')!
      .findNextSibling('tr')!
      .findNextSibling('tr')!
      .findNextSibling('tr')!
      .find('td', class_: 'tar')!
      .findNextSibling("td")!
      .findNextSibling("td")!
      .getText());
  rawWebData.add(bs
      .find('table', class_: 'tbl_data tbl_data_col')!
      .find('tbody')!
      .find('tr')!
      .find('td', class_: 'tar')!
      .findNextSibling("td")!
      .findNextSibling("td")!
      .findNextSibling("td")!
      .findNextSibling("td")!
      .getText());

  LottoWebData.add(LottoWeb(
      lotto1People: rawWebData[0],
      lotto1Amount: rawWebData[1],
      lotto2People: rawWebData[2],
      lotto2Amount: rawWebData[3],
      lotto3People: rawWebData[4],
      lotto3Amount: rawWebData[5],
      lotto4People: rawWebData[6],
      lotto4Amount: rawWebData[7],
      lotto5People: rawWebData[8],
      lotto5Amount: rawWebData[9],
      lottoWay: rawWebData[10]));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

    return LottoWebData;
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    print('서버요청실패');
    throw Exception('Failed to load post');
  }
}

class LottoWeb {
  final String lotto1People;
  final String lotto1Amount;
  final String lotto2People;
  final String lotto2Amount;
  final String lotto3People;
  final String lotto3Amount;
  final String lotto4People;
  final String lotto4Amount;
  final String lotto5People;
  final String lotto5Amount;
  final String lottoWay;

  LottoWeb(
      {required this.lotto1People,
      required this.lotto1Amount,
      required this.lotto2People,
      required this.lotto2Amount,
      required this.lotto3People,
      required this.lotto3Amount,
      required this.lotto4People,
      required this.lotto4Amount,
      required this.lotto5People,
      required this.lotto5Amount,
      required this.lottoWay});
}

class button1Page extends StatefulWidget {
  const button1Page({Key? key}) : super(key: key);

  @override
  State<button1Page> createState() => _button1PageState();
}

class _button1PageState extends State<button1Page> {

  int postNum = 1007;
  // final firestore = FirebaseFirestore.instance;
  late Future<List<LottoWeb>> lottoWeb;
  final ItemScrollController _scrollController = ItemScrollController();
  ScrollController controller = ScrollController();

  bool ListSwitch = false;
  changeLottoWeb(a) {
    setState(() {
      lottoWeb = fetchPost(context.read<Store1>().lottoRound - a);
    });
  }


  @override
  void initState() {
    super.initState();
    lottoWeb = fetchPost(context.read<Store1>().lottoRound);
  }
  void _scrollToIndex(index) {
    controller.animateTo(
        // controller.position.maxScrollExtent,
        double.parse(index.toString()),
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);

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
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffe5e5e5), width: 10.w),
                  color: const Color(0xfff8f8f8),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 2.0.w, color: const Color(0xffe5e5e5)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(' 1등', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.sp)),
                         Expanded(
                           child: FutureBuilder<List<LottoWeb>>(
                                  future: lottoWeb,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Container(
                                        padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                                        child: Text(
                                            '${snapshot.data![0].lotto1People}명',
                                            textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)),
                                      );
                                    } else if (snapshot.hasError) {
                                      print('데이터이상함');
                                      print(snapshot.data);
                                      return Text("${snapshot.error}");
                                    }

                                    // 기본적으로 로딩 Spinner를 보여줍니다.
                                    return context.read<Store1>().but1One == null
                                        ? const CircularProgressIndicator()
                                        : Text(
                                            '${context.read<Store1>().but1One[0].lotto1People}명',
                                            textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp));
                                  }),
                         ),
                        Expanded(
                          child: FutureBuilder<List<LottoWeb>>(
                                future: lottoWeb,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      // 'AAAAAAAAAA원',
                                      softWrap: false,
                                        snapshot.data![0].lotto1Amount,

                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp));
                                  } else if (snapshot.hasError) {
                                    print('데이터이상함');
                                    print(snapshot.data);
                                    return Text("${snapshot.error}");
                                  }

                                  // 기본적으로 로딩 Spinner를 보여줍니다.
                                  return context.read<Store1>().but1One == null
                                      ? const CircularProgressIndicator()
                                      : (Text(
                                          '${context.read<Store1>().but1One[0].lotto1Amount}',
                                          textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)));
                                },
                              ),
                        ),
                       SizedBox(width:120.w,child: Text('당첨번호 6개 일치', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.sp))),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 2.0.w, color: const Color(0xffe5e5e5)),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(' 2등', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.sp)),
                       Expanded(
                         child: FutureBuilder<List<LottoWeb>>(
                              future: lottoWeb,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                                    child: Text(
                                        '${snapshot.data![0].lotto2People}명',
                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)),
                                  );
                                } else if (snapshot.hasError) {
                                  print('데이터이상함');
                                  print(snapshot.data);
                                  return Text("${snapshot.error}");
                                }

                                // 기본적으로 로딩 Spinner를 보여줍니다.
                                return context.read<Store1>().but1One == null
                                    ? const CircularProgressIndicator()
                                    : (Text(
                                        '${context.read<Store1>().but1One[0].lotto2People}명',
                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)));
                              },
                            ),
                       ),

                         Expanded(
                           child: FutureBuilder<List<LottoWeb>>(
                                future: lottoWeb,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                        snapshot.data![0].lotto2Amount,
                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp));
                                  } else if (snapshot.hasError) {
                                    print('데이터이상함');
                                    print(snapshot.data);
                                    return Text("${snapshot.error}");
                                  }

                                  // 기본적으로 로딩 Spinner를 보여줍니다.
                                  return context.read<Store1>().but1One == null
                                      ? const CircularProgressIndicator()
                                      : (Text(
                                          '${context.read<Store1>().but1One[0].lotto2Amount}',
                                          textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)));
                                },
                              ),
                         ),
                      SizedBox(
                        width: 120.w,
                        child: Column(
                          children: [
                            SizedBox(child: Text('당첨번호 5개 일치', textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp))),SizedBox(child: Text('+ 보너스번호 일치', textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)))


                          ],
                        ),
                      ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 2.0.w, color: const Color(0xffe5e5e5)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                     Text(' 3등', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.sp)),
                       Expanded(
                         child: FutureBuilder<List<LottoWeb>>(
                              future: lottoWeb,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                                    child: Text(
                                        '${snapshot.data![0].lotto3People}명',
                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)),
                                  );
                                } else if (snapshot.hasError) {
                                  print('데이터이상함');
                                  print(snapshot.data);
                                  return Text("${snapshot.error}");
                                }
                         
                                // 기본적으로 로딩 Spinner를 보여줍니다.
                                return context.read<Store1>().but1One == null
                                    ? const CircularProgressIndicator()
                                    : (Text(
                                        '${context.read<Store1>().but1One[0].lotto3People}명',
                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)));
                              },
                            ),
                       ),
                       
                      Expanded(
                        child: FutureBuilder<List<LottoWeb>>(
                                future: lottoWeb,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                        
                                    return Text(
                                        snapshot.data![0].lotto3Amount,
                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp));
                                  } else if (snapshot.hasError) {
                                    print('데이터이상함');
                                    print(snapshot.data);
                                    return Text("${snapshot.error}");
                                  }
                        
                                  // 기본적으로 로딩 Spinner를 보여줍니다.
                                  return context.read<Store1>().but1One == null
                                      ? const CircularProgressIndicator()
                                      : (Text(
                                          '${context.read<Store1>().but1One[0].lotto3Amount}',
                                          textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)));
                                },
                              ),
                      )
                        ,

                                SizedBox(width:120.w,child: Text('당첨번호 5개 일치', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.sp))),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 2.0.w, color: const Color(0xffe5e5e5)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(' 4등', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.sp)),
                       Expanded(
                         child: FutureBuilder<List<LottoWeb>>(
                              future: lottoWeb,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                         
                                  return Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                                    child: Text(
                                        '${snapshot.data![0].lotto4People}명',
                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)),
                                  );
                                } else if (snapshot.hasError) {
                                  print('데이터이상함');
                                  print(snapshot.data);
                                  return Text("${snapshot.error}");
                                }
                         
                                // 기본적으로 로딩 Spinner를 보여줍니다.
                                return context.read<Store1>().but1One == null
                                    ? const CircularProgressIndicator()
                                    : (Text(
                                        '${context.read<Store1>().but1One[0].lotto4People}명',
                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)));
                              },
                            ),
                       ),
                      
                        Expanded(
                          child: FutureBuilder<List<LottoWeb>>(
                                future: lottoWeb,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                          
                                    return Text(
                                        snapshot.data![0].lotto4Amount,
                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp));
                                  } else if (snapshot.hasError) {
                                    print('데이터이상함');
                                    print(snapshot.data);
                                    return Text("${snapshot.error}");
                                  }
                          
                                  // 기본적으로 로딩 Spinner를 보여줍니다.
                                  return context.read<Store1>().but1One == null
                                      ? const CircularProgressIndicator()
                                      : (Text(
                                          '${context.read<Store1>().but1One[0].lotto4Amount}',
                                          textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)));
                                },
                              ),
                        ),

                                SizedBox(width:120.w,child: Text('당첨번호 4개 일치', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.sp))),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 2.0.w, color: const Color(0xffe5e5e5)),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Text(' 5등', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.sp)),
                        Expanded(
                          child: FutureBuilder<List<LottoWeb>>(
                              future: lottoWeb,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                          
                                  return Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                                    child: Text(
                                      softWrap: false,
                                        '${snapshot.data![0].lotto5People}명',
                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)),
                                  );
                                } else if (snapshot.hasError) {
                                  print('데이터이상함');
                                  print(snapshot.data);
                                  return Text("${snapshot.error}");
                                }
                          
                                // 기본적으로 로딩 Spinner를 보여줍니다.
                                return context.read<Store1>().but1One == null
                                    ? const CircularProgressIndicator()
                                    : (Text(
                                        '${context.read<Store1>().but1One[0].lotto5People}명',
                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)));
                              },
                            ),
                        ),

                        Expanded(
                          child: FutureBuilder<List<LottoWeb>>(
                                future: lottoWeb,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                          
                                    return Text(
                                        snapshot.data![0].lotto5Amount,
                                        textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp));
                                  } else if (snapshot.hasError) {
                                    print('데이터이상함');
                                    print(snapshot.data);
                                    return Text("${snapshot.error}");
                                  }
                          
                                  // 기본적으로 로딩 Spinner를 보여줍니다.
                                  return context.read<Store1>().but1One == null
                                      ? const CircularProgressIndicator()
                                      : (Text(
                                          '${context.read<Store1>().but1One[0].lotto5Amount}',
                                          textAlign: TextAlign.end,style: TextStyle(fontSize: 15.sp)));
                                },
                              ),
                        ),
                       SizedBox(width:120.w,child: Text('당첨번호 3개 일치', textAlign: TextAlign.center,style: TextStyle(fontSize: 15.sp))),
                      ],
                    ),
                  ),
                ],
              )),
          Expanded(
              // child: ListView.builder(itemCount:context.watch<Store1>().lottoData['drwNo'], itemBuilder: (c,i){
              child: Stack(children: [
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                // color: Colors.transparent,
                width: double.infinity,
                height: 90.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 4.w),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: FutureBuilder<List<LottoWeb>>(
                  future: lottoWeb,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                          padding: EdgeInsets.fromLTRB(0, 4.h, 20.w, 0),
                          child: Text(
                              snapshot.data![0].lottoWay.replaceAll('\n', '').replaceAll(' ', '').replaceAll('\t', '').replaceAll('1등', '1등  ').replaceAll('수동', '  수동').replaceAll('반자동', '  반자동').replaceAll('동', '동 ').trim(),
                              textAlign: TextAlign.end));
                    } else if (snapshot.hasError) {
                      print('데이터이상함');
                      print(snapshot.data);
                      return Text("${snapshot.error}");
                    }

                    // 기본적으로 로딩 Spinner를 보여줍니다.
                    return Container(
                        padding: EdgeInsets.fromLTRB(0, 4.h, 10, 0),
                        child: context.read<Store1>().but1One == null
                            ? const CircularProgressIndicator()
                            : (Text(
                                '${context.read<Store1>().but1One[0].lottoWay.replaceAll('\n', '').replaceAll(' ', '').replaceAll('\t', '').replaceAll('1등', '1등  ').replaceAll('수동', '  수동').replaceAll('반자동', '  반자동').replaceAll('동', '동 ').trim()}',
                                textAlign: TextAlign.end)));
                  },
                )),
                RawScrollbar(
                  // thumbColor: const Color(0xffe5e5e5),
                  thumbColor:Colors.red,
               thumbVisibility:true,
              trackVisibility: true,
              // trackBorderColor: Colors.black,
              thickness: 20,
              interactive: true,
                  // minThumbLength =30,

              controller: controller,
              radius: const Radius.circular(5),
              child:   ListView.builder(
                // itemCount: context.read<Store1>().totalLottoData.length,
                  itemCount: lottoTotalNumber.length,
               controller:controller ,
                  itemBuilder: (c, i) {
                    return GestureDetector(
                        onTap: () {
                          // setState(() {

                          _scrollToIndex(i*90.h);

                          // _scrollController.scrollTo(
                          //     index: i, duration: Duration(milliseconds: 500));

                          changeLottoWeb(i);
                          // });

                          print('클림됨$i');
                        },
                        // child: totalBall(a: i));
                        child: reTotalBall(a: i));
                    //   return Text('a');
                  }),









              // ScrollablePositionedList.builder(
              //     // itemCount: context.read<Store1>().totalLottoData.length,
              //     itemCount: lottoTotalNumber.length,
              //     itemScrollController: _scrollController,
              //     itemBuilder: (c, i) {
              //       return GestureDetector(
              //           onTap: () {
              //             // setState(() {
              //               _scrollController.scrollTo(
              //                   index: i, duration: Duration(milliseconds: 500));
              //               changeLottoWeb(i);
              //             // });
              //
              //             print('클림됨${i}');
              //           },
              //           // child: totalBall(a: i));
              //       child: reTotalBall(a: i));
              //       //   return Text('a');
              //     }),
              //




            ),
          ]))
        ],
      ),
    );
  }
}
