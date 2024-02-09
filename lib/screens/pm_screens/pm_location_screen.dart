import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../local_database/database_handler.dart';
import '../../resources/resources.dart';

class SNAGLocationScreen extends StatefulWidget {

  late ValueChanged<bool> onChange;

   SNAGLocationScreen({super.key,required this.onChange});

  @override
  State<SNAGLocationScreen> createState() => _SNAGLocationScreenState();
}

class _SNAGLocationScreenState extends State<SNAGLocationScreen> {


  TextEditingController searchController = TextEditingController();
  List<dynamic> optionList = ['option 1','option 2','option 3','option 4','option 5',];
  List<dynamic> searchList = ['option 1','option 2','option 3','option 4','option 5'];
  List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());
  int visiblefield =1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              getSearchField(),
              Column(
                children: List.generate(6, (index) {
                  return Visibility(
                    visible: index<visiblefield,
                  child: Container(
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
                            return optionList
                                .where((list) => list.toLowerCase().contains(pattern.toLowerCase())).toList();
                          },
                          onSuggestionSelected: (suggestion) {
                             return
                                 setState(() {
                                    controllers[index].text = suggestion;
                                    print(suggestion);
                                    if(index<5){
                                      visiblefield= index+2;
                                    }
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
                  );
                }
                )
              )

            ],
          ),
        ),
      ),
    );
  }

  getSearchField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      margin: EdgeInsets.only(top: 10,left: 24, right: 24),
      padding: EdgeInsets.only(left: 15, right: 15),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: Color(0xFFF1F2F2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
      child: TypeAheadFormField(
        textFieldConfiguration: TextFieldConfiguration(
          controller: searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
              hintStyle:  TextStyle(
            //  color: Color(0xFFA7A9B7),
            fontSize: 14,
            fontFamily: 'Poppins Medium',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
              prefixIcon:Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Image(image: AssetImage(Resources.searchIcon),height: 1,width: 1,)),
              prefixIconConstraints: BoxConstraints(minHeight: 30,minWidth: 30,maxHeight: 30,maxWidth: 30)
          )
        ),
        itemBuilder: (context,suggestion) {
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
          return searchList.where((list) => list.toLowerCase().contains(pattern.toLowerCase())).toList();
        },

        onSuggestionSelected: (suggestion) {
          return
              setState(() {
                searchController.text = suggestion;
                print(suggestion);
              });
        },
       ),
      );

  }


  // void saveDataInLocal() async {
  //
  //   var locationsList = await DatabaseHandler().getLocations();
  //
  //   print(locationsList);
  //
  //   if (locationsList != null) {
  //     List<String> locations = [];
  //
  //     for (var i in fieldLists) {
  //       locations.add(i['selectedValue']);
  //     }
  //
  //     if (locationsList.isEmpty) {
  //       await DatabaseHandler().insertLocation(locations[0], locations[1], locations[2], locations[3], locations[4]);
  //
  //       var locationsList = await DatabaseHandler().getLocations();
  //
  //       print(locationsList);
  //     }
  //   } else {
  //
  //     await DatabaseHandler().createLocationTable(5);
  //
  //     List<String> locations = [];
  //
  //     for (var i in fieldLists) {
  //       locations.add(i['selectedValue']);
  //     }
  //
  //     await DatabaseHandler().insertLocation(locations[0], locations[1], locations[2], locations[3], locations[4]);
  //
  //     var locationsList = await DatabaseHandler().getLocations();
  //
  //     print(locationsList);
  //
  //   }
  //
  //   /*await DatabaseHandler().createLocationTable(5);
  //
  //   List<String> locations = [];
  //
  //   for (var i in fieldLists) {
  //
  //     locations.add(i['selectedValue']);
  //
  //   }*/
  //
  //   //await DatabaseHandler().insertLocation(locations);
  //
  //
  //
  // }


}
