import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Gallery_Store extends ChangeNotifier {
  final firestore = FirebaseFirestore.instance;
  String collection = '게시판';

  void add(String title, String content, String dateTime) {
    firestore.collection('카운트').doc('카운트').get().then((DocumentSnapshot ds) {
      int a = ds['카운트'] + 1;

      firestore.collection(collection).doc('$a').set(
        {
          '제목': title,
          '내용': content,
          '날짜': dateTime,
          'id': a,
        },
      );

      cntupdate(a);

    });
    notifyListeners();
  }

  void cntupdate(int id) {
    firestore.collection('카운트').doc('카운트').update({'id': id, '카운트': id});
  }

  void update(int id, String title, String content) {
    firestore
        .collection(collection)
        .doc('$id')
        .update({'제목': title, '내용': content});
  }

  void delete(int id) {
    //특정 document 삭제
    firestore.collection(collection).doc('$id').delete();
  }

  void replyupdate(int id, String reply) {
    firestore
        .collection(collection)
        .doc('$id')
        .get()
        .then((DocumentSnapshot ds) {

      if ((ds.data() as Map<String, dynamic>)['댓글수'] == null) {
        firestore
            .collection(collection)
            .doc('$id')
            .update({'댓글1': reply, '댓글수': 1});
      } else {
        int a = ds['댓글수'] + 1;

        firestore
            .collection(collection)
            .doc('$id')
            .update({'댓글${a.toString()}': reply, '댓글수': a});
      }
    });
  }

  void likeupdate(int id, int like) {
    firestore.collection(collection).doc('$id').update({'축하해요': like});
  }

  void envyupdate(int id, int envy) {
    firestore.collection(collection).doc('$id').update({'부러워요': envy});
  }

  getlike(int id) async {
    var getResult = await firestore.collection(collection).doc('$id').get();

    return getResult['축하해요'];
  }
}
