import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qcop/resources/resources.dart';
import 'package:qcop/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController _passwordController;
  late TextEditingController _userNameController;
  //late TextEditingController projectController;

  final FocusNode _passwordNode = FocusNode();
  final FocusNode _projectNode = FocusNode();
  final FocusNode _userNameNode = FocusNode();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [];

    for (var i in projects) {
      menuItems.add(DropdownMenuItem(
          value: i,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              padding: EdgeInsets.only(left: 6, right: 6),
              alignment: Alignment.centerLeft,
              decoration: ShapeDecoration(
                color: selectedValue == i ? Color(0xFF0C3C89) : Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              child: Text(
                i,
                style: TextStyle(
                  color: selectedValue == i ? Colors.white : Color(0xFFA7A9B7),
                  fontSize: 14,
                  fontFamily: 'Poppins medium',
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )));
    }

    return menuItems;
  }


  bool _passwordIsVisible = false;
  bool isConditionsChecked = false;
  String appVersion = "";

  TextEditingController projectController = TextEditingController();
  var selectedValue = "Select";

  List<String> projects = [
    "Test1",
    "Test2",
    "Test3",
    "Test4",
    "Test5",
    "Test6",
    "Test7",
    "Test8",
    "Test9",
    "Test10",
    "Test12",
    "Test13",
    "Test14",
    "Test15",
    "Test16",
    "Test17",
  ];

  List<String> nameList = [
    "name1",
    "name2",
    "name3",
    "name4",
    "name45",
    "name46",
  ];


  // static List<String> filterdProjectList(String query,) {
  //   List<String> matches = [];
  //   matches.addAll(projects);
  //   matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
  //   return matches;
  // }

  String selectedproject = "";

  @override
  void initState() {
    _passwordController = TextEditingController();
    _userNameController = TextEditingController();
    projectController = TextEditingController();
    getAppVersion();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController = TextEditingController();
    _userNameController = TextEditingController();
    projectController = TextEditingController();
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
                  isConditionsChecked = value!;
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
                itemBuilder: (context,String suggestion){
                  return ListTile(
                    leading: Icon(CupertinoIcons.refresh,
                        color:  Color(0xFFA7A9B7),
                        size: 20,
                    ),
                    title: Text(suggestion,
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
                suggestionsCallback: (pattern){
                  return projects.where((project) => project
                         .toLowerCase().contains(pattern.toLowerCase())).toList();
                },
                onSuggestionSelected: (String suggestion) {
                  setState(() {
                    projectController.text = suggestion;
                  //  selectedValue = suggestion;
                    print("$suggestion");
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
                  leading: Icon(CupertinoIcons.refresh,
                    color:  Color(0xFFA7A9B7),
                    size: 20,
                  ),
                  title: Text(suggestion,
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
              suggestionsCallback: (pattern){
                return nameList.where((project) => project
                    .toLowerCase().contains(pattern.toLowerCase())).toList();
              },
              onSuggestionSelected: (String suggestion) {
                setState(() {
                  _userNameController.text = suggestion;
                  //  selectedValue = suggestion;
                  print("$suggestion");
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

        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DashboardScreen()));

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


}


class stateServis {
  List<String> projects1 = [
    "Select",
    "Test1",
    "Test2",
    "Test3",
    "Test4",
    "Test5",
    "Test6",
    "Test7",
    "Test8",
    "Test9",
    "Test10",
    "Test12",
    "Test13",
    "Test14",
    "Test15",
    "Test16",
    "Test17",
  ];

  // static List<String> getSuggestions(String query) {
  //   List<String> matches = List();
  //   matches.addAll();
  //   matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
  //   return matches;
  // }
}