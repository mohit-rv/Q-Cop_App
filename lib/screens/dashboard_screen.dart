import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcop/screens/daily_report_screens/dashb_graph_common_screen.dart';
import 'package:qcop/screens/drawer_screen.dart';
import 'package:qcop/screens/faq_screen.dart';
import 'package:qcop/local_database/database_handler.dart';
import 'package:qcop/resources/resources.dart';
import 'package:qcop/screens/ehs_screens/ehs_common_screen.dart';
import 'package:qcop/screens/material_screens/mat_common_screen.dart';
import 'package:qcop/screens/nc_screens/nc_common_screen.dart';
import 'package:qcop/screens/note_screen.dart';
import 'package:qcop/screens/pm_screens/pm_common_screen.dart';
import 'package:qcop/screens/qa_screens/qa_common_screen.dart';
import 'package:qcop/screens/wp_screens/wp_common_screen.dart';

import 'comm_dir_screens/comm_common_screen.dart';

class DashboardScreen extends StatefulWidget {

  //final FileImage selectImage;

  const DashboardScreen({super.key,});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  CarouselController buttonCarouselController = CarouselController();

  int currentPos = 0;

  var taskLists = [
    {"img" : Resources.qaIcon, "title" : "Quality\nAssurance", "pendency" : 10, "total" : 15, "color" : "0xFFF478B8"},
    {"img" : Resources.ncIcon, "title" : "Non\nConformance", "pendency" : 12, "total" : 16, "color" : "0xFF7C97F8"},
    {"img" : Resources.pmIcon, "title" : "Project\nManagement", "pendency" : 10, "total" : 15, "color" : "0xFFF19244"},
    {"img" : Resources.mIcon, "title" : "Material", "pendency" : 13, "total" : 15, "color" : "0xFFB985FC"},
    {"img" : Resources.cIcon, "title" : "Communication", "pendency" : 10, "total" : 15, "color" : "0xFFFF5A5C"},
    {"img" : Resources.ehsIcon, "title" : "Employee \nHealth & Safety", "pendency" : 13, "total" : 18, "color" : "0xFFFF5A5C"},
    {"img" : Resources.wpIcon, "title" : "Work Permit", "pendency" : 10, "total" : 15, "color" : "0xFF4468C6"},
    {"img" : Resources.dlrIcon, "title" : "Daily \nLabour Report", "pendency" : 12, "total" : 18, "color" : "0xFF4497C6"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
   drawer: DrawerW(),
      body: Stack(
        children: [
          Container(
            color: Color(0xFF005AC6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                       InkWell(
                         onTap: (){

                           scaffoldKey.currentState?.openDrawer();
                        },
                         child: Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(left: 24, top: 60),
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://via.placeholder.com/40x40"),
                                fit: BoxFit.contain,
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),

                          ),
                       ),



                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 60, left: 10),
                        child: Text(
                          'Q-Cop',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Poppins Semibold',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                      //  Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => FAQScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 18, top: 60),
                        child: Image(
                          image: AssetImage(Resources.dashSyncIcon),
                          width: 23,
                          height: 23,
                          color: Colors.white,
                        ),
                      ),
                    ),


                    InkWell(
                      onTap: (){
                  Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => Notif()));
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Notification()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 24, top: 60),
                        child: Image(
                          image: AssetImage(Resources.activeNotyIcon),
                          width: 25,
                          height: 25,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 28),
                  child: CarouselSlider.builder(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      //height: 450,

                      autoPlay: false,
                      enlargeCenterPage: false,
                      viewportFraction: 0.8,
                      initialPage: currentPos,
                      reverse: false,
                      enlargeFactor: 0.1,
                      enableInfiniteScroll: false,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 16 / 8,
                      //aspectRatio: 2 / 1,
                      padEnds: false,
                      autoPlayInterval: const Duration(seconds: 10),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPos = index;
                        });
                      },
                    ),
                    itemCount: 3,

                    itemBuilder: (BuildContext context, int index,
                        int realIndex) {
                      return Container(
                        margin: const EdgeInsets.only(
                            top: 10, left: 22, right: 0, bottom: 18),
                        child: AnimatedPadding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context)
                                  .viewInsets
                                  .bottom),
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.decelerate,
                          child: getSliderCard()
                        ),
                        //getMembersCard(),
                      );
                    },

                  ),
                ),
                getTasksList(),
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
                    'App Version: 1.0.0',
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
          )
        ],
      ),
    );
  }

  getSliderCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x510B3C88),
              blurRadius: 12,
              offset: Offset(0, 2),
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //margin: EdgeInsets.only(top: 20),
              child: Image(
                image: AssetImage(Resources.qcopImg),
                height: 61,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Welcome Johnny,',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF005AC6),
                  fontSize: 18,
                  fontFamily: 'Poppins Semibold',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 9, left: 20, right: 20),
              child: Text(
                'You Are Logged Into:Test',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF005AC6),
                  fontSize: 12,
                  fontFamily: 'Poppins Regular',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getTasksList() {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: 8,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            controller: ScrollController(),
            itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {

              /*await DatabaseHandler().initializedDB();

              var selections = await DatabaseHandler().getQASelections();

              if (selections.isEmpty) {
                await DatabaseHandler().insertQASelections(
                    true, true, true, true);
              } else {

                await DatabaseHandler().updateQASelections(true, true, true, true);
              }*/

              if (taskLists[index]['title'].toString() == "Quality\nAssurance") {
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => QACommonScreen()));
              } else if (taskLists[index]['title'].toString() == "Non\nConformance") {
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => NCCommonScreen()));
              } else if(taskLists[index]['title'].toString() == 'Project\nManagement') {
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => PMCommonScreen()));
              } else if (taskLists[index]['title'].toString() == "Material") {
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => MatCommonScreen()));
              } else if (taskLists[index]['title'].toString()== "Communication") {
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ComDIRCommonScreen()));
              } else if(taskLists[index]['title'].toString()== "Employee \nHealth & Safety") {
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => EHSCommonScreen()));
              } else if(taskLists[index]['title'].toString()== "Work Permit") {
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => WPCommonScreen()));
              } else if(taskLists[index]['title'].toString()== "Daily \nLabour Report") {
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DLRCommonScreen()));
              }else{
                return null;
              }
             // Navigator.push(context, MaterialPageRoute(builder: (context) => NCCommonScreen()));


            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              //height: 68,
              margin: EdgeInsets.only(left: 24, right: 24, bottom: 15),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x440B3C88),
                    blurRadius: 12,
                    offset: Offset(0, 2),
                    spreadRadius: 2,
                  )
                ],
              ),

              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 14, bottom: 14),
                    child: Image(
                      image: AssetImage(taskLists[index]['img'].toString()),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        taskLists[index]['title'].toString(),
                        style: TextStyle(
                          color: Color(int.parse(taskLists[index]['color'].toString())),
                          fontSize: 11,
                          fontFamily: 'Poppins medium',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            taskLists[index]['pendency'].toString(),
                            style: TextStyle(
                              color: Color(0xFFFC8019),
                              fontSize: 17,
                              fontFamily: 'Poppins Semibold',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Pendency',
                            style: TextStyle(
                              color: Color(0xFF191D31),
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
                  Container(
                    margin: EdgeInsets.only(right: 34),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            taskLists[index]['total'].toString(),
                            style: TextStyle(
                              color: Color(0xFFFF4D4F),
                              fontSize: 17,
                              fontFamily: 'Poppins Semibold',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Total',
                            style: TextStyle(
                              color: Color(0xFF191D31),
                              fontSize: 12,
                              fontFamily: 'Poppins Medium',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

}
