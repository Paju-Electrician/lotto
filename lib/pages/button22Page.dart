import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lotto/pages/content.dart';
import 'package:lotto/pages/sharedpreferences.dart';
import 'package:lotto/provider/store2.dart';
import 'write.dart';

import 'package:provider/provider.dart';


class button2Page extends StatefulWidget {
  const button2Page({Key? key}) : super(key: key);

  @override
  State<button2Page> createState() => _button2PageState();
}

class _button2PageState extends State<button2Page>  {

  // final List<String> ImagesList = [
  //   //배너 사진들
  //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2c7QfmDSyMdzugD_z5nzHCORhvnVqiT14w&usqp=CAU",
  //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2c7QfmDSyMdzugD_z5nzHCORhvnVqiT14w&usqp=CAU",
  //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2c7QfmDSyMdzugD_z5nzHCORhvnVqiT14w&usqp=CAU",
  // ];

  void _incrementCounter() {
    //쓰기로 이동
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WritePage()),
      );
    });
  }

  onMove(String title, String content, int id, String url) {
    //해당 게시글로 이동
    data d = data();
    d.setTitle(title, content, id, url);
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const contentPage()),
      );
    });

  }

  onMoveNoImg(String title, String content, int id) {
    //해당 게시글로 이동
    data d = data();
    d.setTitleNoImg(title, content, id);
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const contentPage()),
      );
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff8f8f8),
        leadingWidth: 0,
        centerTitle: true,
        title: Container(
            padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
            child:
            // Row(
            //   children: [
                // ElevatedButton(onPressed: (){testclear();}, child: Text('테스트버튼')),
                const Text(
                  '로또당첨후기 익명게시판',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'DoHyeon'),
                  textAlign: TextAlign.center,
                ),
              // ],

      ),
        elevation: 0,
      ),


      body: Center(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          children: <Widget>[
            Card(
                child: Column(
              children: <Widget>[

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  // height:50,
                  decoration: const BoxDecoration(color: Colors.blueAccent),
                  child: GestureDetector(

                    child: const Text(
                      '< 공지사항 > 필독해주세요',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'DoHyeon',
                          fontSize: 25,
                          fontWeight: FontWeight.w100),
                    ),

                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              //Dialog Main Title
                              title: const Column(
                                children: <Widget>[
                                  Text("<로또당첨후기 익명게시판>"),
                                ],
                              ),
                              //
                              content: const Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('로또당첨후기게시판은',
                                          style: TextStyle(fontSize: 20)),
                                      Text('당첨자만 작성가능합니다. ',
                                          style: TextStyle(fontSize: 20)),
                                      Text('로또당첨글이 아닌 글은',
                                          style: TextStyle(fontSize: 20)),
                                      Text('자동삭제됩니다.',
                                          style: TextStyle(fontSize: 20)),
                                      Text(
                                        '로또당첨자를 이용해주셔서',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        '감사합니다!',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("확인"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 600,
                        child: sss(context),
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        onPressed: _incrementCounter,
        tooltip: '글쓰기',
        icon: const Icon(Icons.add,color: Colors.white),
        label: const Text(
          '당첨후기작성하기',
          style: TextStyle(
            color: Colors.white,
              fontSize: 25, fontWeight: FontWeight.w500, fontFamily: 'DoHyeon'),
        ),
      ),
    );
  }

  Widget sss(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: context
          .read<DataBase>()
          .firestore
          .collection('게시판')
          .orderBy('id', descending: true) //이건 정렬
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading...');
          default:
            var docs = snapshot.data!.docs;
            return FutureBuilder<dynamic>(
                    future: getReport(),
                    builder: (context,snapi) {
                      List snapia = snapi.data ?? [['0'],0];


                      if (snapia[0]==['0']||snapi.data==null){

                      }else{
                        print('snapi는${snapi.data}');
                        for( String c in snapia[0]) {
                          int a = int.parse(c);
                          docs.removeAt(docs.length - a);
                        }
                      }


                      int b;
                      if (snapia[1]==0) {
                        print('b1이 null이면 ${snapia[1]}');
                        b=0;
                      }else{
                        print('b1이 null아니면 ${snapia[1]}');
                        b = snapia[1];
                      }

                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length-b,
                          itemBuilder: (c, i) {return Column(
                          children: <Widget>[
                            SizedBox(
                              height: 70,
                              child: ListTile(
                                  visualDensity:
                                  const VisualDensity(horizontal: 0, vertical: 4),
                                  contentPadding: const EdgeInsets.all(0),
                                  title: Transform.translate(
                                      offset: const Offset(-10, -15),
                                      child: Row(children: [
                                        Expanded(
                                            child: Text(
                                              '${(docs[i].data() as Map<
                                                  String,
                                                  dynamic>)['제목']}',
                                              textAlign: TextAlign.justify,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ))
                                      ])),
                                  subtitle: Transform.translate(
                                      offset: const Offset(-9, -15),
                                      child: Row(children: [
                                        Expanded(
                                            child: Text(
                                              '${(docs[i].data() as Map<
                                                  String,
                                                  dynamic>)['내용']}',
                                              textAlign: TextAlign.justify,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ))
                                      ])),
                                  leading: Transform.translate(
                                      offset: const Offset(0, -17),
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                        width: 90,
                                        height: double.infinity,

                                        child: (docs[i].data() as Map<String,
                                            dynamic>)['imgUrl'] ==
                                            null
                                            ? Image.asset('assets/time.png')
                                            : Image.network(
                                            '${(docs[i].data() as Map<
                                                String,
                                                dynamic>)['imgUrl']}',
                                            fit: BoxFit.cover),
                                      )),
                                  onTap: () {
                                    if ((docs[i].data()
                                    as Map<String, dynamic>)['imgUrl'] ==
                                        null) {
                                      onMoveNoImg(
                                          (docs[i].data()
                                          as Map<String, dynamic>)['제목'],
                                          (docs[i].data()
                                          as Map<String, dynamic>)['내용'],
                                          (docs[i].data()
                                          as Map<String, dynamic>)['id']);
                                    } else {
                                      onMove(
                                          (docs[i].data()
                                          as Map<String, dynamic>)['제목'],
                                          (docs[i].data()
                                          as Map<String, dynamic>)['내용'],
                                          (docs[i].data()
                                          as Map<String, dynamic>)['id'],
                                          (docs[i].data()
                                          as Map<String, dynamic>)['imgUrl']);
                                    }
                                  }),
                            ),
                            const Divider(
                              thickness: 1.0,
                            )
                          ],
                        );

                    });



                });



        }
      },
    );
  }
}
