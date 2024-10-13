

import 'package:shared_preferences/shared_preferences.dart';




saveReport(int? i) async{

  var storage = await SharedPreferences.getInstance();
    int? reportInt = storage.getInt('신고카운트');
    if(reportInt==null) {
      storage.setInt('신고카운트', 1);
    }else{
      storage.setInt('신고카운트', reportInt+1);
    }



    List<String>? reportList = storage.getStringList('신고리스트');

   if(reportList==null) {
     storage.setStringList('신고리스트', [i.toString()]);
   }else {

       reportList.add(i.toString());

       storage.setStringList('신고리스트', reportList);

     }

    // storage.setInt('id', i!);

  // storage.setString('신고', 'true');
}

getReport() async{
  var storage = await SharedPreferences.getInstance();
  // var result = storage.getString('신고');
  // var resultId = storage.get('id');

  List<String>? resultIdList = storage.getStringList('신고리스트');
  resultIdList ??= [];
  var reportInt = storage.getInt('신고카운트');
  reportInt ??= 0;
  List reportInfo =[];
 reportInfo =[resultIdList,reportInt];
  return reportInfo;
}

testclear()async{
  var storage = await SharedPreferences.getInstance();
  await storage.clear();

}


saveReply(int? i) async{
  var storage = await SharedPreferences.getInstance();
  // int? replyInt = storage.getInt('신고댓글번호');
  // if(replyInt==null) {
  //
  // }else{
  //   storage.setInt('신고댓글번호',i!);
  // }



  List<String>? replyListNum = storage.getStringList('신고댓글번호리스트');

  if(replyListNum==null) {
    storage.setStringList('신고댓글번호리스트', [i.toString()]);
  }else {

    replyListNum.add(i.toString());

    storage.setStringList('신고댓글번호리스트', replyListNum);
  }
}
getReply() async{
  var storage = await SharedPreferences.getInstance();
  // var result = storage.getString('신고');
  // var resultId = storage.get('id');

  List<String>? replyListNum = storage.getStringList('신고댓글번호리스트');
  replyListNum ??= [];
  return replyListNum;
}




saveLottoNumberList (List<String>? l) async{

  var storage = await SharedPreferences.getInstance();

  List<String> saveLottoNumberList = storage.getStringList('로또번호저장리스트')??[];

  saveLottoNumberList.add(l.toString());
  print(saveLottoNumberList);
  storage.setStringList('로또번호저장리스트', saveLottoNumberList);
  // if(saveLottoNumberList==null) {
  //    saveLottoNumberList.add(l.toString());
  //   // storage.setStringList('로또번호저장리스트', [l.toString()]);
  //    storage.setStringList('로또번호저장리스트', saveLottoNumberList);
  //   print('l은${l}');
  // }else {
  //
  //
  //   saveLottoNumberList.add(l.toString());
  //
  //   storage.setStringList('로또번호저장리스트', saveLottoNumberList);
  //   print(saveLottoNumberList);
  // }
}

getLottoNumberList() async{
  var storage = await SharedPreferences.getInstance();
  // var result = storage.getString('신고');
  // var resultId = storage.get('id');

  List<String>? getLottoNumberList = storage.getStringList('로또번호저장리스트');
  getLottoNumberList ??= [];
  print(getLottoNumberList);
  return getLottoNumberList;
}
deleteLottoNumberList(i) async{
  var storage = await SharedPreferences.getInstance();
  List<String>? deleteLottoNumberList = storage.getStringList('로또번호저장리스트');
    deleteLottoNumberList!.removeAt(i);
  storage.clear();
  storage.setStringList('로또번호저장리스트', deleteLottoNumberList);



}


saveBell(iconBool) async{
  var storage = await SharedPreferences.getInstance();
    storage.setBool('토요일당첨결과알람', iconBool);








}
getBell() async{
  var storage = await SharedPreferences.getInstance();
  bool getBellBool;
  var temp = storage.getBool('토요일당첨결과알람');
 if(temp==null) {
   getBellBool = false;
 }else {
   getBellBool=temp;
 }

   return getBellBool;
 }


// getTotalDataList() async{
//   var storage = await SharedPreferences.getInstance();
//   String? temp = storage.getString('totalLottoData');
//   List totalLottoData = json.decode(temp!);
//   if(totalLottoData==null){
//     return [];
//   }else{
//     print('get함수에서실행된거:${totalLottoData}');
//     return totalLottoData;
//   }
//
// }
