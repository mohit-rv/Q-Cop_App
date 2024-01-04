import 'package:flutter/material.dart';

import '../resources/resources.dart';

class Notif extends StatefulWidget {
  const Notif({super.key});

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {

  List<Map<String, dynamic>> NFList = [
    {"icon": "QA","title":"Confined Spaces Permit","stitle": "lorem ipsum permit","time": "2 m ago"},
    {"icon": "EHS","title":"Are the tanks adequately \nilluminated while work","stitle": "lorem ipsum permit","time": "2 m ago"},
    {"icon": "NS","title":"Are the tanks adequately \nilluminated while work","stitle": "lorem ipsum permit","time": "10 m ago"},
    {"icon": "QA","title":"Confined Spaces Permit","stitle": "lorem ipsum permit","time": "10 m ago"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Stack(
          children: [

            Container(
              color: Color(0xFF0C3C89),
            ),

            Container(
              height: MediaQuery.of(context).size.height,
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)
                      )
                  )
              ),

              child: Column(
                children: [

                  Row(//crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 27,left: 24),
                        child: Text('Recent',style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins SemiBold",
                          fontSize: 16,
                          color: Color(0xFF191D31),
                          height: 0
                        ),),
                      ),

                      Container(
                        height: 15,width: 15,
                        margin: EdgeInsets.only(top: 25,left: 5),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(75),
                           color: Color(0xFF0060D3),
                        //   shape: BoxShape.circle

                         ),
                        child: Text('4',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            fontFamily: "Poppins Medium",
                        ),),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 27,right: 24,left: 150),
                        child:  Text('Clear All',style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0060D3),
                          fontFamily: "Poppins Medium",
                          height: 0,
                          fontWeight: FontWeight.w400,

                      ),)
                      )
                    ],
                  ),

                   SizedBox(height: 15,),
                  getNotList(),

                ],
              ),
            ),









          ],
        ),

    );
  }

  getAppBar() {
    return AppBar(
    // toolbarHeight: 90,
      automaticallyImplyLeading: false,
      title: Text("Notification",
      style: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins Semibold",
      height: 0),),
      centerTitle: true,
      elevation: 4,
     // backgroundColor: Colors.white,
      flexibleSpace: Container(
        color: Color(0xFF0C3C89),
        padding: EdgeInsets.only(right: 24,left: 24,top: 30),
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

  getNotList() {
    return Expanded(
        child: Container(
          child: ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
              physics: ScrollPhysics(),
              controller: ScrollController(),
              itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Dismissible(
                  key: Key(NFList[index].toString()),
                  background: Container(
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      NFList.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item deleted'),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(NFList[index].toString()),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 10,),
                    width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      ),

                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 0,left: 10,right: 10),
                          child: Container(
                            height: 40,width: 40,
                            margin: EdgeInsets.only(),
                            decoration: ShapeDecoration(
                              color: Color(0x17005AC6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(75)
                              )
                            ),
                            child: Container(
                              margin: EdgeInsets.only(top: 9),
                              child: Text(
                                NFList[index]['icon'].toString(),
                                textAlign:TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0C3C89),
                                  fontSize: 13,
                                  fontFamily: "Poppins SemiBold",
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                         // margin: EdgeInsets.only(),
                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(margin: EdgeInsets.only(right: 43),
                                    child: Text(NFList[index]["title"].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins SemiBold",
                                      fontSize: 13
                                    ),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(),
                                    child: Text(NFList[index]["time"].toString(),
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                          color: Color(0xFFA7A9B7),
                                         height: 0.16
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              Container(
                                margin: EdgeInsets.only(right: 135),
                                child: Text(NFList[index]["stitle"].toString(),
                               //  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xFFA7A9B7),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),



                      ],
                    ),
                  ),

                  Container(
                    width: 300,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.5,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFF3F3F3)
                            )
                        )
                    ),
                  )

                ],
              ),
            );
          }

          ),
    ));
  }

}
