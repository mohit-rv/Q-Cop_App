import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcop/screens/daily_report_screens/dashb_graph_contractor_screen.dart';
import 'package:qcop/screens/daily_report_screens/dashb_graph_tower_screen.dart';
import 'package:qcop/screens/daily_report_screens/dashb_graph_status_screen.dart';

import '../../resources/resources.dart';

class DLRCommonScreen extends StatefulWidget {
  const DLRCommonScreen({super.key});

  @override
  State<DLRCommonScreen> createState() => _DLRCommonScreenState();
}

class _DLRCommonScreenState extends State<DLRCommonScreen> {

  int? currentIndex = 0;
  String title = "QA";
  String title2 = "";
  String title3 = "QA";



  final PageController pageController = PageController(initialPage: 0);

  List<Map<String, dynamic>> gridList = [
    {"title": "QA","graph": Resources.circleGraph,"stitle":"Project","mov": 0},
    {"title": "EHS","graph": Resources.tableGraph,"stitle":"Tower","mov": 0},
    {"title": "SNAG","graph":Resources.tableGraph,"stitle":"Contractor","mov": 0},
    {"title": "NS","graph": Resources.circleGraph,"stitle":"Project","mov": 0},
    {"title": "MAT","graph":  Resources.circleGraph,"stitle":"Project","mov": 0},
  ];

  int selectedMapIndex = 0;
 // Map<String, dynamic> selectedValue = gridList[selectedMapIndex['title']];

  List<Map<String, dynamic>> sildeList = [
    {"title1": "QA","graph1": Resources.circleGraph,"stitle1":"Project",},
    {"title1": "EHS","graph1": Resources.tableGraph,"stitle1":"Contractor",},
    {"title1": "NS","graph1": Resources.tableGraph,"stitle1":"Tower",},
  ] ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,     //to remove by default icon
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Poppins SemiBold',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
        elevation: 4,
        flexibleSpace: Container(
          color: Color(0xFF0C3C89),
          padding: EdgeInsets.only(right: 24,left: 24,top: 30),
          alignment: Alignment.centerLeft,
          child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image(
                    image: AssetImage(Resources.backIcon),
                    width: 28,
                    height: 28,),
                ),
              ]
          ),
        ),
      ),
      body: Stack(
        children: [

          Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xFF0C3C89),
          ),

          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.03
            ),
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)
                    )
                )
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //crossAxisCount: 2,
                maxCrossAxisExtent: 230,
                mainAxisExtent: 210
                //    crossAxisSpacing: 11,
                //   mainAxisSpacing: 11
              ),
              itemBuilder: (context, index)
              {return
                  getGridItems(index);
              },
              itemCount: gridList.length,

            ),
          )

        ],
      ),
    );
  }

  getGridItems(int index){
    return Container(
        //  padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 30,right: 12,left: 12),
        width: 163,
        height: 183,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(width: 1, color: Color(0xFFCACED8)),
            )
        ),
        child:
        Column(
          children: [

            Container(
              margin: EdgeInsets.only(top: 5,left: 0),
              child: Text(
                gridList[index]['title'].toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0C3C89),
                  fontSize: 16,
                  fontFamily: 'Poppins Semibold',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 0),
                // width: 163,
               // height: 183,
                child: PageView.builder(
                     controller: pageController,
                     itemCount: sildeList.length,
                    onPageChanged: (indexp){

                       print(indexp);
                       print((indexp % sildeList.length) as int?);

                      setState(() {
                        gridList[index]["mov"] =  (indexp) ;
                      //  gridList[index]['mov']=(indexp % sildeList.length) as int?;
                    //    currentIndex = gridList[index]['mov'] as int;
                      });
                    },

                    itemBuilder: (context, index1){

                      return Container(
                          margin: EdgeInsets.only(),
                          child: Column(
                            children: [
                              // Container(
                              //   margin: EdgeInsets.only(top: 0,left: 12),
                              //   child: Text(
                              //     sildeList[index]['title1'].toString(),
                              //     //  "$currentIndex[title]",
                              //     textAlign: TextAlign.center,
                              //     style: TextStyle(
                              //       color: Color(0xFF0C3C89),
                              //       fontSize: 16,
                              //       fontFamily: 'Poppins Semibold',
                              //       fontWeight: FontWeight.w600,
                              //       height: 0,
                              //     ),
                              //   ),
                              // ),

                              InkWell(
                                onTap: (){
                                  if(sildeList[index1]['stitle1'].toString()=="Project"){
                                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>
                                        QAProjectScreen(rectitle1: gridList[index]['title'].toString())));
                                  }else if(sildeList[index1]['stitle1'].toString()=="Contractor"){
                                     Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>
                                         QAContractorScreen(rectitle1: gridList[index]['title'].toString(),)));
                                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => QAContractorScreen()));
                                  }else if(sildeList[index1]['stitle1'].toString()=="Tower"){
                                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) =>
                                   DLRTowerScreen(
                                      rectitle1: gridList[index]['title'].toString(),
                                   //  recgridList2: gridList,

                                   )));

                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: 105,
                                  height: 105,
                                  child: Image(
                                    image: AssetImage(
                                        sildeList[index1]['graph1'].toString()
                                      //    "$currentIndex[graph]"
                                    ),
                                    width: 105,
                                    height: 105,
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 1),
                                child: Text(
                                  sildeList[index1]['stitle1'].toString(),
                                  //  "$currentIndex[stitle]",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF394A5D),
                                    fontSize: 12,
                                    fontFamily: 'Poppins Semibold',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ),


                            ],
                          ),

                        );
                    }
                ),

              ),
            ),


            Container(
              margin: EdgeInsets.only(bottom: 5,top: 0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  for (var n= 0; n< 3; n++)  buildIndicator(gridList[index]['mov'] == n)

                ],
              ),
            )


            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   height: 100,
            //   child: Container(
            //     color: Colors.black54,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: List<Widget>.generate(
            //           sildeList.length,
            //               (index) => Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 10),
            //             child: InkWell(
            //               onTap: () {
            //                 pageController.animateToPage(index,
            //                     duration: const Duration(milliseconds: 300),
            //                     curve: Curves.easeIn);
            //               },
            //               child: CircleAvatar(
            //                 radius: 8,
            //                 backgroundColor: currentIndex == index
            //                     ? Colors.amber
            //                     : Colors.grey,
            //               ),
            //             ),
            //           )),
            //     ),
            //   ),
            // ),


        ]
      ),




        );

  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: isSelected ? 5 : 4,
        width: isSelected ? 5 : 4,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected? Colors.black : Colors.grey
        ),
      ),
    );
  }


}
