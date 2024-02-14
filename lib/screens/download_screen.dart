import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../resources/resources.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {

  TextEditingController optionController = TextEditingController();

  List<String> option = [
    'option 1',
    'option 12',
    'option 123',
    'option 121',
    'option 234',
    'option 98',
    'option 10'
  ];

  bool isCheckListInfoChecked = false;
  bool isLevelsInfoChecked = false;
  bool isUserInfoChecked = false;
  bool isInspInfoChecked = false;

  FocusNode optionNode = FocusNode();
  List<Map<String, dynamic>> optionsList = [
    {'slected Value': 'MET Sector 8', }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C3C89),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: EdgeInsets.only(top: 230,left: 17, right: 17, bottom: 18),
            // color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            // elevation: 1,
            child: Container(
             // height: 60,
            //  margin: EdgeInsets.only(top: 50),
             width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          margin: EdgeInsets.only(left: 5),
                          padding: EdgeInsets.all(7),
                          decoration: ShapeDecoration(
                            color: Color(0xFF0C3C89),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
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
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12,left: 10,right: 10),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1,color: Color(0xFF0C3C89)),
                        borderRadius: BorderRadius.circular(12),
                      )
                    ),
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: optionController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Select',
                          hintStyle: TextStyle(
                            color: Color(0xFFA7A9B7),
                            fontSize: 14,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),

                        ),
                      ),
                        onSuggestionSelected: (suggestion) {
                           setState(() {
                             optionController.text = suggestion;
                           });
                        },
                        itemBuilder: (context, suggestion) {
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
                        suggestionsCallback: (pattern) {
                          return option.where((list) => list
                              .toLowerCase().contains(pattern.toLowerCase())).toList();
                        },
                      suggestionsBoxDecoration: SuggestionsBoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)

                      ),
                    ),
                  ),

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

  getUserInfoCheck() {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 12),
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

}
