import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:qcop/screens/edit_profile.dart';
import 'package:qcop/screens/login_screen.dart';
import 'package:qcop/screens/not_setting_screen.dart';

import '../resources/resources.dart';
import 'faq_screen.dart';
import 'note_screen.dart';

class DrawerW extends StatefulWidget {
 // final FileImage selectImage;

  const DrawerW({super.key});

  @override
  State<DrawerW> createState() => _DrawerWState();
}

class _DrawerWState extends State<DrawerW> {

  late YYDialog logoutDialoge;

  //File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
        child: ListView(
          children: [
            // DrawerHeader(child: Text("DrawerHeader")),
             Container(
               margin: EdgeInsets.only(top: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
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
                       margin: EdgeInsets.only(top: 10,left: 10,right: 20),
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

                   InkWell(
                     onTap: (){
                       Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => EditProfileScreen()));
                     },
                     child: Container(
                       //margin: EdgeInsets.only(top: 12,right: 0),
                         width: 65,
                         height: 64,
                           alignment: Alignment.bottomRight,
                           decoration: ShapeDecoration(
                             image: DecorationImage(
                               image: AssetImage(Resources.accountIcon),
                               fit: BoxFit.cover
                             ),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(30)
                             )
                           ),
                         child:  Image(
                             image: AssetImage(Resources.editIcon),
                           height: 20,width: 20,
                           ),

                     ),
                   ),


                   // Stack(
                   //     children: [
                   //       Container(
                   //         margin: EdgeInsets.only(left: 0,top: 10,bottom: 50),
                   //         width: 120,
                   //         height: 120,
                   //         decoration: ShapeDecoration(
                   //             image: widget.selectImage != null ?
                   //             DecorationImage(image: FileImage(widget.selectImage! as File),fit:  BoxFit.cover) :
                   //             DecorationImage(image: AssetImage(Resources.updateimgeuser),fit:  BoxFit.cover)
                   //             ,
                   //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))
                   //         ),
                   //       ),
                   //
                   //
                   //       InkWell(
                   //         onTap: (){
                   //         //  _pickImage();
                   //           // selectImage(ImageSource.gallery, 1);
                   //         },
                   //         child: Container(
                   //           margin: EdgeInsets.only(top: 102,left: 82),
                   //           child:Image(
                   //             image: AssetImage(Resources.editIcon),height: 33,width: 33,
                   //           ),),
                   //       )
                   //
                   //     ]
                   // ),
                   
                   Column(
                     children: [
                       Container(
                         margin: EdgeInsets.only(left: 10,right: 60),
                         child: Text(
                           'User ID',
                           style: TextStyle(
                             color: Color(0xFF26475D),
                             fontSize: 16,
                             fontFamily: 'Poppins Bold',
                             fontWeight: FontWeight.w600,
                             height: 0,
                           ),
                         ),
                       ),

                       Container(
                         margin: EdgeInsets.only(top: 10,left: 5,right: 50),
                         child: Text(
                           '123456789',
                           style: TextStyle(
                             color: Color(0xFF627384),
                             fontSize: 11,
                             fontFamily: 'Poppins Medium',
                             fontWeight: FontWeight.w500,
                             height: 0.11,
                           ),
                         ),
                       )
                     ],
                   )

                 ],
               ),
             ),


            // Drawer Lists

            Container(
                  margin: EdgeInsets.only(top: 0,left: 24,right: 18),
              child: Column(
                children: [

                  InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => NotSettingScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 36,),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                          //  margin: EdgeInsets.only(),
                            width: 46,
                            height: 46,
                            decoration: ShapeDecoration(
                              color: Color(0x11005AC6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Image(
                              image: AssetImage(Resources.notification),
                              width: 24,
                              height: 24,
                            color: Color(0xFF0C3C89),
                            //  color: ,
                            )
                          ),

                          Container(
                             margin: EdgeInsets.only(left: 12,),
                            child: Text(
                              'Notification',
                              style: TextStyle(
                                color: Color(0xFF191D31),
                                fontSize: 14,
                                fontFamily: 'Poppins SemiBold',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )
                          ),



                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0,left: 60),
                    width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.50,
                            strokeAlign: BorderSide.strokeAlignCenter,
                               color: Color(0xFFF3F3F3),
                          //  color: Colors.black
                        ),
                      ),
                    ),
                  ),


                  InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => FAQScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 18,),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              //  margin: EdgeInsets.only(),
                              width: 46,
                              height: 46,
                              decoration: ShapeDecoration(
                                color: Color(0x11005AC6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Image(
                                image: AssetImage(Resources.faqIcon),
                                width: 24,
                                height: 24,
                                color: Color(0xFF0C3C89),
                                //  color: ,
                              )
                          ),

                          Container(
                              margin: EdgeInsets.only(left: 12,),
                              child: Text(
                                'FAQ',
                                style: TextStyle(
                                  color: Color(0xFF191D31),
                                  fontSize: 14,
                                  fontFamily: 'Poppins SemiBold',
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              )
                          ),



                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0,left: 60),
                    width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.50,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFF3F3F3),
                          //  color: Colors.black
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => FAQScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 18),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              //  margin: EdgeInsets.only(),
                              width: 46,
                              height: 46,
                              decoration: ShapeDecoration(
                                color: Color(0x11005AC6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Image(
                                image: AssetImage(Resources.pyIcon),
                                width: 24,
                                height: 24,
                                color: Color(0xFF0C3C89),
                                //  color: ,
                              )
                          ),

                          Container(
                              margin: EdgeInsets.only(left: 12,),
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  color: Color(0xFF191D31),
                                  fontSize: 14,
                                  fontFamily: 'Poppins SemiBold',
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              )
                          ),



                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0,left: 60),
                    width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.50,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFF3F3F3),
                          //  color: Colors.black
                        ),
                      ),
                    ),
                  ),


                  InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => FAQScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 18,),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              //  margin: EdgeInsets.only(),
                              width: 46,
                              height: 46,
                              decoration: ShapeDecoration(
                                color: Color(0x11005AC6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Image(
                                image: AssetImage(Resources.groupContactIcon),
                                width: 24,
                                height: 24,
                               // color: Color(0xFF0C3C89),
                                //  color: ,
                              )
                          ),

                          Container(
                              margin: EdgeInsets.only(left: 12,),
                              child: Text(
                                'Contact Us',
                                style: TextStyle(
                                  color: Color(0xFF191D31),
                                  fontSize: 14,
                                  fontFamily: 'Poppins SemiBold',
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              )
                          ),



                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0,left: 60),
                    width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.50,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFF3F3F3),
                          //  color: Colors.black
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                     // Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => FAQScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 18,),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              //  margin: EdgeInsets.only(),
                              width: 46,
                              height: 46,
                              decoration: ShapeDecoration(
                                color: Color(0x11005AC6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Image(
                                image: AssetImage(Resources.pyIcon),
                                width: 24,
                                height: 24,
                                color: Color(0xFF0C3C89),
                                //  color: ,
                              )
                          ),

                          Container(
                              margin: EdgeInsets.only(left: 12,),
                              child: Text(
                                'Terms and Condition',
                                style: TextStyle(
                                  color: Color(0xFF191D31),
                                  fontSize: 14,
                                  fontFamily: 'Poppins SemiBold',
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              )
                          ),



                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0,left: 60),
                    width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.50,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFF3F3F3),
                          //  color: Colors.black
                        ),
                      ),
                    ),
                  ),

                  // InkWell(
                  //   onTap: () {
                  //     // Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => FAQScreen()));
                  //
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.only(top: 18),
                  //     child: Row(
                  //       children: [
                  //         Container(
                  //             padding: EdgeInsets.all(10),
                  //             //  margin: EdgeInsets.only(),
                  //             width: 46,
                  //             height: 46,
                  //             decoration: ShapeDecoration(
                  //               color: Color(0x11005AC6),
                  //               shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(30),
                  //               ),
                  //             ),
                  //             child: Image(
                  //               image: AssetImage(Resources.lockIcon),
                  //               width: 24,
                  //               height: 24,
                  //               color: Color(0xFF0C3C89),
                  //               //  color: ,
                  //             )
                  //         ),
                  //
                  //         Container(
                  //             margin: EdgeInsets.only(left: 12,),
                  //             child: Text(
                  //               'Delete Account',
                  //               style: TextStyle(
                  //                 color: Color(0xFF191D31),
                  //                 fontSize: 14,
                  //                 fontFamily: 'Poppins SemiBold',
                  //                 fontWeight: FontWeight.w500,
                  //                 height: 0.09,
                  //               ),
                  //             )
                  //         ),
                  //
                  //
                  //
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 0,left: 60),
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: ShapeDecoration(
                  //     shape: RoundedRectangleBorder(
                  //       side: BorderSide(
                  //         width: 1.50,
                  //         strokeAlign: BorderSide.strokeAlignCenter,
                  //         color: Color(0xFFF3F3F3),
                  //         //  color: Colors.black
                  //       ),
                  //     ),
                  //   ),
                  // ),


                  InkWell(
                    onTap: () {

                      logoutDialoge = YYDialogConfirm(context);
                      logoutDialoge.show();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 18,),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              //  margin: EdgeInsets.only(),
                              width: 46,
                              height: 46,
                              decoration: ShapeDecoration(
                                color: Color(0x11005AC6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Image(
                                image: AssetImage(Resources.logoutIcon),
                                width: 24,
                                height: 24,
                                color: Color(0xFF0C3C89),
                                //  color: ,
                              )
                          ),

                          InkWell(
                            onTap: (){

                            },
                            child: Container(
                                margin: EdgeInsets.only(left: 12,),
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: Color(0xFF191D31),
                                    fontSize: 14,
                                    fontFamily: 'Poppins Semibold',
                                    fontWeight: FontWeight.w500,
                                    height: 0.09,
                                  ),
                                )
                            ),
                          ),



                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0,left: 60),
                    width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.50,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFF3F3F3),
                          //  color: Colors.black
                        ),
                      ),
                    ),
                  ),



                ],
              ),
            ),





          ],
        ),
      );

  }

  YYDialog YYDialogConfirm(BuildContext context) {
    return YYDialog().build(context)
      ..width = MediaQuery.of(context).size.width * 0.9
      ..backgroundColor = Colors.transparent
    //  ..height = 500
      ..dismissCallBack = () {

      }..widget(
        StatefulBuilder(
            builder: (BuildContext context, StateSetter mystate) {
             return getlogoutCard(mystate);
            })
    )..animatedFunc = (child, animation) {
        return FadeTransition(
          child: child,
          //scale: Tween(begin: 0.0, end: 1.0).animate(animation),
          opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
        );
      };
  }

   getlogoutCard(StateSetter mystate) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      color: Colors.white,
      child: Container(
        height: 350,
         width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.only(top: 20),
              child: Image(image: AssetImage(Resources.logoutImage),
                width: 131.48,
                height: 141.76,),
            ),

            Container(
              margin: EdgeInsets.only(top: 20,left: 120),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Log Out?',
                style: TextStyle(
                  color: Color(0xFF191D31),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.07,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 30,left: 60),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Are you sure want to log out?',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4099999964237213),
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                ),
              ),
            ),


            Container(
              margin: EdgeInsets.only(top: 40,bottom: 40),
               width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.only(top: 20),
                      width: 104,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: Color(0xFFDEDEDE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF3E3E43),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                   //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Container(
                                     //   margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.only(top: 20),
                      width: 104,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: Color(0xFF0C3C89),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Log Out',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                    ),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }


}
