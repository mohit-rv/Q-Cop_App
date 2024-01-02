import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import 'comm_dir_category.dart';
import 'comm_dir_connect_server.dart';

class ComDIRCommonScreen extends StatefulWidget {
  const ComDIRCommonScreen({super.key});

  @override
  State<ComDIRCommonScreen> createState() => _ComDIRCommonScreenState();
}

class _ComDIRCommonScreenState extends State<ComDIRCommonScreen> {

  late ValueChanged<bool> onChange;

  bool isCategorySelected = true;
  bool isConnectSelected = false;

  @override
  void initState() {
    onChange = (value) {
      setState(() {
        isConnectSelected = false;
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
                child: isCategorySelected ? CommDirCategory() :
                CommDirConnectS()
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

                  isConnectSelected = false;
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

          ],
        ),
      ),
    );
  }

}
