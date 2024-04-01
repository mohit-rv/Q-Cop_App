import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qcop/resources/resources.dart';
import 'package:qcop/screens/drawer_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController= TextEditingController();
  TextEditingController passController= TextEditingController();
  TextEditingController passController1 = TextEditingController();

  // final ImageP = ImagePicker();
  // String image1 = "";
  File? selectedImage;

  void _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
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
          'Edit Profile',
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
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: (){
     //  Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(builder: (context) => DrawerW(selectedImage: selectImage)));

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
          child: Text('Update',style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins Semibold',
            fontWeight: FontWeight.w600,
            height: 0,
          ),),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [

                 Container(
                   margin: EdgeInsets.only(top: 5),
                   //width: MediaQuery.of(context).size.width,
                   child: Stack(
                       children: [

                      Container(
                      margin: EdgeInsets.only(left: 0,top: 10,bottom: 50),
                      width: 120,
                      height: 120,
                        decoration: ShapeDecoration(
                          image: selectedImage != null ?
                              DecorationImage(image: FileImage(selectedImage!),fit:  BoxFit.cover) :
                              DecorationImage(image: AssetImage(Resources.updateimgeuser),fit:  BoxFit.cover),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))
                        ),
                      ),


                      InkWell(
                        onTap: (){
                          _pickImage();
                        // selectImage(ImageSource.gallery, 1);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 102,left: 82),
                          child:Image(
                            image: AssetImage(Resources.editIcon),height: 33,width: 33,
                          ),),
                      )

                      ]
                   ),
                 ),


              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 20),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2,color: Color(0xFFD8DADC)),
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 5),
                      height: 20,width: 20,
                      child: Image(
                        image: AssetImage(Resources.userNameIcon),height: 20,width: 20,color: Colors.black38
                        ,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'username',
                            hintStyle: TextStyle(
                              color: Color(0xFFA7A9B7),
                              fontSize: 14,
                              fontFamily: 'Poppins SemiBold',
                              fontWeight: FontWeight.w400,
                              height: 0.13,
                            )
                        ),
                      ),
                    )
                  ],
                ),),

              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2,color: Color(0xFFD8DADC)),
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 5),
                        height: 20,
                        width: 20,
                        child: Image(
                          image: AssetImage(Resources.lockIcon),
                          height: 20,width: 20,color: Colors.black38,)),
                    Expanded(
                      child: TextFormField(
                        controller: passController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Password',
                            hintStyle: TextStyle(
                              color: Color(0xFFA7A9B7),
                              fontSize: 14,
                              fontFamily: 'Poppins SemiBold',
                              fontWeight: FontWeight.w400,
                              height: 0.13,
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),



              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 20),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2,color: Color(0xFFD8DADC)),
                    borderRadius: BorderRadius.circular(12)

                  )
                ),
                child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 5),
                    height: 20,width: 20,
                    child: Image(
                      image: AssetImage(Resources.lockIcon),height: 20,width: 20,color: Colors.black38
                      ,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: passController1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'new password',
                          hintStyle: TextStyle(
                            color: Color(0xFFA7A9B7),
                            fontSize: 14,
                            fontFamily: 'Poppins SemiBold',
                            fontWeight: FontWeight.w400,
                            height: 0.13,
                          )
                      ),
                    ),
                  )
                ],
              ),),




            ],
          ),
        ),
      ),

    );
  }

  // void selectImage( ImageSource img,int path) async{
  //
  //     final pickedFile = await ImageP.pickImage(source: img);
  //     XFile? xfilePick = pickedFile;
  //
  //     var imageAsUnit = await File(pickedFile!.path).readAsBytes();
  //
  //     // if (xfilePick != null) {
  //     //      final editedImage = await Navigator.push(context, MaterialPageRoute(builder: (context) => ImageEditor(image: imageAsUnit,)));
  //
  //         // print(editedImage);
  //
  //          if(xfilePick != null){
  //            File outPutImage = File(pickedFile.path);
  //            outPutImage.writeAsBytesSync(xfilePick as List<int>);
  //            print(outPutImage.path);
  //
  //            { image1 = outPutImage.path;}
  //
  //          setState(() {
  //
  //          });
  //     }
  // }

  }


