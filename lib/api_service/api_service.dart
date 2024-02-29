
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:qcop/api_service/response/UserMappApi.dart';
import 'package:qcop/api_service/response/level2_response_model.dart';
import 'package:qcop/api_service/response/level3_response_model.dart';
import 'package:qcop/api_service/response/level4_response_model.dart';
import 'package:qcop/api_service/response/level5_response_model.dart';
import 'package:qcop/api_service/response/level6_response_model.dart';
import 'package:qcop/api_service/response/project_list_response_model.dart';
import 'package:qcop/api_service/response/qa_level1_responese_model.dart';
import 'package:qcop/api_service/response/tap_id.dart';
import 'package:qcop/api_service/response/users_table_list.dart';
import 'package:qcop/api_service/utils.dart';





class ApiService {

  static String projectEndpoint = 'GetProjectList';
  static String userMappEndPoint = 'GetUserMapping';
  static String uesrsTableEndPoint = 'GetUsersList';
  static String QALocLevel1EndPoint = 'GetLevel1';
  static String LocLevel2EndPoint = 'GetLevel2';
  static String LocLevel3EndPoint = 'GetLevel3';
  static String LocLevel4EndPoint = 'GetLevel4';
  static String LocLevel5EndPoint = 'GetLevel5';
  static String LocLevel6EndPoint = 'GetLevel6';
  static String TapIDEndPoint = 'GetUserTabID';



  Future<List<ProjectListResponseModel>?> getProjectList()async{
    List<ProjectListResponseModel> projectList = [];
    final response = await http.get(Uri.parse( Constants.apiUrl + projectEndpoint));
    var data = jsonDecode(response.body.toString());

    print(data);
    if(response.statusCode == 200){
      for(var i in data){
        projectList.add(ProjectListResponseModel.fromJson(i));
        print(i);
      }
     // SqfDataBase().insert(projectList as ProjectModel);
      return projectList;
    }else {
         // throw Exception('Failed with status code: ${response
         //    .statusCode}, Message: ${response.body}');
      return null;
          }
        }


    Future<List<UserMap>?> getUserMap() async{
    List<UserMap> userMapList = [];
      final respnse = await http.get(Uri.parse(Constants.apiUrl + userMappEndPoint));
      var data = jsonDecode(respnse.body.toString());
      if(respnse.statusCode== 200){
        for(var i in data){
          userMapList.add(UserMap.fromJson(i));
          print(i);
        }
        return userMapList;
      }else{
             return null;
       }
      }

    Future<List<UsersTableListAPI>?> getUsersdata() async{
    List<UsersTableListAPI> usersDataList = [];
    final response = await http.get(Uri.parse(Constants.apiUrl+ uesrsTableEndPoint));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(var i in data){
        usersDataList.add(UsersTableListAPI.fromJson(i));
        print(i);
      }
      return usersDataList;
    } else {
      return null;
    }
      }


     Future<List<Qalevel>?> getQAlevel1(int pid) async{
     List<Qalevel> level1Data = [];
     final response = await http.get(Uri.parse('${Constants.apiUrl+ QALocLevel1EndPoint}?PrjID=$pid'),
     );
     // print('Content-Type: ${response.headers['Content-Type']}');
     // print('Status code: ${response.statusCode}');
     // print(response.body.toString());
     var data = jsonDecode(response.body.toString());
     if(response.statusCode==200){

       for(var i in data){
        level1Data.add(Qalevel.fromJson(i));
        print(i);
      }
      return level1Data;
    }else{
      return null;
    }
      }


      Future<List<Level2Response>?> getLevel2(int pid) async{
      List<Level2Response> level2Data = [];
      final response = await http.get(Uri.parse('${Constants.apiUrl + LocLevel2EndPoint}?PrjID=$pid')
      );
      var data = jsonDecode(response.body.toString());
      if(response.statusCode==200){
      for(var i in data){
        level2Data.add(Level2Response.fromJson(i));
        print(i);
       }
      return level2Data;
      }else{
      return null;
      }
      }

     Future<List<level3Response>?> getLevel3(int pid) async{
     List<level3Response> level3Data = [];
     final response = await http.get(Uri.parse('${Constants.apiUrl+ LocLevel3EndPoint}?PrjID=$pid'));
     var data =jsonDecode(response.body.toString());
     if(response.statusCode==200){
       for(var i in data){
         level3Data.add(level3Response.fromJson(i));
         print(i);
       }
       return level3Data;
     }else{
       return null;
     }

      }

      Future<List<Level4ResponseModel>?> getLevel4(int pid) async{
        List<Level4ResponseModel> level4List = [];
        final response = await http.get(Uri.parse('${Constants.apiUrl+ LocLevel4EndPoint}?PrjID=$pid'));
        var data = jsonDecode(response.body.toString());
        if(response.statusCode==200) {
          for(var i in data){
            level4List.add(Level4ResponseModel.fromJson(i));
            print(i);
          }
          return level4List;
        }else {
          return null;
        }
      }


      Future<List<Level5ResponseModel>?> getLevel5(int pid) async{
      List<Level5ResponseModel> level5List = [];
      final response = await http.get(Uri.parse('${Constants.apiUrl+ LocLevel5EndPoint}?PrjID=$pid'));
      var data = jsonDecode(response.body.toString());
      if(response.statusCode==200){
        for(var i in data){
          level5List.add(Level5ResponseModel.fromJson(i));
          print(i);
        }
        return level5List;
      }else{
        return null;
      }
      }


      Future<List<Level6ResponseModel>?> getLevel6(int pid) async{
    List<Level6ResponseModel> level6List = [];
    final response = await http.get(Uri.parse('${Constants.apiUrl+ LocLevel6EndPoint}?PrjID=$pid'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(var i in data){
        level6List.add(Level6ResponseModel.fromJson(i));
        print(i);
      }
      return level6List;
    }else {
      return null;
    }
      }

      Future<List<UserTapID>?> getTapID(int uid,int pid) async{
      List<UserTapID> tapList = [];
      final response = await http.get(Uri.parse('${Constants.apiUrl+ TapIDEndPoint}?UserID=$uid&PrjID=$pid'));
      print('response: $response');
      var data = jsonDecode(response.body.toString());
      if(response.statusCode==200){
        for(var i in data){
          tapList.add(UserTapID.fromJson(i));
          print(i);
        }
        print('$tapList');
        return tapList;
      }else {
        return null;
      }
      }





  }


