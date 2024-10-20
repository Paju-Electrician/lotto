



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotto/pages/lottoNumber.dart';
import 'package:lotto/provider/naverSearch_Provider.dart';
import 'package:lotto/widget/mainWidgets.dart';
import 'package:provider/provider.dart';

class button11Page extends StatefulWidget {
  const button11Page({Key? key}) : super(key: key);

  @override
  State<button11Page> createState() => _button11PageState();
}

class _button11PageState extends State<button11Page> {



  List _button11firstRoundList =[];
  var _button11firstRound ;

  List _button11secondRoundList =[];
  var _button11secondRound ;


  button11ListInit(){
    setState(() {
      _button11firstRoundList =List<int>.generate(context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11], (int index) => index+1 );
      _button11secondRoundList =List<int>.generate(context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11] , (int index) => index+1 ).reversed.toList();


      _button11firstRound  = 1;
      _button11secondRound = context.read<naverSearch_FirstNum_Store>().naverSearch_FirstNum[11];

    });
  }




  int setNumber = 1;

  var setList ;
  var setCountList ={};

  var setNumberPoHanList =[];

  dongbanMake(){
    setNumberPoHanList.clear();
    setState(() {
      setList= List<int>.generate(45, (i) => i+1);
      setList.removeWhere((element) => element==setNumber);
      setCountList ={1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0,11:0,12:0,13:0,14:0,15:0,16:0,17:0,18:0,19:0,20:0,21:0,22:0,23:0,24:0,25:0,26:0,27:0,28:0,29:0,30:0,31:0,32:0,33:0,34:0,35:0,36:0,37:0,38:0,39:0,40:0,41:0,42:0,43:0,44:0,45:0};

    });


    for(int i=_button11firstRound-1;i<_button11secondRound;i++) {
      for(int j=1;j<7;j++){

        if (lottoTotalNumber[i][j] == setNumber) {
          setState(() {
            setNumberPoHanList.add(lottoTotalNumber.length - i);
          });

        }

        for(int l=1;l<7;l++) {
          if (lottoTotalNumber[i][j] == setNumber) {
            // setNumberPoHanList.add(lottoTotalNumber.length-i);
            for (int k = 0; k < setList.length; k++) {
              if (lottoTotalNumber[i][l] == setList[k]) {
                // print(setList[k]);
                setState(() {
                  setCountList[setList[k]] = setCountList[setList[k]]! + 1;
                });
              }
            }
          }
        }

      }}
    setState(() {
      setCountList.removeWhere((key, value) => key==setNumber);
      setCountList= Map.fromEntries(setCountList.entries.toList()..sort((e1, e2) =>e1.value==e2.value?e1.key.compareTo(e2.key):e1.value.compareTo(e2.value)));
    });


    // print(setList);
    // print(setCountList);
    // print(setNumberPoHanList);
    // print(setNumberPoHanList.length);
    // print(setCountList.entries.toList()[1]);
  }









  setNumberMakePlus(){
    if(setNumber!=45) {
      setState(() {
        setNumber++;
      });
      dongbanMake();
    }else{
      setState(() {
        setNumber=1;
      });
      dongbanMake();
    }
  }
  setNumberMakeMinus(){
    if(setNumber!=1) {
      setState(() {
        setNumber--;
      });
      dongbanMake();
    }else{
      setState(() {
        setNumber=45;
      });
      dongbanMake();
    }
  }



















  @override
  void initState() {
    // TODO: implement initState
    button11ListInit();
    dongbanMake();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
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
          // Container(
          //   padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 0),
          //   child:
          //
          //
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       IconButton(onPressed: (){}, icon: Icon(Icons.refresh)),
          //       Text('동반수/미동반수 분석',
          //           style: TextStyle(
          //               fontWeight: FontWeight.w500,
          //               fontFamily: 'Pretendard',
          //               fontSize: 30.sp)),
          //       IconButton(onPressed: null, icon: Icon(null)
          //       )
          //     ],
          //   ),
          //
          // ),
          //
          // Container(
          //   padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.h),
          //   child: Text('동반수/미동반수에서는 같이 출현한 번호의 확률을 볼수 있습니다. ',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w500,
          //           fontFamily: 'Pretendard',
          //           fontSize: 15.sp)),
          // ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(children: [
                      DropdownButton(
                        alignment: Alignment.center,
                        value: _button11firstRound,
                        items: _button11firstRoundList.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value.toString(), style: TextStyle(fontSize: 25.sp,
                                fontWeight: FontWeight.w900),),
                          );
                        }).toList(),


                        onChanged: (newVal) {

                          if(_button11secondRound>=newVal) {
                            setState(() {
                              _button11firstRound= newVal;
                            });
                            dongbanMake();
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                width: 320.w,
                                content: Text(
                                  '앞자리 숫자가 뒷자리 숫자보다 클 수 없어요',
                                  style: TextStyle(fontSize: 18.sp),
                                  textAlign: TextAlign.center,
                                ),
                                padding: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                                backgroundColor: Colors.grey,
                                duration: const Duration(milliseconds: 1000),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )));
                          }
                        },




                      ),
                      Text('회차',
                          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900))
                    ]),
                    Text(' ~ ',style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900)),
                    Row(children: [
                      DropdownButton(
                        alignment: Alignment.center,
                        value: _button11secondRound,
                        items: _button11secondRoundList.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value.toString(), style: TextStyle(fontSize: 25.sp,
                                fontWeight: FontWeight.w900),),
                          );
                        }).toList(),


                        onChanged: (newVal) {
                          if(int.parse(newVal.toString()) >=_button11firstRound) {
                            setState(() {
                              _button11secondRound = newVal;
                            });
                            dongbanMake();
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                width: 320.w,
                                content: Text(
                                  '앞자리 숫자가 뒷자리 숫자보다 클 수 없어요',
                                  style: TextStyle(fontSize: 18.sp),
                                  textAlign: TextAlign.center,
                                ),
                                padding: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                                backgroundColor: Colors.grey,
                                duration: const Duration(milliseconds: 1000),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )));
                          }



                        },







                      ),
                      Text('회차',
                          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900))
                    ]),
                  ],

                ),

              ],
            ),
          ),

          dongban(setNumber:setNumber,setList:setList,setCountList:setCountList,setNumberPoHanList:setNumberPoHanList,setNumberMakePlus:setNumberMakePlus,setNumberMakeMinus:setNumberMakeMinus)

        ],
      ),
    );
  }
}

class dongban extends StatefulWidget {
   dongban({Key? key,this.setNumber,this.setList,this.setCountList,this.setNumberPoHanList,this.setNumberMakeMinus,this.setNumberMakePlus}) : super(key: key);
var setNumber;
var setList;
var setCountList;
var setNumberPoHanList;
var setNumberMakeMinus;
var setNumberMakePlus;
  @override
  State<dongban> createState() => _dongbanState();
}

class _dongbanState extends State<dongban> {
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
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder:(c,i) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                           // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(child: getBall(
                                widget.setCountList.entries.toList().reversed.toList()[i].key),
                              fit: BoxFit.cover,),
                            FittedBox(fit: BoxFit.contain, child: Text(
                                '${widget.setCountList.entries.toList().reversed.toList()[i].value}번',style: TextStyle(fontSize: 15.sp),)),
                            FittedBox(fit: BoxFit.contain, child: Text('${((widget.setCountList.entries.toList().reversed.toList()[i].value/widget.setNumberPoHanList.length)*100).toStringAsFixed(2)}%')),
                            // FittedBox(child: getBall(
                            //     setCountList.entries.toList()[i].key),
                            //   fit: BoxFit.contain,),
                            // FittedBox(child: Text(
                            //     '${setCountList.entries.toList()[i].value}회'),
                            //     fit: BoxFit.contain),
                            // FittedBox(child: Text('97%'), fit: BoxFit.contain),
                          ],
                        );
                      }
                       ,itemCount: widget.setCountList.length,),
                    )


                  ],
                ),),

              Expanded(
                flex: 1,
                child: Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [


                      Column(
                        children: [
                          Text('동반수는',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18.sp),),
                          Text('같이 출현한',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18.sp),),
                          Text('번호를',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18.sp),),
                          Text('의미합니다',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18.sp),),
                         
                         

                        ],
                      ),

                      
                      Column(
                        children: [
                          Text('숫자기준',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18.sp),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child:
                              FittedBox(fit:BoxFit.none,child:IconButton(onPressed: (){widget.setNumberMakeMinus();}, icon:const Icon(Icons.arrow_left), splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent, constraints: const BoxConstraints(),iconSize: 100,),)),
                              Expanded(child: FittedBox(child:getBall(widget.setNumber),fit:BoxFit.contain,)),
                              Expanded(child: FittedBox(fit:BoxFit.none, child:IconButton(onPressed: (){widget.setNumberMakePlus();}, icon:const Icon(Icons.arrow_right), splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,constraints: const BoxConstraints(),iconSize: 100,))),
                            ],
                          ),

                          Column(
                            children: [

                              Image.asset('assets/click.png',width: 100.w,height: 100.h,),
                              Text('좌우',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18.sp),),
                              Text('기준변경',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18.sp),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/scroll.png',width: 100.w,height: 100.h,),
                          Text('스크롤',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18.sp),),
                          Text('숫자이동',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18.sp),),
                        ],
                      ),



                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder:(c,i) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(child: getBall(
                                  widget.setCountList.entries.toList()[i].key),
                                fit: BoxFit.cover,),
                              FittedBox(fit: BoxFit.contain, child: Text(
                                  '${widget.setCountList.entries.toList()[i].value}번',style: TextStyle(fontSize: 15.sp))),
                              FittedBox(fit: BoxFit.contain, child: Text('${((widget.setCountList.entries.toList()[i].value/widget.setNumberPoHanList.length)*100).toStringAsFixed(2)}%')),
                              // FittedBox(child: getBall(
                              //     setCountList.entries.toList()[i].key),
                              //   fit: BoxFit.contain,),
                              // FittedBox(child: Text(
                              //     '${setCountList.entries.toList()[i].value}회'),
                              //     fit: BoxFit.contain),
                              // FittedBox(child: Text('97%'), fit: BoxFit.contain),
                            ],
                          );
                        }
                        ,itemCount: widget.setCountList.length,),
                    )

                ])
              )
            ],
          ),
        ),




    );
  }
}
