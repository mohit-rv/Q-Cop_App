import 'dart:ffi';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:qcop/api_service/api_service.dart';
import 'package:qcop/api_service/response/level2_response_model.dart';
import 'package:qcop/api_service/response/level3_response_model.dart';
import 'package:qcop/api_service/response/level4_response_model.dart';
import 'package:qcop/api_service/response/level5_response_model.dart';
import 'package:qcop/api_service/response/level6_response_model.dart';
import 'package:qcop/api_service/response/qa_level1_responese_model.dart';
import 'package:qcop/local_database/database.dart';
import 'package:qcop/local_database/database_handler.dart';
import 'package:qcop/local_database/models/Level5_model.dart';
import 'package:qcop/local_database/models/level2_model.dart';
import 'package:qcop/local_database/models/level3_model.dart';
import 'package:qcop/local_database/models/level4_model.dart';
import 'package:qcop/local_database/models/level6_model.dart';
import 'package:qcop/local_database/models/qa_level1_model.dart';
import 'package:qcop/resources/resources.dart';

import '../../api_service/response/level3_response_model.dart';

class QALocationScreen extends StatefulWidget {


  late ValueChanged<bool> onChange;

  QALocationScreen({super.key, required this.onChange});

  @override
  State<QALocationScreen> createState() => _QALocationScreenState();
}

class _QALocationScreenState extends State<QALocationScreen> {
  //bool optisSelected= true;
  bool opt1isSelected= true;
  bool opt2isSelected= false;
  bool opt3isSelected= false;
  bool opt4isSelected= false;
  bool opt5isSelected= false;
  bool opt6isSelected= false;


  List<QAlevel1Model> level1List = [];

  int visibleFields = 1;
  List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());
  List<dynamic> optionList = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"];



  List<Map<String, dynamic>> fieldLists = [
    {"selectedValue" : "Level 1", "lists" : ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"],"isSelected": true},
    {"selectedValue" : "Level 2", "lists" : ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"],"isSelected": false },
    {"selectedValue" : "Level 3", "lists" : ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"], "isSelected": false},
    {"selectedValue" : "Level 4", "lists" : ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"], "isSelected": false},
    {"selectedValue" : "Level 5", "lists" : ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"],"isSelected": false},
  ];



  List<DropdownMenuItem<String>> dropdownItems(index) {
    List<DropdownMenuItem<String>> menuItems = [];

    for (var i in fieldLists[index]['lists']) {
      menuItems.add(DropdownMenuItem(
          value: i,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              padding: EdgeInsets.only(left: 6, right: 6),
              alignment: Alignment.centerLeft,
              decoration: ShapeDecoration(
                color: fieldLists[index]['selectedValue'] == i ? Color(0xFF0C3C89) : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Text(
                i.toString(),
                style: TextStyle(
                  color: fieldLists[index]['selectedValue'] == i ? Colors.white : Color(0xFFA7A9B7),
                  fontSize: 14,
                  fontFamily: 'Poppins medium',
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )));
    }
  //  print(menuItems);
    return menuItems;
  }

// bool isSelected = true;

 // late TextEditingController _searchController;
  TextEditingController option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  TextEditingController option5 = TextEditingController();
  TextEditingController option6 = TextEditingController();
  TextEditingController _searchController = TextEditingController();


  List<dynamic> option1List = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"];
  List<dynamic> option2List = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5",];
  List<dynamic> option3List = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5",];
  List<dynamic> option4List = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5",];
  List<dynamic> option5List = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5",];
  List<dynamic> option6List = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5",];

  List<dynamic> searchList = [
    "SearchResult1",
    "SearchResult12",
    "SearchResult123",
    "SearchResult1234",
    "SearchResult12345",
    "SearchResult123456",
  ];

  FocusNode _searchNode = FocusNode();


  void fetchData() async {
    ApiService apiService = ApiService();
    int prjID = 1;
    try {
      List<Level6ResponseModel>? data = await apiService.getLevel6(prjID);
      if(data!=null){
        for(var i in data ) {
          print('level5Name: ${i.level6Name}');
        }
      }
      print('Data: $data');
      // Handle the data as needed
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }

  void getLocation1Field() async{
    level1List = await SqfDataBase().getlevel1data();
    if(level1List.isEmpty){
      List<Qalevel>? levelList =await ApiService().getQAlevel1(2);
      if(levelList!=null){
        for(var i in levelList){
          QAlevel1Model level1Data = QAlevel1Model(
              level1ID: i.level1ID,
              pid: i.pid,
              level1Name: i.level1Name ?? "",
          );
          await SqfDataBase().insertLevel1(level1Data);
        }

        for(var i in level1List){
          print('level1Name db: ${i.level1Name}');
        }
      }

    }else{

      for(var i in level1List){
        print('level1Name db: ${i.level1Name}');
      }
    }
    //print('from localdb: $level1List');
  }

  void getLocation2Field() async{
    List<Level2Model> level2List = await SqfDataBase().getLevel2Data();
    if(level2List.isEmpty){
      List<Level2Response>? level2Response = await ApiService().getLevel2(2);
      if(level2Response!=null){
        for(var i in level2Response){
          Level2Model level2Data = Level2Model(
              level2ID: i.level2ID,
              level1ID: i.level1ID,
              level2Name: i.level2Name ?? "",
              Active: i.active ?? "",
          );
          await SqfDataBase().insertLevel2(level2Data);
        }
        for(var i in level2List){
            print('level2Name: ${i.level2Name}');
        }

      }
    } else{
      for(var i in level2List){
        print('level2Name else: ${i.level2Name}');
      }
    }
  }

  void getLocation3Field() async{
     List<Level3Model> Level3Data = await SqfDataBase().getLevel3DModel();
     if(Level3Data.isEmpty){
       List<level3Response>? Level3Response = await ApiService().getLevel3(1);
       if(Level3Response!=null){
         for(var i in Level3Response){
           Level3Model level3Data = Level3Model(
               level2ID: i.level2ID,
               level3ID: i.level3ID,
               level3Name: i.level3Name ?? ""
           );
           await SqfDataBase().insertLevel3(level3Data);
         }

         for(var i in Level3Data){
           print('level3Name: ${i.level3Name}');
         }
       }
     }else {
       for(var i in Level3Data){
         print('level3Name else: ${i.level3Name}');
       }
     }
  }

  void getLoction4Field() async{
    List<Level4Model> level4List = await SqfDataBase().getLevel4Model();
    if(level4List.isEmpty){
      List<Level4ResponseModel>? level4Response = await ApiService().getLevel4(2);
      if(level4Response!= null){
        for(var i in level4Response){
          Level4Model level4Data = Level4Model(
              level4ID: i.level4ID,
              level3ID: i.level3Id,
              level4Name: i.level4Name ?? ""
          );
          await SqfDataBase().insertLevel4(level4Data);
        }
        for(var i in level4List){
          print('level4Name db: ${i.level4Name}');
        }
      }
    }else {
      for(var i in level4List){
        print('level4Name db else: ${i.level4Name}');
      }
    }
  }

  void getLocation5Field() async{
    List<Level5Model> level5List = await SqfDataBase().getLevel5Model();
    if(level5List.isEmpty){
      List<Level5ResponseModel>? level5Response = await ApiService().getLevel5(2);
      if(level5Response!=null){
        for(var i in level5Response){
          Level5Model level5Data = Level5Model(
              level5ID: i.level5ID,
              level4ID: i.level4ID,
              level5Name: i.level5Name ?? ""
          );
          await SqfDataBase().insertLevel5(level5Data);
        }

        for(var i in level5List){
          print('level5Name db: ${i.level5Name}');
        }

      }
    }else {
      for(var i in level5List){
        print('level5Name db el: ${i.level5Name}');
      }
    }
  }

  void getLocation6Field()  async{
    List<Level6Model> level6List = await SqfDataBase().getLevel6Model();
    if(level6List.isEmpty){
      List<Level6ResponseModel>? Level6Response = await ApiService().getLevel6(1);
      if(Level6Response!=null){
        for(var i in Level6Response){
           Level6Model Level6Data = Level6Model(
               level6ID: i.level6ID,
               level5ID: i.level5ID,
               level6Name: i.level6Name ?? ""
           );
           await SqfDataBase().insertLevel6(Level6Data);
        }
        for(var i in level6List){
          print('level6Name : ${i.level6Name}');
        }
      }
    }else{
      for(var i in level6List){
        print('level6Name db el: ${i.level6Name}');
      }
    }
  }

  @override
  void initState() {
    getLocation1Field();
    getLocation2Field();
    getLocation3Field();
    getLoction4Field();
    getLocation5Field();
    getLocation6Field();
    fetchData();
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              getSearchFiled(),

           Column(
             children: List.generate(6, (index) {
               return Visibility(
                 visible: index < visibleFields,
                   child: Container(
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
                                   controller: controllers[index],
                                   //   onChanged: (String? value){
                                   // //    fieldLists[index]['selectedValue'] = value!;
                                   //     setState(() {
                                   //       option1.text = value!;
                                   //     });
                                   //   },
                                   decoration: InputDecoration(
                                     border: InputBorder.none,
                                     hintText: "Level 1",
                                     hintStyle: TextStyle(
                                       color: Color(0xFFA7A9B7),
                                       fontSize: 14,
                                       fontFamily: 'Poppins Medium',
                                       fontWeight: FontWeight.w400,
                                       height: 0,
                                     ),
                                   )
                               ),
                               itemBuilder: (context,suggestion){
                                 return Container(
                                   width: MediaQuery.of(context).size.width,
                                   margin: EdgeInsets.only(top:20,bottom: 10),
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
                                 return optionList.where((list) => list
                                     .toLowerCase().contains(pattern.toLowerCase())).toList();
                               },
                               onSuggestionSelected: (suggestion) {
                                 setState(() {
                                   controllers[index].text = suggestion;
                                   //   fieldLists[index]['selectedValue'] = suggestion;
                                   if (index < 5) {
                                     visibleFields = index + 2; // Show the next field
                                   }
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
                   )
               );
             }),
           ),

              InkWell(
                onTap: () {

                  saveDataInLocal();

                  widget.onChange(true);

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
                    'Next',
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
              )
            ],
          ),
        ),
      ),
    );
  }

   getSearchFiled() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(left: 24, right: 24),
      padding: EdgeInsets.only(left: 15, right: 15),
      alignment: Alignment.center,
      decoration: ShapeDecoration(

        color: Color(0xFFF1F2F2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
      // child: TextFormField(
      //   controller: _searchController,
      //   focusNode: _searchNode,
      //   onChanged: (text) {
      //     //onSearchTextChanged(text);
      //   },
      //   decoration: InputDecoration(
      //     border: InputBorder.none,
      //     hintText: "Search",
      //     hintStyle: TextStyle(
      //       color: Color(0xFF7C7C7C),
      //       fontSize: 14,
      //       fontFamily: 'Poppins Medium',
      //       fontWeight: FontWeight.w400,
      //       height: 0,
      //     ),
      //     counterText: "",
      //     isDense: true,
      //     prefixIcon: Container(
      //       margin: EdgeInsets.only(right: 8),
      //       child: Image(
      //         image: AssetImage(Resources.searchIcon),
      //         width: 24,
      //         height: 24,
      //       ),
      //     ),
      //     prefixIconConstraints: BoxConstraints(
      //         minWidth: 30, maxWidth: 30, minHeight: 30, maxHeight: 30),
      //   ),
      //   keyboardType: TextInputType.name,
      //   maxLines: 1,
      //   enabled: true,
      //   cursorColor: Color(0xFF394A5D),
      //   style: TextStyle(
      //     color: Color(0xFF191D31),
      //     fontSize: 15,
      //     fontFamily: 'Poppins Medium',
      //     fontWeight: FontWeight.w400,
      //     height: 1.0,
      //   ),
      // ),

           child: TypeAheadFormField(
        textFieldConfiguration: TextFieldConfiguration(
            controller: _searchController,
            decoration: InputDecoration(
           prefixIcon: Container(
           margin: EdgeInsets.only(right: 8),
           child: Image(
             image: AssetImage(Resources.searchIcon),
             width: 1,
             height: 1,
           ),),
             prefixIconConstraints: BoxConstraints(
             minWidth: 30, maxWidth: 30, minHeight: 30, maxHeight: 30),
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(
                color: Color(0xFFA7A9B7),
                fontSize: 14,
                fontFamily: 'Poppins Medium',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),

        ),
        itemBuilder: (context, suggestion){
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top:20,bottom: 10),
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
          return searchList.where((list) => list
              .toLowerCase().contains(pattern.toLowerCase())).toList();
        },
        onSuggestionSelected: ( suggestion) {
          setState(() {
            _searchController.text = suggestion;
            //   fieldLists[index]['selectedValue'] = suggestion;
            print("$suggestion");
            // if (index != fieldLists.length-1) {
            // fieldLists[index+1]['isSelected'] = true;
            //  }
          });
        },

             suggestionsBoxDecoration: SuggestionsBoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(12),
             ),

        // suggestionsBoxDecoration: SuggestionsBoxDecoration(
        //   color: Colors.white,
        // ),

      ),

    );
  }

  getFieldsList() {

       return Container(
           child: ListView.builder(
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               // itemCount: fieldLists.length,
               itemCount: 1,
               itemBuilder: (context, index) {
                 // var index = index0fField;
                 // if(fieldLists[index]['selectedValue']!=['lists'] && index<5) {
                 // return fieldLists[index]['isSelected'] ?
                 return  Container(
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
                     // child: Row(
                     //   children: [
                     /*Container(
                  margin: EdgeInsets.only(right: 14),
                  child: Image(
                    image: AssetImage(Resources.projectIcon),
                  ),
                ),*/
                     // Expanded(
                     //   child: Container(
                     //     alignment: Alignment.center,
                     //     child: DropdownButtonHideUnderline(      //to remove underline
                     //       child: DropdownButton2<String>(
                     //         //elevation: 8,
                     //         selectedItemBuilder: (_) {
                     //           return dropdownItems(index).map(
                     //                 (e) => Align(
                     //               alignment: Alignment.centerLeft,
                     //               child: Text(
                     //                 e.value.toString(),
                     //                 textAlign: TextAlign.start,
                     //                 style: const TextStyle(
                     //                   color: Color(0xFF3C3C3C),
                     //                   fontSize: 14,
                     //                   fontFamily: 'Poppins Medium',
                     //                   fontWeight: FontWeight.w400,
                     //                   height: 0,
                     //                 ),
                     //                 maxLines: 1,
                     //                 overflow: TextOverflow.ellipsis,
                     //               ),
                     //             ),
                     //           ).toList();
                     //         },
                     //         isExpanded: true,
                     //         /*buttonStyleData: const ButtonStyleData(
                     //   //padding: EdgeInsets.symmetric(horizontal: 16),
                     //   height: 40,
                     //   width: 60,
                     // ),*/
                     //         iconStyleData: IconStyleData(
                     //           icon: Icon(
                     //             Icons.arrow_drop_down_outlined,
                     //           ),
                     //           iconSize: 30,
                     //           iconEnabledColor: HexColor("#0C3C89"),
                     //           iconDisabledColor: HexColor("#0C3C89"),
                     //         ),
                     //         dropdownStyleData: DropdownStyleData(
                     //           width: MediaQuery.of(context).size.width - 50,
                     //           maxHeight: 150,
                     //           isOverButton: false,
                     //           //padding: EdgeInsets.only(left: 24, right: 24),
                     //           decoration: BoxDecoration(
                     //             borderRadius: BorderRadius.circular(6),
                     //             color: Colors.white,
                     //           ),
                     //           offset: const Offset(-14, -10),
                     //           scrollbarTheme: ScrollbarThemeData(      //side srollbar dor showing screen length
                     //             radius: const Radius.circular(40),
                     //             thickness: MaterialStateProperty.all(6),
                     //             thumbVisibility:
                     //             MaterialStateProperty.all(true),
                     //           ),
                     //         ),
                     //         menuItemStyleData: const MenuItemStyleData(
                     //           height: 50,
                     //           padding: EdgeInsets.only(
                     //               left: 14, right: 14, bottom: 8, top: 8),
                     //         ),
                     //         /*icon: Container(
                     //           margin: EdgeInsets.only(left: 10, right: 4),
                     //           child: Image(
                     //             image: AssetImage(Assets().downArrowIcon),
                     //             width: 10,
                     //             height: 10,
                     //           ),
                     //         ),*/
                     //         //borderRadius: BorderRadius.circular(10),
                     //
                     //         value: fieldLists[index]['selectedValue'].toString(),
                     //         items: dropdownItems(index),
                     //           //alignment: Alignment.center,
                     //         onChanged: (String? newValue) {
                     //           setState(() {
                     //             fieldLists[index]['selectedValue'] = newValue!;
                     //             print(newValue);
                     //             print(fieldLists[index]['selectedValue'].toString());   //condition to generate next dropdown
                     //             if (index != fieldLists.length-1) {
                     //               fieldLists[index+1]['isSelected'] = true;
                     //             }
                     //           });
                     //         }
                     //       ),
                     //     ),
                     //
                     //
                     //
                     //   ),
                     // ),


                     child: TypeAheadFormField(
                       textFieldConfiguration: TextFieldConfiguration(
                           controller: option1,
                           decoration: InputDecoration(
                             border: InputBorder.none,
                             hintText: "Level 1",
                             hintStyle: TextStyle(
                               color: Color(0xFFA7A9B7),
                               fontSize: 14,
                               fontFamily: 'Poppins Medium',
                               fontWeight: FontWeight.w400,
                               height: 0,
                             ),
                           )
                       ),
                       itemBuilder: (context,suggestion){
                         return Container(
                           width: MediaQuery.of(context).size.width,
                           margin: EdgeInsets.only(top:20,bottom: 10),
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
                         return option1List.where((list) => list
                             .toLowerCase().contains(pattern.toLowerCase())).toList();
                       },
                       onSuggestionSelected: (suggestion) {
                         setState(() {
                           option1.text = suggestion;
                           // fieldLists[index]['selectedValue'] = suggestion;
                           if(option1 == suggestion){
                             opt2isSelected == true;
                           }
                           print("$suggestion");
                           // if (index != fieldLists.length-1) {
                           // fieldLists[index+1]['isSelected'] = true;
                           //  }
                         });
                       },

                       suggestionsBoxDecoration: SuggestionsBoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(12),
                       ),

                     ),



                   ),
                 );
                 // Container();

               }
           )
       );

  }

  getFieldsList2() {
     if(opt2isSelected == true){
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
                      controller: option2,
                      //   onChanged: (String? value){
                      // //    fieldLists[index]['selectedValue'] = value!;
                      //     setState(() {
                      //       option1.text = value!;
                      //     });
                      //   },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Level 1",
                        hintStyle: TextStyle(
                          color: Color(0xFFA7A9B7),
                          fontSize: 14,
                          fontFamily: 'Poppins Medium',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )
                  ),
                  itemBuilder: (context,suggestion){
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top:20),
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
                    return option2List.where((list) => list
                        .toLowerCase().contains(pattern.toLowerCase())).toList();
                  },
                  onSuggestionSelected: (suggestion) {
                    setState(() {
                      option2.text = suggestion;
                      //   fieldLists[index]['selectedValue'] = suggestion;
                      if(option2.text == suggestion){

                      }
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
    }else{
       return Container();
     }
  }

  getFieldsList3() {
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
                    controller: option3,
                    //   onChanged: (String? value){
                    // //    fieldLists[index]['selectedValue'] = value!;
                    //     setState(() {
                    //       option1.text = value!;
                    //     });
                    //   },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Level 1",
                      hintStyle: TextStyle(
                        color: Color(0xFFA7A9B7),
                        fontSize: 14,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )
                ),
                itemBuilder: (context,suggestion){
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top:20),
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
                  return option3List.where((list) => list
                      .toLowerCase().contains(pattern.toLowerCase())).toList();
                },
                onSuggestionSelected: ( suggestion) {
                  setState(() {
                    option3.text = suggestion;
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

  getFieldsList4() {
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
                    controller: option4,
                    //   onChanged: (String? value){
                    // //    fieldLists[index]['selectedValue'] = value!;
                    //     setState(() {
                    //       option1.text = value!;
                    //     });
                    //   },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Level 1",
                      hintStyle: TextStyle(
                        color: Color(0xFFA7A9B7),
                        fontSize: 14,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )
                ),
                itemBuilder: (context,suggestion){
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top:20),
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
                  return option4List.where((list) => list
                      .toLowerCase().contains(pattern.toLowerCase())).toList();
                },
                onSuggestionSelected: ( suggestion) {
                  setState(() {
                    option4.text = suggestion;
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

  getFieldsList5() {
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
                    controller: option5,
                    //   onChanged: (String? value){
                    // //    fieldLists[index]['selectedValue'] = value!;
                    //     setState(() {
                    //       option1.text = value!;
                    //     });
                    //   },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Level 1",
                      hintStyle: TextStyle(
                        color: Color(0xFFA7A9B7),
                        fontSize: 14,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )
                ),
                itemBuilder: (context,suggestion){
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top:20),
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
                  return option5List.where((list) => list
                      .toLowerCase().contains(pattern.toLowerCase())).toList();
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    option5.text = suggestion;
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

  getFieldsList6() {
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
                    controller: option6,
                    //   onChanged: (String? value){
                    // //    fieldLists[index]['selectedValue'] = value!;
                    //     setState(() {
                    //       option1.text = value!;
                    //     });
                    //   },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Level 1",
                      hintStyle: TextStyle(
                        color: Color(0xFFA7A9B7),
                        fontSize: 14,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )
                ),
                itemBuilder: (context,suggestion){
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top:20),
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
                  return option6List.where((list) => list
                      .toLowerCase().contains(pattern.toLowerCase())).toList();
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    option3.text = suggestion;
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

  getsuggestions(){
    if(opt1isSelected==true){
      return getFieldsList();
    }
    // else if(opt2isSelected==true){
    //   return getFieldsList2();
    // }else if(opt3isSelected==true){
    //   return getFieldsList3();
    // }else if(opt4isSelected==true){
    //   return getFieldsList4();
    // }else if(opt5isSelected==true){
    //   return getFieldsList5();
    // }else if(opt6isSelected==true){
    //   return getFieldsList6();
    // }
    else{
        return Container();
    }



  }

  void saveDataInLocal() async {

    var locationsList = await DatabaseHandler().getLocations();

    print(locationsList);

    if (locationsList != null) {
      List<String> locations = [];

      for (var i in fieldLists) {
        locations.add(i['selectedValue']);
      }

      if (locationsList.isEmpty) {
        await DatabaseHandler().insertLocation(locations[0], locations[1], locations[2], locations[3], locations[4]);

        var locationsList = await DatabaseHandler().getLocations();

        print(locationsList);
      }
    } else {

      await DatabaseHandler().createLocationTable(5);

      List<String> locations = [];

      for (var i in fieldLists) {
        locations.add(i['selectedValue']);
      }

      await DatabaseHandler().insertLocation(locations[0], locations[1], locations[2], locations[3], locations[4]);

      var locationsList = await DatabaseHandler().getLocations();

      print(locationsList);

    }

    /*await DatabaseHandler().createLocationTable(5);

    List<String> locations = [];

    for (var i in fieldLists) {

      locations.add(i['selectedValue']);

    }*/

    //await DatabaseHandler().insertLocation(locations);

  }


}
