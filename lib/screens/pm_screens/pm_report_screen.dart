//import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';

import '../../resources/resources.dart';

class PMReportScreen extends StatefulWidget {
  const PMReportScreen({super.key});

  @override
  State<PMReportScreen> createState() => _PMReportScreenState();
}

class _PMReportScreenState extends State<PMReportScreen> {


  String photo1 = "";
  String photo2 = "";
  String photo3 = "";
  final picker = ImagePicker();

  TextEditingController _flateController = TextEditingController();
  List<Map<String, dynamic>> itemCard = [
    {
      "report type": "Re-Open",
       "Date": "${DateFormat('yyyy-mm-dd hh:mm:ss').format(DateTime.now())}",
      "Category":"Last Updated by","checklist":"Checker User",
      "Category2":"Notes","checklist2": "Vsfs",
    "Category3": "Checker","checklist3": "Checker User","Category4": "Maker","Checklist4": "Maker User",
    "Category5": "Contractor","checklist5":"test Contractor","Category6": "Company Name","checklist6":"test Q-Cop",
      "Category7": "Severity","checklist7":"Medium", "Category8": "Exp Date","checklist8":"06/10/2023\n38 Days remaining",
    "location1": "Tower 1","location2": "Tower 2","location3": "Tower 3","location4": "location",
      "isSynced" : true, "isLastEdited" : false
    },

    {
      "report type": "Re-Open",
      "Date": "${DateFormat('yyyy-mm-dd hh:mm:ss').format(DateTime.now())}",
      "Category":"Last Updated by","checklist":"Checker User",
      "Category2":"Notes","checklist2": "Vsfs",
      "Category3": "Checker","checklist3": "Checker User","Category4": "Maker","Checklist4": "Maker User",
      "Category5": "Contractor","checklist5":"test Contractor","Category6": "Company Name","checklist6":"test Q-Cop",
      "Category7": "Severity","checklist7":"Medium", "Category8": "Exp Date","checklist8":"06/10/2023\n38 Days remaining",
      "location1": "Tower 1","location2": "Tower 2","location3": "Tower 3","location4": "location",
      "isSynced" : true, "isLastEdited" : false
    }

  ];

  List<String> flateoption = ["Level 1","Level 12","Level 3","Level 4","Level 5","Level 6","Level 7"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
           children: [
             getflatOption(),
             getItemCard(0),
             getItemCard(1)
           ],
        ),
      ),
    );
  }

  getflatOption() {
    return Container(
        child:  Container(
          width: MediaQuery.of(context).size.width,
          height: 54,
          margin: EdgeInsets.only(left: 24, right: 24, top: 20),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF0C3C89)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Expanded(
              child: TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                    controller: _flateController,
                    //   onChanged: (String? value){
                    // //    fieldLists[index]['selectedValue'] = value!;
                    //     setState(() {
                    //       option1.text = value!;
                    //     });
                    //   },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                     // hintText: "${itemList[label]}",
                      hintText: 'flate',
                      hintStyle:  TextStyle(
                        color: Color(0xFF0C3C89),
                        fontSize: 12,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.05,
                      ),
                    )
                ),
                itemBuilder: (context, suggestion){
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top:20,bottom: 10,left: 10),
                    child: Text(suggestion,
                      style: TextStyle(
                        color: Color(0xFFA7A9B7),
                        fontSize: 14,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  );

                },
                suggestionsCallback: (pattern){
                  return flateoption.where((list) => list
                      .toLowerCase().contains(pattern.toLowerCase())).toList();
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    _flateController.text = suggestion;
                    //   fieldLists[index]['selectedValue'] = suggestion;

                    print("$suggestion");
                    // if (index != fieldLists.length-1) {
                    // fieldLists[index+1]['isSelected'] = true;
                    //  }

                  });
                },
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                ),

              ),
            ),


          ),
        )
      // Container();
    );
  }

  getItemCard(int index) {
     return Card(
         margin: EdgeInsets.only(left: 17, right: 17, bottom: 20),
         color: Colors.white,
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
                          //'${index + 1}/${reportLists.length}',
                          '${index + 1}/23',
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
                        color: itemCard[index]['report type'].toString() == "Re-Open" ? Color(0xFFD450D1) : Color(0xFF15C059),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(62),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 12, right: 12),
                        child: Text(
                          itemCard[index]['report type'].toString(),
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
                          itemCard[index]['Date'].toString(),
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
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(top: 10),
                  child: Text("MEP: Plumbing: Hole is not closed properly at ceiling for Downtake pipe ",
                    style: TextStyle(
                      color: Color(0xFF394A5D),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1,
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
                  margin: EdgeInsets.only(top: 32, left: 17, right: 17),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 34,
                        child: Text(
                          itemCard[index]['Category'].toString(),
                          style: TextStyle(
                            color: Color(0xBC63676F),
                            fontSize: 12,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: -0.36,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 34,
                        child: Text(
                          itemCard[index]['checklist'].toString(),
                          style: TextStyle(
                            color: Color(0xFF394A5D),
                            fontSize: 13,
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
                  margin: EdgeInsets.only(top: 32, left: 17, right: 17),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 34,
                        child: Text(
                          itemCard[index]['Category2'].toString(),
                          style: TextStyle(
                            color: Color(0xBC63676F),
                            fontSize: 12,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: -0.36,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 34,
                        child: Text(
                          itemCard[index]['checklist2'].toString(),
                          style: TextStyle(
                            color: Color(0xFF394A5D),
                            fontSize: 13,
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
                  margin: EdgeInsets.only(top: 32, left: 17, right: 17),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 34,
                        child: Text(
                          itemCard[index]['Category3'].toString(),
                          style: TextStyle(
                            color: Color(0xBC63676F),
                            fontSize: 12,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: -0.36,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 34,
                        child: Text(
                          itemCard[index]['checklist3'].toString(),
                          style: TextStyle(
                            color: Color(0xFF394A5D),
                            fontSize: 13,
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
                  margin: EdgeInsets.only(top: 32, left: 17, right: 17),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 34,
                        child: Text(
                          itemCard[index]['Category4'].toString(),
                          style: TextStyle(
                            color: Color(0xBC63676F),
                            fontSize: 12,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: -0.36,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 34,
                        child: Text(
                          itemCard[index]['checklist4'].toString(),
                          style: TextStyle(
                            color: Color(0xFF394A5D),
                            fontSize: 13,
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
                  margin: EdgeInsets.only(top: 32, left: 17, right: 17),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 34,
                        child: Text(
                          itemCard[index]['Category5'].toString(),
                          style: TextStyle(
                            color: Color(0xBC63676F),
                            fontSize: 12,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: -0.36,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 34,
                        child: Text(
                          itemCard[index]['checklist5'].toString(),
                          style: TextStyle(
                            color: Color(0xFF394A5D),
                            fontSize: 13,
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
                  margin: EdgeInsets.only(top: 32, left: 17, right: 17),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 34,
                        child: Text(
                          itemCard[index]['Category6'].toString(),
                          style: TextStyle(
                            color: Color(0xBC63676F),
                            fontSize: 12,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: -0.36,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 34,
                        child: Text(
                          itemCard[index]['checklist6'].toString(),
                          style: TextStyle(
                            color: Color(0xFF394A5D),
                            fontSize: 13,
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
                  margin: EdgeInsets.only(top: 18, left: 15, right: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal ,
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            itemCard[index]['location1'].toString(),
                            style: TextStyle(
                              color: Color(0xBC63676F),
                              fontSize: 12,
                              fontFamily: 'Poppins medium',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.36,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 21, right: 21),
                          child: Image(
                            image: AssetImage(Resources.rightArrowIcon),
                            width: 7,
                            height: 13,
                          ),
                        ),
                        Container(
                          child: Text(
                            itemCard[index]['location2'].toString(),
                            style: TextStyle(
                              color: Color(0xBC63676F),
                              fontSize: 12,
                              fontFamily: 'Poppins medium',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.36,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 21, right: 21),
                          child: Image(
                            image: AssetImage(Resources.rightArrowIcon),
                            width: 7,
                            height: 13,
                          ),
                        ),
                        Container(
                          child: Text(
                            itemCard[index]['location3'].toString(),
                            style: TextStyle(
                              color: Color(0xBC63676F),
                              fontSize: 12,
                              fontFamily: 'Poppins medium',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.36,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 21, right: 21),
                          child: Image(
                            image: AssetImage(Resources.rightArrowIcon),
                            width: 7,
                            height: 13,
                          ),
                        ),
                        Container(
                          child: Text(
                            itemCard[index]['location4'].toString(),
                            style: TextStyle(
                              color: Color(0xBC63676F),
                              fontSize: 12,
                              fontFamily: 'Poppins medium',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.36,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 27, left: 17, right: 17, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      itemCard[index]['isSynced'] ? Container(
                        height: 30,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFF0C3C88),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(62),
                          ),
                        ),
                        child: Text(
                          'Completed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Poppins Semibold',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ) :
                      Container(
                        height: 30,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        margin: EdgeInsets.only(right: 5),
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFFEF3B4F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(62),
                          ),
                        ),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Poppins Semibold',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      !itemCard[index]['isSynced'] ? Container(
                        height: 30,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        margin: EdgeInsets.only(left: 5),
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFF0C3C88),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(62),
                          ),
                        ),
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Poppins Semibold',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ) : Container(),
                    ],
                  ),
                ),


              ],
            ),

     ));
  }


  Future getImage(
      ImageSource img,
      int path
      ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;

    var imageAsUnit8 = await File(pickedFile!.path).readAsBytes();       //import dart io

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


}
