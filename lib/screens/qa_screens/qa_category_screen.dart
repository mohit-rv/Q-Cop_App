import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:qcop/screens/qa_screens/qa_category_check_points_screen.dart';

import '../../resources/resources.dart';

class QACategoryScreen extends StatefulWidget {

  late ValueChanged<bool> onChange;

  QACategoryScreen({super.key, required this.onChange});

  @override
  State<QACategoryScreen> createState() => _QACategoryScreenState();
}

class _QACategoryScreenState extends State<QACategoryScreen> {

  //late TextEditingController _searchController;
  late TextEditingController _dwgController;
  late TextEditingController _locController;
  late TextEditingController _irDateController;
  late TextEditingController _irTimeController;
  FocusNode _searchNode = FocusNode();
  FocusNode _dwgNode = FocusNode();
  FocusNode _locNode = FocusNode();
  FocusNode _irDateNode = FocusNode();
  FocusNode _irTimeNode = FocusNode();
  FocusNode _intmNode = FocusNode();

  List<Map<String, dynamic>> fieldLists = [
    {"selectedValue" : "Category", "lists" : ["Category", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Check List", "lists" : ["Check List", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Element", "lists" : ["Element", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Intimated To", "lists" : ["Intimated To", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Level 5", "lists" : ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7"]},
  ];

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  var picked;

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

    return menuItems;
  }

  @override
  void initState() {
    _searchController = TextEditingController();
    _dwgController = TextEditingController();
    _locController = TextEditingController();
    _irDateController = TextEditingController();
    _irTimeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _dwgController.dispose();
    _locController.dispose();
    _irDateController.dispose();
    _irTimeController.dispose();
    super.dispose();
  }

  TextEditingController _searchController = TextEditingController();
  TextEditingController workOController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController checkController = TextEditingController();
  TextEditingController elementController = TextEditingController();
  TextEditingController _intmController = TextEditingController();
  TextEditingController option1 = TextEditingController();

  List<dynamic> qaSearchList = [
    "QASearchResult",
    "QASearchResult1",
    "QASearchResult112",
    "QASearchResult11210",
    "QASearchResult11",
    "QASearchResult1187",
    "QASearchResult118755",
  ];
  List<dynamic> workOList = ["level 1","level 3","level 3","level 5","level 5"];
  List<dynamic> categoryList = ["level 1","level 3","level 3","level 5","level 5"];
  List<dynamic> checkList = ["level 1","level 3","level 3","level 5","level 5"];
  List<dynamic> elementList = ["level 1","level 3","level 3","level 5","level 5"];
  List<dynamic> intmList = ["level 1","level 3","level 3","level 5","level 5"];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            getSearchFiled(),
            getFieldsList(),
            getcategoryField(),
            getcheckField(),
            getDwgField(),
            getElementField(),
            getLocationField(),
            getIntimatedField(),
            getIRDateField(),
            getIRTimeField(),
            InkWell(
              onTap: () {

                //Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => QACheckPointsScreen()));

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
            ),
          ],
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
      child: TypeAheadFormField(
        textFieldConfiguration: TextFieldConfiguration(
          controller: _searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Container(
                margin: EdgeInsets.only(right: 8),
                child: Image(image: AssetImage(Resources.searchIcon),height: 1,width: 1,)),
            prefixIconConstraints: BoxConstraints(
                minWidth: 30, maxWidth: 30, minHeight: 30, maxHeight: 30
            ),
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
        itemBuilder: (context, suggestion) {
          return Container(
            margin: EdgeInsets.only(top: 20,bottom: 10),
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
        suggestionsCallback: (pattern) {
          return qaSearchList.where((list) => list
              .toLowerCase().contains(pattern.toLowerCase())).toList();
        },

        onSuggestionSelected: (suggestion) {
          return setState(() {
            _searchController.text = suggestion;
            print(suggestion);
          });
        },

        suggestionsBoxDecoration: SuggestionsBoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)
        ),
      ),
    );
  }

  // getFieldsList(int indexOfField) {
  //   return Container(
  //     child: ListView.builder(
  //         shrinkWrap: true,
  //         physics: NeverScrollableScrollPhysics(),
  //         itemCount: 1,
  //         itemBuilder: (context, index) {
  //         //  var index = indexOfField;
  //           return Container(
  //             width: MediaQuery.of(context).size.width,
  //             height: 54,
  //             margin: EdgeInsets.only(left: 24, right: 24, top: 20),
  //             decoration: ShapeDecoration(
  //               shape: RoundedRectangleBorder(
  //                 side: BorderSide(width: 1, color: Color(0xFF0C3C89)),
  //                 borderRadius: BorderRadius.circular(4),
  //               ),
  //             ),
  //             child: Container(
  //               alignment: Alignment.centerLeft,
  //               margin: EdgeInsets.only(left: 15, right: 15),
  //               child: Row(
  //                 children: [
  //                   /*Container(
  //                 margin: EdgeInsets.only(right: 14),
  //                 child: Image(
  //                   image: AssetImage(Resources.projectIcon),
  //                 ),
  //               ),*/
  //                   Expanded(
  //                     child: Container(
  //                       alignment: Alignment.center,
  //                       child: DropdownButtonHideUnderline(
  //                         child: DropdownButton2<String>(
  //                           //elevation: 8,
  //                           selectedItemBuilder: (_) {
  //                             return dropdownItems(index)
  //                                 .map(
  //                                   (e) => Align(
  //                                 alignment: Alignment.centerLeft,
  //                                 child: Text(
  //                                   e.value.toString(),
  //                                   textAlign: TextAlign.start,
  //                                   style: const TextStyle(
  //                                     color: Color(0xFF0C3C89),
  //                                     fontSize: 12,
  //                                     fontFamily: 'Poppins Medium',
  //                                     fontWeight: FontWeight.w500,
  //                                     height: 0,
  //                                     letterSpacing: 0.05,
  //                                   ),
  //                                   maxLines: 1,
  //                                   overflow: TextOverflow.ellipsis,
  //                                 ),
  //                               ),
  //                             )
  //                                 .toList();
  //                           },
  //                           isExpanded: true,
  //                           /*buttonStyleData: const ButtonStyleData(
  //                     //padding: EdgeInsets.symmetric(horizontal: 16),
  //                     height: 40,
  //                     width: 60,
  //                   ),*/
  //                           iconStyleData: IconStyleData(
  //                             icon: Icon(
  //                               Icons.arrow_drop_down_outlined,
  //                             ),
  //                             iconSize: 30,
  //                             iconEnabledColor: HexColor("#0C3C89"),
  //                             iconDisabledColor: HexColor("#0C3C89"),
  //                           ),
  //                           dropdownStyleData: DropdownStyleData(
  //                             width: MediaQuery.of(context).size.width - 50,
  //                             maxHeight: 150,
  //                             isOverButton: false,
  //                             //padding: EdgeInsets.only(left: 24, right: 24),
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(6),
  //                               color: Colors.white,
  //                             ),
  //                             offset: const Offset(-14, -10),
  //                             scrollbarTheme: ScrollbarThemeData(
  //                               radius: const Radius.circular(40),
  //                               thickness: MaterialStateProperty.all(6),
  //                               thumbVisibility:
  //                               MaterialStateProperty.all(true),
  //                             ),
  //                           ),
  //                           menuItemStyleData: const MenuItemStyleData(
  //                             height: 50,
  //                             padding: EdgeInsets.only(
  //                                 left: 14, right: 14, bottom: 8, top: 8),
  //                           ),
  //                           /*icon: Container(
  //                             margin: EdgeInsets.only(left: 10, right: 4),
  //                             child: Image(
  //                               image: AssetImage(Assets().downArrowIcon),
  //                               width: 10,
  //                               height: 10,
  //                             ),
  //                           ),*/
  //                           //borderRadius: BorderRadius.circular(10),
  //                           value: fieldLists[index]['selectedValue'].toString(),
  //                           items: dropdownItems(index),
  //                           //alignment: Alignment.center,
  //                           onChanged: (String? newValue) {
  //                             setState(() {
  //                               fieldLists[index]['selectedValue'] = newValue!;
  //                             });
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         }),
  //   );
  // }

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
                        controller: workOController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Work order",
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
                    itemBuilder: (context,suggestion){
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
                      return workOList.where((list) => list
                          .toLowerCase().contains(pattern.toLowerCase())).toList();
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        workOController.text = suggestion;
                        //   fieldLists[index]['selectedValue'] = suggestion;

                        print("$suggestion");
                        // if (index != fieldLists.length-1) {
                        // fieldLists[index+1]['isSelected'] = true;
                        //  }
                      });
                    },

                    // suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    //   color: Colors.white,
                    // ),

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

  getcategoryField() {
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
                    controller: categoryController,
                    //   onChanged: (String? value){
                    // //    fieldLists[index]['selectedValue'] = value!;
                    //     setState(() {
                    //       option1.text = value!;
                    //     });
                    //   },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Category",
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
                  return categoryList.where((list) => list
                      .toLowerCase().contains(pattern.toLowerCase())).toList();
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    categoryController.text = suggestion;
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

  getcheckField() {
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
                    controller: checkController,
                    //   onChanged: (String? value){
                    // //    fieldLists[index]['selectedValue'] = value!;
                    //     setState(() {
                    //       option1.text = value!;
                    //     });
                    //   },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Check List",
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
                  return checkList.where((list) => list
                      .toLowerCase().contains(pattern.toLowerCase())).toList();
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    checkController.text = suggestion;
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

  getElementField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 54,
      margin: EdgeInsets.only(left: 24, right: 24, top: 20),
      padding: EdgeInsets.only(left: 16, right: 16),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF0C3C89)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: TextFormField(
        controller: _dwgController,
        focusNode: _dwgNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Element",
          hintStyle:  TextStyle(
            color: Color(0xFF0C3C89),
            fontSize: 12,
            fontFamily: 'Poppins Medium',
            fontWeight: FontWeight.w500,
            height: 0,
            letterSpacing: 0.05,
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
    );
  }



  getDwgField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 54,
      margin: EdgeInsets.only(left: 24, right: 24, top: 20),
      padding: EdgeInsets.only(left: 16, right: 16),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF0C3C89)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: TextFormField(
        controller: _dwgController,
        focusNode: _dwgNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Dwg. No",
          hintStyle:  TextStyle(
            color: Color(0xFF0C3C89),
            fontSize: 12,
            fontFamily: 'Poppins Medium',
            fontWeight: FontWeight.w500,
            height: 0,
            letterSpacing: 0.05,
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
    );
  }

  getIntimatedField() {
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
                    controller: _intmController,
                    //   onChanged: (String? value){
                    // //    fieldLists[index]['selectedValue'] = value!;
                    //     setState(() {
                    //       option1.text = value!;
                    //     });
                    //   },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Intimated To",
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
                  return intmList.where((list) => list
                      .toLowerCase().contains(pattern.toLowerCase())).toList();
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    _intmController.text = suggestion;
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

  getLocationField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 54,
      margin: EdgeInsets.only(left: 24, right: 24, top: 20),
      padding: EdgeInsets.only(left: 16, right: 16),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF0C3C89)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: TextFormField(
        controller: _locController,
        focusNode: _locNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Location 1",
          hintStyle:  TextStyle(
            color: Color(0xFF0C3C89),
            fontSize: 12,
            fontFamily: 'Poppins Medium',
            fontWeight: FontWeight.w500,
            height: 0,
            letterSpacing: 0.05,
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
    );
  }

  getIRDateField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 54,
      margin: EdgeInsets.only(left: 24, right: 24, top: 20),
      padding: EdgeInsets.only(left: 16, right: 16),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF0C3C89)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: TextFormField(
        controller: _irDateController,
        focusNode: _irDateNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        onTap: () {
          _selectDate(context);
          _irTimeController.clear();
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "IR Date",
          hintStyle:  TextStyle(
            color: Color(0xFF0C3C89),
            fontSize: 12,
            fontFamily: 'Poppins Medium',
            fontWeight: FontWeight.w500,
            height: 0,
            letterSpacing: 0.05,
          ),
          counterText: "",
          isDense: true,
          suffixIcon: Container(
            child: Image(
              image: AssetImage(Resources.irDateIcon),
              width: 13,
              height: 12,
            ),
          ),
          suffixIconConstraints: BoxConstraints(
            maxHeight: 22,
            maxWidth: 23,
            minHeight: 22,
            minWidth: 23
          )
        ),
        keyboardType: TextInputType.name,
        maxLines: 1,
        enabled: true,
        readOnly: true,
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
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(), // Set this to allow only present and future dates
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _irDateController.text = getFormattedDate();
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
     TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      );}
    );

    if (picked_s != null) {
      DateTime combinedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        picked_s.hour,
        picked_s.minute,
      );

      if(combinedDateTime.isBefore(DateTime.now())) {
        Fluttertoast.showToast(
          msg: "Cannot select past time for current date!",
         // gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }else{
        setState(() {
          selectedTime = picked_s;
          print(picked_s.hour);
          print(picked_s.minute);
          print(picked_s.format(context));
          _irTimeController.text = picked_s.format(context);

        });
      }
    }
  }


  getFormattedDate() {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate =
    inputFormat.parse("${selectedDate.toLocal()}".split(' ')[0]);
    //var outputFormat = DateFormat('dd/MM/yyyy');
    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);
    print(outputDate);
    return outputDate;
  }

  getIRTimeField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 54,
      margin: EdgeInsets.only(left: 24, right: 24, top: 20),
      padding: EdgeInsets.only(left: 16, right: 16),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF0C3C89)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: TextFormField(
        controller: _irTimeController,
        focusNode: _irTimeNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        onTap: () {

          selectedTime = TimeOfDay.now();
          //_selectDate(context);
          _selectTime(context);

        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "IR Time",
            hintStyle:  TextStyle(
              color: Color(0xFF0C3C89),
              fontSize: 12,
              fontFamily: 'Poppins Medium',
              fontWeight: FontWeight.w500,
              height: 0,
              letterSpacing: 0.05,
            ),
            counterText: "",
            isDense: true,
            suffixIcon: Container(
              child: Image(
                image: AssetImage(Resources.irTimeIcon),
                width: 13,
                height: 12,
              ),
            ),
            suffixIconConstraints: BoxConstraints(
                maxHeight: 22,
                maxWidth: 23,
                minHeight: 22,
                minWidth: 23
            )
        ),
        keyboardType: TextInputType.name,
        maxLines: 1,
        enabled: true,
        readOnly: true,
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
    );
  }

}
