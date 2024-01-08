import 'package:flutter/material.dart';
import 'package:qcop/resources/resources.dart';
import 'package:flutter/cupertino.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen>
  with TickerProviderStateMixin {

  List<Map<String, dynamic>> FaqItems = [

  ];


   bool isContainerVisible = false;

   @override
   void initState() {


     for(var i = 0; i < 8; i++) {

       var _controller = AnimationController(
           duration: Duration(microseconds: 500),
           vsync: this);

       var _animation = CurvedAnimation(
           parent: _controller, curve: Curves.easeInOut);

       FaqItems.add(
         {
           "title": "Are the adequaltety",
           "stitle": "Open the Tradebase app is to get started and follow the steps. Tradebase this doesn’t charge a fee to create"
               " or maintain your Tradebase account. Open the Tradebase app to get. started and follow, the steps. doesn’t charge a fee "
               "to create or maintain your Tradebase account.",
           "isExpanded": false,
           "controller": _controller,
           "animation": _animation
         },

       );
     }

    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        elevation: 8,
        title: Text(
          'FAQ',
          style: TextStyle(
            color: Color(0xFF191D31),
            fontSize: 18,
            fontFamily: 'Poppins Semibold',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          color: Colors.white,
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
                child: Container(
                  width: 46,
                  height: 46,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFF3F3F3),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Image(
                    image: AssetImage(Resources.backIcon),
                    width: 12,
                    height: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {


        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 56,
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 8, left: 24, right: 24),
          decoration: ShapeDecoration(
            color: Color(0xFF0C3C89),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            'Contact via email',
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
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: FaqList()
      ),

    );
  }

  FaqList() {
        return  Container(
         // width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: FaqItems.length,
              physics: ScrollPhysics(),
              controller: ScrollController(),
              itemBuilder: (context, index){
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      FaqItems[index]['isExpanded'] = !FaqItems[index]['isExpanded'];
                      if(FaqItems[index]['isExpanded']) {
                        FaqItems[index]['controller'].forward() ;

                      }else {
                        FaqItems[index]['controller'].reverse();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Color(0xFFF3F3F3),
                              strokeAlign: BorderSide.strokeAlignCenter
                            ),
                          borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15 , top: 14, bottom: 14),
                               child: Text(
                                 FaqItems[index]['title'].toString(),
                                 style: TextStyle(
                                   color: Color(0xFF48484D),
                                   fontSize: 13,
                                   fontFamily: 'Poppins SemiBold',
                                   fontWeight: FontWeight.w400,
                                   height: 0.10,
                                 ),
                               )
                            ),

                            Container(
                                margin: EdgeInsets.only(right: 15, top: 14, bottom: 14),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                                )
                              ),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                child: Image(
                                  image: FaqItems[index]['isExpanded'] ? AssetImage(Resources.collapseIcon) : AssetImage(Resources.addIcon),
                                  width: 24,
                                  height: FaqItems[index]['isExpanded'] ? 2 :24,
                                ),
                              )
                            ),


                          ],
                        ),
                        FaqItems[index]['isExpanded'] ?
                        SizeTransition(
                          sizeFactor: FaqItems[index]['animation'],
                          //  axis: Axis.vertical,
                          child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                            child: Text(
                              FaqItems[index]['stitle'].toString(),
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 10,
                                fontFamily: 'Poppins Medium',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                letterSpacing: 0.25,
                              ),
                            ),
                          ),
                        ): Container()
                      ],
                    ),
                  ),
                );
              }
          ),
        );
  }



}
