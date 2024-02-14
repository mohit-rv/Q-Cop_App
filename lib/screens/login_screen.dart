import 'dart:ffi';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:qcop/api_service/api_service.dart';
import 'package:qcop/api_service/response/UserMappApi.dart';
import 'package:qcop/api_service/response/project_list_response_model.dart';
import 'package:qcop/api_service/response/users_table_list.dart';
import 'package:qcop/local_database/models/project_models.dart';
import 'package:qcop/local_database/models/usermapping.dart';
import 'package:qcop/local_database/models/users_model.dart';
import 'package:qcop/resources/resources.dart';
import 'package:qcop/screens/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../local_database/database.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      print('user loggedin');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    }
  }

  void checkRememberMeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool rememberMe = prefs.getBool('rememberMe') ?? false;

    if (rememberMe) {
      String savedUsername = prefs.getString('username') ?? '';
      String savedPassword = prefs.getString('password') ?? '';

      _userNameController.text = savedUsername;
      _passwordController.text = savedPassword;

      // Optionally, automatically attempt login with the saved credentials here
    }
  }

  void _login() async {
    // Validate login credentials (you can replace this with your authentication logic)
    // For simplicity, just checking if username and password are not empty
    if ( _userNameController.text.isNotEmpty && _passwordController.text==pass ) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => DashboardScreen()),
      // );
      //prefs.setString('password', _passwordController.text);
      print('remember me ');
    }
  }


  // void _login() async {
  //   // Validate login credentials (replace with your authentication logic)
  //   if (_userNameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //     // Save login credentials if "Remember Me" is selected
  //     if (isConditionsChecked) {
  //       prefs.setBool('rememberMe', true);
  //       prefs.setString('username', _userNameController.text);
  //       prefs.setString('password', _passwordController.text);
  //     } else {
  //       // If "Remember Me" is not selected, clear saved credentials
  //       prefs.setBool('rememberMe', false);
  //       prefs.remove('username');
  //       prefs.remove('password');
  //     }
  //
  //     // Proceed with your login logic here
  //   }
  // }

  String pass= "";
  var selectedPid;
  var mapUID;
  var userName;
 // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;
  late TextEditingController _userNameController;
  late TextEditingController projectController;

  late FocusNode _passwordNode = FocusNode();
  late FocusNode _projectNode = FocusNode();
  late FocusNode _userNameNode = FocusNode();


  bool _passwordIsVisible = false;
  bool isConditionsChecked = false;
  String appVersion = "";

  //TextEditingController projectController = TextEditingController();
  var selectedValue = "";

  // Future<List<dynamic>> ListName = SqfDataBase().getProjects();
   final List<int> projectListID = [];

   final List<dynamic> projectName = [];
   final List<String> userMappingsList =[];
  //var selectedProjectName = "";
   final List<String> userList = [];
 // final List<String> usersList = [];
   Set<String> uniqueUserSet = Set<String>();

   final List<int>   getUID = [];
  List<ProjectModel> projects = [];
  List<UserModel> Users = [];
  List<UserMappingModel> UsermappingModel = [];

   getPIDFromProjectName(selectedProjectName, List<ProjectModel> projects) {
    for (var project in projects) {
      if (project.ProjectName == selectedProjectName) {
        print("Match found! ProjectName: ${project.ProjectName}, PID: ${project.PID}");
        return project.PID;
      }
    }
    print("No match found for ProjectName: $selectedProjectName");
    return null; // Return null if projectName is not found
  }


  getUIDfromUserMapping( selectedPid, List<UserMappingModel> UserMapping) {
     for(var items in UserMapping){
       if( items.PrjID == selectedPid){
         print("UID of selected project from usermapping table: ${items.UID}");
         // print("get UID from UserMapping Table: ${items.UID},When ProjectModel_PID = UserMapping_PrjID");
         // return items.UID;
         getUID.add(items.UID!);
         // mapUID= items.UID;
         //getUsersListBasedOnUIDMap();

       }
     }
     getUsersListBasedOnUID();
    // print("No UID found for for $selectedPid");
     return null;
  }

  getPasswordOfSelecteduser(selectedUser , List<UserModel> users){
     for(var items in users){
       if( items.LoginName == selectedUser){
         print('password of selected User: ${items.Password}');
         pass= items.Password;
         break;
       }
     }
     return null;
  }



  // static List<String> filterdProjectList(String query,projects) {
  //   List<String> matches = [];
  //   matches.addAll(projects);
  //   matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
  //   return matches;
  // }

  String selectedproject = "";

  int? j;

  int? userMappinguid;



  @override
  void initState() {
    _passwordController = TextEditingController();
    _userNameController = TextEditingController();
    projectController = TextEditingController();
    _passwordNode= FocusNode();
    _userNameNode= FocusNode();
    _projectNode= FocusNode();
    checkLoginStatus();
    getAppVersion();
   getProjectName();
    fetchDataUserMapping();
     getUsersListBasedOnUID();
     SqfDataBase().getProjects();
  //  SQDatabase?.insertProjectApiModel(ProjectListResponseModel, projectName);
    super.initState();
  }

  // void _getData() async {
  //    var data = (await ApiService().getProjectList())!;
  //   Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  // }

  @override
  void dispose() {
    _passwordController.dispose();
    _userNameController.dispose();
    projectController.dispose();
    _passwordNode.dispose();
    _userNameNode.dispose();
    _projectNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.minWidth,
                minHeight: constraints.minHeight,
              ),
              child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 38),
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage(Resources.qcopImg),
                          width: 170,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'Poppins Bold',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Etiam posuere pretium ipsum. ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.699999988079071),
                            fontSize: 14,
                            fontFamily: 'Poppins Regular',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 20, left: 25),
                      //   alignment: Alignment.centerLeft,
                      //   child: Text(
                      //     'Project',
                      //     style: TextStyle(
                      //       color: Color(0xFF191D31),
                      //       fontSize: 15,
                      //       fontFamily: 'Poppins Medium',
                      //       fontWeight: FontWeight.w500,
                      //       height: 0,
                      //     ),
                      //   ),
                      // ),


                      // TypeAheadField(
                      //    builder: (context,_projectController,_projectNode){
                      //      return TextFormField(
                      //        controller: _projectController,
                      //        focusNode: _projectNode,
                      //        autofocus: true,
                      //        decoration: InputDecoration(
                      //          border: OutlineInputBorder(),
                      //          hintText: 'Project'
                      //        ),
                      //      );
                      //    },
                      //   itemBuilder: (context,suggestion){
                      //      return ListTile(
                      //        leading: Icon(CupertinoIcons.refresh),
                      //        title: Text(projects as String),
                      //      );
                      //
                      //   },
                      //    suggestionsCallback: (pattern){
                      //      return projects.where((project) => project
                      //          .toLowerCase().contains(pattern.toLowerCase())).toList();
                      //    },
                      //   onSelected: (suggestion) {
                      //     setState(() {
                      //       selectedproject = selectedproject;
                      //     });
                      //   },
                      // ),


                      getProjectField(),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 25, top: 20),
                        child: Text(
                          'User',
                          style: TextStyle(
                            color: Color(0xFF191D31),
                            fontSize: 15,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: getUserNameField(),
                          ),
                          Container(
                            width: 52,
                            height: 52,
                            margin: EdgeInsets.only(top: 10, left: 7, right: 24),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1,
                                    color: Color(0xFFD8DADC)
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Image(
                              image: AssetImage(Resources.syncIcon),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 25, top: 20),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            color: Color(0xFF191D31),
                            fontSize: 15,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      getPasswordField(),
                      getTermsAndCheck(),
                      getLoginBtn(),
                      Spacer(),
                      Container(
                        child: Text(
                          'An Innovation For You',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFA7A9B7),
                            fontSize: 12,
                            fontFamily: 'Poppins Regular',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Container(
                        //margin: EdgeInsets.only(bottom: 16),
                        child: Text(
                          'App Version: ${appVersion}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF005AC6),
                            fontSize: 12,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      )
                    ],
                  ),
              ),
            ),
          );
        }
      ),
    );
  }

  void getAppVersion() async {

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    print(version);
    print(buildNumber);

    setState(() {
      appVersion = version;
    });

  }

  getTermsAndCheck() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 15),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Checkbox(
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFF005AC6);
                    }
                    return Colors.black12;
                  }),
              side: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
              value: isConditionsChecked,
              onChanged: (bool? value) {
                setState(() {
                  isConditionsChecked = value ?? false;
                    print('CheckBox Selected');
                    _login();
                });
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Text(
              'Remember me',
              style: TextStyle(
                color: Color(0xFF232323),
                fontSize: 12,
                fontFamily: 'Poppins Regular',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -0.36,
              ),
            ),
          )
        ],
      ),
    );
  }

  getPasswordField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFD8DADC),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            controller: _passwordController,
            focusNode: _passwordNode,
            onChanged: (text) {
              setState(() {});
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your password",
                hintStyle: TextStyle(
                  color: Color(0xFFA7A9B7),
                  fontSize: 14,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
                counterText: "",
                prefixIcon: Container(
                  margin: EdgeInsets.only(right: 8),
                  child: const Image(
                    image: AssetImage(Resources.passIcon),
                    width: 24,
                    height: 24,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 34,
                  maxHeight: 34,
                  minHeight: 34,
                  maxWidth: 34,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    !_passwordIsVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    //change icon based on boolean value
                    color: _passwordIsVisible
                        ? HexColor("#838383")
                        : HexColor("#838383"),
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordIsVisible =
                          !_passwordIsVisible; //change boolean value
                    });
                  },
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(18)),
            keyboardType: TextInputType.name,
            obscureText: !_passwordIsVisible,
            maxLines: 1,
            cursorColor: Color(0xFFA7A9B7),
            style: TextStyle(
              color: Color(0xFFA7A9B7),
              fontSize: 14,
              fontFamily: 'Poppins Medium',
              fontWeight: FontWeight.w400,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  getProjectField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFD8DADC),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 5, right: 15),
        child: Column(
          children: [

            Expanded(
              child: TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  focusNode: _projectNode,
                  // autofocus: true,
                   controller: projectController,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     prefixIcon: Image(image: AssetImage(Resources.projectIcon),),
                     hintText: "Project",
                     hintStyle: TextStyle(
                       color: Color(0xFFA7A9B7),
                       fontSize: 14,
                       fontFamily: 'Poppins Medium',
                       fontWeight: FontWeight.w400,
                       height: 0.13,
                     ),
                   )
                ),
                itemBuilder: (context,suggestion){
                  return ListTile(
                    title: Text(
                      suggestion,
                    style: TextStyle(
                      color: Color(0xFFA7A9B7),
                      fontSize: 14,
                      fontFamily: 'Poppins Medium',
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                    ),
                  );
                },
                suggestionsCallback: (pattern) async {
                 //  List<String?> projectNames = await getProjectNamefromDevice();       //through sqflite modelclass
                 // return projectNames.where((name) => name!.toLowerCase().contains(pattern.toLowerCase())).toList();
                  return projectName.where((projectName) => projectName
                      .toLowerCase().contains(pattern.toLowerCase())).toList();
                },

                onSuggestionSelected: (suggestion) {
                  setState(() {
                    projectController.text = suggestion;
                    _userNameController.clear();
                    selectedPid = getPIDFromProjectName(suggestion, projects);
                    if (selectedPid != null) {
                      print("Selected PID: $selectedPid");
                      getUIDfromUserMapping(selectedPid,UsermappingModel);
                     // getUserMapONprojectID();
                    } else {
                      print("ProjectName not found or PID is null.");
                    }
                  });
                },
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }

  getUserNameField() {
    //List<String> userList = uniqueUserSet.toList();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(top: 10, left: 24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFD8DADC)
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          alignment: Alignment.center,
          // child: TextFormField(
          //   controller: _userNameController,
          //   focusNode: _userNameNode,
          //   onChanged: (text) {
          //     setState(() {});
          //   },
          //   decoration: InputDecoration(
          //       border: InputBorder.none,
          //       hintText: "Enter user name",
          //       hintStyle: TextStyle(
          //         color: Color(0xFFA7A9B7),
          //         fontSize: 14,
          //         fontFamily: 'Poppins Medium',
          //         fontWeight: FontWeight.w400,
          //         height: 1,
          //       ),
          //       counterText: "",
          //       prefixIcon: Container(
          //         margin: EdgeInsets.only(right: 8),
          //         child: const Image(
          //           image: AssetImage(Resources.userNameIcon),
          //           width: 13,
          //           height: 19,
          //         ),
          //       ),
          //       prefixIconConstraints: BoxConstraints(
          //         minWidth: 25,
          //         maxHeight: 25,
          //         minHeight: 25,
          //         maxWidth: 25,
          //       ),
          //       isDense: true,
          //       contentPadding: EdgeInsets.all(18)),
          //   keyboardType: TextInputType.name,
          //   maxLines: 1,
          //   cursorColor: Color(0xFFA7A9B7),
          //   style: TextStyle(
          //     color: Color(0xFFA7A9B7),
          //     fontSize: 14,
          //     fontFamily: 'Poppins Medium',
          //     fontWeight: FontWeight.w400,
          //     height: 0,
          //   ),
          // ),

            child: TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                  focusNode: _userNameNode,
                //  autofocus: true,
                  controller: _userNameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Container(
                        margin: EdgeInsets.only(right: 8),
                        child: Image(image: AssetImage(Resources.userNameIcon),height:5 ,width: 5,)),
                    prefixIconConstraints: BoxConstraints(
                    minWidth: 25,
                    maxHeight: 25,
                    minHeight: 25,
                    maxWidth: 25,),
                    hintText: "Enter user name",
                    hintStyle: TextStyle(
                      color: Color(0xFFA7A9B7),
                      fontSize: 14,
                      fontFamily: 'Poppins Medium',
                      fontWeight: FontWeight.w400,
                      height: 0.13,
                    ),
                  )
              ),
              itemBuilder: (context,String suggestion){
                return ListTile(
                  title: Container(
                    margin: EdgeInsets.only(right: 8),
                    child: Text(suggestion,
                      style: TextStyle(
                        color: Color(0xFFA7A9B7),
                        fontSize: 14,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ),
                );
              },
              suggestionsCallback: (pattern){
                // for (var i in projectListID) {
                //if(i == projectListID.indexed){
                return userList.where((userName) => userName
                    .toLowerCase().contains(pattern.toLowerCase())).toList();
              },
              onSuggestionSelected: (String suggestion) {
                setState(() {
                  _userNameController.text = suggestion;
                  //  selectedValue = suggestion;
                  print("$suggestion");
                  getPasswordOfSelecteduser(suggestion,Users);

                });
              },

              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
            ),

        ),
      ),
    );
  }

  getLoginBtn() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {

        if(projectController.text.isEmpty){
          _projectNode.requestFocus();
          Fluttertoast.showToast(
                  msg: "Please Select Project ",
                  // gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                );
        }else if (_userNameController.text.isEmpty){
          _userNameNode.requestFocus();
          Fluttertoast.showToast(
            msg: "Please Select User",
            // gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }else if (_passwordController.text.isEmpty) {
          _passwordNode.requestFocus();
          Fluttertoast.showToast(
            msg: "Please Enter the Password ",
            // gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }else if(_passwordController.text==pass){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
         // Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DashboardScreen()));
          Fluttertoast.showToast(
            msg: "Login Succesfully",
            // gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }else{
          _passwordNode.requestFocus();
          Fluttertoast.showToast(
            msg: "Password does not exist",
            // gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );


        }

       // if(_formKey.currentState!.validate()) {
       //     _projectNode.requestFocus();
       //     _userNameNode.requestFocus();
       //     _passwordNode.requestFocus();
       //     Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DashboardScreen()));
       //     Fluttertoast.showToast(
       //     msg: "Login Succesfully",
       //     // gravity: ToastGravity.BOTTOM,
       //     backgroundColor: Colors.red,
       //     textColor: Colors.white,
       //   );
       // }else{
       //   Fluttertoast.showToast(
       //     msg: "Enterd Wrong Credentials",
       //     // gravity: ToastGravity.BOTTOM,
       //     backgroundColor: Colors.red,
       //     textColor: Colors.white,
       //   );
       // }

         // String UserName = _userNameController.text;
         // String project = projectController.text;
         // String passward = _passwordController.text;
         //
         // UserModel userModel = UserModel(
         //
         //     LoginName: UserName,
         //     Password: passward,
         //     FirstName: '',
         //     LastName: '',
         //     AccessRights: '',
         //     Designation: '',
         //     PAssigned: '',
         //     Active: '',
         //     CompanyID: null,
         //     uid: null
         // );
         // await SqfDataBase().inserttblUsers(userModel).then((value) {
         //   print('UserModel local database created');
         // }).onError((error, stackTrace) {
         //   print(error.toString());
         // });
         //
         // ProjectModel projectModel = ProjectModel(
         //   ProjectName: project,
         //   PID: 1,
         //   ProjectCode: '',
         //   ProjectDescription: '',
         //   Status: '',
         // );
         // await SqfDataBase().insert(projectModel).then((value) {
         //   print('ProjectModel local database created');
         // }).onError((error, stackTrace) {
         //   print(error.toString());
         // });



      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 56,
        margin: EdgeInsets.only(left: 24, right: 24, top: 30),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: Color(0xFF005AC6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins Semibold',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
    );
  }

  // void getProjectList() async {
  //
  //     List<ProjectModel> projectLists = await SqfDataBase().getProjects();
  //
  //     if (projectLists.isEmpty) {
  //       List<ProjectListResponseModel>? projectList = await ApiService().getProjectList();
  //
  //       if (projectList != null) {
  //         for (var i in projectList) {
  //           //  print(i.projectName);
  //           ProjectModel project = ProjectModel(
  //             PID: i.pID,
  //             ProjectCode: i.projectCode ?? "",
  //             ProjectName: i.projectName ?? "",
  //             ProjectDescription: i.projectDescription ?? "",
  //             Status: i.status ?? "",
  //           );
  //           await SqfDataBase().insert(project); // Merging data to sqflite database table  (local device storage)
  //         }
  //
  //         projectListName.clear();
  //
  //         for (var i in projectLists) {
  //          // print(i.ProjectName);
  //           projectListName.add(i.ProjectName);
  //         }
  //       }
  //     } else {
  //       projectListName.clear();
  //
  //       for (var i in projectLists) {
  //         print(i.ProjectName);
  //         projectListName.add(i.ProjectName);
  //       }
  //
  //     }
  //
  //
  // }
  // Function to get PID based on projectName

  void getProjectName() async{
    projects = await SqfDataBase().getProjects();
    if(projects.isEmpty){
      List<ProjectListResponseModel>? insertProjects = await ApiService().getProjectList();
      if(insertProjects!=null){
        for(var i in insertProjects){
          ProjectModel items = ProjectModel(
            PID: i.pID,
            ProjectCode: i.projectCode ?? "",
            ProjectName: i.projectName ?? "",
            ProjectDescription: i.projectDescription ?? "",
            Status: i.status ?? "",
          );
          await SqfDataBase().insert(items);
        }
        projects = await SqfDataBase().getProjects();
        projectName.clear();
        for(var i in projects) {
          projectName.add(i.ProjectName);
          //projectName.add(i.PID);
        }
      }
    }else {
      projectName.clear();
      for(var i in projects){
        projectName.add(i.ProjectName);
        //projectName.add(i.PID);
      }
      print(projectName);
    }
  }


  void fetchDataUserMapping() async {
    UsermappingModel = await SqfDataBase().getUserMappingAll();
     if(UsermappingModel.isEmpty){
     List<UserMap>? userMapApiList = await ApiService().getUserMap();
     if(userMapApiList!=null){
       for(var i in userMapApiList) {
         UserMappingModel userMapinsert = UserMappingModel(
             UID: i.uID ,
             PrjID: i.prjID,
             PrjAccess: i.prjAccess ?? "",
             QaAccess: i.qaAccess ?? "",
             HseAccess: i.hseAccess ?? "",
             SnagAccess: i.snagAccess ?? "",
             ObsAccess: i.obsAccess ?? "",
             BoqAccess: i.boQAccess ?? "",
             PmAccess: i.pMAccess ?? "",
             DlrAccess: i.dlrAccess ?? "",
             MatAccess: i.matAccess ?? "",
         );

         await SqfDataBase().insertUserMapping(userMapinsert);

       }
       UsermappingModel = await SqfDataBase().getUserMappingAll();
        userMappingsList.clear();
       for(var i in UsermappingModel){
         userMappingsList.add(i.QaAccess);
        // print(i.UID);
       //  userMappingsList.clear();
       }


     }

   }else {
     //print('have not data');
     for(var i in UsermappingModel){
     userMappingsList.add(i.DlrAccess);
     //print(i.UID);
     //  print(userMappingsList);
     }
   }
  }

  void getUsersListBasedOnUID() async {
   // List<String> userList = uniqueUserSet.toList();
    Users = await SqfDataBase().getUserData();
    if(Users.isEmpty){
      List<UsersTableListAPI>? insertUsersDataList = await ApiService().getUsersdata();
      if(insertUsersDataList!=null){
        for(var i in insertUsersDataList){
          UserModel insertData = UserModel(
              CompanyID: i.companyID,
              uid: i.uid,
              LoginName: i.loginName ?? "",
              Password: i.password ?? "",
              FirstName: i.firstName ?? "",
              LastName: i.lastName ?? "",
              AccessRights: i.accessRights ?? "",
              Designation: i.designation ?? "",
              PAssigned: i.pAssigned ?? "",
              Active: i.active ?? ""
          );
          await SqfDataBase().inserttblUsers(insertData);
        }
        Users = await SqfDataBase().getUserData();
        userList.clear();
        for (var i in getUID) {
          List<UserModel> usersList = await SqfDataBase().getUIDmappingBasedUsers(i);
          for(var j in usersList){
            userList.add(j.LoginName);
          }
        }
        print(getUID);
        getUID.clear();
        print(userList);
        }
    } else
    {
      userList.clear();

      for (var i in getUID) {
        List<UserModel> usersList = await SqfDataBase().getUIDmappingBasedUsers(i);
        for(var j in usersList) {
          userList.add(j.LoginName);
        }
      }
      getUID.clear();
      print(userList);
    }


    // List<String> _projectNames = projectList.map((project) => project.ProjectName).toList();
    // return _projectNames;
  }


  // void getUsersListBasedOnUIDMap() async {    //Not Used
  //   Users = await SqfDataBase().getUserData();
  //
  //   if (Users.isEmpty) {
  //     List<UsersTableListAPI>? insertUsersDataList = await ApiService().getUsersdata();
  //     if(insertUsersDataList!=null) {
  //       for (var i in insertUsersDataList) {
  //         UserModel insertData = UserModel(
  //             CompanyID: i.companyID,
  //             uid: i.uid,
  //             LoginName: i.loginName ?? "",
  //             Password: i.password ?? "",
  //             FirstName: i.firstName ?? "",
  //             LastName: i.lastName ?? "",
  //             AccessRights: i.accessRights ?? "",
  //             Designation: i.designation ?? "",
  //             PAssigned: i.pAssigned ?? "",
  //             Active: i.active ?? ""
  //         );
  //         await SqfDataBase().inserttblUsers(insertData);
  //       }
  //       userList.clear();
  //         for (var uid in getUID) {
  //       List<UserModel> usersList = await SqfDataBase()
  //           .getUIDmappingBasedUsers(uid);
  //
  //       // Filter usersList based on the condition i.UID == j
  //
  //       // Add the filtered users to userList
  //       for (var user in usersList) {
  //         userList.add(user.LoginName);
  //       }
  //     }
  //
  //       print(userList);
  //     }
  //
  //
  //   } else {
  //     // ... (your existing code)
  //     userList.clear();
  //     //for (var uid in getUID) {
  //     //getUserNamefromUID();
  //       List<UserModel> usersList = await SqfDataBase().getUIDmappingBasedUsers(mapUID);
  //
  //     //  List<UserModel> filteredUsers = usersList.where((user) => user.uid == mapUID).toList();
  //      // getUserNamefromUID(mapUID,usersList);
  //       for (var user in usersList) {
  //         userList.add(user.LoginName);
  //       //  userName= user.LoginName;
  //       }
  //     //}
  //
  //       print(userList);
  //
  //   }
  // }




  Future<List<String?>> getProjectListApi() async{      //fetching data through api
    List<ProjectListResponseModel>? projectListApi = await ApiService().getProjectList();
    List<String?> ApiProjects = projectListApi!.map((apiList) => apiList.projectName).toList();
    return ApiProjects;
 }

  // Future<List<String?>> getProjectNamefromDevice() async{
  //   List<ProjectModel> projectListApi = await SqfDataBase().getProjects();
  //   List<String?> ApiProjects = projectListApi.map((apiList) => apiList.ProjectName).toList();
  //   return ApiProjects;
  // }






}