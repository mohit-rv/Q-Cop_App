


import 'package:flutter/cupertino.dart';
import 'package:qcop/api_service/response/project_list_response_model.dart';




class  ProjectModel {

  //  final int? PrimaryKey;
    final int? PID;
    final String ProjectCode;
    final String ProjectName;
    final String ProjectDescription;
    final String Status;



 ProjectModel({
  // this.PrimaryKey,
   required this.PID,required this.ProjectCode,required this.ProjectName,required this.ProjectDescription,required this.Status});


 // int? get pID => PID;                    //getter
 // String get projectCode => ProjectCode;
 // String get projectName => ProjectName;
 // String get projectDescription => ProjectDescription;
 // String get status => Status;
 //
 // set projectN(String newprojectName){    //setter
 //     if(newprojectName.isNotEmpty){
 //       ProjectName = newprojectName;
 //     }
 // }
 //
 //
 //   set fromApiModel(ProjectListResponseModel projectListResponseModel) {
 //     ProjectName = projectListResponseModel.projectName ?? ProjectName;  //at ihis
 //   }


 ProjectModel.fromMap(Map<String, dynamic> res):
    //PrimaryKey = res['id'],
    PID = res['Pid'],
    ProjectCode = res['ProjectCode'],
    ProjectName = res['ProjectName'],
    ProjectDescription = res['ProjectDescription'],
    Status = res['Status'];

  Map<String, Object?> toMap(){
    return {
    //'id': PrimaryKey,
      'Pid': PID,
      'ProjectCode': ProjectCode,
      'ProjectName' : ProjectName,
      'ProjectDescription': ProjectDescription,
      'Status': Status
    };
  }



}


