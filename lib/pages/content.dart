import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotto/pages/sharedpreferences.dart';
import 'package:lotto/provider/win_gallery_Provider.dart';
import 'package:provider/provider.dart';

import 'button2Page.dart';

String data_title = '';
String data_content = '';
String data_url = '';
int? data_id;

class data {
  void setTitleNoImg(String title, String content, int id) {
    data_title = title;
    data_content = content;
    data_id = id;
  }

  void setTitle(String title, String content, int id, String url) {
    data_title = title;
    data_content = content;
    data_id = id;
    data_url = url;
  }
}

class contentPage extends StatefulWidget {
  const contentPage({Key? key}) : super(key: key);

  @override
  _contentPageState createState() => _contentPageState();
}

class _contentPageState extends State<contentPage> {
  data d = data();
  var inputData;
  final _controller = TextEditingController();

  int like = 0;
  int envy = 0;

  clearText() {
    _controller.clear();
  }

  likeplus() {
    if (data_id != null) {
      context.read<Gallery_Store>().likeupdate(data_id!, like + 1);
    }
  }

  envyplus() {
    if (data_id != null) {
      context.read<Gallery_Store>().envyupdate(data_id!, envy + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0.h),
          child: AppBar(
            leadingWidth: 0,
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
            titleSpacing: 0,
            // toolbarHeight: 60,
            title: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child:

                  AutoSizeText(
                    '로또당첨후기 익명게시판',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w100,
                        fontFamily: 'Pretendard'),
                  ),


            ),
            elevation: 0,
          ),
        ),
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        '${data_id.toString()}번째 당첨게시글! 축하합니다!',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 5.h)),
                      AutoSizeText('제목:$data_title',
                          maxLines: 2, style: TextStyle(fontSize: 20.sp)),
                      //제목
                    ],
                  ))
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 2.0,
              ), // Container(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                          child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                    Container(
                        child: Row(
                      children: <Widget>[
                        Expanded(
                          child: data_url == null
                              ? const CircularProgressIndicator()
                              : InteractiveViewer(
                                  child: Image.network(data_url)),
                        ), //내용
                      ],
                    )),

                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 50.h),
                        child: Text(data_content,
                            style: TextStyle(fontSize: 20.sp))),

                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              child: Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    likeplus();
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        '축하해요',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: 'Pretendard'),
                                      ),
                                      const Icon(Icons.thumb_up, color: Colors.blue)
                                    ],
                                  )),
                            ],
                          )),
                          StreamBuilder<QuerySnapshot>(
                              stream: context
                                  .read<Gallery_Store>()
                                  .firestore
                                  .collection('게시판')
                                  .where('id', isEqualTo: data_id)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                Map<String, dynamic>? likeResult;
                                if (snapshot.data != null) {
                                  likeResult = snapshot.data!.docs.map((doc) {
                                    return (doc.data());
                                  }).toList()[0] as Map<String, dynamic>;

                                  // like = likeResult['축하해요'];

                                  like = likeResult['축하해요'] ?? 0;
                                }
                                return Container(
                                  child: Text(
                                      '${likeResult == null ? 0 : likeResult['축하해요'] ?? 0}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w100,
                                          fontFamily: 'Pretendard')),
                                );
                              }),
                          Container(
                              child: Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    envyplus();
                                  },
                                  child: Row(
                                    children: [
                                      Text('부러워요',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w100,
                                              fontFamily: 'Pretendard')),
                                      const Icon(Icons.thumb_up, color: Colors.red)
                                    ],
                                  )),
                            ],
                          )),
                          StreamBuilder<QuerySnapshot>(
                              stream: context
                                  .read<Gallery_Store>()
                                  .firestore
                                  .collection('게시판')
                                  .where('id', isEqualTo: data_id)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                Map<String, dynamic>? envyResult;
                                if (snapshot.data != null) {
                                  envyResult = snapshot.data!.docs.map((doc) {
                                    return (doc.data());
                                  }).toList()[0] as Map<String, dynamic>;

                                  envy = envyResult['부러워요'] ?? 0;
                                }

                                return Container(
                                  child: Text(
                                      '${envyResult == null ? 0 : envyResult['부러워요'] ?? 0}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w100,
                                          fontFamily: 'Pretendard')),
                                );
                              }),
                        ],
                      ),
                    ), //

                    Container(
                      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            '신고하고 글보지 않기',
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      //Dialog Main Title
                                      title: const Column(
                                        children: <Widget>[
                                          Text("<신고관련 유의사항>"),
                                        ],
                                      ),
                                      //
                                      content: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text('컨탠츠와 관련없는',
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              Text('부적절한 글인가요?',
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              Text('신고를 하면 이 글은',
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              Text('더이상 보이지 않습니다.',
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              // Text('자동삭제됩니다.',
                                              //     style: TextStyle(fontSize: 20)),
                                              // Text(
                                              //   '로또당첨자를 이용해주셔서',
                                              //   style: TextStyle(fontSize: 20),
                                              // ),
                                              // Text(
                                              //   '감사합니다!',
                                              //   style: TextStyle(fontSize: 20),
                                              // ),
                                            ],
                                          )
                                        ],
                                      ),
                                      actionsAlignment:
                                          MainAxisAlignment.spaceAround,
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text("아니오"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: const Text("확인"),
                                          onPressed: () {
                                            saveReport(data_id);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (c) {
                                              return const button2Page();
                                            }));
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.notifications_off,
                              size: 30,
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      ),
                    ), // 내용,
                    const Divider(
                      color: Colors.grey,
                      thickness: 2.0,
                    ),

                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        // height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Row(children: [
                          Expanded(
                              child: Container(
                                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                  child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              hintText: '축하댓글을 써주세요',
                              hintStyle: TextStyle(fontSize: 20.sp),
                              suffixIcon: IconButton(
                                onPressed: _controller.clear,
                                icon: const Icon(Icons.clear),
                              ),
                            ),
                            maxLines: 2,
                            maxLength: 60,
                            onChanged: (text) {
                              setState(
                                () {
                                  inputData = text;
                                },
                              );
                            },
                          ))),
                          ElevatedButton(
                            onPressed: () {
                              clearText();

                              context
                                  .read<Gallery_Store>()
                                  .replyupdate(data_id!, inputData); //댓글의 개수를 i
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(50.0.w, 50.0.h), backgroundColor: Colors.blueAccent,
                                maximumSize: Size(100.0.w, 50.0.h)),
                            child: Text(
                              '등록',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w900),
                            ),
                          )
                        ])),

                    Container(
                        decoration: const BoxDecoration(color: Color(0xffeeeeee)),
                        margin: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
                        child: const reply()

                        // reply(context)

                        ),
                  ])))),
            ])));
  }
}

class reply extends StatefulWidget {
  const reply({Key? key}) : super(key: key);

  @override
  State<reply> createState() => _replyState();
}

class _replyState extends State<reply> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: context
            .read<Gallery_Store>()
            .firestore
            .collection('게시판')
            .where('id', isEqualTo: data_id)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading...}');
            default:
              return FutureBuilder<dynamic>(
                  future: getReply(),
                  builder: (context, result) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            //
                            // ((snapshot.data!.docs.map((doc) {
                            //   return (doc.data());
                            // }).toList())[0] as Map<String, dynamic>)['댓글수'] ==
                            //     null
                            //     ? 0
                            //     : ((snapshot.data!.docs.map((doc) {
                            //   return (doc.data());
                            // }).toList())[0] as Map<String, dynamic>)['댓글수'],

                            ((snapshot.data!.docs.map((doc) {
                                      return (doc.data());
                                    }).toList())[0]
                                        as Map<String, dynamic>)['댓글수'] ==
                                    null
                                ? 0
                                : result.data != null
                                    ? ((snapshot.data!.docs.map((doc) {
                                          return (doc.data());
                                        }).toList())[0]
                                            as Map<String, dynamic>)['댓글수'] -
                                        result.data.length
                                    : ((snapshot.data!.docs.map((doc) {
                                        return (doc.data());
                                      }).toList())[0]
                                        as Map<String, dynamic>)['댓글수'],
                        itemBuilder: (c, i) {
                          var a2 = snapshot.data!.docs.map((doc) {
                            return (doc.data());
                          }).toList();
                          var a3 = a2[0] as Map<String, dynamic>;


                          return FutureBuilder<dynamic>(
                              future: getReply(),
                              builder: (context, snapi) {
                                if (snapi.data != []&&snapi.data!=null) {
                                  for (var a in snapi.data) {
                                    if (i + 1 == int.parse(a)) {
                                      i = i + 1;
                                    }
                                  }
                                }

                                return Container(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(Icons.person),
                                            Expanded(
                                              child: Text(
                                                '${a3['댓글${i + 1}']}',
                                                textAlign: TextAlign.justify,
                                                style:
                                                    TextStyle(fontSize: 20.sp),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                              ),
                                            ),
                                            Container(
                                                // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                                alignment: Alignment.topCenter,
                                                padding: const EdgeInsets.all(0),
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 5.w, 0),
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0)),
                                                              //Dialog Main Title
                                                              title: const Column(
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                      "<댓글신고관련 유의사항>"),
                                                                ],
                                                              ),
                                                              //
                                                              content: const Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                          '댓글이 부적절한 글인가요?',
                                                                          style:
                                                                              TextStyle(fontSize: 20)),
                                                                      Text(
                                                                          '신고를 하면 이 댓글은',
                                                                          style:
                                                                              TextStyle(fontSize: 20)),
                                                                      Text(
                                                                          '더이상 보이지 않습니다.',
                                                                          style:
                                                                              TextStyle(fontSize: 20)),
                                                                      // Text('자동삭제됩니다.',
                                                                      //     style: TextStyle(fontSize: 20)),
                                                                      // Text(
                                                                      //   '로또당첨자를 이용해주셔서',
                                                                      //   style: TextStyle(fontSize: 20),
                                                                      // ),
                                                                      // Text(
                                                                      //   '감사합니다!',
                                                                      //   style: TextStyle(fontSize: 20),
                                                                      // ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                              actionsAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  child:
                                                                      Text(
                                                                    "아니오",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20.sp),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                                TextButton(
                                                                  child: Text(
                                                                      "확인",
                                                                      style: TextStyle(
                                                                        color: Colors.blue,
                                                                          fontSize:
                                                                              20.sp)),
                                                                  onPressed:
                                                                      () {
                                                                    saveReply(
                                                                        i + 1);
                                                                    setState(
                                                                        () {
                                                                      const reply();
                                                                    });
                                                                    Navigator.pop(
                                                                        context);
                                                                    //
                                                                    // Navigator.pop(context);

                                                                    // Navigator.push(context, MaterialPageRoute(builder: (c) {
                                                                    //   return button5Page();
                                                                    // }));
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          });
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor: Colors.grey,
                                                            minimumSize: Size(
                                                                50.w, 10.h),
                                                            maximumSize: Size(
                                                                150.w, 35.h),
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    0,
                                                                    5.h,
                                                                    0,
                                                                    5.h)),
                                                    child: Text(
                                                      '신고',
                                                      style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    )))
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                          thickness: 0.8,
                                        ),
                                      ],
                                    ));
                              });
                        });
                  });
          }
        });
  }
}
