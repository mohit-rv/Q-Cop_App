import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../resources/resources.dart';

class PMServerScreen extends StatefulWidget {
  const PMServerScreen({super.key});

  @override
  State<PMServerScreen> createState() => _PMServerScreenState();
}

class _PMServerScreenState extends State<PMServerScreen> {

  List<Map<String, dynamic>> fieldLists = [
    {"selectedValue" : "Download Data", "lists" : ["Download Data", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Check List", "lists" : ["Check List", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Element", "lists" : ["Element", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Intimated To", "lists" : ["Intimated To", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Level 5", "lists" : ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7"]},
  ];

  bool isUserInfoChecked = false;
  bool isCheckListInfoChecked = true;
  bool isLevelsInfoChecked = true;
  bool isInspInfoChecked = true;

  TextEditingController downloadController = TextEditingController();
  List<dynamic> _downloadList = [
    "Download1",
    "Download11",
    "Download12",
    "Download13",
    "Download14",
    "Download15",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Card(
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 14, right: 14, top: 27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Tab ID : 1039',
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
                        height: 36,
                        padding: const EdgeInsets.only(
                          left: 14,
                          right: 14,
                        ),
                        decoration: ShapeDecoration(
                          color: Color(0xFF0C3C89),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                'Connect to Central Server',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'Poppins Semibold',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Image(
                                image: AssetImage(Resources.connectDbIcon),
                                width: 12,
                                height: 11,
                              ),
                            )
                          ],
                        ),
                      ),
                      //getFieldsList(0),
                    ],
                  ),
                ),
                getDownloadSuggestion(),
                getUserInfoCheck(),
                getCheckListInfoCheck(),
                getLevelsInfoCheck(),
                getInspInfoCheck(),
                Container(
                  //width: 179,
                  height: 46,
                  margin: EdgeInsets.only(top: 33, bottom: 26, left: 80, right: 80),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Color(0xFF0C3C89),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Download',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Poppins Semibold',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Image(
                          image: AssetImage(Resources.downloadIcon),
                          width: 16,
                          height: 13,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getUserInfoCheck() {
    return Container(
      margin: const EdgeInsets.only(top: 13, left: 12),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Checkbox(
              checkColor: Colors.white,
              visualDensity: VisualDensity(vertical: -4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFF005AC6);
                    }
                    return Colors.white;
                  }),
              side: const BorderSide(
                color: Color(0xFF005AC6),
                width: 1,
              ),
              value: isUserInfoChecked,
              onChanged: (bool? value) {
                setState(() {
                  isUserInfoChecked = value!;
                });
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                'Users Info',
                style: TextStyle(
                  color: Color(0xBC63676F),
                  fontSize: 12,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: -0.36,
                ),
              )
          ),
        ],
      ),
    );
  }

  getCheckListInfoCheck() {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Checkbox(
              checkColor: Colors.white,
              visualDensity: VisualDensity(vertical: -4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFF005AC6);
                    }
                    return Colors.white;
                  }),
              side: const BorderSide(
                color: Color(0xFF005AC6),
                width: 1,
              ),
              value: isCheckListInfoChecked,
              onChanged: (bool? value) {
                setState(() {
                  isCheckListInfoChecked = value!;
                });
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                'CheckList Info',
                style: TextStyle(
                  color: Color(0xBC63676F),
                  fontSize: 12,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: -0.36,
                ),
              )
          ),
        ],
      ),
    );
  }

  getLevelsInfoCheck() {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Checkbox(
              checkColor: Colors.white,
              visualDensity: VisualDensity(vertical: -4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFF005AC6);
                    }
                    return Colors.white;
                  }),
              side: const BorderSide(
                color: Color(0xFF005AC6),
                width: 1,
              ),
              value: isLevelsInfoChecked,
              onChanged: (bool? value) {
                setState(() {
                  isLevelsInfoChecked = value!;
                });
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                'Levels Info',
                style: TextStyle(
                  color: Color(0xBC63676F),
                  fontSize: 12,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: -0.36,
                ),
              )
          ),
        ],
      ),
    );
  }

  getInspInfoCheck() {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Checkbox(
              checkColor: Colors.white,
              visualDensity: VisualDensity(vertical: -4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFF005AC6);
                    }
                    return Colors.white;
                  }),
              side: const BorderSide(
                color: Color(0xFF005AC6),
                width: 1,
              ),
              value: isInspInfoChecked,
              onChanged: (bool? value) {
                setState(() {
                  isInspInfoChecked = value!;
                });
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                'Insp. Info',
                style: TextStyle(
                  color: Color(0xBC63676F),
                  fontSize: 12,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: -0.36,
                ),
              )
          ),
        ],
      ),
    );
  }

  getDownloadSuggestion() {
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
                        controller: downloadController,
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
                      return _downloadList.where((list) => list
                          .toLowerCase().contains(pattern.toLowerCase())).toList();
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        downloadController.text = suggestion;
                        // fieldLists[index]['selectedValue'] = suggestion;
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

}
