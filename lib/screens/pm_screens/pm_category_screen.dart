import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:qcop/resources/resources.dart';

class PMCategoryScreen extends StatefulWidget {
  const PMCategoryScreen({super.key});

  @override
  State<PMCategoryScreen> createState() => _PMCategoryScreenState();
}

class _PMCategoryScreenState extends State<PMCategoryScreen> {

  List<dynamic> titleList = ["Activity","Sub activit","BE","Severity","Type","Orientation","Exp Date"];
  List<TextEditingController> controllers = List.generate(7, (index) => TextEditingController());
  List<dynamic> optionList= ["level 1","level 3","level 3","level 5","level 5"];

  TextEditingController searchController = TextEditingController();
  List<dynamic> searchList =
  ['PMCategoryResult1','PMCategoryResult11',
    'PMCategoryResult12','PMCategoryResult122','PMCategoryResult456',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            getSearchField(),
           Column(
             children: List.generate(titleList.length, (index) {
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
                   child: TypeAheadFormField(
                     textFieldConfiguration: TextFieldConfiguration(
                       controller: controllers[index],
                       decoration: InputDecoration(
                         border: InputBorder.none,
                         hintText: titleList[index],
                         hintStyle:  TextStyle(
                           color: Color(0xFF0C3C89),
                           fontSize: 12,
                           fontFamily: 'Poppins Medium',
                           fontWeight: FontWeight.w500,
                           height: 0,
                           letterSpacing: 0.05,
                         ),
                       ),
                     ),
                     itemBuilder: (context,suggestion) {
                       return Container(
                         width: MediaQuery.of(context).size.width,
                         margin: EdgeInsets.only(top: 20,bottom: 10,left: 10),
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
                       return optionList.where((list) => list
                           .toLowerCase().contains(pattern.toLowerCase())).toList();
                     },
                     onSuggestionSelected: (suggestion) {
                       return setState(() {
                         controllers[index].text = suggestion;
                         print(suggestion);
                       });
                     },
                     suggestionsBoxDecoration: SuggestionsBoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(12)
                     ),
                   ),
                 ),
               );
             }
             ),
           )

          ],

        ),
      ),
    );
  }

  getSearchField() {
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
           controller: searchController,
           decoration: InputDecoration(
             border: InputBorder.none,
             hintText: 'Search',
             hintStyle: TextStyle(
               color: Color(0xFFA7A9B7),
               fontSize: 14,
               fontFamily: 'Poppins Medium',
               fontWeight: FontWeight.w400,
               height: 0,
             ),
             prefixIcon: Container(
                 margin: EdgeInsets.only(right: 8),
                 child: Image(image: AssetImage(Resources.searchIcon),height: 1,width: 1,)),
             prefixIconConstraints: BoxConstraints(
                 minWidth: 30, maxWidth: 30, minHeight: 30, maxHeight: 30
             ),
           )
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
           return searchList..where((list) => list
               .toLowerCase().contains(pattern.toLowerCase())).toList();
         },
         onSuggestionSelected: (suggestion) {
           setState(() {
             searchController.text = suggestion;
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




}
