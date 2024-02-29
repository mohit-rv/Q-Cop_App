import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qcop/api_service/response/tap_id.dart';
import 'package:qcop/local_database/models/qa_level1_model.dart';
import 'package:qcop/screens/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_service/api_service.dart';
import '../api_service/response/level2_response_model.dart';
import '../api_service/response/level3_response_model.dart';
import '../api_service/response/level4_response_model.dart';
import '../api_service/response/level5_response_model.dart';
import '../api_service/response/level6_response_model.dart';
import '../api_service/response/project_list_response_model.dart';
import '../api_service/response/qa_level1_responese_model.dart';
import '../local_database/database.dart';
import '../local_database/models/Level5_model.dart';
import '../local_database/models/level2_model.dart';
import '../local_database/models/level3_model.dart';
import '../local_database/models/level4_model.dart';
import '../local_database/models/level6_model.dart';
import '../local_database/models/project_models.dart';
import '../resources/resources.dart';

class DownloadScreen extends StatefulWidget {

  final String projectname;
  const DownloadScreen({super.key,required this.projectname});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {

  List<String> projectName = [];
  List<int> prjPid = [];
  TextEditingController optionController = TextEditingController();
  List<QAlevel1Model>  level1List = [];
  List<ProjectModel>  projects = [];
  bool _isLoading = false;
  var retrievedPid;
  var retrievedUid;
  var retrievedtabId;
  Future<void> retrievePid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    retrievedPid= prefs.getInt("storedPid")!;
    retrievedUid= prefs.getInt('UIDkey');
    retrievedtabId= prefs.getInt('tabIDkey');
    setState(() {
      print('loading');
    });
    print('retrievedPid: $retrievedPid');
    print('retrievedUid: $retrievedUid');
    print('retrievedtabId: $retrievedtabId');
  }
  Future<void> _loadText() async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String savedText = prefs.getString('ProjectName') ?? '';
      setState(() {
        optionController.text = savedText;
      });
  }
  Future<void> _saveText(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('ProjectName', value);
  }

   bool isListDownloaded = false;
   void checkDataIsStored() async{
    if(isLevelsInfoChecked) {
           getLevel1Field();
           getLevel2Field();
           getLevel3Field();
           getLevel4Field();
           getLevel5Field();
           getLevel6Field();
           print('list downloaded');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isListDownloaded', true);
      setState(() {
        isListDownloaded = true;
        print('List Downloaded : $level1List');
      });
      print('check selected: level Info');
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
       Fluttertoast.showToast(
         msg: "Levels info Content has Downloded",
         // gravity: ToastGravity.BOTTOM,
         backgroundColor: Colors.white,
         textColor: Colors.black,
       );
    }else if(isInspInfoChecked){
      Fluttertoast.showToast(
        msg: "Content is not availibe",
        // gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white
      );
    } else if(isCheckListInfoChecked){
      Fluttertoast.showToast(
        msg: "Content is not availibe",
        // gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white
      );
    } else if(isUserInfoChecked) {
      Fluttertoast.showToast(
        msg: "Content is not availibe",
        // gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white
      );
    }
    else {
      Fluttertoast.showToast(
          msg: 'Content is not downloaded',
          backgroundColor: Colors.red,
        textColor: Colors.white
      );
    }
  }

  void showLoadingIndicator() {
    setState(() {
      _isLoading = true;
    });
    // Show CircularProgressIndicator for 2 seconds
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
      checkDataIsStored();
      // After 2 seconds, you can proceed with your logic
      // For example, call a method or navigate to another screen
      // yourOtherLogic();
    });
  }

  //how to show CircularProgressIndicator for 2 secondes in flutter

  // void levelData(){
  //   _isLoading ? CircularProgressIndicator(color: Colors.orangeAccent,): checkDataIsStored(retrievedPid, level1List);
  // }

  void fetchData() async {
    ApiService apiService = ApiService();
    try {
      List<UserTapID>? data = await apiService.getTapID(retrievedUid,retrievedPid);
      if(data!=null){
        for(var i in data ) {
          print('tabID p: ${i.tabID}');
        }
      }
      print('Data: $data');
      // Handle the data as needed
    } catch (e) {
      // Handle errors
      print('Error fetching Api: $e');
    }
  }
  void getLevel1Field() async{
    level1List = (await SqfDataBase().getlevel1data())!;
    if(level1List.isEmpty){
      List<Qalevel>? levelList =await ApiService().getQAlevel1(retrievedPid);
      if(levelList!=null){
        for(var i in levelList){
          QAlevel1Model level1Data = QAlevel1Model(
            level1ID: i.level1ID,
            pid: i.pid,
            level1Name: i.level1Name ?? "",
          );
          await SqfDataBase().insertLevel1(level1Data);
        }

        for(var i in level1List){
          print('level1Name db: ${i.level1Name}');
        }
      }

    }else{
      for(var i in level1List){
        print('level1Name db: ${i.level1Name}');
      }
    }
    //print('from localdb: $level1List');
  }
  void getLevel2Field() async{
    List<Level2Model> level2List = await SqfDataBase().getLevel2Data();
    if(level2List.isEmpty){
      List<Level2Response>? level2Response = await ApiService().getLevel2(retrievedPid);
      if(level2Response!=null){
        for(var i in level2Response){
          Level2Model level2Data = Level2Model(
            level2ID: i.level2ID,
            level1ID: i.level1ID,
            level2Name: i.level2Name ?? "",
            Active: i.active ?? "",
          );
          await SqfDataBase().insertLevel2(level2Data);
        }
        for(var i in level2List){
          print('level2Name: ${i.level2Name}');
        }

      }
    } else{
      for(var i in level2List){
        print('level2Name else: ${i.level2Name}');
      }
    }
  }
  void getLevel3Field() async{
    List<Level3Model> Level3Data = await SqfDataBase().getLevel3DModel();
    if(Level3Data.isEmpty){
      List<level3Response>? Level3Response = await ApiService().getLevel3(retrievedPid);
      if(Level3Response!=null){
        for(var i in Level3Response){
          Level3Model level3Data = Level3Model(
              level2ID: i.level2ID,
              level3ID: i.level3ID,
              level3Name: i.level3Name ?? ""
          );
          await SqfDataBase().insertLevel3(level3Data);
        }

        for(var i in Level3Data){
          print('level3Name: ${i.level3Name}');
        }
      }
    }else {
      for(var i in Level3Data){
        print('level3Name else: ${i.level3Name}');
      }
    }
  }
  void getLevel4Field() async{
    List<Level4Model> level4List = await SqfDataBase().getLevel4Model();
    if(level4List.isEmpty){
      List<Level4ResponseModel>? level4Response = await ApiService().getLevel4(retrievedPid);
      if(level4Response!= null){
        for(var i in level4Response){
          Level4Model level4Data = Level4Model(
              level4ID: i.level4ID,
              level3ID: i.level3Id,
              level4Name: i.level4Name ?? ""
          );
          await SqfDataBase().insertLevel4(level4Data);
        }
        for(var i in level4List){
          print('level4Name db: ${i.level4Name}');
        }
      }
    }else {
      for(var i in level4List){
        print('level4Name db else: ${i.level4Name}');
      }
    }
  }
  void getLevel5Field() async{
    List<Level5Model> level5List = await SqfDataBase().getLevel5Model();
    if(level5List.isEmpty){
      List<Level5ResponseModel>? level5Response = await ApiService().getLevel5(retrievedPid);
      if(level5Response!=null){
        for(var i in level5Response){
          Level5Model level5Data = Level5Model(
              level5ID: i.level5ID,
              level4ID: i.level4ID,
              level5Name: i.level5Name ?? ""
          );
          await SqfDataBase().insertLevel5(level5Data);
        }

        for(var i in level5List){
          print('level5Name db: ${i.level5Name}');
        }

      }
    }else {
      for(var i in level5List){
        print('level5Name db el: ${i.level5Name}');
      }
    }
  }
  void getLevel6Field()  async{
    List<Level6Model> level6List = await SqfDataBase().getLevel6Model();
    if(level6List.isEmpty){
      List<Level6ResponseModel>? Level6Response = await ApiService().getLevel6(retrievedPid);
      if(Level6Response!=null){
        for(var i in Level6Response){
          Level6Model Level6Data = Level6Model(
              level6ID: i.level6ID,
              level5ID: i.level5ID,
              level6Name: i.level6Name ?? ""
          );
          await SqfDataBase().insertLevel6(Level6Data);
        }
        for(var i in level6List){
          print('level6Name : ${i.level6Name}');
        }
      }
    }else{
      for(var i in level6List){
        print('level6Name db el: ${i.level6Name}');
      }
    }
  }
  void getProjectName() async{
    projects = await SqfDataBase().getProjects();
    if(projects.isEmpty){
      List<ProjectListResponseModel>? insertProjects = await ApiService().getProjectList();
      if(insertProjects!=null) {
        for (var i in insertProjects) {
          ProjectModel items = ProjectModel(
            PID: i.pID,
            ProjectCode: i.projectCode ?? "",
            ProjectName: i.projectName ?? "",
            ProjectDescription: i.projectDescription ?? "",
            Status: i.status ?? "",
          );
          await SqfDataBase().insert(items);
        }
        projectName.clear();
          List<ProjectModel> prjNm = await SqfDataBase().getProjcteNameOnPID(retrievedPid);
        for (var i in prjNm) {
          projectName.add(i.ProjectName);
          //projectName.add(i.PID);
        }

        prjPid.clear();
      }
    }else {
      projectName.clear();

        List<ProjectModel> prjNm = await SqfDataBase().getProjcteNameOnPID(retrievedPid);
        for (var i in prjNm) {
          projectName.add(i.ProjectName);
        }

      print('projectName from login: $projectName');
      prjPid.clear();
    }
  }

 //how to show navigated string value in suggestion of typeaheadformfield

  bool isUserInfoChecked = false;
  bool isLevelsInfoChecked = true;
  bool isCheckListInfoChecked = true;
  bool isInspInfoChecked = true;

  FocusNode optionNode = FocusNode();
  List<Map<String, dynamic>> optionsList = [
    {'slected Value': 'MET Sector 8', }
  ];
//but i want to show navigated value which is coming from first screen and used in suggestion of typeaheadformfield which is in second screen

  @override
  void initState() {
    _initializeData();
    _loadText();
    print('Data has initialized');

    // TODO: implement initState
    super.initState();
  }

  Future<void> _initializeData() async{
    await retrievePid(); // Await the async method
    print('pid $retrievedPid');
    getProjectName();
   // fetchData();
    //getProject(retrievedPid, projects);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C3C89),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: EdgeInsets.only(top: 230,left: 17, right: 17, bottom: 18),
            // color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            // elevation: 1,
            child: Container(
             // height: 60,
            //  margin: EdgeInsets.only(top: 50),
             width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(

                          child: Text(
                            'Tab ID : $retrievedtabId',
                            style: TextStyle(
                              color: Color(0xFF242424),
                              fontSize: 15,
                              fontFamily: 'Poppins Semibold',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          padding: EdgeInsets.all(7),
                          decoration: ShapeDecoration(
                            color: Color(0xFF0C3C89),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                          child: Text(
                          'Connect to Central Server',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: 'Poppins Semibold',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width:  MediaQuery.of(context).size.width,
                    height:  50,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.only(top: 12,left: 10,right: 10),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1,color: Color(0xFF0C3C89)),
                        borderRadius: BorderRadius.circular(12),
                      )
                    ),
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: optionController,
                        onChanged: (value) {
                           setState(() {

                           });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '${widget.projectname}',
                          hintStyle: TextStyle(
                            // color: Color(0xFF242424),
                            color: Color(0xFFA7A9B7),
                            fontSize: 14,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                        onSuggestionSelected: (suggestion) {
                           setState(() {
                             optionController.text = suggestion;
                             _saveText(suggestion);
                           });
                        },
                        itemBuilder: (context, suggestion) {
                          return Container(
                            padding: EdgeInsets.only(top: 3),
                            child: ListTile(
                              title: Text(suggestion,
                                style: TextStyle(
                               //   color: Color(0xFFA7A9B7),
                                  color: Color(0xFF242424),
                                  fontSize: 14,
                                  fontFamily: 'Poppins Medium',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              ),
                            ),
                          );
                        },
                        suggestionsCallback: (pattern) {
                        return projectName.where((list) => list
                            .toLowerCase().contains(pattern.toLowerCase())).toList();
                        },
                      suggestionsBoxDecoration: SuggestionsBoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)
                      ),
                    ),

                  ),

                  getUserInfoCheck(),
                  getCheckListInfoCheck(),
                  getLevelsInfoCheck(),
                  getInspInfoCheck(),

                    getDownloadBtn()

                    ]
                  )
            ),
          ),
        ),
      ),
    );
  }


  getDownloadBtn() {
    if(isUserInfoChecked || isCheckListInfoChecked || isInspInfoChecked || isLevelsInfoChecked){
      return   InkWell(
           highlightColor: Colors.transparent,  // Disable splash effect
          onTap:  (){

            _isLoading ? null : showLoadingIndicator();
          },
          child: Container(
            //width: 179,
            height: 46,
            margin: EdgeInsets.only(top: 33, bottom: 26, left: 80, right: 80),
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: Color(0xFF0C3C89),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child:
            _isLoading ?  Container(
                height: 24,width: 24,
                child: CircularProgressIndicator(backgroundColor: Color(0xFF0C3C89),color: Colors.white,)):
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Download',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Poppins Semibold',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Image(
                    image: AssetImage(Resources.downloadIcon),
                    width: 16,
                    height: 13,
                  ),
                )
              ],
            ),
          )
      );
    }
    else {
       return  InkWell(
           onTap:  (){
             Fluttertoast.showToast(
               msg: 'Select minimum one checkbox',
               backgroundColor: Colors.red,
               textColor: Colors.white,
             );
            // _isLoading ? null : showLoadingIndicator();
           },
           child: Container(
             //width: 179,
             height: 46,
             margin: EdgeInsets.only(top: 33, bottom: 26, left: 80, right: 80),
             alignment: Alignment.center,
             decoration: ShapeDecoration(
               color: Color(0xFF0C3C89),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(30),
               ),
             ),
             child:
             _isLoading ?  Container(
                 height: 24,width: 24,
                 child: CircularProgressIndicator(backgroundColor: Color(0xFF0C3C89),color: Colors.white,)):
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   child: Text(
                     'Download',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 15,
                       fontFamily: 'Poppins Semibold',
                       fontWeight: FontWeight.w600,
                       height: 0,
                     ),
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(left: 8),
                   child: Image(
                     image: AssetImage(Resources.downloadIcon),
                     width: 16,
                     height: 13,
                   ),
                 )
               ],
             ),
           )
       );
    }
  }

  getCheckListInfoCheck() {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Checkbox(
              checkColor: Colors.white,
              visualDensity: VisualDensity(vertical: -4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFF005AC6);
                    }
                    return Colors.white;
                  }),
              side: const BorderSide(
                color: Color(0xFF005AC6),
                width: 1,
              ),
              value: isCheckListInfoChecked,
              onChanged: (bool? value) {
                setState(() {
                  isCheckListInfoChecked = value!;
                });
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                'CheckList Info',
                style: TextStyle(
                  color: Color(0xBC63676F),
                  fontSize: 12,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: -0.36,
                ),
              )
          ),
        ],
      ),
    );
  }

  getLevelsInfoCheck() {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Checkbox(
              checkColor: Colors.white,
              visualDensity: VisualDensity(vertical: -4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFF005AC6);
                    }
                    return Colors.white;
                  }),
              side: const BorderSide(
                color: Color(0xFF005AC6),
                width: 1,
              ),
              value: isLevelsInfoChecked,
              onChanged: (bool? value) {
                setState(() {
                 // selectCheck();
                  isLevelsInfoChecked = value!;
                  if(isLevelsInfoChecked) {

                  }
                });
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                'Levels Info',
                style: TextStyle(
                  color: Color(0xBC63676F),
                  fontSize: 12,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: -0.36,
                ),
              )
          ),
        ],
      ),
    );
  }

  getInspInfoCheck() {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Checkbox(
              checkColor: Colors.white,
              visualDensity: VisualDensity(vertical: -4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFF005AC6);
                    }
                    return Colors.white;
                  }),
              side: const BorderSide(
                color: Color(0xFF005AC6),
                width: 1,
              ),
              value: isInspInfoChecked,
              onChanged: (bool? value) {
                setState(() {
                  isInspInfoChecked = value!;
                });
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                'Insp. Info',
                style: TextStyle(
                  color: Color(0xBC63676F),
                  fontSize: 12,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: -0.36,
                ),
              )
          ),
        ],
      ),
    );
  }

  getUserInfoCheck() {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 12),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Checkbox(
              checkColor: Colors.white,
              visualDensity: VisualDensity(vertical: -4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFF005AC6);
                    }
                    return Colors.white;
                  }),
              side: const BorderSide(
                color: Color(0xFF005AC6),
                width: 1,
              ),
              value: isUserInfoChecked,
              onChanged: (bool? value) {
                setState(() {
                  isUserInfoChecked = value!;
                });
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                'Users Info',
                style: TextStyle(
                  color: Color(0xBC63676F),
                  fontSize: 12,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: -0.36,
                ),
              )
          ),
        ],
      ),
    );
  }

}
