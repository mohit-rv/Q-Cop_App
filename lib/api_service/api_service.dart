
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:qcop/api_service/response/UserMappApi.dart';
import 'package:qcop/api_service/response/project_list_response_model.dart';
import 'package:qcop/api_service/utils.dart';
import 'package:qcop/local_database/database.dart';
import 'package:qcop/local_database/models/project_models.dart';





class ApiService {

  static String projectEndpoint = 'GetProjectList';
  static String userMappEndPoint = 'GetUserMapping';






  Future<List<ProjectListResponseModel>?> getProjectList()async{
    List<ProjectListResponseModel> projectList = [];
    final response = await http.get(Uri.parse( Constants.projectUrl + projectEndpoint));
    var data = jsonDecode(response.body.toString());

    print(data);
    if(response.statusCode == 200){
      for(var i in data){
        projectList.add(ProjectListResponseModel.fromJson(i));
        // print(data);
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
      final respnse = await http.get(Uri.parse(Constants.projectUrl + userMappEndPoint));
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







  }


