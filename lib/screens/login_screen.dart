import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  late TextEditingController _projectController;

  final FocusNode _passwordNode = FocusNode();
  final FocusNode _projectNode = FocusNode();
  final FocusNode _userNameNode = FocusNode();

  bool _passwordIsVisible = false;
  bool isConditionsChecked = false;
  String appVersion = "";

  List<String> projects = [
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

  var selectedValue = "Select";

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

  @override
  void initState() {
    _passwordController = TextEditingController();
    _userNameController = TextEditingController();
    _projectController = TextEditingController();
    getAppVersion();
    super.initState();
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
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 25),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Project',
                        style: TextStyle(
                          color: Color(0xFF191D31),
                          fontSize: 15,
                          fontFamily: 'Poppins Medium',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
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
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 14),
              child: Image(
                image: AssetImage(Resources.projectIcon),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    //elevation: 8,
                    selectedItemBuilder: (_) {
                      return dropdownItems
                          .map(
                            (e) => Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                e.value.toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Color(0xFF3C3C3C),
                                  fontSize: 14,
                                  fontFamily: 'Poppins Medium',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList();
                    },
                    isExpanded: true,
                    /*buttonStyleData: const ButtonStyleData(
                      //padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 60,
                    ),*/
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                      iconSize: 30,
                      iconEnabledColor: HexColor("#A7A9B7"),
                      iconDisabledColor: HexColor("#A7A9B7"),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      width: MediaQuery.of(context).size.width - 50,
                      maxHeight: 300,
                      //padding: EdgeInsets.only(left: 24, right: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      offset: const Offset(-50, -10),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                      padding: EdgeInsets.only(left: 14, right: 14, bottom: 8, top: 8),
                    ),
                    /*icon: Container(
                              margin: EdgeInsets.only(left: 10, right: 4),
                              child: Image(
                                image: AssetImage(Assets().downArrowIcon),
                                width: 10,
                                height: 10,
                              ),
                            ),*/
                    //borderRadius: BorderRadius.circular(10),
                    value: selectedValue,
                    items: dropdownItems,
                    //alignment: Alignment.center,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                  ),
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
          child: TextFormField(
            controller: _userNameController,
            focusNode: _userNameNode,
            onChanged: (text) {
              setState(() {});
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter user name",
                hintStyle: TextStyle(
                  color: Color(0xFFA7A9B7),
                  fontSize: 14,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
                counterText: "",
                prefixIcon: Container(
                  margin: EdgeInsets.only(right: 8),
                  child: const Image(
                    image: AssetImage(Resources.userNameIcon),
                    width: 13,
                    height: 19,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 25,
                  maxHeight: 25,
                  minHeight: 25,
                  maxWidth: 25,
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(18)),
            keyboardType: TextInputType.name,
            maxLines: 1,
            cursorColor: Color(0xFFA7A9B7),
            style: TextStyle(
              color: Color(0xFFA7A9B7),
              fontSize: 14,
              fontFamily: 'Poppins Medium',
              fontWeight: FontWeight.w400,
              height: 0,
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
