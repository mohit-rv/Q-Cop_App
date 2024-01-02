import 'package:flutter/material.dart';
import 'package:qcop/local_database/database_handler.dart';
import 'package:qcop/screens/wp_screens/wp_category_screen.dart';
import 'package:qcop/screens/wp_screens/wp_connect_screen.dart';
import 'package:qcop/screens/wp_screens/wp_loc_screen.dart';
import 'package:qcop/screens/wp_screens/wp_report_screen.dart';

import '../../resources/resources.dart';

class WPCommonScreen extends StatefulWidget {
  const WPCommonScreen({super.key});

  @override
  State<WPCommonScreen> createState() => _WPCommonScreenState();
}

class _WPCommonScreenState extends State<WPCommonScreen> {

  late ValueChanged<bool> onChange;

  bool isLocSelected = true;
  bool isCategorySelected = false;
  bool isConnectSelected = false;
  bool isCheckSelected = false;

  @override
  void initState() {
    onChange = (value) {
      setState(() {
        isLocSelected = false;
        isConnectSelected = false;
        isCheckSelected = false;
        isCategorySelected = value;
      });
    };
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Stack(
        children: [
          getSelectOptions(),
          Container(
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                ),
                color: Colors.white,
              ),
              child: Container(
                color: Colors.transparent,
                margin: EdgeInsets.only(top: 30),
                child: isLocSelected ? WPLocScreen(onChange: onChange,) :
                isCategorySelected ? WPCategoryScreen(onChange: onChange) :
                isConnectSelected ? WPConnectScreen() :
                WPReportScreen(),
              )
          ),
        ],
      ),
    );
  }


  getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      //toolbarHeight: 80,
      elevation: 8,
      backgroundColor: Colors.white,
      flexibleSpace: Container(
        color: Color(0xFF0C3C89),
        padding: EdgeInsets.only(top: 20, left: 24, right: 24),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image(
                image: AssetImage(Resources.backIcon),
                width: 28,
                height: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getSelectOptions() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Color(0xFF0C3C89),
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isCheckSelected = false;
                  isConnectSelected = false;
                  isCategorySelected = false;
                  isLocSelected = true;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 4 - 24,
                height: 95,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: isLocSelected ? Colors.white : Colors.white30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image(
                        image: isLocSelected
                            ? AssetImage(Resources.activeLocIcon)
                            : AssetImage(Resources.locIcon),
                        width: 24,
                        height: 30,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Select location',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                          isLocSelected ? Color(0xFF0C3C89) : Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins Medium',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: () {
                setState(() {
                  isLocSelected = false;
                  isConnectSelected = false;
                  isCheckSelected = false;
                  isCategorySelected = true;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 4 - 24,
                height: 95,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: isCategorySelected ? Colors.white : Colors.white30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image(
                        image: isCategorySelected
                            ? AssetImage(Resources.cateActiveIcon)
                            : AssetImage(Resources.cateIcon),
                        width: 24,
                        height: 30,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Select Category',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isCategorySelected
                              ? Color(0xFF0C3C89)
                              : Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins Medium',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isLocSelected = false;
                  isCheckSelected = false;
                  isCategorySelected = false;
                  isConnectSelected = true;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 4 - 24,
                height: 95,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: isConnectSelected ? Colors.white : Colors.white30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image(
                        image: isConnectSelected
                            ? AssetImage(Resources.connectActiveIcon)
                            : AssetImage(Resources.connectIcon),
                        width: 24,
                        height: 30,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Connect Server',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isConnectSelected
                              ? Color(0xFF0C3C89)
                              : Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins Medium',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isLocSelected = false;
                  isConnectSelected = false;
                  isCategorySelected = false;
                  isCheckSelected = true;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 4 - 24,
                height: 95,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: isCheckSelected ? Colors.white : Colors.white30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image(
                        image: isCheckSelected
                            ? AssetImage(Resources.checkActiveIcon)
                            : AssetImage(Resources.checkIcon),
                        width: 24,
                        height: 30,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Check Status',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isCheckSelected
                              ? Color(0xFF0C3C89)
                              : Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins Medium',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getSelectionData() async {

    var selections = await DatabaseHandler().getQASelections();

    print(selections);

  }

}
