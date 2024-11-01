import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotto/provider/win_gallery_Provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  FocusNode focusNode = FocusNode();
  FocusNode focusNodeTitle = FocusNode();
  var userImage;
  String title = ''; //제목
  String content = ''; //내용

  Future _uploadFile(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      // 스토리지에 업로드할 파일 경로
      final firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('post') //'post'라는 folder를 만들고
          .child('${DateTime.now().millisecondsSinceEpoch}.png');

      // 파일 업로드
      final uploadTask = firebaseStorageRef.putFile(
          userImage, SettableMetadata(contentType: 'image/png'));

      // 완료까지 기다림
      await uploadTask.whenComplete(() => null);

      // 업로드 완료 후 url
      final downloadUrl = await firebaseStorageRef.getDownloadURL();



      FirebaseFirestore.instance
          .collection('카운트')
          .doc('카운트')
          .get()
          .then((DocumentSnapshot ds) {
        var b = ds['카운트'];
        FirebaseFirestore.instance
            .collection('게시판')
            .doc('$b')
            .update({'imgUrl': downloadUrl});
      });



    } catch (e) {
      print(e);
    }

    // 완료 후 앞 화면으로 이동
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          title: Container(
              padding: EdgeInsets.fromLTRB(0, 7.h, 0, 0),
              child: Text("글쓰기", style:TextStyle(color:Colors.white,fontSize: 35.sp,fontFamily: 'Pretendard'))),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Container(
              // height: focusNode.hasFocus?50.h:100.h,
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
              child: TextField(
                focusNode: focusNodeTitle,
                onChanged: (String text) {
                  title = text;
                },
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(

                  hintText: '제목예시> 1007회차 당첨후기..',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              // height: (focusNode.hasFocus||focusNodeTitle.hasFocus)?50.h:100.h,
              margin: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 0),
              padding: EdgeInsets.fromLTRB(10.h, 0, 10.h, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(10.0)),
              child: userImage == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '당첨사진',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w900),
                        ),
                        IconButton(
                            onPressed: () async {
                              var picker = ImagePicker();
                              var image = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (image != null) {
                                setState(() {
                                  userImage = File(image.path);
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.add_box_outlined,
                              size: 35,
                            ))
                      ],
                    )
                  : SizedBox(
                      height: 40.h,
                      child: Image.file(userImage),
                    ),
            ),
            Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.w, 5.h, 0.w, 0.h),
              padding: EdgeInsets.fromLTRB(20.w,0,20.w, 0),
              child: TextField(
                focusNode: focusNode,
                onChanged: (String text) {
                  content = text;
                },
                keyboardType: TextInputType.multiline,
                maxLines: 20,
                decoration: InputDecoration(
                  // label: userImage==null? Text('이미지넣어주세요'):SizedBox(child: Image.file(userImage),),
                  hintText: '당첨소감과 후기를 적어주세요',
                  hintStyle: TextStyle(fontSize: 20.sp),
                  border: const OutlineInputBorder(),
                  // labelText: "내용을 입력하세요.",
                ),
              ),
            )),
            SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 5.h),
                margin: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 20.h),
              
                child: TextButton(
                  onPressed: () {
                    if (userImage == null) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text('당첨사진 등록해주셔야해요!')],
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
                    } else if (title == '' ||
                        title == ' ' ||
                        title == '  ' ||
                        content == '' ||
                        content == ' ' ||
                        content == '  ') {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text('제목이나 내용이 비어있어요!')],
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
                    } else {
                      //네트워크상 시간 (스마트폰의 위치에 따라 시간대가 바뀜)
                      var now = DateTime.now();
              
                      context
                          .read<Gallery_Store>()
                          .add(title, content, '$now'); //제목 내용으로 저장
                      _uploadFile(context);
              
                      Navigator.pop(context);
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(0, 10.h, 0, 5.h),
                    backgroundColor: Colors.blueAccent,
                    minimumSize: Size(400.w, 50.h),
                    maximumSize: Size(400.w,200.h)
                  ),
                  child: Text(
                    '당첨후기 등록',
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily:'Pretendard',
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ))

    );
  }
}
