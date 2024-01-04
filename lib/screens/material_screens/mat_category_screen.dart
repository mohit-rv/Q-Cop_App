import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../../resources/resources.dart';
import 'mat_check_points_screen.dart';

class MatCategoryScreen extends StatefulWidget {

  late ValueChanged<bool> onChange;
  MatCategoryScreen({super.key, required this.onChange});

  @override
  State<MatCategoryScreen> createState() => _MatCategoryScreenState();
}

class _MatCategoryScreenState extends State<MatCategoryScreen> {

  DateTime selectedDate = DateTime.now();

  late TextEditingController _searchController;
  late TextEditingController _venderController;
  late TextEditingController _vehicleController;
  late TextEditingController _challanController;
  late TextEditingController _brandController;
  late TextEditingController _speciController;
  late TextEditingController _expDateController;
  late TextEditingController _quantController;



  FocusNode _searchNode = FocusNode();
  FocusNode _venderNode = FocusNode();
  FocusNode _vehicleNode = FocusNode();
  FocusNode _challanNode = FocusNode();
  FocusNode _brandNode = FocusNode();
  FocusNode _speciNode = FocusNode();
  FocusNode _expDateNode = FocusNode();
  FocusNode _quantNode = FocusNode();



  List<Map<String, dynamic>> fieldLists = [
    {"selectedValue" : "Category", "lists" : ["Category", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Check List", "lists" : ["Check List", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Unit", "lists" : ["Unit", "Level 2", "Level 3", "Level 4", "Level 5"]},
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
    // TODO: implement initState
    _searchController = TextEditingController();
    _venderController = TextEditingController();
    _vehicleController = TextEditingController();
    _challanController = TextEditingController();
    _brandController = TextEditingController();
    _speciController = TextEditingController();
    _expDateController = TextEditingController();
    _quantController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController = TextEditingController();
    _venderController = TextEditingController();
    _vehicleController = TextEditingController();
    _challanController = TextEditingController();
    _brandController = TextEditingController();
    _speciController = TextEditingController();
    _expDateController = TextEditingController();
    _quantController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            getSearchFiled(),
            getFieldsList(0),
            getFieldsList(1),
            getVenderField(),
            getVehicleField(),
            getChallanField(),
            getSpeciField(),
            getBranMField(),
            getExpDateField(),
            getQuantityField(),
            getFieldsList(2),

            InkWell(
              onTap: () {

              //  Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => MatCheckPointsScreen()));

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

  getVenderField() {
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
        controller: _venderController,
        focusNode: _venderNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Vender",
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

  getVehicleField() {
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
        controller: _vehicleController,
        focusNode: _vehicleNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Vehicle No.",
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

  getChallanField() {
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
        controller: _challanController,
        focusNode: _challanNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Challan No.",
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

  getBranMField() {
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
        controller: _brandController,
        focusNode: _brandNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Brand No.",
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

  getSpeciField() {
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
        controller: _speciController,
        focusNode: _speciNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Specifications",
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

  getExpDateField() {
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
        controller: _expDateController,
        focusNode: _expDateNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        onTap: () {

          _selectDate(context);

        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Exp Date",
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
      initialDate: DateTime(DateTime
          .now()
          .year, DateTime
          .now()
          .month, DateTime
          .now()
          .day),
      firstDate: DateTime(DateTime
          .now()
          .year - 50, 1),
      lastDate: DateTime(DateTime
          .now()
          .year, DateTime
          .now()
          .month, DateTime
          .now()
          .day),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _expDateController.text = getFormattedDate();
      });
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

  getQuantityField() {
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
        controller: _quantController,
        focusNode: _quantNode,
        onChanged: (text) {
          //onSearchTextChanged(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Quantity",
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
