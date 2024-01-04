import 'package:flutter/material.dart';
import 'package:qcop/screens/wp_screens/wp_category_checkpoint_screen.dart';
import 'package:qcop/screens/wp_screens/wp_category_screen.dart';

class WPCategoryMain extends StatefulWidget {
  const WPCategoryMain({super.key});

  @override
  State<WPCategoryMain> createState() => _WPCategoryMainState();
}

class _WPCategoryMainState extends State<WPCategoryMain> {

  var isOnCheckPointScreen = false;

  late ValueChanged<bool> onChange;

  @override
  void initState() {

    onChange = (value) {
      setState(() {
        isOnCheckPointScreen = value;
      });
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        if (isOnCheckPointScreen) {
          setState(() {
            isOnCheckPointScreen = false;
          });

          return false;
        } else {

          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: isOnCheckPointScreen ? WPCCheckPont() : WPCategoryScreen(onChange: onChange,),
      ),
    );;
  }
}
