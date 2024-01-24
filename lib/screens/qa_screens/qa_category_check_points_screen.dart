import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:qcop/resources/resources.dart';

class QACheckPointsScreen extends StatefulWidget {
  const QACheckPointsScreen({super.key});

  @override
  State<QACheckPointsScreen> createState() => _QACheckPointsScreenState();
}

class _QACheckPointsScreenState extends State<QACheckPointsScreen> {

  String photo1 = "";
  String photo2 = "";
  String photo3 = "";
  String photo4 = "";
  String photo5 = "";
  String photo6 = "";

  final picker = ImagePicker();

  late TextEditingController _makerController;
  late TextEditingController _checkerController;
  late TextEditingController _approverController;

  final FocusNode _makerNode = FocusNode();
  final FocusNode _checkerNode = FocusNode();
  final FocusNode _approverNode = FocusNode();

  late YYDialog confirmDialog;

  @override
  void initState() {
    _makerController = TextEditingController();
    _checkerController = TextEditingController();
    _approverController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _makerController.dispose();
    _checkerController.dispose();
    _approverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
                itemBuilder: (context, index) {
              return getPointsCard(index);
            }),
            InkWell(
              onTap: () {

                //Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => QACheckPointsScreen()));
                confirmDialog = YYDialogConfirm(context);
                confirmDialog.show();

              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 56,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 24, right: 24, top: 36, bottom: 16),
                decoration: ShapeDecoration(
                  color: Color(0xFF0C3C89),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Confirm',
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
          ],
        ),
      ),
    );
  }

  getPointsCard(int index) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(left: 17, right: 17, bottom: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 15, left: 15),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE1ECFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(82),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    child: Text(
                      '${index + 1}/3',
                      style: TextStyle(
                        color: Color(0xFF0C3C88),
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 15, left: 4),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Color(0xFFCACB07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(62),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 15, left: 4),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFCACED8)),
                      borderRadius: BorderRadius.circular(108),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    child: Text(
                      '${DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now())}',
                      style: TextStyle(
                        color: Color(0xFF6C6C6C),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                )
              ],
            ),

            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Text(
                'Weather the bricks are soaked in water prior to use?',
                style: TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 15,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      getImage(ImageSource.gallery, 1);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/3 - 30,
                      height: 102,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0x4C3C3C43)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        image: photo1.isEmpty ?  DecorationImage(
                          image: AssetImage(Resources.addPhotoImg),
                          fit: BoxFit.cover,
                        ) :
                        DecorationImage(
                          image: FileImage(File(photo1)),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      getImage(ImageSource.gallery, 2);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/3 - 30,
                      height: 102,
                      decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0x4C3C3C43)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          image: photo2.isEmpty ?  DecorationImage(
                            image: AssetImage(Resources.addPhotoImg),
                            fit: BoxFit.cover,
                          ) :
                          DecorationImage(
                            image: FileImage(File(photo2)),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      getImage(ImageSource.gallery, 3);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/3 - 30,
                      height: 102,
                      decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0x4C3C3C43)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          image: photo3.isEmpty ?  DecorationImage(
                            image: AssetImage(Resources.addPhotoImg),
                            fit: BoxFit.cover,
                          ) :
                          DecorationImage(
                            image: FileImage(File(photo3)),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {

                      getImage(ImageSource.gallery, 4);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/3 - 30,
                      height: 102,
                      decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0x4C3C3C43)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          image: photo4.isEmpty ?  DecorationImage(
                            image: AssetImage(Resources.addPhotoImg),
                            fit: BoxFit.cover,
                          ) :
                          DecorationImage(
                            image: FileImage(File(photo4)),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      getImage(ImageSource.gallery, 5);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/3 - 30,
                      height: 102,
                      decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0x4C3C3C43)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          image: photo5.isEmpty ?  DecorationImage(
                            image: AssetImage(Resources.addPhotoImg),
                            fit: BoxFit.cover,
                          ) :
                          DecorationImage(
                            image: FileImage(File(photo5)),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      getImage(ImageSource.gallery, 6);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/3 - 30,
                      height: 102,
                      decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0x4C3C3C43)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          image: photo6.isEmpty ?  DecorationImage(
                            image: AssetImage(Resources.addPhotoImg),
                            fit: BoxFit.cover,
                          ) :
                          DecorationImage(
                            image: FileImage(File(photo6)),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 20, left: 16),
              child: Text(
                'Maker',
                style: TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 15,
                  fontFamily: 'Poppins medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 15, right: 15, top: 9),
              padding: EdgeInsets.only(left: 19, right: 19),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFCACED8)),
                  borderRadius: BorderRadius.circular(78),
                ),
              ),
              child:  TextFormField(
                //controller: _makerController,
                //focusNode: _makerNode,
                onChanged: (text) {
                  //onSearchTextChanged(text);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Text",
                  hintStyle:  TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 14,
                    fontFamily: 'Poppins medium',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  counterText: "",
                  isDense: true,
                ),
                keyboardType: TextInputType.name,
                maxLines: 1,
                enabled: true,
                //cursorColor: Color(0xFF394A5D),
                style:  TextStyle(
                  color: Color(0xFF0C3C89),
                  fontSize: 12,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.05,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 38,
                    height: 36,
                    margin: EdgeInsets.only(right: 8, left: 8),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0C3C89),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 38,
                    height: 36,
                    margin: EdgeInsets.only( right: 8, left: 8),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFFEAEAEA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Color(0xFF232323),
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 38,
                    height: 36,
                    margin: EdgeInsets.only(right: 8, left: 8),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFFEAEAEA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'NA',
                      style: TextStyle(
                        color: Color(0xFF232323),
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 20, left: 16),
              child: Text(
                'Checker',
                style: TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 15,
                  fontFamily: 'Poppins medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 15, right: 15, top: 9),
              padding: EdgeInsets.only(left: 19, right: 19),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFCACED8)),
                  borderRadius: BorderRadius.circular(78),
                ),
              ),
              child:  TextFormField(
                //controller: _checkerController,
                //focusNode: _checkerNode,
                onChanged: (text) {
                  //onSearchTextChanged(text);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Text",
                  hintStyle:  TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 14,
                    fontFamily: 'Poppins medium',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  counterText: "",
                  isDense: true,
                ),
                keyboardType: TextInputType.name,
                maxLines: 1,
                enabled: true,
                //cursorColor: Color(0xFF394A5D),
                style:  TextStyle(
                  color: Color(0xFF0C3C89),
                  fontSize: 12,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.05,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 38,
                    height: 36,
                    margin: EdgeInsets.only(right: 8, left: 8),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0C3C89),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 38,
                    height: 36,
                    margin: EdgeInsets.only( right: 8, left: 8),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFFEAEAEA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Color(0xFF232323),
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 38,
                    height: 36,
                    margin: EdgeInsets.only(right: 8, left: 8),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFFEAEAEA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'NA',
                      style: TextStyle(
                        color: Color(0xFF232323),
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 20, left: 16),
              child: Text(
                'Approver',
                style: TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 15,
                  fontFamily: 'Poppins medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 15, right: 15, top: 9),
              padding: EdgeInsets.only(left: 19, right: 19),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFCACED8)),
                  borderRadius: BorderRadius.circular(78),
                ),
              ),
              child:  TextFormField(
                //controller: _approverController,
                //focusNode: _approverNode,
                onChanged: (text) {
                  //onSearchTextChanged(text);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Text",
                  hintStyle:  TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 14,
                    fontFamily: 'Poppins medium',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  counterText: "",
                  isDense: true,
                ),
                keyboardType: TextInputType.name,
                maxLines: 1,
                enabled: true,
                //cursorColor: Color(0xFF394A5D),
                style:  TextStyle(
                  color: Color(0xFF0C3C89),
                  fontSize: 12,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.05,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 13, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 38,
                    height: 36,
                    margin: EdgeInsets.only(right: 8, left: 8),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0C3C89),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 38,
                    height: 36,
                    margin: EdgeInsets.only( right: 8, left: 8),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFFEAEAEA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Color(0xFF232323),
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 38,
                    height: 36,
                    margin: EdgeInsets.only(right: 8, left: 8),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFFEAEAEA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'NA',
                      style: TextStyle(
                        color: Color(0xFF232323),
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage(
      ImageSource img,
      int path
      ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;

    var imageAsUnit8 = await File(pickedFile!.path).readAsBytes();

    if (xfilePick != null) {
      final editedImage = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ImageEditor(
                image: imageAsUnit8, // <-- Uint8List of image
              ),
        ),
      );

      print(editedImage);

      if (editedImage != null) {

        File outPutImage = File(pickedFile!.path);
        outPutImage.writeAsBytesSync(editedImage);
        print(outPutImage.path);

        switch (path) {
          case 1 :
            {
              photo1 = outPutImage.path;
              break;
            }
          case 2 :
            {
              photo2 = outPutImage.path;
              break;
            }
          case 3 :
            {
              photo3 = outPutImage.path;
              break;
            }
          case 4 :
            {
              photo4 = outPutImage.path;
              break;
            }
          case 5 :
            {
              photo5 = outPutImage.path;
              break;
            }
          case 6 :
            {
              photo6 = outPutImage.path;
              break;
            }
          default :
            {
              photo1 = outPutImage.path;
              break;
            }
        }
        //titleTxt = "Submit";

        //uploadImg();

      } else {
        /*ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));*/
      }
    }

    setState(() {

    });
  }



  YYDialog YYDialogConfirm(BuildContext context) {
    return YYDialog().build(context)
      ..width = MediaQuery.of(context).size.width * 0.9
      ..backgroundColor = Colors.transparent
    //..height = 500
      ..dismissCallBack = () {

      }..widget(
          StatefulBuilder(
              builder: (BuildContext context, StateSetter mystate) {
                return getConfirmWidget(mystate);
              })
      )..animatedFunc = (child, animation) {
        return FadeTransition(
          child: child,
          //scale: Tween(begin: 0.0, end: 1.0).animate(animation),
          opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
        );
      };
  }




    getConfirmWidget(StateSetter mystate) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,

        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 39),
              child: Text(
                'Notes',
                style: TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 15,
                  fontFamily: 'Poppins Semibold',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 22, right: 22, top: 9),
              padding: EdgeInsets.only(left: 19, right: 19),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFCACED8)),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: TextFormField(
                //controller: _approverController,
                //focusNode: _approverNode,
                onChanged: (text) {
                  //onSearchTextChanged(text);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Notes",
                  hintStyle:  TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 14,
                    fontFamily: 'Poppins Medium',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  counterText: "",
                ),
                keyboardType: TextInputType.multiline,
                enabled: true,
                maxLines: null,
                //expands: true,

                //cursorColor: Color(0xFF394A5D),
                style:  TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 14,
                  fontFamily: 'Poppins medium',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 36,
                    margin: EdgeInsets.only(right: 2.5),
                    padding: EdgeInsets.only(left: 23, right: 23),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0C3C89),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'Satisfied',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins Semibold',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Container(
                    height: 36,
                    margin: EdgeInsets.only(left: 2.5),
                    padding: EdgeInsets.only(left: 12, right: 12),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFFEAEAEA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'Not Satisfied',
                      style: TextStyle(
                        color: Color(0xFF232323),
                        fontSize: 12,
                        fontFamily: 'Poppins Semibold',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 46,
              margin: EdgeInsets.only(left: 70, right: 70, top: 40, bottom: 40),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: Color(0xFF0C3C89),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Poppins Semibold',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            )
          ],
        ),
      ),
    );

  }

}
