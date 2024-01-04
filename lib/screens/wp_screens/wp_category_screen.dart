import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:qcop/screens/wp_screens/wp_category_checkpoint_screen.dart';

import '../../resources/resources.dart';

class WPCategoryScreen extends StatefulWidget {

  late ValueChanged<bool> onChange;
  WPCategoryScreen({super.key, required this.onChange});

  @override
  State<WPCategoryScreen> createState() => _WPCategoryScreenState();
}

class _WPCategoryScreenState extends State<WPCategoryScreen> {

  late TextEditingController _searchController;
  late TextEditingController _locController;

  FocusNode _searchNode = FocusNode();
  FocusNode _locNode = FocusNode();

  List<Map<String, dynamic>> fieldLists = [
    {"selectedValue" : "Category","list" : ["Category","level1","level2","level3","level4","level5"]},      //0
    {"selectedValue" : "Check List", "lists" : ["Check List", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Intimated to", "lists" : ["Intimated to", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Level 5", "lists" : ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7"]},
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

    return menuItems;
  }

  @override
  void initState() {
    _searchController = TextEditingController();
    _locController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            getSearchFiled(),
            getFieldsList(1),
            getFieldsList(2),
            getLoc1Field(),
            getFieldsList(3),
            // Spacer(),
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => WPCCheckPont()));
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
      child: TextFormField(
        controller: _searchController,
        focusNode: _searchNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            color: Color(0xFF7C7C7C),
            fontSize: 14,
            fontFamily: 'Poppins Medium',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          counterText: "",
          isDense: true,
          prefixIcon: Container(
            margin: EdgeInsets.only(right: 8),
            child: Image(
              image: AssetImage(Resources.searchIcon),
              width: 24,
              height: 24,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
              minWidth: 30, maxWidth: 30, minHeight: 30, maxHeight: 30),
        ),
        keyboardType: TextInputType.name,
        maxLines: 1,
        enabled: true,
        cursorColor: Color(0xFF394A5D),
        style: TextStyle(
          color: Color(0xFF191D31),
          fontSize: 15,
          fontFamily: 'Poppins Medium',
          fontWeight: FontWeight.w400,
          height: 1.0,
        ),
      ),
    );
  }

  getFieldsList(int indexOfField) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            var index = indexOfField;
            return Container(
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
                child: Row(
                  children: [
                    /*Container(
                  margin: EdgeInsets.only(right: 14),
                  child: Image(
                    image: AssetImage(Resources.projectIcon),
                  ),
                ),*/
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            //elevation: 8,
                            selectedItemBuilder: (_) {
                              return dropdownItems(index)
                                  .map(
                                    (e) => Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    e.value.toString(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: Color(0xFF0C3C89),
                                      fontSize: 12,
                                      fontFamily: 'Poppins Medium',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                      letterSpacing: 0.05,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                                  .toList();
                            },
                            isExpanded: true,
                            /*buttonStyleData: const ButtonStyleData(
                      //padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 60,
                    ),*/
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down_outlined,
                              ),
                              iconSize: 30,
                              iconEnabledColor: HexColor("#0C3C89"),
                              iconDisabledColor: HexColor("#0C3C89"),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              width: MediaQuery.of(context).size.width - 50,
                              maxHeight: 150,
                              isOverButton: false,
                              //padding: EdgeInsets.only(left: 24, right: 24),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                              ),
                              offset: const Offset(-14, -10),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                MaterialStateProperty.all(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 50,
                              padding: EdgeInsets.only(
                                  left: 14, right: 14, bottom: 8, top: 8),
                            ),
                            /*icon: Container(
                              margin: EdgeInsets.only(left: 10, right: 4),
                              child: Image(
                                image: AssetImage(Assets().downArrowIcon),
                                width: 10,
                                height: 10,
                              ),
                            ),*/
                            //borderRadius: BorderRadius.circular(10),

                            value: fieldLists[index]['selectedValue'].toString(),
                            items: dropdownItems(index),
                            //alignment: Alignment.center,
                            onChanged: (String? newValue) {
                              setState(() {
                                fieldLists[index]['selectedValue'] = newValue!;


                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  getLoc1Field() {
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
          hintText: "Location1",
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

}
