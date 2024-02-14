

import 'package:flutter/cupertino.dart';

class QAlevel1Model {

   final int? level1ID;
   final int? pid;
   final String level1Name;

  QAlevel1Model({required this.level1ID,required this.pid,required this.level1Name});

   QAlevel1Model.fromMap(Map<String, dynamic>res):
       pid = res['PID'],
       level1ID = res['Level1ID'],
       level1Name = res['Level1Name'];


    Map<String, Object?> toMap(){
     return {
       'PID': pid,
       'Level1ID': level1ID,
       'Level1Name': level1Name
     };
    }




}