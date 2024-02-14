import 'package:flutter/material.dart';
import 'package:qcop/resources/resources.dart';
import 'package:qcop/screens/pm_screens/pm_category_screen.dart';
import 'package:qcop/screens/pm_screens/pm_connect_serverer_screen.dart';
import 'package:qcop/screens/pm_screens/pm_location_screen.dart';
import 'package:qcop/screens/pm_screens/pm_report_screen.dart';

class PMCommonScreen extends StatefulWidget {
  const PMCommonScreen({super.key});

  @override
  State<PMCommonScreen> createState() => _PMCommonScreenState();
}

class _PMCommonScreenState extends State<PMCommonScreen> {
  late ValueChanged<bool> onChange;

  bool isLocIconSelected = true;
  bool isCheckIconSelected = false;
  bool isCategoryIconSelected = false;
  bool isConnectServerIconSelected = false;

  @override
  void initState() {
    onChange = (value) {
      setState(() {
        isLocIconSelected = false;
        isCheckIconSelected = false;
        isConnectServerIconSelected = false;
        isCategoryIconSelected= value;
      });
    };
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getappBar(),
      body: Stack(
        children: [
          getselctIcons(),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15),
            width: MediaQuery.of(context).size.width,

            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50)
                )
              )
            ),
            child: Container(            //showing screens
              color: Colors.transparent,
              margin: EdgeInsets.only(top: 40),
              child:
              isLocIconSelected ?  SNAGLocationScreen(onChange: onChange):
              isCategoryIconSelected ? const PMCategoryScreen():
              isConnectServerIconSelected ? const PMServerScreen():
              PMReportScreen()

            ),
          )
        ],
      ),
    );
  }

  getappBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      //toolbarHeight: 80,
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
              onTap: (){
                Navigator.pop(context);
              },
              child: Image(image: AssetImage(Resources.backIcon),
              height: 28,
              width: 28,),
            )
          ],
        ),
      ),
    );
  }

  getselctIcons() {
       return Container(
        height: MediaQuery.of(context).size.height,
         color: Color(0xFF0C3C89),
         alignment: Alignment.topCenter,
         child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              InkWell(
                onTap: (){
                  setState(() {
                    isLocIconSelected = true;
                    isCategoryIconSelected = false;
                    isCheckIconSelected = false;
                    isConnectServerIconSelected = false;
                  });
                },
                child:
                      Container(
                        width: MediaQuery.of(context).size.width/4-24,
                        height: 95,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: isLocIconSelected ? Colors.white: Colors.white30,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          )
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Image(
                                image: isLocIconSelected ? AssetImage(Resources.activeLocIcon):
                                AssetImage(Resources.locIcon),
                                width: 24,
                                height: 30,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10,left: 6),
                              child: Text(' Select\nLoctaion',
                                style: TextStyle(
                                  color: isLocIconSelected ? Color(0xFF0C3C89): Colors.white ,
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

              InkWell(
                onTap: (){
                  setState(() {
                    isCategoryIconSelected = true;
                    isCheckIconSelected = false;
                    isConnectServerIconSelected= false;
                   // isCheckIconSelected =  false;
                    isLocIconSelected = false;
                  });

                },

                child: Container(
                  width: MediaQuery.of(context).size.width/4-24,
                  height: 95,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                      color: isCategoryIconSelected ? Colors.white: Colors.white30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      )
                  ),
                  child: Column(
                    children: [
                     Container(
                       margin: EdgeInsets.only(top: 10),
                      child: Image(
                        image: isCategoryIconSelected ? AssetImage(Resources.cateActiveIcon):
                        AssetImage(Resources.cateIcon),
                        height: 30,width: 24,
                      ),
                    ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text('   Select \nCategory',
                          style: TextStyle(
                            color:
                            isCategoryIconSelected ? Color(0xFF0C3C89) : Colors.white,
                            fontSize: 12,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      )
                    ]
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                  setState(() {
                    isCategoryIconSelected=false;
                    isCheckIconSelected=false;
                    isConnectServerIconSelected=true;
                    isLocIconSelected=false;
                  });
                },

                child: Container(
                  width: MediaQuery.of(context).size.width/4-24,
                  height: 95,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                      color: isConnectServerIconSelected ? Colors.white: Colors.white30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      )
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image(
                          image:isConnectServerIconSelected ? AssetImage(Resources.connectActiveIcon):
                          AssetImage(Resources.connectIcon),
                          height: 30,width: 24,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10,left: 9),
                        child: Text('Connect   Server',
                          style: TextStyle(
                            color:
                            isConnectServerIconSelected ? Color(0xFF0C3C89) : Colors.white,
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

              InkWell(
                onTap: (){
                  setState(() {
                    isCategoryIconSelected=false;
                    isCheckIconSelected=true;
                    isConnectServerIconSelected=false;
                    isLocIconSelected=false;
                  });

                },
                child:  Container(
                  width: MediaQuery.of(context).size.width/4-24,
                  height: 95,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                      color: isCheckIconSelected ? Colors.white: Colors.white30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      )
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image(
                          image:isCheckIconSelected ? AssetImage(Resources.checkActiveIcon):
                          AssetImage(Resources.checkIcon),
                          height: 30,width: 24,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10,left: 10),
                        child: Text('Check Status',
                          style: TextStyle(
                            color:
                            isCheckIconSelected ? Color(0xFF0C3C89) : Colors.white,
                            fontSize: 12,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      )
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
